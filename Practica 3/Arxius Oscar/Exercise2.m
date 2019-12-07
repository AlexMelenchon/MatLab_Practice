function varargout = Exercise2(varargin)
% EXERCISE2 MATLAB code for Exercise2.fig
%      EXERCISE2, by itself, creates a new EXERCISE2 or raises the existing
%      singleton*.
%
%      H = EXERCISE2 returns the handle to a new EXERCISE2 or the handle to
%      the existing singleton*.
%
%      EXERCISE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXERCISE2.M with the given input arguments.
%
%      EXERCISE2('Property','Value',...) creates a new EXERCISE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exercise2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exercise2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exercise2

% Last Modified by GUIDE v2.5 03-Dec-2019 12:44:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exercise2_OpeningFcn, ...
                   'gui_OutputFcn',  @Exercise2_OutputFcn, ...
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


% --- Executes just before Exercise2 is made visible.
function Exercise2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exercise2 (see VARARGIN)

% Choose default command line output for Exercise2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exercise2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Exercise2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function y_0_editable_Callback(hObject, eventdata, handles)
% hObject    handle to y_0_editable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_0_editable as text
%        str2double(get(hObject,'String')) returns contents of y_0_editable as a double


% --- Executes during object creation, after setting all properties.
function y_0_editable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_0_editable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function velocity_slider_Callback(hObject, eventdata, handles)
% hObject    handle to velocity_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%Update the speed----------------------------------------------------------
velocity=get(handles.velocity_slider,'Value');
set(handles.velocity_text_value,'String',velocity);

% --- Executes during object creation, after setting all properties.
function velocity_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocity_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function angle_slider_Callback(hObject, eventdata, handles)
% hObject    handle to angle_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Update the angle---------------------------------------------------------
angle=get(handles.angle_slider,'Value');
set(handles.angle_text_value,'String',angle);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function angle_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Calculate_button.
function Calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get the variables---------------------------------------------------------
angle=get(handles.angle_slider,'Value');
velocity=get(handles.velocity_slider,'Value');
posX0= str2num(get(handles.x_0_editable,'String'));
posY0= str2num(get(handles.y_0_editable,'String'));

%Get the max time----------------------------------------------------------
abc=[-0.5*9.81,velocity*sind(angle),posY0];
times=roots(abc);
t=max(times);

%The maximum x-------------------------------------------------------------
XMAX=posX0+velocity*cosd(angle)*t;

%The maximum Y------------------------------------------------------------
X=linspace(posX0,XMAX,200);
Y=zeros(size(X));
TinMaxY= (-velocity*sind(angle))/-9.81;
YMax= posY0+ velocity*sind(angle)*TinMaxY-0.5*9.81*(TinMaxY*TinMaxY);
[m,n]=size(X);

%Set the maximum Y & X into the UI-------------------------------------------
formatSpec='%.2f m.';
str=sprintf(formatSpec,XMAX);
set(handles.range_text_value,'String',str);
str=sprintf(formatSpec,YMax);
set(handles.max_height_text_value,'String',str);

%The parable---------------------------------------------------------------
for i=1:n
actualtime=(X-posX0)/(velocity*cosd(angle));
Y(i)=posY0+(velocity*sind(angle)*actualtime(i))-(0.5*9.81*(actualtime(i)*actualtime(i)));
end

%Plots---------------------------------------------------------------------
plot (X,Y);%%prints the line
hold;
plot(posX0+velocity*cosd(angle)*TinMaxY,YMax,'o');%%prints max point
hold;
axis([0 inf 0 35])%%sets the scale of the graphics
xlabel('X[m]');
ylabel('Y[m]');



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Calculate_button.
function Calculate_button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


