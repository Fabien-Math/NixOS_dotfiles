-- Laptop screen
hl.monitor({
	output = "desc:Chimei Innolux Corporation 0x1521",
	mode = "1920x1080@60.02",
	position = "0x360",
	scale = 1.0,
})

-- Thesis screens
hl.monitor({
	output = "desc:Lenovo Group Limited P24QD-40 VKVK5787",
	mode = "2560x1440@60.0",
	position = "1920x0",
	scale = 1.0,
})

hl.monitor({
	output = "desc:Lenovo Group Limited P24q-30 V90EZ1NZ",
	mode = "2560x1440@60.0",
	position = "4480x0",
	scale = 1.0,
})

-- Home screen
hl.monitor({
	output = "desc:Iiyama North America PL3484WQ 1251650400525",
	mode = "3440x1440@60.0",
	position = "auto-center-left",
	scale = 1.0,
})

-- Binds workspaces to my monitors (find desc with: hyprctl monitors)
hl.workspace_rule({
	workspace = "1",
	persistent = true,
	monitor = "desc:Chimei Innolux Corporation 0x1521",
	default = true,
})

hl.workspace_rule({
	workspace = "2",
	persistent = true,
	monitor = "desc:Chimei Innolux Corporation 0x1521",
})

hl.workspace_rule({
	workspace = "3",
	persistent = true,
	monitor = "desc:Lenovo Group Limited P24QD-40 VKVK5787",
	default = true,
})

hl.workspace_rule({
	workspace = "4",
	persistent = true,
	monitor = "desc:Lenovo Group Limited P24QD-40 VKVK5787",
})

hl.workspace_rule({
	workspace = "5",
	persistent = true,
	monitor = "desc:Lenovo Group Limited P24q-30 V90EZ1NZ",
	default = true,
})

hl.workspace_rule({
	workspace = "6",
	persistent = true,
	monitor = "desc:Lenovo Group Limited P24q-30 V90EZ1NZ",
})
