defmodule ExMonAPI do
  alias ExMonAPI.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
