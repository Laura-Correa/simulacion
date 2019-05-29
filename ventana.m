function varargout = ventana(varargin)
% VENTANA MATLAB code for ventana.fig
%      VENTANA, by itself, creates a new VENTANA or raises the existing
%      singleton*.
%
%      H = VENTANA returns the handle to a new VENTANA or the handle to
%      the existing singleton*.
%
%      VENTANA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VENTANA.M with the given input arguments.
%
%      VENTANA('Property','Value',...) creates a new VENTANA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ventana_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ventana_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ventana

% Last Modified by GUIDE v2.5 28-May-2019 18:52:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ventana_OpeningFcn, ...
                   'gui_OutputFcn',  @ventana_OutputFcn, ...
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


% --- Executes just before ventana is made visible.
function ventana_OpeningFcn(hObject, eventdata, handles, varargin)
global ima
im = imread('perros.jpg');
[filas,columnas,z] = size(im);
n = 3;          m = 4;
ancho = floor(columnas/m);
alto  = floor(filas/n);
ns    = randperm(n*m);
% copia de la imagen original con tamaños adecuados
final = im(1:alto*n,1:ancho*m,:);
final2= final;
size(final);
% subplot(2,1,1)
% imshow(final);
for i=1:n
    for j=1:m
        inix = (ancho*(j-1)+1);
        finx = (ancho*(j)+1)-1;
        iniy = (alto*(i-1)+1);
        finy = (alto*(i)+1)-1;
        [num2str(inix) ':' num2str(finx) ' --- '...
            num2str(iniy) ':' num2str(finy)];
        submatriz = final(iniy:finy,inix:finx,:);
        indice1 = j+(i-1)*m;
        indice = ns(indice1);
        % subplot(n,m,indice);
        %subplot(n,m,ns(indice1));
        fila    =floor((indice-1)/m)+1;
        columna =mod(indice-1,m)+1;
        [num2str(fila) '-' num2str(columna) ' --- '...
            num2str(ns(indice))];
        inix = (ancho*(columna-1)+1);
        finx = (ancho*(columna)+1)-1;
        iniy = (alto*(fila-1)+1);
        finy = (alto*(fila)+1)-1;
        [num2str(inix) ':' num2str(finx) ' --- '...
            num2str(iniy) ':' num2str(finy)];
        final2(iniy:finy,inix:finx,:) = submatriz;
        %imshow(submatriz);
    end
end

ima=final2;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ventana (see VARARGIN)

% Choose default command line output for ventana
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ventana wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ventana_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global ima
imshow(ima);
% hObject    handle to pushutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global ima
valor = get(hObject,'Value');
set(handles.edit1,'String',num2str(valor))
image= im2bw(ima,valor/10);
imshow(image);

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
