//////////////////////////////////////////////////
//						//
// Attract-Mode Frontend - NES mini Theme	//
// made by sana2dang				//
//////////////////////////////////////////////////

/*
Copyright (c) 2010, NAVER Corporation (http://www.nhncorp.com),

 

with Reserved Font Name Nanum, Naver Nanum, NanumGothic, Naver NanumGothic, NanumMyeongjo, Naver NanumMyeongjo, NanumBrush, Naver NanumBrush, NanumPen, Naver NanumPen, Naver NanumGothicEco, NanumGothicEco, Naver NanumMyeongjoEco, NanumMyeongjoEco, Naver NanumGothicLight, NanumGothicLight, NanumBarunGothic, Naver NanumBarunGothic,

This Font Software is licensed under the SIL Open Font License, Version 1.1.

This license is copied below, and is also available with a FAQ at: http://scripts.sil.org/OFL

SIL OPEN FONT LICENSE

Version 1.1 - 26 February 2007  
*/

class UserConfig { 
</ label="해상도 Width", help="가로 해상도", option="1200", order=1 />  user_width="1280";
</ label="해상도 Height", help="세로 해상도" option="800", order=12 />  user_height="1024";
</ label="marquee 유무", help="하단 marquee 유무" options="Yes,No", order=3 />  marqueeYn="Yes";
</ label="스캔라인 effect", help="스캔라인 효과 적용", options="Yes,No", order=4 /> enable_crt="No";
</ label="스캔라인 값 (0-255)", help="스캔라인 값 (0,50,100,150,200,255)", options="0,50,100,150,200,255", order=5 /> scanlineValue = "200";
}


fe.load_module("animate");
local my_config = fe.get_config();

fe.layout.font="NANUMBARUNGOTHICBOLD";

fe.add_signal_handler(  "on_signal" );

function on_signal( sig )
{
	switch ( sig )	
	{
		case "left":	// left 키를 눌렀을 때	
			//fe.signal( "prev_page" );
			fe.signal( "prev_filter" );
			return true;
		case "right":	// right 키를 눌렀을 때
			//fe.signal( "next_page" );			
			fe.signal( "next_filter" );			
			return true;
		case "custom1":
			deleteRom();
			return true;
	}
	return false;
}




///////////////////////////////////////////// 레이아웃 해상도 셋팅 start /////////////////////////////////////////////
local monitor_width = abs((my_config["user_width"]).tointeger());	// 레이아웃 해상도 width 변수
local monitor_height = abs((my_config["user_height"]).tointeger())	// 레이아웃 해상도 height 변수

local topPadding = monitor_height / 12;


fe.layout.width =  monitor_width;				// Set 레이아웃 해상도 width
fe.layout.height = monitor_height;				// Set 레이아웃 해상도 height
//fe.layout.preserve_aspect_ratio = false;

///////////////////////////////////////////// 레이아웃 해상도 셋팅 end /////////////////////////////////////////////

///////////////////////////////////////////// Scanline 셋팅 end /////////////////////////////////////////////
local scanlineValue = abs(("0"+my_config["scanlineValue"]).tointeger());	// Scanline 사용 유무 Yes, No
scanlineValue =(scanlineValue >255 ? scanlineValue % 255 : scanlineValue );	// Scanline 값 ( 0  ~ 255 / 옅음 ~ 진하게 )
///////////////////////////////////////////// Scanline 셋팅 end /////////////////////////////////////////////

//////////////////////////////////////////// Category 셋팅 start ////////////////////////////////////////////
local filterText1 = "전체";
local filterText2 = "★";
local filterText3 = "아케이드";
local filterText4 = "슈팅";
local filterText5 = "대전";
local filterText6 = "퍼즐";
local filterText7 = "보드게임";
local filterText8 = "스포츠";
local filterText9 = "多인용";
local filterText10 = "성인";


local filterName1 = fe.add_text( filterText1, 0, 0, fe.layout.width / 5, topPadding / 2 );
filterName1.set_rgb( 255, 255, 255 );
filterName1.set_bg_rgb( 0, 0, 0 );
filterName1.align = Align.Centre;

local filterName2 = fe.add_text( filterText2, fe.layout.width/5, 0, fe.layout.width/5, topPadding / 2 );
filterName2.set_rgb( 255, 255, 255 );
filterName2.set_bg_rgb( 0, 0, 0 );
filterName2.align = Align.Centre;

local filterName3 = fe.add_text( filterText3, (fe.layout.width/5)*2, 0, fe.layout.width / 5, topPadding / 2 );
filterName3.set_rgb( 255, 255, 255 );
filterName3.set_bg_rgb( 0, 0, 0 );
filterName3.align = Align.Centre;

