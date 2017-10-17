function varargout = MainFigure(varargin)
% MAINFIGURE MATLAB code for MainFigure.fig
%      MAINFIGURE, by itself, creates a new MAINFIGURE or raises the existing
%      singleton*.
%
%      H = MAINFIGURE returns the handle to a new MAINFIGURE or the handle to
%      the existing singleton*.
%
%      MAINFIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFIGURE.M with the given input arguments.
%
%      MAINFIGURE('Property','Value',...) creates a new MAINFIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainFigure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainFigure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainFigure

% Last Modified by GUIDE v2.5 11-Oct-2017 13:53:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainFigure_OpeningFcn, ...
                   'gui_OutputFcn',  @MainFigure_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MainFigure is made visible.
function MainFigure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainFigure (see VARARGIN)

% Choose default command line output for MainFigure
handles.output = hObject;
set(handles.InputPreview,'enable','off');
set(handles.SimulationRegionInput,'enable','off');
set(handles.ResultShow,'enable','off');
handles.AX=[];
handles.AY=[];
handles.BX=[];
handles.BY=[];
handles.CX=[];
handles.CY=[];
handles.SplitNum=[];
handles.SplitRadius=[];
handles.LineRadius=[];
handles.Voltage=[];
handles.Current=[];
handles.LineX=[];
handles.LineY=[];
handles.Distance=[];
handles.Sag=[];
handles.LineDirection=[];
handles.LineLength=[];
handles.LineName=[];
handles.RegisterStart=[];
handles.RegisterEnd=[];
handles.DataPath=[];
handles.ModelChoose=[];
handles.SurfaceState=[];
handles.P1x=[];
handles.P1y=[];
handles.P1z=[];
handles.P2x=[];
handles.P2y=[];
handles.P2z=[];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainFigure wait for user response (see UIRESUME)
 uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainFigure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
if(isempty(handles))
    ;
else
    varargout{1} = handles.output;
end

% --- Executes on button press in LoadIn.
function LoadIn_Callback(hObject, eventdata, handles)
% hObject    handle to LoadIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile('*.xls','载入线路集');
if(min(FileName==0)&&min(FilePath==0))
    return;
else
    filename=[FilePath,FileName];
    handles.DataPath=filename;
end
set(gcf,'visible','off');
[~,Sheet,~]=xlsfinfo(filename);
set(gcf,'visible','on');
for s=1:1:length(Sheet)
    [num,txt,~]=xlsread(filename,s);
    if(isempty(num(1:1:6,2))||isempty(txt(1,2)))
        warndlg('当前数据集数据格式有误','载入错误');
        return;
    end
    if(max(isnan(num(1:1:6,2)))||isnan(num(7,1)))
        warndlg('当前数据集数据格式有误','载入错误');
        return;
    end
    L=num(7,1);
    if(isempty(num(8:1:18,2:1:L+1)))
        warndlg('当前数据集数据格式有误','载入错误');
        return;
    end
    
    if(isnan(num(8:1:18,2:1:L+1)))
        warndlg('当前数据集数据格式有误','载入错误');
        return;
    end
    handles.LineX(s)=num(1,2);
    handles.LineY(s)=num(2,2);
    handles.LineLength(s)=num(3,2);
    handles.LineDirection(s)=num(4,2);
    handles.Distance(s)=num(5,2);
    handles.Sag(s)=num(6,2);
    
    if(s==1)
        handles.RegisterStart(s)=1;
        handles.RegisterEnd(s)=L;
        handles.LineName=txt(1,2);
    else
        handles.RegisterStart(s)=handles.RegisterEnd(s-1)+1;
        handles.RegisterEnd(s)=handles.RegisterEnd(s-1)+L;
        handles.LineName=[handles.LineName txt(1,2)];
    end
    for t=1:1:L
        handles.AX=[handles.AX,num(8,t+1)];
        handles.AY=[handles.AY,num(9,t+1)];
        handles.BX=[handles.BX,num(10,t+1)];
        handles.BY=[handles.BY,num(11,t+1)];
        handles.CX=[handles.CX,num(12,t+1)];
        handles.CY=[handles.CY,num(13,t+1)];
        handles.SplitNum=[handles.SplitNum,num(14,t+1)];
        handles.SplitRadius=[handles.SplitRadius,num(15,t+1)];
        handles.LineRadius=[handles.LineRadius,num(16,t+1)];
        handles.Voltage=[handles.Voltage,num(17,t+1)];
        handles.Current=[handles.Current,num(18,t+1)];
    end
