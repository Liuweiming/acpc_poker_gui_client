# To add bots, please see ApplicationDefs::STATIC_GAME_DEFINITIONS
# below and add your script or class appropriately as the examples
# describe for every game definition your bot plays.

require_relative 'all_bot_runner_classes'
require_relative '../app/models/user'
require 'acpc_dealer'

# Assortment of constant definitions.
module Bots
  DEFAULT_BOT_NAME = 'Tester' unless const_defined? :DEFAULT_BOT_NAME

  BOT_DIR = File.expand_path('../', __FILE__)

  STATIC_GAME_DEFINITIONS = {
    two_player_nolimit: {
      file: AcpcDealer::GAME_DEFINITION_FILE_PATHS[2][:nolimit],
      text: '2-player no-limit',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false},
        'ExamplePlayer' => {runner: AcpcDealer::EXAMPLE_PLAYERS[2][:nolimit], requires_special_port: false}
      },
      num_players: 2
    },
    two_player_limit: {
      file: AcpcDealer::GAME_DEFINITION_FILE_PATHS[2][:limit],
      text: '2-player limit',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false},
        'ExamplePlayer' => {runner: AcpcDealer::EXAMPLE_PLAYERS[2][:limit], requires_special_port: false},
        'AlwaysRaise' => {runner: File.join(BOT_DIR, 'agent_scripts', 'raise_bot'), requires_special_port: false}
      },
      num_players: 2
    },
    two_player_royal: {
      file: File.expand_path('../../game_defs/royal.limit.2p.reverse_blinds.game', __FILE__),
      text: '2-player limit royal',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false},
      },
      num_players: 2
    },
    three_player_nolimit: {
      file: AcpcDealer::GAME_DEFINITION_FILE_PATHS[3][:nolimit],
      text: '3-player no-limit',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false}
      },
      num_players: 3
    },
    three_player_limit: {
      file: AcpcDealer::GAME_DEFINITION_FILE_PATHS[3][:limit],
      text: '3-player limit',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false}
      },
      num_players: 3
    },
    three_player_kuhn: {
      file: AcpcDealer::GAME_DEFINITION_FILE_PATHS[3][:kuhn],
      text: '3-player kuhn',
      opponents: {
        # ADD BOTS HERE LIKE SO:
        # 'YourAgentNameForDropdownAndLogs' => RunYourAgent
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => '/absolute/path/to/my/agent'
        # OR:
        # 'YourAgentNameForDropdownAndLogs' => File.join(BOT_DIR, 'path/relative/to/bots/directory')
        DEFAULT_BOT_NAME => {runner: RunTestingBot, requires_special_port: false}
      },
      num_players: 3
    }
  } unless const_defined? :STATIC_GAME_DEFINITIONS

  # Human opponent names map to nil
  def self.game_definitions
    lcl_game_defs = STATIC_GAME_DEFINITIONS.dup
    # @todo Code duplication
    #lcl_game_defs.each do |type, prop|
    #  User.each do |user|
    #    prop[:opponents].merge! user.name => nil
    #  end
    #end
  end
end