local filterName4 = fe.add_text( filterText4, (fe.layout.width/5)*3, 0, fe.layout.width / 5, topPadding / 2 );
filterName4.set_rgb( 255, 255, 255 );
filterName4.set_bg_rgb( 0, 0, 0 );
filterName4.align = Align.Centre;

local filterName5 = fe.add_text( filterText5, (fe.layout.width/5)*4, 0, fe.layout.width / 5, topPadding / 2 );
filterName5.set_rgb( 255, 255, 255 );
filterName5.set_bg_rgb( 0, 0, 0 );
filterName5.align = Align.Centre;



local filterName6 = fe.add_text( filterText6, 0, topPadding/2, fe.layout.width / 5, topPadding / 2 );
filterName6.set_rgb( 255, 255, 255 );
filterName6.set_bg_rgb( 0, 0, 0 );
filterName6.align = Align.Centre;

local filterName7 = fe.add_text( filterText7, fe.layout.width/5, topPadding/2, fe.layout.width/5, topPadding / 2 );
filterName7.set_rgb( 255, 255, 255 );
filterName7.set_bg_rgb( 0, 0, 0 );
filterName7.align = Align.Centre;

local filterName8 = fe.add_text( filterText8, (fe.layout.width/5)*2, topPadding/2, fe.layout.width / 5, topPadding / 2 );
filterName8.set_rgb( 255, 255, 255 );
filterName8.set_bg_rgb( 0, 0, 0 );
filterName8.align = Align.Centre;

local filterName9 = fe.add_text( filterText9, (fe.layout.width/5)*3, topPadding/2, fe.layout.width / 5, topPadding / 2 );
filterName9.set_rgb( 255, 255, 255 );
filterName9.set_bg_rgb( 0, 0, 0 );
filterName9.align = Align.Centre;

local filterName10 = fe.add_text( filterText10, (fe.layout.width/5)*4, topPadding/2, fe.layout.width / 5, topPadding / 2 );
filterName10.set_rgb( 255, 255, 255 );
filterName10.set_bg_rgb( 0, 0, 0 );
filterName10.align = Align.Centre;







//////////////////////////////////////////// Category 셋팅 end ///////////////////////////////////////////////

local PAD= fe.layout.width / 32;

//fe.load_module("animate");
// Include the utilities to read the history.dat file
//dofile(fe.script_dir + "file_util.nut" );


//local flyer = fe.add_artwork("flyer", PAD*1.2, PAD*4.8, fe.layout.width / 3 + PAD*2, fe.layout.height / 1.4 );
//flyer.alpha = 30;
//flyer.trigger = Transition.EndNavigation;
//flyer.preserve_aspect_ratio = false;


local marqueeName_default = "./marquee/defalut.png";
local marquee_default = fe.add_image( marqueeName_default  , fe.layout.width/1.65, fe.layout.height - fe.layout.height/3.51 + topPadding, fe.layout.width/2.9, fe.layout.height/6.55 );
marquee_default.preserve_aspect_ratio = false;


local bluebg = fe.add_image( "./bluebg.png", fe.layout.width/1.765 + PAD*0.78, fe.layout.height/5.30 + topPadding, fe.layout.width/2.70, fe.layout.height/2.2 );

local snap = fe.add_artwork( "snap", fe.layout.width/1.765 + PAD*0.78, fe.layout.height/5.30 + topPadding, fe.layout.width/2.70, fe.layout.height/2.2 );
snap.preserve_aspect_ratio = true;
snap.trigger = Transition.EndNavigation;

fe.add_image( "bg.png", 0, 0 + topPadding, fe.layout.width, fe.layout.height); 

local logo = fe.add_image( "logo.png", fe.layout.width/12, PAD*1.1 + topPadding, fe.layout.width/2.5, PAD*2.2 );

// ------------------------- end history move 

// main game list 
fe.add_image("box.png", fe.layout.width/40, fe.layout.height/2.01 + topPadding, fe.layout.width/1.92, fe.layout.height/11 );



// main number entries on the left
local listboxNumber = fe.add_listbox( fe.layout.width/33, fe.layout.height/5.5 + topPadding, fe.layout.width/13, fe.layout.height/1.4 );
listboxNumber.charsize = 29;
listboxNumber.set_sel_rgb( 0, 216, 255 );
listboxNumber.set_rgb( 0, 216, 255 );
listboxNumber.selbg_alpha = 0;
listboxNumber.align = Align.Right;
listboxNumber.format_string = "[ListEntry]";
listboxNumber.rows = 9;
listboxNumber.font="UnDotum";

