function varargout = Kompresi_Citra_UAS(varargin)
% KOMPRESI_CITRA_UAS MATLAB code for Kompresi_Citra_UAS.fig
%      KOMPRESI_CITRA_UAS, by itself, creates a new KOMPRESI_CITRA_UAS or raises the existing
%      singleton*.
%
%      H = KOMPRESI_CITRA_UAS returns the handle to a new KOMPRESI_CITRA_UAS or the handle to
%      the existing singleton*.
%
%      KOMPRESI_CITRA_UAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KOMPRESI_CITRA_UAS.M with the given input arguments.
%
%      KOMPRESI_CITRA_UAS('Property','Value',...) creates a new KOMPRESI_CITRA_UAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Kompresi_Citra_UAS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Kompresi_Citra_UAS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Kompresi_Citra_UAS



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kompresi_Citra_UAS_OpeningFcn, ...
                   'gui_OutputFcn',  @Kompresi_Citra_UAS_OutputFcn, ...
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


% --- Executes just before Kompresi_Citra_UAS is made visible.
function Kompresi_Citra_UAS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Kompresi_Citra_UAS (see VARARGIN)

% Choose default command line output for Kompresi_Citra_UAS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Kompresi_Citra_UAS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Kompresi_Citra_UAS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% menampilkan menu browse file
[file, path] = uigetfile({'*.bmp;*.jpg;*.png;*.tiff;';'*.*'},...
    'Select an Image File');

% jika ada file citra yang dipilih maka akan mengeksekusi perintah di
% bawahnya
if ~isequal(file,0)
    % membaca file citra yang dipilih
    Img = im2double(imread(fullfile(path,file)));
    % melihat ukuran file citra dalam satuan kb
    fileinfo = imfinfo(file);
    SIZE = fileinfo.FileSize;
    Size = SIZE/1024;
    % menampilkan ukuran file citra dalam satuan kb
    set(handles.edit3,'String',[num2str(Size),' kb']);
    % menampilkan file citra ke dalam axes
    imshow(Img,'Parent', handles.axes1)
    % menyimpan variabel Img & fileinfo pada lokasi handles (lokasi
    % penyimpanan variabel dalam MATLAB) agar dapat dipanggil oleh
    % pushbutton yang lain
    handles.Img = Img;
    handles.fileinfo = fileinfo;
    guidata(hObject, handles)
    % mereset button2
    axes(handles.axes2)
    cla reset
    set(gca,'XTick',[])
    set(gca,'YTick',[])
    set(handles.pushbutton2,'Enable','on')
    set(handles.pushbutton3,'Enable','off')
    set(handles.edit1,'String',[])
    set(handles.edit2,'String',[])
    set(handles.edit4,'String',[])
    set(handles.edit5,'String',[])
    % jika tidak ada file citra yang dipilih maka akan kembali
else
    return
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% %SVD 
% %Melakukan kompresi citra menggunakan Singular Value Decomposition (SVD)
% memanggil variabel Img & fileinfo yang ada pada lokasi handles
Img = handles.Img;
fileinfo = handles.fileinfo;

k = str2double(get(handles.editSingular, 'String'));
if isnan(k) || k <= 0
    errordlg('Masukkan nilai singular yang valid (angka positif)!', 'Error');
    return;
end

Img_comp = zeros(size(Img));
for n = 1:3
    % Mengambil saluran citra (Red, Green, Blue)
    I = im2double(Img(:,:,n));

    % Melakukan SVD
    [U, S, V] = svd(I);

    U_k = U(:, 1:k);
    S_k = S(1:k, 1:k);
    V_k = V(:, 1:k);

    % Rekonstruksi citra terkompresi
    Img_comp(:,:,n) = U_k * S_k * V_k';
end

% menyimpan file citra hasil kompresi
file_comp = ['Hasil Kompresi.',fileinfo.Format];
imwrite(Img_comp,file_comp);

% melihat ukuran file citra hasil kompresi dalam satuan kb
fileinfo_comp = imfinfo(file_comp);
SIZE = fileinfo_comp.FileSize;
Size = SIZE/1024;

% menampilkan ukuran file citra hasil kompresi dalam satuan kb
set(handles.edit4,'string',[num2str(Size),' kb']);
% menampilkan file citra hasil kompresi ke dalam axes
imshow(Img_comp,'Parent',handles.axes2)
 
% mereset button2
set(handles.pushbutton3,'Enable','on')
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])
set(handles.edit5,'String',[])
 
% menyimpan variabel Img_comp & fileinfo_comp pada lokasi handles (lokasi
% penyimpanan variabel dalam MATLAB) agar dapat dipanggil oleh
% pushbutton yang lain
handles.Img_comp = Img_comp;
handles.fileinfo_comp = fileinfo_comp;
guidata(hObject, handles)

%menampilkan histogram citra asli
axes(handles.axes3);  % Asumsi ada axes3 untuk menampilkan histogram
imhist(Img);  % Menampilkan histogram citra asli

%menampilkan histogram citra asli
axes(handles.axes4);  % Asumsi ada axes3 untuk menampilkan histogram
imhist(Img);  % Menampilkan histogram citra asli


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% memanggil variabel Img, fileinfo, Img_comp, dan fileinfo_comp yang ada
% pada lokasi handles

Img = handles.Img;
fileinfo = handles.fileinfo;
Img_comp = handles.Img_comp;
fileinfo_comp = handles.fileinfo_comp;

nilai_psnr = psnr(Img,Img_comp);
nilai_mse = mean(mse(Img,Img_comp));
nilai_ssim = ssim(Img,Img_comp); 
filesize = fileinfo.FileSize;
filesize_comp = fileinfo_comp.FileSize;
persen_kompresi = filesize_comp/filesize*100;

% menampilkan nilai
set(handles.edit1,'String',nilai_psnr)
set(handles.edit2,'String',nilai_mse)
set(handles.edit5, 'String', [num2str(persen_kompresi), '%']);% memanggil variabel Img, fileinfo, Img_comp, dan fileinfo_comp yang ada
set(handles.edit12,'String',nilai_ssim)


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% mereset button2
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes4)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
set(handles.pushbutton2,'Enable','off')
set(handles.pushbutton3,'Enable','off')
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])
set(handles.edit3,'String',[])
set(handles.edit4,'String',[])
set(handles.edit5,'String',[])
set(handles.edit12,'String',[])
set(handles.editSingular, 'String', '') 

% Perbarui handles
guidata(hObject, handles)

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSingular_Callback(hObject, eventdata, handles)
% hObject    handle to editSingular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSingular as text
%        str2double(get(hObject,'String')) returns contents of editSingular as a double


% --- Executes during object creation, after setting all properties.
function editSingular_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSingular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
