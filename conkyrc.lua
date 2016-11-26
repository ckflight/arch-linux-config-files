-----------------------------------------------------------------------------
-- conkyrc_seamod
-- Date : 2016/11/13
-- Author : SeaJey, Maxiwell and JPvRiel
-- Conky : >= 1.10
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

conky.config = {

  background = true,
  update_interval = 1,

  cpu_avg_samples = 2,
  net_avg_samples = 2,
  temperature_unit = 'celsius',
  if_up_strictness = 'address',

  double_buffer = true,
  no_buffers = true,
  text_buffer_size = 2048,

  own_window = true,
  own_window_class = 'conky-semi',
  --own_window_type = 'override',
  --own_window_type = 'desktop',
  own_window_type = 'dock',
  own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

  own_window_colour = '#000000',
  own_window_transparent = true,
  own_window_argb_visual = true,
  own_window_argb_value = 192,

  draw_shades = false,
  draw_outline = false,
  draw_borders = false,
  draw_graph_borders = false,

  alignment = 'top_left',
  gap_x = 80,
  gap_y = 70,
  --minimum_width = 340
  minimum_width = 1000, minimum_height = 600,
  --maximum_width = 700
  maximum_width = 1000,
  border_inner_margin = 0,
  border_outer_margin = 20,
  xinerama_head = 0,

  override_utf8_locale = true,
  use_xft = true,
  font = 'Ubuntu:size=11',
  xftalpha = 0.8,
  uppercase = false,

  -- Defining colors
  default_color = '#FFFFFF',
  -- Shades of Gray
  color1 = '#DDDDDD',
  color2 = '#AAAAAA',
  color3 = '#AAAAAA',
  -- color 3 used to b #888888
  -- Orange
  color4 = '#EF5A29',
  -- Green
  color5 = '#77B753',

  -- Loading lua script for drawning rings
  lua_load = '~/.conky/seamod/seamod_rings.lua',
  lua_draw_hook_post = 'main'

};

