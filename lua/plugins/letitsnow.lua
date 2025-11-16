return {
	{
		"marcussimonsen/let-it-snow.nvim",
		cmd = "LetItSnow", -- lazy-load when you run the command
		opts = {
			-- optional: override default options
			delay = 250,
			snowflake_char = "\u{2744}",
			snowpile_chars = {
				[1] = "\u{2581}",
				[2] = "\u{2582}",
				[3] = "\u{2583}",
				[4] = "\u{2584}",
				[5] = "\u{2585}",
				[6] = "\u{2586}",
				[7] = "\u{2587}",
				[8] = "\u{2588}",
			},
			max_spawn_attempts = 500,
			create_highlight_groups = true,
			namespace = "let-it-snow",
			highlight_group_name_snowflake = "snowflake",
			highlight_group_name_snowpile = "snowpile",
		},
	},
}
