function varargout = QuaternionMultiplication_Ex1(varargin)
% QUATERNIONMULTIPLICATION_EX1 MATLAB code for QuaternionMultiplication_Ex1.fig
%      QUATERNIONMULTIPLICATION_EX1, by itself, creates a new QUATERNIONMULTIPLICATION_EX1 or raises the existing
%      singleton*.
%
%      H = QUATERNIONMULTIPLICATION_EX1 returns the handle to a new QUATERNIONMULTIPLICATION_EX1 or the handle to
%      the existing singleton*.
%
%      QUATERNIONMULTIPLICATION_EX1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUATERNIONMULTIPLICATION_EX1.M with the given input arguments.
%
%      QUATERNIONMULTIPLICATION_EX1('Property','Value',...) creates a new QUATERNIONMULTIPLICATION_EX1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QuaternionMultiplication_Ex1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QuaternionMultiplication_Ex1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QuaternionMultiplication_Ex1

% Last Modified by GUIDE v2.5 26-Nov-2019 18:34:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QuaternionMultiplication_Ex1_OpeningFcn, ...
                   'gui_OutputFcn',  @QuaternionMultiplication_Ex1_OutputFcn, ...
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


% --- Executes just before QuaternionMultiplication_Ex1 is made visible.
function QuaternionMultiplication_Ex1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QuaternionMultiplication_Ex1 (see VARARGIN)

% Choose default command line output for QuaternionMultiplication_Ex1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes QuaternionMultiplication_Ex1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = QuaternionMultiplication_Ex1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q0a=str2double(get(handles.q_0_a,'String'));
q0b=str2double(get(handles.q_0_b,'String'));
qVa=[str2double(get(handles.q_1_a,'String'));str2double(get(handles.q_2_a,'String'));str2double(get(handles.q_3_a,'String'))]
qVb=[str2double(get(handles.q_1_b,'String'));str2double(get(handles.q_2_b,'String'));str2double(get(handles.q_3_b,'String'))]

res=zeros(4,4);
matr=[0,-qVb(3),qVb(2);
 qVb(3),0,-qVb(1);
  -qVb(2),qVb(1),0];
aux=q0b*eye(3)+matr;

res(1,1)=q0b;
res(1,2:4)=-qVb';
res(2:4,1)=qVb;
res(2:4,2:4)=aux;

qaVector=[q0a,qVa(1),qVa(2),qVa(3)]'
outp=res*qaVector

set(handles.q_0_c,'String',num2str(outp(1)));
set(handles.q_1_c,'String',num2str(outp(2)));
set(handles.q_2_c,'String',num2str(outp(3)));
set(handles.q_3_c,'String',num2str(outp(4)));



function q_0_c_Callback(hObject, eventdata, handles)
% hObject    handle to q_0_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_0_c as text
%        str2double(get(hObject,'String')) returns contents of q_0_c as a double


% --- Executes during object creation, after setting all properties.
function q_0_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_0_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_1_c_Callback(hObject, eventdata, handles)
% hObject    handle to q_1_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_1_c as text
%        str2double(get(hObject,'String')) returns contents of q_1_c as a double


% --- Executes during object creation, after setting all properties.
function q_1_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_1_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_2_c_Callback(hObject, eventdata, handles)
% hObject    handle to q_2_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_2_c as text
%        str2double(get(hObject,'String')) returns contents of q_2_c as a double


% --- Executes during object creation, after setting all properties.
function q_2_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_2_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_3_c_Callback(hObject, eventdata, handles)
% hObject    handle to q_3_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_3_c as text
%        str2double(get(hObject,'String')) returns contents of q_3_c as a double


% --- Executes during object creation, after setting all properties.
function q_3_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_3_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_0_b_Callback(hObject, eventdata, handles)
% hObject    handle to q_0_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_0_b as text
%        str2double(get(hObject,'String')) returns contents of q_0_b as a double


% --- Executes during object creation, after setting all properties.
function q_0_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_0_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_1_b_Callback(hObject, eventdata, handles)
% hObject    handle to q_1_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_1_b as text
%        str2double(get(hObject,'String')) returns contents of q_1_b as a double


% --- Executes during object creation, after setting all properties.
function q_1_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_1_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_2_b_Callback(hObject, eventdata, handles)
% hObject    handle to q_2_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_2_b as text
%        str2double(get(hObject,'String')) returns contents of q_2_b as a double


% --- Executes during object creation, after setting all properties.
function q_2_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_2_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_3_b_Callback(hObject, eventdata, handles)
% hObject    handle to q_3_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_3_b as text
%        str2double(get(hObject,'String')) returns contents of q_3_b as a double


% --- Executes during object creation, after setting all properties.
function q_3_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_3_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_0_a_Callback(hObject, eventdata, handles)
% hObject    handle to q_0_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_0_a as text
%        str2double(get(hObject,'String')) returns contents of q_0_a as a double


% --- Executes during object creation, after setting all properties.
function q_0_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_0_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_1_a_Callback(hObject, eventdata, handles)
% hObject    handle to q_1_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_1_a as text
%        str2double(get(hObject,'String')) returns contents of q_1_a as a double


% --- Executes during object creation, after setting all properties.
function q_1_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_1_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_2_a_Callback(hObject, eventdata, handles)
% hObject    handle to q_2_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_2_a as text
%        str2double(get(hObject,'String')) returns contents of q_2_a as a double


% --- Executes during object creation, after setting all properties.
function q_2_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_2_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_3_a_Callback(hObject, eventdata, handles)
% hObject    handle to q_3_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_3_a as text
%        str2double(get(hObject,'String')) returns contents of q_3_a as a double


% --- Executes during object creation, after setting all properties.
function q_3_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_3_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
