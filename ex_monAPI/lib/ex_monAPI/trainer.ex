defmodule ExMonAPI.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMonAPI.Trainer.Pokemon

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many(:pokemons, Pokemon)
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(trainer, params), do: create_changeset(trainer, params)

  @required_params [:name, :password]
  defp create_changeset(trainer_or_module, params) do
    trainer_or_module
    |> IO.inspect()
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
