import segno

text = "LRT-003"

qr = segno.make_qr(text)
qr.save("lrt003.png", scale=20, border=5)

print("QR code generated")