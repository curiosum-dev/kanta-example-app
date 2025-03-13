# KantaTest

KantaTest is a showcase application that demonstrates how to use [Kanta](https://github.com/curiosum-dev/kanta), a user-friendly translations manager for Elixir/Phoenix projects.

## About the project 

If you're working on an Elixir/Phoenix project and need to manage translations, you know how time-consuming and error-prone it can be. That's where Kanta comes in. Our tool simplifies the process of managing translations by providing an intuitive interface for adding, editing, and deleting translations. Our tool also makes it easy to keep translations up-to-date as your project evolves. With Kanta, you can streamline your workflow and focus on building great software, not managing translations.

## Requirements

Clone the [Kanta repository](https://github.com/curiosum-dev/kanta) into a directory named `kanta`, located in the same parent directory as `kanta-example-app`. Then, check out the latest `develop` branch:

```bash
git clone https://github.com/curiosum-dev/kanta.git kanta
cd kanta
git checkout develop
```

This is necessary because `kanta-example-app` uses a relative path to the Kanta dependency in its `mix.exs` file:

```
defp deps do
  [
    # ...
    {:kanta, path: "../kanta", override: true}
  ]
end
```

This is necessary because `kanta-example-app` relies on the latest features available in Kanta's `develop` branch, which are not yet included in the stable release.
