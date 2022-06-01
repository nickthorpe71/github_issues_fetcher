defmodule CliTest do
  use ExUnit.Case
  doctest(GithubIssuesFetch)

  import GithubIssuesFetch.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values are returned if three are given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is defaulted if two values are given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end