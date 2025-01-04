package game

import rl "vendor:raylib"

WIDTHGAMEWINDOW :: 500
HEIGHTGAMEWINDOW :: 500

FPS :: 144

PLAYERHEIGHT :: 32
PLAYERRADIUS :: 16

PLAYERSPEED :: 200

STARTINGPOINT :: rl.Vector2{0, 0}

main :: proc() {
	rl.SetTargetFPS(FPS)
	rl.InitWindow(WIDTHGAMEWINDOW, HEIGHTGAMEWINDOW, "snake-game")

	player_pos := STARTINGPOINT

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()

		rl.ClearBackground(rl.BLANK)
		if rl.IsKeyDown(.A) || rl.IsKeyDown(.LEFT) {
			player_pos.x -= PLAYERSPEED * rl.GetFrameTime()
		}

		if rl.IsKeyDown(.D) || rl.IsKeyDown(.RIGHT) {
			player_pos.x += PLAYERSPEED * rl.GetFrameTime()
		}

		rl.DrawRectangleV(player_pos, {PLAYERRADIUS, PLAYERHEIGHT}, rl.GREEN)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