local listboxNumber1 = fe.add_listbox( fe.layout.width/33+1, fe.layout.height/5.5+1 + topPadding, fe.layout.width/13, fe.layout.height/1.4 );
listboxNumber1.charsize = 29;
listboxNumber1.set_sel_rgb( 0, 216, 255 );
listboxNumber1.set_rgb( 0, 216, 255 );
listboxNumber1.selbg_alpha = 0;
listboxNumber1.align = Align.Right;
listboxNumber1.format_string = "[ListEntry]";
listboxNumber1.rows = 9;
listboxNumber1.font="UnDotum";

//////////////////////////////////////////////////////




// blue text solid, white when selected (centered position)
local listbox = fe.add_listbox( fe.layout.width/32 + PAD*1.9, fe.layout.height/5.5 + topPadding, fe.layout.width/2.6, fe.layout.height/1.4 );
listbox.charsize = 35;
listbox.set_sel_rgb( 255, 228, 0 );
listbox.set_rgb( 255, 255, 255 );
listbox.selbg_alpha = 0;
listbox.align = Align.Left;
//listbox.format_string =  "[!gamename]";
listbox.format_string =  "[Title]";
listbox.rows = 9;
//listbox.font="font";



local listbox_fav = fe.add_listbox( fe.layout.width/2.1, fe.layout.height/5.5 + topPadding, fe.layout.width/2.3, fe.layout.height/1.4 );
listbox_fav.charsize = 35;
listbox_fav.set_sel_rgb( 255, 0, 0 );
listbox_fav.set_rgb( 255, 228, 0 );
listbox_fav.selbg_alpha = 0;
listbox_fav.align = Align.Left;
listbox_fav.format_string =  "[!gamename]";
listbox_fav.rows = 9;
//listbox_fav.font="font";


// Game name text. We do this in the layout as the frontend doesn't chop up titles with a forward slash
 function gamename( index_offset ) {

	local fav = fe.game_info(  Info.Favourite , index_offset );
	if( fav == "1" )
	{
		return  "★";
	}
	else
	{
		return "";

	}


 return "";
}


local favorite_logo = fe.add_image( "[!favoriteBg]", fe.layout.width/23, fe.layout.height/5.5 + topPadding, fe.layout.width/8.5, fe.layout.height/7.5 );
//favorite_logo.visible = false;
//favorite_logo.preserve_aspect_ratio = false;


function favoriteBg(){
	local index = fe.list.filter_index;
	local re;
	
	// Init Category Text Color
	filterName1.set_rgb( 255, 255, 255 );
	filterName2.set_rgb( 255, 255, 255 );
	filterName3.set_rgb( 255, 255, 255 );
	filterName4.set_rgb( 255, 255, 255 );
	filterName5.set_rgb( 255, 255, 255 );
	filterName6.set_rgb( 255, 255, 255 );
	filterName7.set_rgb( 255, 255, 255 );
	filterName8.set_rgb( 255, 255, 255 );
	filterName9.set_rgb( 255, 255, 255 );
	filterName10.set_rgb( 255, 255, 255 );

	filterName1.set_bg_rgb( 0, 0, 0 );
	filterName2.set_bg_rgb( 0, 0, 0 );
	filterName3.set_bg_rgb( 0, 0, 0 );
	filterName4.set_bg_rgb( 0, 0, 0 );
	filterName5.set_bg_rgb( 0, 0, 0 );
	filterName6.set_bg_rgb( 0, 0, 0 );
	filterName7.set_bg_rgb( 0, 0, 0 );
	filterName8.set_bg_rgb( 0, 0, 0 );
	filterName9.set_bg_rgb( 0, 0, 0 );
	filterName10.set_bg_rgb( 0, 0, 0 );

	filterName1.alpha = 150;
	filterName2.alpha = 150;
	filterName3.alpha = 150;
	filterName4.alpha = 150;
	filterName5.alpha = 150;
	filterName6.alpha = 150;
	filterName7.alpha = 150;
	filterName8.alpha = 150;
	filterName9.alpha = 150;
	filterName10.alpha = 150;



	if ( index == 0)	// all	
	{
		filterName1.set_rgb( 0, 0, 0 );
		filterName1.set_bg_rgb( 255, 255, 255 );
		filterName1.alpha = 255;
		re = "";	
	}				
	if ( index == 1)	// favorite
	{ 	
		filterName2.set_rgb( 0, 0, 0 );
		filterName2.set_bg_rgb( 255, 255, 255 );
		filterName2.alpha = 255;
		re = "./favourite.png"; 	
	}		
	if ( index == 2)
	{ 	
		filterName3.set_rgb( 0, 0, 0 );
		filterName3.set_bg_rgb( 255, 255, 255 );
		filterName3.alpha = 255;
	}		
	if ( index == 3)
	{ 	
		filterName4.set_rgb( 0, 0, 0 );
		filterName4.set_bg_rgb( 255, 255, 255 );
		filterName4.alpha = 255;
	}		
	if ( index == 4)
	{ 	
		filterName5.set_rgb( 0, 0, 0 );
		filterName5.set_bg_rgb( 255, 255, 255 );
		filterName5.alpha = 255;
	}		
	if ( index == 5)
	{ 	
		filterName6.set_rgb( 0, 0, 0 );
		filterName6.set_bg_rgb( 255, 255, 255 );
		filterName6.alpha = 255;
	}		
	if ( index == 6)
	{ 	
		filterName7.set_rgb( 0, 0, 0 );
		filterName7.set_bg_rgb( 255, 255, 255 );
		filterName7.alpha = 255;
	}		
	if ( index == 7)
	{ 	
		filterName8.set_rgb( 0, 0, 0 );
		filterName8.set_bg_rgb( 255, 255, 255 );
		filterName8.alpha = 255;
	}		
	if ( index == 8)
	{ 	
		filterName9.set_rgb( 0, 0, 0 );
		filterName9.set_bg_rgb( 255, 255, 255 );
		filterName9.alpha = 255;
	}		
	if ( index == 9)
	{ 	
		filterName10.set_rgb( 0, 0, 0 );
		filterName10.set_bg_rgb( 255, 255, 255 );
		filterName10.alpha = 255;
	}
	
	return re;
}




