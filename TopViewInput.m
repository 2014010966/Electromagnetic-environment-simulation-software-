function varargout = TopViewInput(varargin)
% TOPVIEWINPUT MATLAB code for TopViewInput.fig
%      TOPVIEWINPUT, by itself, creates a new TOPVIEWINPUT or raises the existing
%      singleton*.
%
%      H = TOPVIEWINPUT returns the handle to a new TOPVIEWINPUT or the handle to
%      the existing singleton*.
%
%      TOPVIEWINPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOPVIEWINPUT.M with the given input arguments.
%
%      TOPVIEWINPUT('Property','Value',...) creates a new TOPVIEWINPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TopViewInput_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TopViewInput_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TopViewInput

% Last Modified by GUIDE v2.5 17-Oct-2017 13:36:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TopViewInput_OpeningFcn, ...
                   'gui_OutputFcn',  @TopViewInput_OutputFcn, ...
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


% --- Executes just before TopViewInput is made visible.
function TopViewInput_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TopViewInput (see VARARGIN)

% Choose default command line output for TopViewInput
handles.output = hObject;
switch(varargin{1})
    case 'InitialCondition'
        handles.MyLineSet=varargin{2};
end
InitializationFunction(hObject,handles);
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes TopViewInput wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TopViewInput_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
if(isempty(handles))
    varargout{1}='Error';
else
    varargout{1} = handles.output;
    varargout{2}=handles.MyLineSet;
    close(gcf);
end


% --- Executes on selection change in LineIndex.
function LineIndex_Callback(hObject, eventdata, handles)
% hObject    handle to LineIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MyLineSet.LineChoose=get(hObject,'value');
RenewLineIndex(hObject,handles);
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns LineIndex contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LineIndex


