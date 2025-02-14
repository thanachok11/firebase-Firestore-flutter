# Student Information System

ระบบจัดการข้อมูลนักศึกษา ที่สามารถเพิ่ม, แก้ไข, และดูข้อมูลนักศึกษาพร้อมกับการแสดงผลในตาราง โดยข้อมูลที่สามารถจัดการได้ประกอบด้วย ชื่อ, อีเมล, ชั้นปีที่ศึกษา และสาขาที่กำลังศึกษา

## ฟีเจอร์หลัก

- **แสดงข้อมูลนักศึกษา**: ระบบจะแสดงข้อมูลของนักศึกษาทั้งหมดในตาราง
- **เพิ่มข้อมูลนักศึกษา**: สามารถเพิ่มข้อมูลนักศึกษาใหม่ เช่น ชื่อ, อีเมล, ชั้นปีที่ศึกษา และสาขาที่กำลังศึกษา
- **แก้ไขข้อมูลนักศึกษา**: สามารถกดปุ่มเพื่อแก้ไขข้อมูลของนักศึกษาที่ยังไม่ได้แก้ไข
- **เปลี่ยนชั้นปีที่ศึกษา**: จะมีการใช้ฟิลด์ที่ให้ผู้ใช้กรอกข้อมูลใหม่ เช่น ชั้นปีที่ศึกษาและสาขาที่กำลังศึกษา

## การติดตั้งและใช้งาน

1. **Clone โค้ดจาก GitHub**:
   ```bash
   git clone https://github.com/thanachok11/firebase-Firestore-flutter.git
   cd firebase-Firestore-flutter
## เทคโนโลยีที่ใช้
- Frontend: React, HTML, CSS, JavaScript
- Backend: Firebase Firestore
- การเชื่อมต่อฐานข้อมูล: Firebase Authentication และ Firebase Firestore
- การจัดการสถานะ: React Hooks
## การใช้งานฟีเจอร์
### 1.การเพิ่มข้อมูลนักศึกษา:
- กรอกข้อมูลนักศึกษาทั้งหมด เช่น ชื่อ, อีเมล, ชั้นปีที่ศึกษา, และสาขาที่กำลังศึกษาในฟอร์มที่มีอยู่แล้ว
- คลิกที่ปุ่ม "เพิ่มข้อมูล" เพื่อบันทึกข้อมูลลงใน Firebase Firestore
### 2.การแก้ไขข้อมูลนักศึกษา:
- คลิกที่ปุ่ม "แก้ไข" ข้างๆ ชื่อนักศึกษาที่ต้องการแก้ไข
- ทำการเปลี่ยนแปลงข้อมูลที่ต้องการ เช่น เปลี่ยนชั้นปีที่ศึกษา หรือสาขาที่กำลังศึกษา
- คลิกปุ่ม "บันทึกการแก้ไข" เพื่อบันทึกข้อมูลใหม่ลงใน Firestore
### 3.การแสดงข้อมูลนักศึกษา:
- ข้อมูลนักศึกษาทั้งหมดจะแสดงในตาราง โดยจะมีข้อมูลของชื่อ, อีเมล, ชั้นปีที่ศึกษา และสาขาที่กำลังศึกษา
- ข้อมูลจะถูกดึงมาจาก Firebase Firestore และแสดงผลในหน้าจอหลัก
### 4.การกรอกข้อมูลฟิลด์ใหม่:
- ในฟอร์มกรอกข้อมูลใหม่ จะมีช่องกรอกสำหรับเลือกชั้นปีที่ศึกษาและสาขาที่กำลังศึกษา โดยสามารถเลือกจากเมนูดรอปดาวน์ หรือกรอกเองได้
## ลิขสิทธิ์
- **โปรเจกต์นี้** ไม่อนุญาตให้นำไปใช้เพื่อการค้าหรือการใช้ทางการค้าโดยไม่ได้รับอนุญาตจากเจ้าของโปรเจกต์
### คำอธิบาย:
- **การติดตั้ง**: มีคำแนะนำในการติดตั้งและเริ่มโปรเจกต์ รวมถึงขั้นตอนการตั้งค่า Firebase
- **ฟีเจอร์**: มีการอธิบายฟีเจอร์ต่างๆ ที่สามารถใช้งานได้ในระบบ เช่น การเพิ่ม, แก้ไข และแสดงข้อมูลนักศึกษา
- **การพัฒนาเพิ่มเติม**: คุณสามารถเพิ่มฟีเจอร์ต่างๆ ตามที่ต้องการในอนาคต เช่น การยืนยันตัวตนหรือการเชื่อมต่อกับฐานข้อมูลอื่นๆ
- **การสนับสนุน**: มีช่องทางให้ติดต่อหากพบปัญหาหรือมีข้อเสนอแนะ
