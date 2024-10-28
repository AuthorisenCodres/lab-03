bld = gtk.Builder()
bld:add_from_file('UI.glade')

prov = gtk.CssProvider()
prov:load_from_path('')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_from_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

opt = {ui.opd_a, ui.opd_b, ui.opd_c, ui.opd_d}

function update()
	x = 0
	y = 0
	if ui.chk_x.active == true then x = 1 end
	if ui.chk_y.active == true then y = 1 end

	v = x + y * 2
	opd[v + 1].active = true
	ui.label.label = v
end

function ui.chk_x:on_clicked(...)
	update()
end

function ui.chk_y:on_clicked(...)
	update()
end

ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()