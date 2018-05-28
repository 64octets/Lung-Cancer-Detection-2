function varargout = LungCancer(varargin)
% LUNGCANCER MATLAB code for LungCancer.fig
%      LUNGCANCER, by itself, creates a new LUNGCANCER or raises the existing
%      singleton*.
%
%      H = LUNGCANCER returns the handle to a new LUNGCANCER or the handle to
%      the existing singleton*.
%
%      LUNGCANCER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LUNGCANCER.M with the given input arguments.
%
%      LUNGCANCER('Property','Value',...) creates a new LUNGCANCER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LungCancer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LungCancer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LungCancer

% Last Modified by GUIDE v2.5 28-May-2018 19:59:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LungCancer_OpeningFcn, ...
                   'gui_OutputFcn',  @LungCancer_OutputFcn, ...
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


% --- Executes just before LungCancer is made visible.
function LungCancer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LungCancer (see VARARGIN)

% Choose default command line output for LungCancer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LungCancer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LungCancer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in processBtn.
function processBtn_Callback(hObject, eventdata, handles)
% hObject    handle to processBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in browseBtn.
function browseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to browseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[nama_file, nama_path] = uigetfile('*.png;*.jpg;*.bmp;*.gif;*.tif','Select Image');
if ~isequal (nama_file,0)
    img = imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(img);
    
    null = sprintf(' ');
    set(handles.st2, 'String', null);
    set(handles.st3, 'String', null);
    set(handles.st4, 'String', null);
    cla(handles.pb2);
    cla(handles.pb3);
    cla(handles.pb4);
else
    return;
end
