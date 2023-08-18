-- Variables
local spawnCoords = vector3(24.38, -1345.23, 28.5)  -- Les coordonnées de votre choix
local ped = PlayerPedId() -- Ped du joueur

-- Attendre jusqu'à ce que le joueur soit actif
while not NetworkIsPlayerActive(PlayerId()) do
    print("En attente de l'activation du joueur...")
    Wait(0)
end

-- Placer le joueur aux coordonnées de spawn
SetEntityCoords(ped, spawnCoords.x, spawnCoords.y, spawnCoords.z, false, false, false, true)

-- Supprimer les tâches en cours du joueur immédiatement
ClearPedTasksImmediately(ped)

-- Retirer toutes les armes du joueur
RemoveAllPedWeapons(ped)

-- Débloquer la position du joueur pour qu'il puisse se déplacer
FreezeEntityPosition(ped, false)

-- Effacer le niveau de recherche du joueur
ClearPlayerWantedLevel(PlayerId())

-- Fermer l'écran de chargement du jeu
ShutdownLoadingScreen()

-- Fermer l'interface utilisateur de l'écran de chargement
ShutdownLoadingScreenNui()