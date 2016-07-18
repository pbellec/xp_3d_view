
%% Read html template
hf = fopen('xp_3d_view_template.html');
text_html = fread(hf,Inf,'uint8=>char')';
fclose(hf);

%% Read png
%hf = fopen ('test_lowres.png');
hf = fopen ('test.png');
data = fread (hf,Inf,'double');
fclose(hf);

%% Convert to base 64
str = base64_encode(data);
text_html = strrep(text_html,'$DATA',str);

%% Write page 
hf = fopen('index.html','w');
fprintf(hf,'%s',text_html);
fclose(hf);
