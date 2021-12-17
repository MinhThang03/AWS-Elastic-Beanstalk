# ĐỒ ÁN MÔN ĐIỆN TOÁN ĐÁM MÂY
# Nhóm 20 - Đề tài AWS Elastic Beanstalk
# Tên các thành viên:
    Hoàng Minh Thắng - 19110462
    Lê Hải Dương     - 19110341
    Dương Thế Hiếu   - 19110362

# Hướng dẫn truy cập vào trang Admin
    1. username: admin
    2. password: 123


# HIỆN THỰC HÓA GIẢI PHÁP – SỬ DỤNG AWS ELASTIC BEANSTALK

 # 2.1 Cài đặt RDS
 
    Bước 1: vào RDS chọn create  database.
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh1.png?alt=media&token=76b143fc-6133-4ff7-a6de-ae23f37ecdec">
    
Bước 2: Chọn framework vsà phiên bản mà bạn sữ dụng.
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh2.png?alt=media&token=53fa6289-3063-4225-af4a-d1442252d6a3">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh3.png?alt=media&token=98288065-cb4a-4077-8fa0-4bd8b33f1be9">
    
Bước 3: Đặt tên và đặt password.
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh5.png?alt=media&token=a494d844-148f-4ed5-9c80-2d7df432e249">
    
Bước 4: tuỳ chỉnh các thông sô.
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh6.png?alt=media&token=6986c497-aa97-465f-832d-c54f2faa35db">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh7.png?alt=media&token=4b6bf515-4b2d-43be-b059-fdc81c725b8d">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh8.png?alt=media&token=9df973dc-522b-4d08-8dc1-433b930f6c06">
    
Bước 5: kết nỗi với local.
        
- Đầu tiên các bạn hãy thay đổi địa chỉ cho phép truy cập vào database trên aws
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh9.png?alt=media&token=eec91ae3-4289-49b8-a51c-889019f19380">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh10.png?alt=media&token=209ac407-76b6-4e23-9615-9092e0bd3328">
        
- Vào lại trang thông tin của database để lấy các thông tin cần thiết kết nối với local của bạn.
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh11.png?alt=media&token=301c9a16-8ee8-49bf-ba12-e0aa71137eb7">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh12.png?alt=media&token=d42ea365-bc05-4f1b-875d-44e769fc1b56">
        
- Thực hiện điền các thông tin và test connect
 
 # 2.2 Import file backup data
 
    Bước 1: Thực hiện download file backup data db_cloud.sql trên git
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh13.png?alt=media&token=67a0c1cb-4484-4cd3-a05d-2f49f5414fd9">
    
Bước 2: Mở mysql workbench và thực hiện vào mục database kết nối với database đã tạo trên AWS
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh14.png?alt=media&token=a96e962d-2ef2-439a-8d32-9ae3539cbf93">
    
Bước 3: Trên thanh công cụ, chọn Server chọn Data import. Sau đó thực hiện lựa chọn như hình bên dưới
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh15.png?alt=media&token=22deb3d0-9a68-4d10-b87d-fb83a4a1cda4">
 
 # 2.3 Cấu hình kết nối data trong source code và export file war( dành cho project java web)
 > ### 2.3.1 Cấu hình kết nối data trong source code
  
Bước 1: Mở thư mục source code bằng ide Intellij -> trong thư mục src -> thư mục resources -> chọn file db.properties để thực hiện chỉnh sửa
    
Bước 2: Thực hiện chỉnh sửa các thông số database
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh16.png?alt=media&token=2004dbee-f4b7-40aa-b594-b06db807cc10">
 

 > ### 2.3.2 Tạo file war

Bước 1: Trên thanh công cụ chọn Build -> chọn Build Artifacts
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh17.png?alt=media&token=29656768-101d-4baa-b1d5-36aedbdcb2e2">
Bước 2: Trong mục Build Artifacts chọn All Artifacts chọn Build
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh18.png?alt=media&token=76f6a1d0-da9f-4ad7-bbf6-56004da459ff">
Bước 3: Chờ hệ thống thực hiện build -> file war đã được build trong mục target

# 2.4 Cài đặt một trường elastic beanstalk trên aws và thực hiện deploy code

Bước 1: Truy cập vào AWS và tìm kiếm dịch vụ AWS Elastic Beanstalk
    
Bước 2: Trong trang dịch vụ AWS Elastic Beanstal click vào Create Application
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh19.png?alt=media&token=39b0e03c-bbdf-4ca8-a006-826f0a4d1378">
    
Bước 3: Ở trang tiếp theo tiến hành nhập các thông tin và lựa chọn cơ bản, sau đó click vào Configure more options
<img src ="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh20.png?alt=media&token=f6ed2206-4746-41fd-bccc-4cc98c67bed4">
    
Bước 4: Ở trang Configure more options chọn nút Edit ở mục Security. Tiến hành cấu hình Security. Nhấn Save về trang Configure more options, và nhấn nút Create app
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh21.png?alt=media&token=cb8c78c2-61d1-4b0f-a64b-9555dc7cd3bf">
    
Bước 5: Sau khi tạo environment và application thành công, click chọn upload and deploy để chọn source code 
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh22.png?alt=media&token=c838cd92-17a7-4dcf-9bf7-cec030e9c6bb">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh23.png?alt=media&token=082123ad-40e1-42a4-a4f5-dadcab0ff68a">
# 2.5 Cài đặt auto scaling load balance
    
Bước 1: Trong mục Elastic Beanstalk, click chọn vào environment đã tạo để deploy web, click chọn Configuaration
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh24.png?alt=media&token=f18eb997-a307-4a23-bb5d-78a6ff6068df">
    
Bước 2: Trong mục Capacity click chọn Edit
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh25.png?alt=media&token=3666a06b-1666-4a89-91e3-8fd83105cd13">
    
Bước 3: Cấu hình các thông số
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh26.png?alt=media&token=d486e52b-4fa5-4095-81c8-41df0abfc378">
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh27.png?alt=media&token=7815f0c2-b3e9-4d91-a453-3f852289b289">
    
Bước 4: Click Apply để hoàn tất quá trình cài đặt
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh28.png?alt=media&token=21ee297e-1ea6-4b43-8c30-fcccfa6a079c">
    
Bước 5: Xem kết quả sao khi hoàn thành cài đặt 
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh30.png?alt=media&token=af7c013a-4a2c-4cc6-849b-b417cddc4324">
# 2.6 Cài đặt Alarm.
    
Bước 1: vào Monitoring 
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh31.png?alt=media&token=792f2b61-9812-4309-87ce-bc82d85367e3">
    
Bước 2: Chọn vào biểu tượng cái chuông vào thông số bạn muốn cài đặt Alarm
<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh32.png?alt=media&token=12eb76d6-7e7c-45c8-b094-a695cc4fa374">
    
Bước 3: Đặt tên Alarm và chỉnh các thông số

<img src="https://firebasestorage.googleapis.com/v0/b/cloud-final-46f24.appspot.com/o/hinh33.png?alt=media&token=97704ba9-fd5c-47d0-90a9-7ab02d05959c">
