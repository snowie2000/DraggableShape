﻿	<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
		<PropertyGroup>
			<ProjectGuid>{17965511-923C-49D7-A574-3167DF98BFE5}</ProjectGuid>
			<MainSource>dclDraggableShape.dpk</MainSource>
			<ProjectVersion>12.3</ProjectVersion>
			<Base>True</Base>
			<Config Condition="'$(Config)'==''">Debug</Config>
			<Platform>Win32</Platform>
			<AppType>Package</AppType>
			<FrameworkType>VCL</FrameworkType>
			<DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Base' or '$(Base)'!=''">
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Debug' or '$(Cfg_1)'!=''">
			<Cfg_1>true</Cfg_1>
			<CfgParent>Base</CfgParent>
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Config)'=='Release' or '$(Cfg_2)'!=''">
			<Cfg_2>true</Cfg_2>
			<CfgParent>Base</CfgParent>
			<Base>true</Base>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Base)'!=''">
			<GenPackage>true</GenPackage>
			<DCC_CBuilderOutput>All</DCC_CBuilderOutput>
			<GenDll>true</GenDll>
			<DCC_ImageBase>00400000</DCC_ImageBase>
			<DCC_DcuOutput>.\$(Config)\$(Platform)</DCC_DcuOutput>
			<DCC_UnitAlias>WinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;$(DCC_UnitAlias)</DCC_UnitAlias>
			<DCC_ExeOutput>.\$(Config)\$(Platform)</DCC_ExeOutput>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Cfg_1)'!=''">
			<DCC_Define>DEBUG;$(DCC_Define)</DCC_Define>
			<DCC_Optimize>false</DCC_Optimize>
			<DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
		</PropertyGroup>
		<PropertyGroup Condition="'$(Cfg_2)'!=''">
			<DCC_LocalDebugSymbols>false</DCC_LocalDebugSymbols>
			<DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
			<DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
			<DCC_DebugInformation>false</DCC_DebugInformation>
		</PropertyGroup>
		<ItemGroup>
			<DelphiCompile Include="dclDraggableShape.dpk">
				<MainSource>MainSource</MainSource>
			</DelphiCompile>
			<DCCReference Include="rtl.dcp"/>
			<DCCReference Include="vcl.dcp"/>
			<DCCReference Include="DraggableShape.pas"/>
			<BuildConfiguration Include="Release">
				<Key>Cfg_2</Key>
				<CfgParent>Base</CfgParent>
			</BuildConfiguration>
			<BuildConfiguration Include="Base">
				<Key>Base</Key>
			</BuildConfiguration>
			<BuildConfiguration Include="Debug">
				<Key>Cfg_1</Key>
				<CfgParent>Base</CfgParent>
			</BuildConfiguration>
		</ItemGroup>
		<Import Condition="Exists('$(BDS)\Bin\CodeGear.Delphi.Targets')" Project="$(BDS)\Bin\CodeGear.Delphi.Targets"/>
		<Import Condition="Exists('$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj')" Project="$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj"/>
		<ProjectExtensions>
			<Borland.Personality>Delphi.Personality.12</Borland.Personality>
			<Borland.ProjectType>Package</Borland.ProjectType>
			<BorlandProject>
				<Delphi.Personality>
					<Source>
						<Source Name="MainSource">dclDraggableShape.dpk</Source>
					</Source>
					<VersionInfo>
						<VersionInfo Name="IncludeVerInfo">True</VersionInfo>
						<VersionInfo Name="AutoIncBuild">False</VersionInfo>
						<VersionInfo Name="MajorVer">1</VersionInfo>
						<VersionInfo Name="MinorVer">0</VersionInfo>
						<VersionInfo Name="Release">0</VersionInfo>
						<VersionInfo Name="Build">0</VersionInfo>
						<VersionInfo Name="Debug">False</VersionInfo>
						<VersionInfo Name="PreRelease">False</VersionInfo>
						<VersionInfo Name="Special">False</VersionInfo>
						<VersionInfo Name="Private">False</VersionInfo>
						<VersionInfo Name="DLL">False</VersionInfo>
						<VersionInfo Name="Locale">2052</VersionInfo>
						<VersionInfo Name="CodePage">936</VersionInfo>
					</VersionInfo>
					<VersionInfoKeys>
						<VersionInfoKeys Name="CompanyName"/>
						<VersionInfoKeys Name="FileDescription"/>
						<VersionInfoKeys Name="FileVersion">1.0.0.0</VersionInfoKeys>
						<VersionInfoKeys Name="InternalName"/>
						<VersionInfoKeys Name="LegalCopyright"/>
						<VersionInfoKeys Name="LegalTrademarks"/>
						<VersionInfoKeys Name="OriginalFilename"/>
						<VersionInfoKeys Name="ProductName"/>
						<VersionInfoKeys Name="ProductVersion">1.0.0.0</VersionInfoKeys>
						<VersionInfoKeys Name="Comments"/>
					</VersionInfoKeys>
					<Excluded_Packages>
						<Excluded_Packages Name="$(BDSBIN)\dcloffice2k150.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
						<Excluded_Packages Name="$(BDSBIN)\dclofficexp150.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
					</Excluded_Packages>
				</Delphi.Personality>
				<Platforms>
					<Platform value="Win32">True</Platform>
				</Platforms>
			</BorlandProject>
			<ProjectFileVersion>12</ProjectFileVersion>
		</ProjectExtensions>
	</Project>