% --- Executes during object creation, after setting all properties.
function LineIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LineIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XInput_Callback(hObject, eventdata, handles)
% hObject    handle to XInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempX=str2double(get(hObject,'string'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of XInput as text
%        str2double(get(hObject,'String')) returns contents of XInput as a double


% --- Executes during object creation, after setting all properties.
function XInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NameInput_Callback(hObject, eventdata, handles)
% hObject    handle to NameInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempName=get(hObject,'string');
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of NameInput as text
%        str2double(get(hObject,'String')) returns contents of NameInput as a double


% --- Executes during object creation, after setting all properties.
function NameInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NameInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YInput_Callback(hObject, eventdata, handles)
% hObject    handle to YInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempY=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of YInput as text
%        str2double(get(hObject,'String')) returns contents of YInput as a double


% --- Executes during object creation, after setting all properties.
function YInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DirectionInput_Callback(hObject, eventdata, handles)
% hObject    handle to DirectionInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempDirection=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of DirectionInput as text
%        str2double(get(hObject,'String')) returns contents of DirectionInput as a double


% --- Executes during object creation, after setting all properties.
function DirectionInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DirectionInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LengthInput_Callback(hObject, eventdata, handles)
% hObject    handle to LengthInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempLength=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of LengthInput as text
%        str2double(get(hObject,'String')) returns contents of LengthInput as a double


% --- Executes during object creation, after setting all properties.
function LengthInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LengthInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Complete.
function Complete_Callback(hObject, eventdata, handles)
% hObject    handle to Complete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.MyLineSet.LineCheck)
    if(isempty(handles.MyLineSet.DataPath))
        [Filename,Filepath]=uiputfile('*.xls','文件保存为','线路信息存储');
    else
        [Filename,Filepath]=uiputfile('*.xls','文件保存为',handles.MyLineSet.DataPath);
    end
    if(min(Filename==0)&&min(Filepath==0))
        return;
    else
        filename=[Filepath,Filename];
        handles.MyLineSet.DataPath=filename;
    end
    if(exist(filename))
        delete(filename);
    end
    if(isempty(handles.MyLineSet.LineIndex))
        warndlg('线路信息未输入(未保存)','保存错误');
        return;
    end
    WriteToXls(handles)
    guidata(hObject, handles);
end
uiresume(handles.figure1);

% --- Executes on button press in Delete.
function Delete_Callback(hObject, eventdata, handles)
% hObject    handle to Delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(isempty(handles.MyLineSet.LineIndex)>0)
    warndlg('当前保存线路为0，无法进行删除操作','!!warning!!');
else
    handles.MyLineSet=handles.MyLineSet.Delete();
    RenewLineIndex(hObject,handles);
end
guidata(hObject, handles);


% --- Executes on button press in Change.
function Change_Callback(hObject, eventdata, handles)
% hObject    handle to Change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(UpdateData(hObject,handles))
    return;
end
handles.MyLineSet=handles.MyLineSet.Change(handles.TempName,handles.TempX,handles.TempY,handles.TempLength,handles.TempDirection,handles.TempDistance,handles.TempSag);
RenewLineIndex(hObject,handles);
guidata(hObject, handles);
choice=questdlg('是否进一步修改线路相关信息？','修改线路信息','是','否','是');
switch choice
    case'是'
        set(gcf,'visible','off');
        [h,CircuitSet]=CircuitInfoInput('OldLine',handles.MyLineSet.LineIndex(handles.MyLineSet.LineChoose).MyCircuit);
        set(gcf,'visible','on');
        if(max(h=='Error'))
            warndlg('必须输入线路截面信息，错误的关闭将导致程序出现错误，请重启主程序','!!Error!!');
        else
            handles.MyLineSet.LineIndex(handles.MyLineSet.LineChoose).MyCircuit=CircuitSet;
            if(CircuitSet.CircuitCheck)
                handles.MyLineSet.LineCheck=1;
            end
        end
    case'否'
        ;
end
guidata(hObject, handles);


% --- Executes on button press in Add.
function Add_Callback(hObject, eventdata, handles)
% hObject    handle to Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(UpdateData(hObject,handles))
    return;
end
handles.MyLineSet=handles.MyLineSet.Add(handles.TempName,handles.TempX,handles.TempY,handles.TempLength,handles.TempDirection,handles.TempDistance,handles.TempSag);
RenewLineIndex(hObject,handles);
set(gcf,'visible','off');
[h,CircuitSet]=CircuitInfoInput('NewLine');
set(gcf,'visible','on');
if(max(h=='Error'))
    warndlg('必须输入线路截面信息，错误的关闭将导致程序出现错误，请重启主程序','!!Error!!');
else
    handles.MyLineSet.LineIndex(handles.MyLineSet.LineChoose).MyCircuit=CircuitSet;
end
guidata(hObject, handles);


function PlotOnAx(handles)
LineX=handles.MyLineSet.LineX;
LineY=handles.MyLineSet.LineY;
LineDirection=handles.MyLineSet.LineDirection;
LineChoose=handles.MyLineSet.LineChoose;
LineLength=handles.MyLineSet.LineLength;
LineName=handles.MyLineSet.LineName;
L=length(LineX);
cla(handles.ax);
if(L==0)
    cla(handles.ax);
else
    for s=1:1:L
        x=linspace(LineX(s),LineX(s)+LineLength(s)*cos(LineDirection(s)),100);
        y=linspace(LineY(s),LineY(s)+LineLength(s)*sin(LineDirection(s)),100);
        x0=LineX(s)+LineLength(s)*cos(LineDirection(s))/2;
        y0=LineY(s)+LineLength(s)*sin(LineDirection(s))/1.5;
        hold on;
        temp=plot(handles.ax,x,y,'k');
        if(L==1)
            text(x0,y0,LineName);
        else
            text(x0,y0,LineName(s));
        end
        if(s==LineChoose)
            set(temp,'linewidth',4);
        else
            set(temp,'linewidth',2);
        end
    end
end


% --- Executes during object creation, after setting all properties.
function Delete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function InitializationFunction(hObject,handles)
handles.MyLineSet.LineChoose=1;
handles.TempX=[];
handles.TempY=[];
handles.TempDirection=[];
handles.TempLength=[];
handles.TempName=[];
handles.TempDistance=[];
handles.TempSag=[];
if(isempty(handles.MyLineSet.LineIndex))
    set(handles.LineIndex,'string',{'请输入信息'});
    set(handles.NameInput,'string',{});
    set(handles.XInput,'string',{});
    set(handles.YInput,'string',{});
    set(handles.LengthInput,'string',{});
    set(handles.DirectionInput,'string',{});
    set(handles.DistanceInput,'string',{});
    set(handles.SagInput,'string',{});
else
    set(handles.XInput,'string',num2str(handles.MyLineSet.LineX(1)));
    set(handles.LineIndex,'string',handles.MyLineSet.LineName);
    set(handles.NameInput,'string',handles.MyLineSet.LineName(1));
    set(handles.YInput,'string',num2str(handles.MyLineSet.LineY(1)));
    set(handles.DirectionInput,'string',num2str(handles.MyLineSet.LineDirection(1)));
    set(handles.LengthInput,'string',num2str(handles.MyLineSet.LineLength(1)));
    set(handles.DistanceInput,'string',num2str(handles.MyLineSet.Distance(1)));
    set(handles.SagInput,'string',num2str(handles.MyLineSet.Sag(1)));
end
set(handles.LineIndex,'value',handles.MyLineSet.LineChoose);
PlotOnAx(handles);
guidata(hObject, handles);

function RenewLineIndex(hObject,handles)
L=handles.MyLineSet.LineChoose;
if(isempty(handles.MyLineSet.LineIndex))
    set(handles.LineIndex,'string',{'请输入信息'});
    set(handles.NameInput,'string',{});
    set(handles.XInput,'string',{});
    set(handles.YInput,'string',{});
    set(handles.LengthInput,'string',{});
    set(handles.DirectionInput,'string',{});
    set(handles.DistanceInput,'string',{});
    set(handles.SagInput,'string',{});
else
    set(handles.XInput,'string',num2str(handles.MyLineSet.LineX(L)));
    set(handles.LineIndex,'string',handles.MyLineSet.LineName,'value',L);
    set(handles.NameInput,'string',handles.MyLineSet.LineName(L));
    set(handles.YInput,'string',num2str(handles.MyLineSet.LineY(L)));
    set(handles.DirectionInput,'string',num2str(handles.MyLineSet.LineDirection(L)));
    set(handles.LengthInput,'string',num2str(handles.MyLineSet.LineLength(L)));
    set(handles.DistanceInput,'string',num2str(handles.MyLineSet.Distance(L)));
    set(handles.SagInput,'string',num2str(handles.MyLineSet.Sag(L)));
end
PlotOnAx(handles);

function WriteToXls(handles)
h=waitbar(0,'写入文件');
steps=0;step=0;filename=handles.MyLineSet.DataPath;
for s=1:1:length(handles.MyLineSet.LineX)
    for t=1:1:length(handles.MyLineSet.LineIndex(s).MyCircuit)
        steps=steps+1;
    end
end
for s=1:1:length(handles.MyLineSet.LineX)
    temp='线路名称:';
    temp=[temp,{'起始位置横坐标(m):'}];
    temp=[temp,{'起始位置纵坐标(m):'}];
    temp=[temp,{'线路长度(m):'}];
    temp=[temp,{'线路延伸方向(m):'}];
    temp=[temp,{'档距(m):'}];
    temp=[temp,{'弧垂(m):'}];
    temp=[temp,{num2str(length(handles.MyLineSet.LineIndex(s).MyCircuit.CircuitIndex))}];
    temp=[temp,{'A相横坐标(m):'}];
    temp=[temp,{'A相纵坐标(m):'}];
    temp=[temp,{'B相横坐标(m):'}];
    temp=[temp,{'B相纵坐标(m):'}];
    temp=[temp,{'C相横坐标(m):'}];
    temp=[temp,{'C相纵坐标(m):'}];
    temp=[temp,{'分裂数:'}];
    temp=[temp,{'分裂半径(m):'}];
    temp=[temp,{'导线半径(m):'}];
    temp=[temp,{'电压等级(kv):'}];
    temp=[temp,{'电流大小(A):'}];
    xlswrite(filename,temp',s,'A1');
    temp2=handles.MyLineSet.LineName(s);
    temp2=[temp2,{num2str(handles.MyLineSet.LineX(s))}];
    temp2=[temp2,{num2str(handles.MyLineSet.LineY(s))}];
    temp2=[temp2,{num2str(handles.MyLineSet.LineLength(s))}];
    temp2=[temp2,{num2str(handles.MyLineSet.LineDirection(s))}];
    temp2=[temp2,{num2str(handles.MyLineSet.Distance(s))}];
    temp2=[temp2,{num2str(handles.MyLineSet.Sag(s))}];
    xlswrite(filename,temp2',s,'B1');
    for t=1:1:length(handles.MyLineSet.LineIndex(s).MyCircuit)
        step=step+1;
        waitbar(step/steps);
        Str1=['第',num2str(t),'回线路'];
        Str2=[char(t+65),num2str(8)];
        Str3=[handles.MyLineSet.LineIndex(s).MyCircuit.AX,handles.MyLineSet.LineIndex(s).MyCircuit.AY,handles.MyLineSet.LineIndex(s).MyCircuit.BX,handles.MyLineSet.LineIndex(s).MyCircuit.BY,handles.MyLineSet.LineIndex(s).MyCircuit.CX,handles.MyLineSet.LineIndex(s).MyCircuit.CY,handles.MyLineSet.LineIndex(s).MyCircuit.SplitNum,handles.MyLineSet.LineIndex(s).MyCircuit.SplitRadius,handles.MyLineSet.LineIndex(s).MyCircuit.LineRadius,handles.MyLineSet.LineIndex(s).MyCircuit.Voltage,handles.MyLineSet.LineIndex(s).MyCircuit.Current]';
        Str4=[char(t+65),num2str(9)];
        xlswrite(filename,{Str1},s,Str2);
        xlswrite(filename,Str3,s,Str4);
    end
end
close(h);

function Flag=UpdateData(hObject,handles)
handles.TempX=str2double(get(handles.XInput,'string'));
handles.TempY=str2double(get(handles.YInput,'string'));
handles.TempDirection=str2double(get(handles.DirectionInput,'string'));
handles.TempLength=str2double(get(handles.LengthInput,'string'));
handles.TempName=get(handles.NameInput,'string');
handles.TempDistance=str2double(get(handles.DistanceInput,'string'));
handles.TempSag=str2double(get(handles.SagInput,'string'));
guidata(hObject, handles);
if(isempty(handles.TempX))
    warndlg('横坐标未输入','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempY))
    warndlg('纵坐标未输入','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempLength))
    warndlg('长度未输入','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempDirection))
    warndlg('线路方向未输入','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempDistance))
    warndlg('线路档距未输入','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempSag))
    warndlg('线路档距未输入','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempDistance))
    warndlg('线路档距未输入','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempSag))
    warndlg('线路档距未输入','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempX))
    warndlg('横坐标输入错误','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempY))
    warndlg('纵坐标输入错误','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempName))
    warndlg('线路名称输入错误','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempLength))
    warndlg('长度输入错误','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempDirection))
    warndlg('线路方向输入错误','输入错误');
    Flag=1;
    return;
end
Flag=0;



function DistanceInput_Callback(hObject, eventdata, handles)
% hObject    handle to DistanceInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempDistance=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of DistanceInput as text
%        str2double(get(hObject,'String')) returns contents of DistanceInput as a double


% --- Executes during object creation, after setting all properties.
function DistanceInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DistanceInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SagInput_Callback(hObject, eventdata, handles)
% hObject    handle to SagInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempSag=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of SagInput as text
%        str2double(get(hObject,'String')) returns contents of SagInput as a double


% --- Executes during object creation, after setting all properties.
function SagInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SagInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
