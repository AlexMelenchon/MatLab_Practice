function varargout = Exercise3(varargin)
% EXERCISE3 MATLAB code for Exercise3.fig
%      EXERCISE3, by itself, creates a new EXERCISE3 or raises the existing
%      singleton*.
%
%      H = EXERCISE3 returns the handle to a new EXERCISE3 or the handle to
%      the existing singleton*.
%
%      EXERCISE3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXERCISE3.M with the given input arguments.
%
%      EXERCISE3('Property','Value',...) creates a new EXERCISE3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exercise3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exercise3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exercise3

% Last Modified by GUIDE v2.5 07-Dec-2019 12:24:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exercise3_OpeningFcn, ...
                   'gui_OutputFcn',  @Exercise3_OutputFcn, ...
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


% --- Executes just before Exercise3 is made visible.
function Exercise3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exercise3 (see VARARGIN)

% Choose default command line output for Exercise3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exercise3 wait for user response (see UIRESUME)
% uiwait(handles.aixs_plot);


% --- Outputs from this function are returned to the command line.
function varargout = Exercise3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function angle_slider_Callback(hObject, eventdata, handles)
% hObject    handle to angle_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get the angle & update it ------------------------------------------------
angle=get(handles.angle_slider,'Value');
set(handles.angle_text,'String',angle);

%Get & normalize v; then conversion to pure quaternion --------------------
v=[str2double(get(handles.v_1_num,'String'));str2double(get(handles.v_2_num,'String'));str2double(get(handles.v_3_num,'String'))]

v = v/sqrt(v'*v);

v= [0; v];


%We transform the direction of rotation to a unit quaternion using the
%angle---------------------------------------------------------------------
q0=cosd(angle);

qV=[str2double(get(handles.u_1_num,'String'));str2double(get(handles.u_2_num,'String'));str2double(get(handles.u_3_num,'String'))]

qV = qV/sqrt(qV'*qV);

qV = sind(angle).*qV;


%We know that v' = q*v*qº, but this is equal to the  QL(q)*QR(qº), so
%we're going to do that

%First we declare & assenmble Q; using R(qº)-------------------------------
Q = zeros(4);
Q(1,1) = 1;

R1 = [(q0^2 + qV(1)^2 -qV(2)^2 - qV(3)^2), 2*qV(1)*qV(2) - 2*q0*qV(3), 2*qV(1)* qV(3) + 2*q0*qV(2);];
R2 = [ 2*qV(1)*qV(2) + 2*q0*qV(3),( q0^2 - qV(1)^2 +qV(2)^2 - qV(3)^2), 2*qV(2)*qV(3) - 2 *q0*qV(1)];
R3 = [ 2*qV(1)*qV(3) - 2*q0*qV(2), 2*qV(2)*qV(3) + 2*q0*qV(1), q0^2-qV(1)^2-qV(2)^2 + qV(3)^2;];
R = [R1; R2; R3];

Q(2:4,2:4) = R;

%We get the new vector rotated & we normalize it---------------------------
w = Q*v;

w(2:4) = w(2:4)/sqrt(w(2:4)'*w(2:4));

%Vectors for an isometric triad--------------------------------------------
b1 = [1,0,0];
b2 = [0,1,0];
b3 = [0,0,1];

%Plots---------------------------------------------------------------------

cla;
hold ( 'all');

%Plot the triad
plot3([0;b1(1)],[0;b1(2)],[0;b1(3)],'Color',[1,0,0],'LineWidth',2)

plot3([0;b2(1)],[0;b2(2)],[0;b2(3)],'Color',[0,1,0],'LineWidth',2)

plot3([0;b3(1)],[0;b3(2)],[0;b3(3)],'Color',[0,0,1],'LineWidth',2)

%Plot the rotated vector
plot3([0;w(2)],[0;w(3)],[0;w(4)],'Color',[1,1,0],'LineWidth',2)






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



function dynamic_angle_Callback(hObject, eventdata, handles)
% hObject    handle to dynamic_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dynamic_angle as text
%        str2double(get(hObject,'String')) returns contents of dynamic_angle as a double


% --- Executes during object creation, after setting all properties.
function dynamic_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dynamic_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_2_num_Callback(hObject, eventdata, handles)
% hObject    handle to u_2_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u_2_num as text
%        str2double(get(hObject,'String')) returns contents of u_2_num as a double


% --- Executes during object creation, after setting all properties.
function u_2_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u_2_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_3_num_Callback(hObject, eventdata, handles)
% hObject    handle to u_3_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u_3_num as text
%        str2double(get(hObject,'String')) returns contents of u_3_num as a double


% --- Executes during object creation, after setting all properties.
function u_3_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u_3_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_2_num_Callback(hObject, eventdata, handles)
% hObject    handle to v_2_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_2_num as text
%        str2double(get(hObject,'String')) returns contents of v_2_num as a double


% --- Executes during object creation, after setting all properties.
function v_2_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_2_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_3_num_Callback(hObject, eventdata, handles)
% hObject    handle to v_3_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_3_num as text
%        str2double(get(hObject,'String')) returns contents of v_3_num as a double


% --- Executes during object creation, after setting all properties.
function v_3_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_3_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_1_num_Callback(hObject, eventdata, handles)
% hObject    handle to v_1_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_1_num as text
%        str2double(get(hObject,'String')) returns contents of v_1_num as a double


% --- Executes during object creation, after setting all properties.
function v_1_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_1_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_1_num_Callback(hObject, eventdata, handles)
% hObject    handle to u_1_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u_1_num as text
%        str2double(get(hObject,'String')) returns contents of u_1_num as a double


% --- Executes during object creation, after setting all properties.
function u_1_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u_1_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