conky.text = [[
# Showing CPU Graph with TOP 5
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Temp:  ${font Ubuntu:size=10:style=normal}${color2}${hwmon 2 temp 1} C
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Fan: ${font Ubuntu:size=10:style=normal}${color2}${hwmon 2 fan 1} RPM
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Freq: ${font Ubuntu:size=10:style=normal}${color2}${lua freq_min} - ${lua freq_max} MHz
${offset 145}${cpugraph cpu0 30,200 666666 666666}
${voffset -32}
${offset 91}${font Ubuntu:size=11:style=bold}${color5}PROC
# Showing TOP 5 CPU-consumers
${offset 110}${font Ubuntu:size=11:style=normal}${color4}${top name 1}${top cpu 1}%
${offset 110}${font Ubuntu:size=11:style=normal}${color1}${top name 2}${top cpu 2}%
${offset 110}${font Ubuntu:size=10:style=normal}${color2}${top name 3}${top cpu 3}%
${offset 110}${font Ubuntu:size=10:style=normal}${color3}${top name 4}${top cpu 4}%


#Showing memory Graph with TOP 5
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Available: ${font Ubuntu:size=10:style=normal}${color2}${memeasyfree}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Cache: ${font Ubuntu:size=10:style=normal}${color2}${cached}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Buffer: ${font Ubuntu:size=10:style=normal}${color2}${buffers}
${offset 145}${memgraph 30,200 666666 666666}
${voffset -16}
${offset 100}${font Ubuntu:size=11:style=bold}${color5}MEM
${offset 110}${font Ubuntu:size=12:style=normal}${color4}${top_mem name 1}${top_mem mem_res 1}
${offset 110}${font Ubuntu:size=11:style=normal}${color1}${top_mem name 2}${top_mem mem_res 2}
${offset 110}${font Ubuntu:size=10:style=normal}${color2}${top_mem name 3}${top_mem mem_res 3}
${offset 110}${font Ubuntu:size=10:style=normal}${color3}${top_mem name 4}${top_mem mem_res 4}



# Showing disk partitions: root, home and files
${voffset -362}
${offset 580}${color1}${font Ubuntu:size=10:style=bold}Read:${font Ubuntu:size=10:style=normal}${color2}${diskio_read}
${offset 580}${color1}${font Ubuntu:size=10:style=bold}Write: ${font Ubuntu:size=10:style=normal}${color2}${diskio_write}
${offset 545}${diskiograph 30,200 666666 666666}
${voffset -48}
${offset 500}${font Ubuntu:size=11:style=bold}${color5}STORE
${offset 510}${font Ubuntu:size=12:style=normal}${color4}${top_mem name 1}r:${top_io io_read 1}w:${top_io io_write 1}
${offset 510}${font Ubuntu:size=11:style=normal}${color1}${top_mem name 2}r:${top_io io_read 2}w:${top_io io_write 2}
${offset 510}${font Ubuntu:size=10:style=normal}${color2}${top_mem name 3}r:${top_io io_read 3}w:${top_io io_write 3}
${offset 510}${font Ubuntu:size=10:style=normal}${color2}${top_mem name 4}r:${top_io io_read 4}w:${top_io io_write 4}
${offset 510}${font Ubuntu:size=10:style=normal}${color2}${top_mem name 5}r:${top_io io_read 5}w:${top_io io_write 5}

${voffset -0}
# Network data (assumes wireless info). NET ring is mostly useless but looks pretty, main info is in the graphs
#${if_up wlp2s0}
${if_match "${addr wlp2s0}" != "No Address"}\
${offset 580}${font Ubuntu:size=10:style=bold}${color1}Wireless
${offset 580}${font Ubuntu:size=10:style=bold}${color1}IP: ${font Ubuntu:size=10:style=normal}${color2}${addr wlp2s0}
${offset 580}${font Ubuntu:size=10:style=bold}${color1}Public IP: ${font Ubuntu:size=10:style=normal}${color2}${curl http://api.ipify.org 300}
${offset 545}${upspeedgraph wlp2s0 25,200 4B1B0C FF5C2B 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Up: ${font Ubuntu:size=10:style=normal}${color3}${upspeed wlp2s0} / ${totalup wlp2s0}
${offset 545}${downspeedgraph wlp2s0 25,200 324D23 77B753 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Down: ${font Ubuntu:size=10:style=normal}${color3}${downspeed wlp2s0} / ${totaldown wlp2s0}
${else}\
${if_match "${addr wlan0}" != "No Address"}\
${offset 580}${font Ubuntu:size=10:style=bold}${color1}Wifi: ${font Ubuntu:size=10:style=normal}${color2}${wireless_essid} (${wireless_bitrate wlan0})
${offset 580}${font Ubuntu:size=10:style=bold}${color1}IP: ${font Ubuntu:size=10:style=normal}${color2}${addr wlan0}
${offset 580}${font Ubuntu:size=10:style=bold}${color1}Public IP: ${font Ubuntu:size=10:style=normal}${color2}${curl http://api.ipify.org 300}
${offset 545}${upspeedgraph wlan0 25,200 4B1B0C FF5C2B 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Up: ${font Ubuntu:size=10:style=normal}${color3}${upspeed wlan0} / ${totalup wlan0}
${offset 545}${downspeedgraph wlan0 25,200 324D23 77B753 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Down: ${font Ubuntu:size=10:style=normal}${color3}${downspeed wlan0} / ${totaldown wlan0}
${else}\

${offset 580}${font Ubuntu:size=10:style=bold}${color1}Disconnected
${offset 580}${font Ubuntu:size=10:style=normal}${color3}(wlp2s0 and wlan0 have no IP)
${offset 545}${upspeedgraph wlp2s0 25,200 4B1B0C FF5C2B 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Up: ${font Ubuntu:size=10:style=normal}${color3}NA
${offset 545}${downspeedgraph wlp2s0 25,200 324D23 77B753 1280KiB -l}
${offset 545}${color1}${font Ubuntu:size=10:style=bold}Down: ${font Ubuntu:size=10:style=normal}${color3}NA
${endif}\
${endif}\
${voffset -100}
${offset 505}${font Ubuntu:size=11:style=bold}${color5}NET

#### Modifications below HERE wont cause alignment problems with the gauges/rings ####
# Extra info
${voffset 60}
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Entropy:${tab}${color3}${entropy_bar 5,140} ${color3}${entropy_perc}% (${entropy_avail}/${entropy_poolsize})
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Battery:${tab}${color3}${battery_bar 5,140} ${if_match ${battery_percent BAT0} <= 33}${color4}${else}${color3}${endif}${battery_short}${if_match ${battery_percent BAT0} != 100} (${battery_time})${endif}
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Uptime:${tab}${tab}${color3}$uptime

# Log feed
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Time:  ${color3}${font Ubuntu Condensed:size=8:style=normal}${time %H:%M:%S }
]];
