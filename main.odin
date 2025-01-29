package main

import rl "vendor:raylib"

WIDTHGAMEWINDOW :: 500
HEIGHTGAMEWINDOW :: 500

FPS :: 144

GRAVITY :: 980

PLAYERHEIGHT :: 32
PLAYERRADIUS :: 32

PLAYERSPEED :: 200
PLAYERJUMPVELOCITY :: 300

BACKGROUND_COLOR :: rl.Color{50, 50, 50, 255}

STARTINGPOINT :: rl.Vector2{0, 0}

main :: proc() {
	rl.SetTargetFPS(FPS)
	rl.InitWindow(WIDTHGAMEWINDOW, HEIGHTGAMEWINDOW, "snake-game")


	player_pos := STARTINGPOINT
	player_vel := rl.Vector2{0.0, 0.0}

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()

		rl.ClearBackground(BACKGROUND_COLOR)

		if rl.IsKeyDown(.A) || rl.IsKeyDown(.LEFT) {
			player_vel.x = -PLAYERSPEED
		} else if rl.IsKeyDown(.D) || rl.IsKeyDown(.RIGHT) {
			player_vel.x = PLAYERSPEED
		} else {
			player_vel.x = 0
		}

		player_vel.y = -GRAVITY * rl.GetFrameTime()

		if rl.IsKeyDown(.SPACE) {
			player_vel.y = -PLAYERJUMPVELOCITY
		}

		rl.DrawRectangleV(player_pos, {PLAYERRADIUS, PLAYERHEIGHT}, rl.WHITE)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
