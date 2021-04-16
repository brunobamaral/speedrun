# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Speedrun.Repo.insert!(%Speedrun.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
Speedrun.Repo.insert!(
  %Speedrun.Authors.Schemas.Author{
    name: "Bruno",
    email: "bruno@email.com"
  },
  on_conflict: :nothing
)
