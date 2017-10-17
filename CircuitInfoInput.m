function varargout = CircuitInfoInput(varargin)
% CIRCUITINFOINPUT MATLAB code for CircuitInfoInput.fig
%      CIRCUITINFOINPUT, by itself, creates a new CIRCUITINFOINPUT or raises the existing
%      singleton*.
%
%      H = CIRCUITINFOINPUT returns the handle to a new CIRCUITINFOINPUT or the handle to
%      the existing singleton*.
%
%      CIRCUITINFOINPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIRCUITINFOINPUT.M with the given input arguments.
%
%      CIRCUITINFOINPUT('Property','Value',...) creates a new CIRCUITINFOINPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CircuitInfoInput_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CircuitInfoInput_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CircuitInfoInput

% Last Modified by GUIDE v2.5 17-Oct-2017 14:09:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CircuitInfoInput_OpeningFcn, ...
                   'gui_OutputFcn',  @CircuitInfoInput_OutputFcn, ...
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

% --- Executes just before CircuitInfoInput is made visible.
function CircuitInfoInput_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CircuitInfoInput (see VARARGIN)
switch varargin{1}
    case 'NewLine'
        handles.MyCircuitSet=CircuitSet;
    case 'OldLine'
        handles.MyCircuitSet=varargin{2};
end
InitializationFunction(handles,hObject);
% Choose default command line output for CircuitInfoInput
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes CircuitInfoInput wait for user response (see UIRESUME)
 uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CircuitInfoInput_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
if(isempty(handles))
    varargout{1}='Error';
    varargout{2}=[];
else
    varargout{1} = handles.output;
    varargout{2}=handles.MyCircuitSet;
    close(gcf);
end
% --- Executes on button press in Complete.
function Complete_Callback(hObject, eventdata, handles)
% hObject    handle to Complete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(isempty(handles.MyCircuitSet.CircuitIndex))
    warndlg('截面线路信息未输入(未保存)','输入错误');
    return;
end
guidata(hObject, handles);
uiresume(handles.figure1);

% --- Executes on button press in Add.
function Add_Callback(hObject, eventdata, handles)
% hObject    handle to Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(UpdateData(handles,hObject))
    return;
end
handles.MyCircuitSet=handles.MyCircuitSet.Add(handles.TempAX,handles.TempAY,handles.TempBX,handles.TempBY,handles.TempCX,handles.TempCY,handles.TempSplitNum,handles.TempSplitRadius,handles.TempLineRadius,handles.TempVoltage,handles.TempCurrent);
guidata(hObject, handles);
Plot(handles);
RenewFigure(handles);
guidata(hObject, handles);

% --- Executes on button press in Delete.
function Delete_Callback(hObject, eventdata, handles)
% hObject    handle to Delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
L=length(handles.MyCircuitSet.CircuitIndex);
k=handles.MyCircuitSet.CircuitChoose;
if(L<1)
    warndlg('当前无输入回路，无法删除','删除错误');
    return;
end
handles.MyCircuitSet=handles.MyCircuitSet.Delete();
Plot(handles);
RenewFigure(handles);
guidata(hObject, handles);

% --- Executes on button press in Change.
function Change_Callback(hObject, eventdata, handles)
% hObject    handle to Change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
L=length(handles.MyCircuitSet.CircuitIndex);
if(L<1)
    warndlg('当前无输入回路，无法修改','修改错误');
    return;
end
if(UpdateData(handles,hObject))
    return;
end
handles.MyCircuitSet=handles.MyCircuitSet.Change(handles.TempAX,handles.TempAY,handles.TempBX,handles.TempBY,handles.TempCX,handles.TempCY,handles.TempSplitNum,handles.TempSplitRadius,handles.TempLineRadius,handles.TempVoltage,handles.TempCurrent);
Plot(handles)
RenewFigure(handles);
guidata(hObject, handles);

% --- Executes on selection change in CircuitIndex.
function CircuitIndex_Callback(hObject, eventdata, handles)
% hObject    handle to CircuitIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MyCircuitSet.CircuitChoose=get(hObject,'value');
Plot(handles);
RenewFigure(handles);
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns CircuitIndex contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CircuitIndex


% --- Executes during object creation, after setting all properties.
function CircuitIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CircuitIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CurrentInput_Callback(hObject, eventdata, handles)
% hObject    handle to CurrentInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempCurrent=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of CurrentInput as text
%        str2double(get(hObject,'String')) returns contents of CurrentInput as a double


% --- Executes during object creation, after setting all properties.
function CurrentInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrentInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VoltageInput_Callback(hObject, eventdata, handles)
% hObject    handle to VoltageInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempVoltage=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of VoltageInput as text
%        str2double(get(hObject,'String')) returns contents of VoltageInput as a double


