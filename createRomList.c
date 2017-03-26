/* 
 *  AttractMode list maker
 *  Author       : sana2dang ( fly9p ) - sana2dang@naver.com
 *  Cafe         : http://cafe.naver.com/raspigamer
 *  Thanks to    : zzeromin, smyani, GreatKStar, KimPanda, StarNDevil, angel
 * 
 * - complie -
 * sudo gcc romlist.c -o romlist
 * sudo romlist
 */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>

int main (int argc, char **argv)
{	

	FILE *fIn;
	FILE *fOut;
	char list[1000];
	char cfgText[1000];
	char get_list[1000];
	char outputFileName[500] = "";

	DIR *spDir;
	DIR *spList;

	int writeListFlag = 0;

	struct dirent* em_entry = NULL;
	struct dirent* rom_entry = NULL;
	
	struct stat em_buf;
	struct stat rom_buf;
	
	char root_path[500] = "";						// 풀롬리스트 저장 폴더
	char make_path[500] = "";						// 어트랙트모드 롬리스트 폴더
	char em_path[500] = "/home/pi/RetroPie/roms/";	
	char rom_path[500] = "/home/pi/RetroPie/roms/";
	char get_path[500] = "";
		
	char old_config_path[500] = "/home/pi/.attract/attract.cfg";		// 오리지널 attract.cfg 파일
	char new_config_path[500] = "/home/pi/.attract/aa.cfg"; 		// 새로생설 할 attract.cfg 파일

	FILE *fNewCfg;					
	FILE *fOldCfg;						
					
	int fileCnt = 0;
	int cfg_write_flag = 0;		// 오리지널 attract.cfg 에서 display를 제외한 곳을 판별하기위한 플래그

	char *file_name;
	char *compareTemp;
	char *compare;
	char *thin_file_name;

	int length = 0;
	char *abc = "";

	char em_buff[256]={'\0'};
	char rom_buff[256]={'\0'};

	if( (spDir=opendir( em_path ))==NULL )
		puts("error");
	
	if( (fNewCfg= fopen( new_config_path, "w+")) == NULL )		// new attract.cfg 임시 파일 생성
		puts("error!");		
	
	// 환경설정 메뉴는 무조건 만들기
	fprintf(fNewCfg,"display\t%s\n","Attract Mode Setup" );
	fprintf(fNewCfg,"\tlayout\tBasic\n");
	fprintf(fNewCfg,"\tromlist\t%s\n","Attract Mode Setup" );
	fprintf(fNewCfg,"\tin_cycle\tyes\n" );
	fprintf(fNewCfg,"\tin_menu\tyes\n\n" );

	
	// 어트랙트모드 종료하기
	system( "sudo kill -9 `ps -ef | grep attract | grep -v grep | awk '{ print $2 }'`" );
	//system( "clear" );
	
	while( (em_entry = readdir(spDir)) != NULL )
	{
		lstat( em_entry-> d_name, &em_buf );		
		snprintf(em_buff, sizeof(em_buff), "%s/%s", em_path, em_entry->d_name);
	
		strcpy( get_path, "" );
		strcpy( root_path,"");
		strcpy( make_path,"");
		strcpy( outputFileName,"");


		if( chdir(em_buff) == 0 )
		{
			//printf("롬폴더 %d %s\n", em_buf.st_mode, em_entry->d_name );			

				strcpy( get_path, rom_path );
				strcat( get_path, em_entry->d_name);
				//printf(" %s\n", get_path );
				
				if( (spList=opendir( get_path ))==NULL )
				{
					printf(" %s\n", get_path );
					continue;
				}

			
				strcpy( root_path,"");
				strcpy( make_path,"");
				strcpy( outputFileName,"");

				
				strcat( root_path,"/home/pi/dev/fullRomList/");
				strcat( root_path,em_entry->d_name);
				strcat( root_path,".txt");

				if( !strcmp( "amstradcpc", em_entry->d_name ) )
					strcpy( outputFileName, "Amstrad CPC" );

				if( !strcmp( "arcade", em_entry->d_name ) )
					strcpy( outputFileName, "Arcade" );

				if( !strcmp( "atari2600", em_entry->d_name ) )
					strcpy( outputFileName, "Atari 2600" );

				if( !strcmp( "atari7800", em_entry->d_name ) )
					strcpy( outputFileName, "Atari 7800 ProSystem" );

				if( !strcmp( "atarilynx", em_entry->d_name ) )
					strcpy( outputFileName, "Atari Lynx" );

				if( !strcmp( "fds", em_entry->d_name ) )
					strcpy( outputFileName, "Famicom Disk System" );

				if( !strcmp( "fba", em_entry->d_name ) )
					strcpy( outputFileName, "Final Burn Alpha" );

				if( !strcmp( "gba", em_entry->d_name ) )
					strcpy( outputFileName, "Game Boy Advance" );

				if( !strcmp( "gbc", em_entry->d_name ) )
					strcpy( outputFileName, "Game Boy Color" );

				if( !strcmp( "gb", em_entry->d_name ) )
					strcpy( outputFileName, "Game Boy" );

				if( !strcmp( "segacd", em_entry->d_name ) )
					strcpy( outputFileName, "Mega CD" );

				if( !strcmp( "msx", em_entry->d_name ) )
					strcpy( outputFileName, "MSX" );

				if( !strcmp( "mame-advance", em_entry->d_name ) )
					strcpy( outputFileName, "AdvanceMAME" );
			
				if( !strcmp( "mame-libretro", em_entry->d_name ) )
					strcpy( outputFileName, "Multiple Arcade Machine Emulator" );

				if( !strcmp( "ngpc", em_entry->d_name ) )
					strcpy( outputFileName, "Neo Geo Pocket Color" );

				if( !strcmp( "ngp", em_entry->d_name ) )
					strcpy( outputFileName, "Neo Geo Pocket" );

				if( !strcmp( "neogeo", em_entry->d_name ) )
					strcpy( outputFileName, "Neo Geo" );

				if( !strcmp( "n64", em_entry->d_name ) )
					strcpy( outputFileName, "Nintendo 64" );

				if( !strcmp( "nds", em_entry->d_name ) )
					strcpy( outputFileName, "Nintendo DS" );

				if( !strcmp( "nes", em_entry->d_name ) )
					strcpy( outputFileName, "Nintendo Entertainment System" );

				if( !strcmp( "pcengine", em_entry->d_name ) )
					strcpy( outputFileName, "PC Engine" );

				if( !strcmp( "psx", em_entry->d_name ) )
					strcpy( outputFileName, "PlayStation" );

				if( !strcmp( "sega32x", em_entry->d_name ) )
					strcpy( outputFileName, "Sega 32X" );

				if( !strcmp( "gamegear", em_entry->d_name ) )
					strcpy( outputFileName, "Sega Gamegear" );

				if( !strcmp( "mastersystem", em_entry->d_name ) )
					strcpy( outputFileName, "Sega Master System" );

				if( !strcmp( "megadrive", em_entry->d_name ) )
					strcpy( outputFileName, "Sega Mega Drive" );

				if( !strcmp( "sg-1000", em_entry->d_name ) )
					strcpy( outputFileName, "Sega SG-1000" );

				if( !strcmp( "snes", em_entry->d_name ) )
					strcpy( outputFileName, "Super Nintendo" );

				if( !strcmp( "vectrex", em_entry->d_name ) )
					strcpy( outputFileName, "Vectrex" );

				if( !strcmp( "zxspectrum", em_entry->d_name ) )
					strcpy( outputFileName, "ZX Spectrum" );

				if( !strcmp( "ports", em_entry->d_name ) )
					strcpy( outputFileName, "ports" );

				


				
				strcpy( make_path,"");
				strcat( make_path,"/home/pi/.attract/romlists/");
				strcat( make_path,outputFileName);
				strcat( make_path,".txt");

				//printf("아웃풋 리스트 파일명 : %s\n", make_path );

				if( (fIn = fopen( root_path,"r")) == NULL )		// 풀롬 리스트 유무 확인
				{
					printf("%s full list empty!\n", root_path);
					continue;
				}
				
				if( (fOut = fopen( make_path,"w")) == NULL )
				{
					printf("%s output list error!\n", make_path );
					continue;
				}

				printf("%s\n", outputFileName);

				while( (rom_entry = readdir(spList)) != NULL )
				{
					lstat( rom_entry-> d_name, &rom_buf );		
					snprintf(rom_buff, sizeof(rom_buff), "%s/%s", rom_path, rom_entry->d_name);

					file_name = rom_entry->d_name;
					length=strlen(file_name);
					compare=&file_name[length-3];					

					if( chdir(rom_buff) != 0 )
					{
						if( 	!strcmp(".sh", compare) || 
							!strcmp(".SH", compare) || 
							!strcmp("zip", compare) || 
							!strcmp("ZIP", compare) || 
							!strcmp("pce", compare) || 
							!strcmp("PCE", compare) ||
							!strcmp("nes", compare) ||
							!strcmp("NES", compare) ||
							!strcmp("fba", compare) ||
							!strcmp("FBA", compare) ||							
							!strcmp("gba", compare) ||
							!strcmp("GBA", compare) ||
							!strcmp("gbc", compare) ||
							!strcmp("GBC", compare) ||
							!strcmp("SMC", compare) ||
							!strcmp("smc", compare) ||
							!strcmp("swc", compare) ||
							!strcmp("SWC", compare) ||
							!strcmp("sfc", compare) ||
							!strcmp("SFC", compare) ||
							!strcmp("bin", compare) ||
							!strcmp("BIN", compare) ||
							!strcmp("mx1", compare) ||
							!strcmp("MX1", compare) ||
							!strcmp("mx2", compare) ||
							!strcmp("MX2", compare) ||
							!strcmp("rom", compare) ||
							!strcmp("ROM", compare) ||							
							!strcmp("iso", compare) ||
							!strcmp("ISO", compare) 
							)
						{						
							thin_file_name = strtok( rom_entry->d_name,".");
							writeListFlag = 0;
							fseek(fIn, 0L, SEEK_SET );
							
							fileCnt  = 1;		// 파일이 하나라도 존재함
							while(1)
							{
								if( fgets(list,1000,fIn)==NULL ) 
									break;

								strcpy( get_list, list );
								strtok( get_list, ";");			// 풀 롬 리스트에 있는 롬명
								//printf("%s\n", list );

								//printf("%s / %s\n", thin_file_name, get_list );
								
								if( !strcmp( thin_file_name, get_list) )	// 리스트에 있으면
								{
									//printf("=== %s", list);
									fprintf(fOut, "%s", list);
									writeListFlag = 1;
									break;
								}								
								
								
							}

							if( writeListFlag == 0 )
							{								
									fprintf(fOut, "%s;%s;%s;;;;;;;;;;;;;;\n", thin_file_name, thin_file_name, outputFileName );
							}
							
						}
					}
				}
				

				if( fileCnt > 0 )
				{
					fprintf(fNewCfg,"display\t%s\n",outputFileName );
					fprintf(fNewCfg,"\tlayout\tPandoras Box\n");
					fprintf(fNewCfg,"\tromlist\t%s\n",outputFileName );
					fprintf(fNewCfg,"\tin_cycle\tyes\n" );
					fprintf(fNewCfg,"\tin_menu\tyes\n\n" );
					fileCnt = 0;
				}
				
			
				closedir( spList );
				fclose(fIn);
				fclose(fOut);

		}			
		else
		{
			//printf("파일 %d %s\n", em_buf.st_mode, em_entry->d_name );
		}		
	}
	closedir( spDir );




	

	if( (fOldCfg= fopen( old_config_path, "r")) == NULL )			// old attract.cfg 파일 읽기
		puts("error!");

	while(1)
	{
		if( fgets(cfgText,1000,fOldCfg)==NULL ) 
			break;

		if( cfg_write_flag == 0 )
		{
			if( strstr(cfgText, "sound") != 0 )			
			{
				cfg_write_flag = 1;
				fprintf(fNewCfg, "%s", cfgText);
			}
		}
		else
		{
			fprintf(fNewCfg, "%s", cfgText);

		}
	}



	fclose(fNewCfg);	
	fclose(fOldCfg);	
	
	// 기존 attract.cfg 백업
	system( "sudo mv /home/pi/.attract/attract.cfg /home/pi/.attract/attract.cfg.bak" );
	// 새로운 attract.cfg 갱신
	system( "sudo mv /home/pi/.attract/aa.cfg /home/pi/.attract/attract.cfg" );	
	// 어트랙트모드 실행
	system( "sudo reboot" );
	//execlp("attract","attract",0,0);	
	
	return -1;	
}
