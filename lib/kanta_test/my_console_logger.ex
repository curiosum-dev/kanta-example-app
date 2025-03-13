defmodule MyConsoleLogger do
  @ecto_sql_log_filter [
    "translations",
    "commit",
    "begin",
    "kanta_domains",
    "kanta_messages",
    "kanta_contexts",
    "kanta_locales"
  ]

  @spec format(atom, term, Logger.Formatter.time(), keyword()) :: IO.chardata()
  def format(level, message, _timestamp, metadata) do
    msg = inspect(message)

    contains_filtered_word? =
      Enum.any?(@ecto_sql_log_filter, fn word ->
        msg =~ word
      end)

    application = Keyword.get(metadata, :application)

    if application == :ecto_sql and contains_filtered_word? do
      ""
    else
      "[#{level}] #{message}\n"
    end
  end
end
