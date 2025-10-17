defmodule KantaTestWeb.Plugs.SetLocale do
  @moduledoc """
  A plug that sets the locale from the URL path or cookie.

  Replaces the unmaintained `set_locale` package with a simple custom implementation
  that supports modern Gettext versions.
  """
  import Plug.Conn

  @doc """
  Initializes the plug with options.

  ## Options

    * `:gettext` - The Gettext module to use (required)
    * `:default_locale` - The default locale to use if none is found (required)
    * `:cookie_key` - The cookie key to store the locale preference (required)
  """
  def init(opts) do
    %{
      gettext: Keyword.fetch!(opts, :gettext),
      default_locale: Keyword.fetch!(opts, :default_locale),
      cookie_key: Keyword.fetch!(opts, :cookie_key)
    }
  end

  @doc """
  Sets the locale based on the URL path parameter or cookie.

  Priority:
  1. URL path parameter (`:locale`)
  2. Cookie value
  3. Default locale
  """
  def call(conn, opts) do
    locale = determine_locale(conn, opts)

    Gettext.put_locale(opts.gettext, locale)

    conn
    |> put_resp_cookie(opts.cookie_key, locale, max_age: 365 * 24 * 60 * 60)
    |> assign(:locale, locale)
  end

  # Determines the locale from URL params, cookies, or default
  defp determine_locale(conn, opts) do
    conn.path_params["locale"] ||
      conn.cookies[opts.cookie_key] ||
      opts.default_locale
  end
end