% --- Executes during object creation, after setting all properties.
function VoltageInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VoltageInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LineRadiusInput_Callback(hObject, eventdata, handles)
% hObject    handle to LineRadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempLineRadius=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of LineRadiusInput as text
%        str2double(get(hObject,'String')) returns contents of LineRadiusInput as a double


% --- Executes during object creation, after setting all properties.
function LineRadiusInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LineRadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SplitRadiusInput_Callback(hObject, eventdata, handles)
% hObject    handle to SplitRadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempSplitRadius=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of SplitRadiusInput as text
%        str2double(get(hObject,'String')) returns contents of SplitRadiusInput as a double


% --- Executes during object creation, after setting all properties.
function SplitRadiusInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SplitRadiusInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SplitNumInput_Callback(hObject, eventdata, handles)
% hObject    handle to SplitNumInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempAplitNum=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of SplitNumInput as text
%        str2double(get(hObject,'String')) returns contents of SplitNumInput as a double


% --- Executes during object creation, after setting all properties.
function SplitNumInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SplitNumInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CYInput_Callback(hObject, eventdata, handles)
% hObject    handle to CYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempCY=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of CYInput as text
%        str2double(get(hObject,'String')) returns contents of CYInput as a double


% --- Executes during object creation, after setting all properties.
function CYInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CXInput_Callback(hObject, eventdata, handles)
% hObject    handle to CXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempCX=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of CXInput as text
%        str2double(get(hObject,'String')) returns contents of CXInput as a double


% --- Executes during object creation, after setting all properties.
function CXInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BYInput_Callback(hObject, eventdata, handles)
% hObject    handle to BYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempBY=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of BYInput as text
%        str2double(get(hObject,'String')) returns contents of BYInput as a double


% --- Executes during object creation, after setting all properties.
function BYInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BXInput_Callback(hObject, eventdata, handles)
% hObject    handle to BXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempBX=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of BXInput as text
%        str2double(get(hObject,'String')) returns contents of BXInput as a double


% --- Executes during object creation, after setting all properties.
function BXInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AYInput_Callback(hObject, eventdata, handles)
% hObject    handle to AYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempAY=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of AYInput as text
%        str2double(get(hObject,'String')) returns contents of AYInput as a double


% --- Executes during object creation, after setting all properties.
function AYInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AYInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AXInput_Callback(hObject, eventdata, handles)
% hObject    handle to AXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.TempAX=str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of AXInput as text
%        str2double(get(hObject,'String')) returns contents of AXInput as a double


% --- Executes during object creation, after setting all properties.
function AXInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AXInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RenewFigure(handles)
k=handles.MyCircuitSet.CircuitChoose;
if(isempty(handles.MyCircuitSet.CircuitIndex))
    set(handles.CircuitIndex,'string','请输入信息','value',1);
    set(handles.AXInput,'string',{});
    set(handles.AYInput,'string',{});
    set(handles.BXInput,'string',{});
    set(handles.BYInput,'string',{});
    set(handles.CXInput,'string',{});
    set(handles.CYInput,'string',{});
    set(handles.SplitIndex,'value',1);
    set(handles.SplitRadiusInput,'string',{});
    set(handles.LineRadiusInput,'string',{});
    set(handles.VoltageInput,'string',{});
    set(handles.CurrentInput,'string',{});
else
    for s=1:1:length(handles.MyCircuitSet.CircuitIndex)
        CircuitStr(s)=num2cell(s);
    end
    set(handles.CircuitIndex,'string',CircuitStr,'value',k);
    set(handles.AXInput,'string',num2str(handles.MyCircuitSet.AX(k)));
    set(handles.AYInput,'string',num2str(handles.MyCircuitSet.AY(k)));
    set(handles.BXInput,'string',num2str(handles.MyCircuitSet.BX(k)));
    set(handles.BYInput,'string',num2str(handles.MyCircuitSet.BY(k)));
    set(handles.CXInput,'string',num2str(handles.MyCircuitSet.CX(k)));
    set(handles.CYInput,'string',num2str(handles.MyCircuitSet.CY(k)));
    switch handles.MyCircuitSet.SplitNum(k)
        case 1
            set(handles.SplitIndex,'value',1);
        otherwise
            set(handles.SplitIndex,'value',handles.MyCircuitSet.SplitNum(k)/2+1);
    end
    set(handles.SplitRadiusInput,'string',num2str(handles.MyCircuitSet.SplitRadius(k)));
    set(handles.LineRadiusInput,'string',num2str(handles.MyCircuitSet.LineRadius(k)));
    set(handles.VoltageInput,'string',num2str(handles.MyCircuitSet.Voltage(k)));
    set(handles.CurrentInput,'string',num2str(handles.MyCircuitSet.Current(k)));
end


% --- Executes during object creation, after setting all properties.
function Add_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function Plot(handles)
cla(handles.ax);
if(isempty(handles.MyCircuitSet.CircuitIndex))
    return;
