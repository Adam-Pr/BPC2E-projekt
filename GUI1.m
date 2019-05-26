function varargout = GUI1(varargin)
% GUI1 MATLAB code for GUI1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI1

% Last Modified by GUIDE v2.5 01-Dec-2013 15:23:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI1_OutputFcn, ...
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


% --- Executes just before GUI1 is made visible.
function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI1 (see VARARGIN)

% Choose default command line output for GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text8, 'String', '0');                                      % po zmáèknutí tlaèítka nastaví hodnotu string v textu8  na 0
load(handles);                                                          % naète hodnoty v textovém souboru, naète funkce y.


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = str2double(get(handles.text8, 'String'));                     % naète hodnotu ve string v textu8, pøevádí øetìzec z textu8 na èíslo s desetinou èárkou, hodnota promìnné current je hodnota ve string v textu8
if (current > 0) previous = current - 1;                                % podmínka, díky které nejde listovat do menšího øádku ne je 0
else previous = current; 
end
set(handles.text8, 'String', previous);                                 % nastavení obsahu z promìnné previous do stringu v textu8
load(handles);                                                          % naète hodnoty 

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = str2double(get(handles.text8, 'String'));                     
next = current + 1;                                                     % hodnota v current se zvìtší o 1 tedy se posune øádek
set(handles.text8, 'String', next);                                     
load(handles);

function load(handles)
file = fopen('functions.txt');
current = str2double(get(handles.text8, 'String'));
for index = 0:current                                                   % prochází øádek po øádku od 0 do hodnoty uloené v current
    line = fgetl(file);                                                 % fgetl pøeète jeden øádek ze souboru
end
karnaugh = zeros(4);                                                    % nulová matice 4x4 
truth = [0 0 0 0 0; 0 0 0 1 0; 
         0 0 1 0 0; 0 0 1 1 0;
         0 1 0 0 0; 0 1 0 1 0; 
         0 1 1 0 0; 0 1 1 1 0; 
         1 0 0 0 0; 1 0 0 1 0; 
         1 0 1 0 0; 1 0 1 1 0; 
         1 1 0 0 0; 1 1 0 1 0; 
         1 1 1 0 0; 1 1 1 1 0;];                                        % nastavení pravdivostní tabulky, poèáteèní stav
y = 0;

set(handles.text6, 'String', line);                                     % nastavení do hodnoty string v textu6 obsah promìnné line, co je naètenı jeden øádek ze souboru, jedna funkcy y.

a=0;b=0;c=0;d=0;eval(line);karnaugh(1,1)=y; truth(1,5)=y;	%0          % eval naète øádek z line a provede vıpoèet funkce na tomto øádku, vısledek uloí na pozici v K. mapì a pravdivostní tabulce. Tedy na pozici 1;1 v K.m a 1;5 v p.t.
a=0;b=0;c=0;d=1;eval(line);karnaugh(1,2)=y; truth(2,5)=y;	%1
a=0;b=0;c=1;d=0;eval(line);karnaugh(1,4)=y; truth(3,5)=y;	%2
a=0;b=0;c=1;d=1;eval(line);karnaugh(1,3)=y; truth(4,5)=y;	%3

a=0;b=1;c=0;d=0;eval(line);karnaugh(2,1)=y; truth(5,5)=y;	%4
a=0;b=1;c=0;d=1;eval(line);karnaugh(2,2)=y; truth(6,5)=y;	%5
a=0;b=1;c=1;d=0;eval(line);karnaugh(2,4)=y; truth(7,5)=y;	%6
a=0;b=1;c=1;d=1;eval(line);karnaugh(2,3)=y; truth(8,5)=y;	%7

a=1;b=0;c=0;d=0;eval(line);karnaugh(4,1)=y; truth(9,5)=y;	%8
a=1;b=0;c=0;d=1;eval(line);karnaugh(4,2)=y; truth(10,5)=y;	%9
a=1;b=0;c=1;d=0;eval(line);karnaugh(4,4)=y; truth(11,5)=y;	%10
a=1;b=0;c=1;d=1;eval(line);karnaugh(4,3)=y; truth(12,5)=y;	%11

a=1;b=1;c=0;d=0;eval(line);karnaugh(3,1)=y; truth(13,5)=y;	%12
a=1;b=1;c=0;d=1;eval(line);karnaugh(3,2)=y; truth(14,5)=y;	%13
a=1;b=1;c=1;d=0;eval(line);karnaugh(3,4)=y; truth(15,5)=y;	%14
a=1;b=1;c=1;d=1;eval(line);karnaugh(3,3)=y; truth(16,5)=y;	%15

set(handles.uitable2, 'Data', karnaugh);                                % vkládá matici karnaugh do tabulky 2

set(handles.uitable3, 'Data', truth);                                   % vkládá matici truth do tabulky 3
