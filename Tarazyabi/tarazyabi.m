
function varargout = tarazyabi(varargin)
% TARAZYABI MATLAB code for tarazyabi.fig
%      TARAZYABI, by itself, creates a new TARAZYABI or raises the existing
%      singleton*.
%
%      H = TARAZYABI returns the handle to a new TARAZYABI or the handle to
%      the existing singleton*.
%
%      TARAZYABI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TARAZYABI.M with the given input arguments.
%
%      TARAZYABI('Property','Value',...) creates a new TARAZYABI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tarazyabi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tarazyabi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tarazyabi

% Last Modified by GUIDE v2.5 27-Jan-2018 10:59:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tarazyabi_OpeningFcn, ...
                   'gui_OutputFcn',  @tarazyabi_OutputFcn, ...
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


% --- Executes just before tarazyabi is made visible.
function tarazyabi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tarazyabi (see VARARGIN)

% Choose default command line output for tarazyabi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tarazyabi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tarazyabi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bs fs n trz pid dx bb;

[name,path] = uigetfile({'*.txt'},'File tarazyabi ra entekhab konid.','C:\tarazyabi.txt');
data = csvread([path,name]);
bb=path;
[n,~]=size(data);
pid = data(1:n,1);
bs = data(1:n,2);
fs = data(1:n,3);
dx = data(1:n-1,4);
em=12*((sum(dx)/1000)^(1/2));
set(handles.emax,'string',num2str(em));
if pid(1)==pid(n)
    trz = 1;%yek yani tarazyabi baste ast
else
    trz = 0;
    set(handles.hf,'enable','on')
end
global L;
L=sum(dx)/1000;
set(handles.ete1,'visible','on')
set(handles.run,'enable','on')
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in notaraz3.
function notaraz3_Callback(hObject, eventdata, handles)
% hObject    handle to notaraz3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global L;
em=12*(L^(1/2));
set(handles.emax,'string',num2str(em));
% Hint: get(hObject,'Value') returns toggle state of notaraz3


% --- Executes on button press in notaraz2.
function notaraz2_Callback(hObject, eventdata, handles)
% hObject    handle to notaraz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global L;
em=8*(L^(1/2));
set(handles.emax,'string',num2str(em));
% Hint: get(hObject,'Value') returns toggle state of notaraz2


% --- Executes on button press in notaraz1.
function notaraz1_Callback(hObject, eventdata, handles)
% hObject    handle to notaraz1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of notaraz1
global L;
em=3*(L^(1/2));
set(handles.emax,'string',num2str(em));
% --- Executes on key press with focus on notaraz1 and none of its controls.
function notaraz1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to notaraz1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function emax_Callback(hObject, eventdata, handles)
% hObject    handle to emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of emax as text
%        str2double(get(hObject,'String')) returns contents of emax as a double


% --- Executes during object creation, after setting all properties.
function emax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hi_Callback(hObject, eventdata, handles)
% hObject    handle to hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hi as text
%        str2double(get(hObject,'String')) returns contents of hi as a double


% --- Executes during object creation, after setting all properties.
function hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hf_Callback(hObject, eventdata, handles)
% hObject    handle to hf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hf as text
%        str2double(get(hObject,'String')) returns contents of hf as a double


% --- Executes during object creation, after setting all properties.
function hf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in print.
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pid h bb;
path = uigetdir(bb,'mahale zakhire sazi ra entekhab konid');
name='\result.xlsx';

A=[pid h']
mahale_zakhire_sazi=[path name]
xlswrite(mahale_zakhire_sazi,A)
open(mahale_zakhire_sazi)
% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bs fs trz n h dx;
set(handles.print,'enable','on')
for i=1:n-1
    dh(i)=bs(i)-fs(i+1);
end
h(1)=str2double(get(handles.hi,'string'));
for i=1:n-1
    h(i+1)=h(i)+dh(i);
end
if trz==1
    e=h(n)-h(1);
elseif trz==0
    hn=str2double(get(handles.hf,'string'));
    e=h(n)-hn;
end
set(handles.error,'string',num2str(e*1000));
c=(-e)/(n);

for i=2:n
    h(i)=h(i)+c*i;
end
axes(handles.axes1);
cla;
x(1)=0;
for i=1:n-1
    x(i+1)=x(i)+dx(i);
end
y=h;
plot(x,y,'-*')