// Game name from the history, at the bottom right

// end game name info + history ---------------------------------------------------------------

// CLOCK ACTUAL STRING STUFF

local clock = fe.add_text( "", fe.layout.width/1.75, PAD*0.9 + topPadding, fe.layout.width/4, PAD * 0.9  );
clock.align = Align.Centre;
clock.set_rgb( 255, 255, 255 );
//clock.font="font";

function update_clock( ttime ){
	local now = date();
	//clock.msg = format("%02d", now.hour) + ":" + format("%02d", now.min ) + ":" + format("%02d", now.sec );
	clock.msg = format("%02d", now.hour) + ":" + format("%02d", now.min );

}
fe.add_ticks_callback( this, "update_clock" );


// GAMES NUMBERS
local list = fe.add_text("[ListEntry] / [ListSize]", fe.layout.width/1.3 + 1, PAD*0.9 + 1 + topPadding, fe.layout.width/4, PAD * 0.9  );
list.set_rgb( 255,255,255 );
list.align = Align.Centre;
//list.font="font";


local titleText = fe.add_text( "[DisplayName] > [Emulator] > [Title] [ [Name] ]", 0, fe.layout.height - fe.layout.height/48, fe.layout.width, fe.layout.height/48  );
titleText.alpha = 210;
titleText.align = Align.Centre;
//titleText.font="font";

if ( my_config["enable_crt"] == "Yes" )
{
	local scanline_img = fe.add_image( "scanline.png", 0, 0, fe.layout.width, fe.layout.height);
	scanline_img.alpha = scanlineValue; 
}


if ( my_config["marqueeYn"] == "Yes" )
{
	local emulatorMarqueeName = "./marquee/"+ "[Emulator]" + ".png";
	local emulatorMarquee = fe.add_image( emulatorMarqueeName , fe.layout.width/1.65, fe.layout.height - fe.layout.height/3.51 + topPadding, fe.layout.width/2.9, fe.layout.height/6.55 );
	
	local emulatorMaqueeOn = { 	
		which = "translate",
		when = Transition.ToNewList,
		property = "alpha",
		start = 255,
		end = 0,
		time = 3000,
		loop = true,
		delay = 3000,

	} 	

	animation.add( PropertyAnimation( emulatorMarquee , emulatorMaqueeOn) );
}
function deleteRom()
{
	fe.set_display(  fe.list.display_index   );
	local optionsYn = ["예", "아니오"];
	local command = fe.overlay.list_dialog( optionsYn,  "'" +fe.game_info(Info.Name) + "' 롬파일을 지우시겠습니까?");
	// 0 예  1 아니오  -1 취소

	local emulator = "\""+ fe.game_info(Info.Emulator ) + "\"";	
	local filename = "\""+ fe.game_info(Info.Name ) + "\"";	

	local del_exec = "/home/pi/dev/delRomList";
//	local arg_exec = "\"" +emulator  + "\" \""  + filename + "\"";
	local arg_exec = emulator  + " "+ filename;

	if( command == 0 )	// 예
	{
		fe.plugin_command( del_exec, arg_exec );
		fe.set_display(  fe.list.display_index   );
		//fe.signal( "reset_window" );
			
	}
	else
	{
	}
}
