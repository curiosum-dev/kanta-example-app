defmodule KantaTest.Repo.Migrations.AddKantaTranslationsTable do
  use Ecto.Migration

  def up do
    Kanta.Migrations.up()
  end

  def down do
    Kanta.Migrations.down()
  end
end
