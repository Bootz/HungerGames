
#ifndef HG_GAME_HEADER
#define HG_GAME_HEADER

#include <vector>
#include <string>
#include "Battleground.h"
#include "Player.h"

class HG_Game : public Battleground
{
	public:
		HG_Game();
		~HG_Game();

		bool SetupBattleground();
		std::string getPlayerNameListStr();
		void AddPlayer(Player * plr);
		void RemovePlayer(Player* plr, uint64 guid, uint32 /*team*/);
		bool HasPlayer(uint64 guid);

        std::string GetGameName() { return GameName; }
        bool SetGameName(std::string name, uint64 playerGUID);
        bool IsHost(uint64 playerGUID) { return playerGUID == hostGUID; }
        void SetHost(uint64 playerGUID) { hostGUID = playerGUID; }

        bool HasGameStarted() { return IsInGame; }
        uint32 GetGUID() { return GUID; }

        uint64 hostGUID;

	private:
		uint32 playersInGame[10];
		bool IsInGame;
		uint32 GUID;
        std::string GameName;
		WorldLocation locations[10];
};

#endif