end
guidata(hObject, handles);
set(gcf,'visible','off');
[h,handles.DataPath,handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.SplitNum,handles.SplitRadius,handles.LineRadius,handles.Voltage,handles.Current,handles.Distance,handles.Sag,handles.RegisterStart,handles.RegisterEnd]=TopViewInput('InitialCondition',handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.SplitNum,handles.SplitRadius,handles.LineRadius,handles.Voltage,handles.Current,handles.Distance,handles.Sag,handles.RegisterStart,handles.RegisterEnd,handles.DataPath);
set(gcf,'visible','on');
if(h=='DeleteWithoutSaving')
    ;
else
    set(hObject,'enable','off');
    set(handles.NewBuild,'string','修改数据集');
    set(handles.InputPreview,'enable','on');
    set(handles.SimulationRegionInput,'enable','on');
end
guidata(hObject, handles);
% --- Executes on button press in NewBuild.
function NewBuild_Callback(hObject, eventdata, handles)
% hObject    handle to NewBuild (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
[h,handles.DataPath,handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.SplitNum,handles.SplitRadius,handles.LineRadius,handles.Voltage,handles.Current,handles.Distance,handles.Sag,handles.RegisterStart,handles.RegisterEnd]=TopViewInput('InitialCondition',handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.SplitNum,handles.SplitRadius,handles.LineRadius,handles.Voltage,handles.Current,handles.Distance,handles.Sag,handles.RegisterStart,handles.RegisterEnd,handles.DataPath);
set(gcf,'visible','on');
if(h=='DeleteWithoutSaving')
    ;
else
    set(handles.NewBuild,'string','修改数据集');
    set(handles.LoadIn,'enable','off');
    set(handles.InputPreview,'enable','on');
    set(handles.SimulationRegionInput,'enable','on');
end
guidata(hObject, handles);

% --- Executes on button press in SimulationRegionInput.
function SimulationRegionInput_Callback(hObject, eventdata, handles)
% hObject    handle to SimulationRegionInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
%[~,handles.ModelChoose,handles.Temp1,handles.Temp2,handles.Temp3,handles.Temp4]=RegionInput('SimulationRegion',handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.RegisterStart,handles.RegisterEnd);
[h,handles.ModelChoose,handles.SurfaceState,handles.P1x,handles.P1y,handles.P1z,handles.P2x,handles.P2y,handles.P2z]=SimulationRegionInput('SimulationRegion',handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.RegisterStart,handles.RegisterEnd);
set(gcf,'visible','on');
if(h=='DeleteWithoutSaving')
    ;
else
    set(handles.LoadIn,'enable','off');
    set(handles.NewBuild,'enable','off');
end
guidata(hObject, handles);

% --- Executes on button press in InputPreview.
function InputPreview_Callback(hObject, eventdata, handles)
% hObject    handle to InputPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
PreviewFigure('PreViewInput',handles.LineName,handles.LineX,handles.LineY,handles.LineDirection,handles.LineLength,handles.AX,handles.AY,handles.BX,handles.BY,handles.CX,handles.CY,handles.SplitNum,handles.SplitRadius,handles.LineRadius,handles.Voltage,handles.Current,handles.Distance,handles.Sag,handles.RegisterStart,handles.RegisterEnd);
set(gcf,'visible','on');

% --- Executes on button press in ResultShow.
function ResultShow_Callback(hObject, eventdata, handles)
% hObject    handle to ResultShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