end
for s=1:1:length(handles.MyCircuitSet.CircuitIndex)
    sigma=linspace(0,2*pi,handles.MyCircuitSet.CircuitIndex(s).SplitNum+1);
    x=cos(sigma(1:1:handles.MyCircuitSet.CircuitIndex(s).SplitNum))*handles.MyCircuitSet.CircuitIndex(s).SplitRadius;
    y=sin(sigma(1:1:handles.MyCircuitSet.CircuitIndex(s).SplitNum))*handles.MyCircuitSet.CircuitIndex(s).SplitRadius;
    hold on;temp1=scatter(handles.ax,x+handles.MyCircuitSet.CircuitIndex(s).AX,y+handles.MyCircuitSet.CircuitIndex(s).AY,'k');
    hold on;temp2=scatter(handles.ax,x+handles.MyCircuitSet.CircuitIndex(s).BX,y+handles.MyCircuitSet.CircuitIndex(s).BY,'k');
    hold on;temp3=scatter(handles.ax,x+handles.MyCircuitSet.CircuitIndex(s).CX,y+handles.MyCircuitSet.CircuitIndex(s).CY,'k');
    if(s==handles.MyCircuitSet.CircuitChoose)
        set(temp1,'linewidth',4);
        set(temp2,'linewidth',4);
        set(temp3,'linewidth',4);
    else
        set(temp1,'linewidth',2);
        set(temp2,'linewidth',2);
        set(temp3,'linewidth',2);
    end
end


% --- Executes during object creation, after setting all properties.
function Complete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Complete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(isempty(handles.MyCircuitSet.CircuitIndex))
    warndlg('必须输入线路截面信息，错误的关闭将导致程序崩溃，请重启主程序','!!Error!!');
end


% --- Executes on selection change in SplitIndex.
function SplitIndex_Callback(hObject, eventdata, handles)
% hObject    handle to SplitIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SplitArray=[1,2,4,6,8];
handles.TempSplitNum=SplitArray(get(hObject,'Value'));
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns SplitIndex contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SplitIndex


% --- Executes during object creation, after setting all properties.
function SplitIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SplitIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Flag=UpdateData(handles,hObject)
SplitArray=[1,2,4,6,8];
handles.TempAX=str2double(get(handles.AXInput,'string'));
handles.TempAY=str2double(get(handles.AYInput,'string'));
handles.TempBX=str2double(get(handles.BXInput,'string'));
handles.TempBY=str2double(get(handles.BYInput,'string'));
handles.TempCX=str2double(get(handles.CXInput,'string'));
handles.TempCY=str2double(get(handles.CYInput,'string'));
handles.TempSplitNum=SplitArray(get(handles.SplitIndex,'value'));
handles.TempSplitRadius=str2double(get(handles.SplitRadiusInput,'string'));
handles.TempLineRadius=str2double(get(handles.LineRadiusInput,'string'));
handles.TempVoltage=str2double(get(handles.VoltageInput,'string'));
handles.TempCurrent=str2double(get(handles.CurrentInput,'string'));
guidata(hObject, handles);
if(isempty(handles.TempAX)||isempty(handles.TempAY)||isempty(handles.TempBX)||isempty(handles.TempBY)||isempty(handles.TempCX)||isempty(handles.TempCY))
    warndlg('单回线路空间位置输入存在遗漏','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempAX)||isnan(handles.TempAY)||isnan(handles.TempBX)||isnan(handles.TempBY)||isnan(handles.TempCX)||isnan(handles.TempCY))
    warndlg('单回线路空间位置输入有误','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempSplitRadius)||isempty(handles.TempLineRadius))
    warndlg('分裂导线信息输入存在遗漏','输入错误');
    Flag=1;
    return;
end
if(isnan(handles.TempSplitNum)||isnan(handles.TempSplitRadius)||isnan(handles.TempLineRadius))
    warndlg('分裂导线信息输入有误','输入错误');
    Flag=1;
    return;
end
if(isempty(handles.TempVoltage)||isempty(handles.TempCurrent))
     warndlg('单回线路电气信息输入存在遗漏','输入错误');
     Flag=1;
     return;
end
if(isnan(handles.TempVoltage)||isnan(handles.TempCurrent))
    warndlg('单回线路电气信息输入有误','输入错误');
    Flag=1;
    return;
end
Flag=0;

function InitializationFunction(handles,hObject)
set(handles.ax,'XLim',[-50,50],'YLim',[0,70],'YAxisLocation','origin');
handles.MyCircuitSet.CircuitChoose=1;
handles.TempAX=[];
handles.TempAY=[];
handles.TempBX=[];
handles.TempBY=[];
handles.TempCX=[];
handles.TempCY=[];
handles.TempSplitNum=[];
handles.TempSplitRadius=[];
handles.TempLineRadius=[];
handles.TempVoltage=[];
handles.TempCurrent=[];
Plot(handles);
RenewFigure(handles);
guidata(hObject, handles);
