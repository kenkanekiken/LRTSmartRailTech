import cv2
import time

cap = cv2.VideoCapture(0)
detector = cv2.QRCodeDetector()

last_scan_time = 0
cooldown = 3  

lrt_mileage = {
    'lrt001': 0.0,
    'lrt002': 0.0,
    'lrt003': 0.0,
}

def handle_qr(data):
    global last_scan_time, frame

    if not data:
        return

    current_time = time.time()

    # ONLY block the action, NOT detection/display
    if current_time - last_scan_time < cooldown:
        return

    last_scan_time = current_time

    print("QR Code:", data)

    if data == 'LRT-001':
        lrt_mileage['lrt001'] += 3000
    elif data == 'LRT-002':
        lrt_mileage['lrt002'] += 3000
    elif data == 'LRT-003':
        lrt_mileage['lrt003'] += 3000

    print('LRT001:', lrt_mileage['lrt001'])
    print('LRT002:', lrt_mileage['lrt002'])
    print('LRT003:', lrt_mileage['lrt003'])


while True:
    ret, frame = cap.read()
    if not ret:
        break

    data, points, _ = detector.detectAndDecode(frame)

    # Always draw QR box (no cooldown here)
    if points is not None:
        points = points.astype(int)
        for i in range(len(points[0])):
            pt1 = tuple(points[0][i])
            pt2 = tuple(points[0][(i + 1) % len(points[0])])
            cv2.line(frame, pt1, pt2, (0, 255, 0), 2)

    # Handle logic separately (non-blocking)
    handle_qr(data)

    cv2.imshow("QR Scanner", frame)

    if cv2.waitKey(1) & 0xFF == ord("q"):
        break

cap.release()
cv2.destroyAllWindows()