defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Create deck.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
      "Nine of Spades", "Ten of Spades", "Jack of Spades", "Queen of Spades",
      "King of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Six of Clubs", "Seven of Clubs",
      "Eight of Clubs", "Nine of Clubs", "Ten of Clubs", "Jack of Clubs",
      "Queen of Clubs", "King of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Six of Hearts",
      "Seven of Hearts", "Eight of Hearts", "Nine of Hearts", "Ten of Hearts",
      "Jack of Hearts", "Queen of Hearts", "King of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds",
      "Six of Diamonds", "Seven of Diamonds", "Eight of Diamonds",
      "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds", "Queen of Diamonds", "King of Diamonds"]

  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle the deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if the deck contais a given card.

  ## Examples

      iex> Cards.contains?(["Ace", "Two", "Three"], "Ace")
      true 

      iex> Cards.contains?(["Ace", "Two", "Three"], "King")
      false 

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deal cards.

  ## Examples

      iex> Cards.deal(["Ace", "Two", "Three"], 1)
      ["Ace"] 

      iex> Cards.deal(["Ace", "Two", "Three"], 2)
      ["Ace", "Two"] 

  """
  def deal(deck, hand_size) do
    {hand, _} = Enum.split(deck, hand_size)

    hand
  end

  @doc """
  Save a deck.

  ## Examples

      iex> Cards.save(["Ace", "Two", "Three"], "my_deck_filename")
      :ok 

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load a deck.

  ## Examples

      iex> Cards.load("my_deck_filename")
      ["Ace", "Two", "Three"] 

      iex> Cards.load("wrong_filename")
      "That file does not exist" 

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  @doc """
  Create a hand of a desired size.
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end
end
