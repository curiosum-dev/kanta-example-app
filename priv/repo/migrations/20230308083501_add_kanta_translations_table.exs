defmodule KantaTest.Repo.Migrations.AddKantaTranslationsTable do
  use Ecto.Migration

  def up do
    Kanta.Migration.up(version: 1)
  end

  def down do
    Kanta.Migration.down(version: 1)
  end
end
