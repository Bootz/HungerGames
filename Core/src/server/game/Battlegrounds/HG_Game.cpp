
#include "HG_Game.h"

HG_Game::HG_Game(std::string gameName, Player* plr)
{
	GUID = ++CUR_GUID;
	this->gameName = gameName;
	inGame = false;
	killMe = false;

	playersInGame[0] = plr;
	for (int i = 1; i < 10; ++i)
		playersInGame[i] = NULL;
}

HG_Game::~HG_Game()
{
}

void HG_Game::AddPlayer(Player * plr)
{
	for (int i = 0; i < 10; ++i)
	{
		if (playersInGame[i] == NULL)
		{
			playersInGame[i] = plr;
			return;
		}
	}
	plr->GetSession()->SendNotification("The game is full, cannot join!");
}

bool HG_Game::RemovePlayer(Player * plr)
{
	std::string name = plr->GetName();
	for (int i = 0; i < 10; ++i)
	{
		if (playersInGame[i] != NULL)
		{
			if (playersInGame[i]->GetName().compare(name) == 0)
			{
				playersInGame[i] = NULL;
				return true;
			}
		}
	}
	return false;
}

std::string HG_Game::getPlayerNameListStr()
{
	std::stringstream str;
	str << "PLAYERS";
	for (int i = 0; i < 10; ++i)
	{
		if (playersInGame[i] != NULL)
		{
			str << "-" << playersInGame[i]->GetName();
		}
	}
	return str.str();
}