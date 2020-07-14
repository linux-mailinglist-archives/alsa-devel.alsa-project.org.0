Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049B21F5A4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 17:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92793165E;
	Tue, 14 Jul 2020 17:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92793165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594739067;
	bh=UxLIHjNMDuOcJPYKWVZ0NeUzRJHBrL+77S27hHGeHas=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UqsCpXTf4mXpfvP6w8x7ThjvdAckE/2fTbTBcEPgkK9b3a8eW/y5NESww2xiK93m9
	 xEE6fo+TrJLfUNgHm7fRwlCqQKbAfEUmOhKUETpcnFUdJ52F8xlsm4ZL6h/emGxzSq
	 QWFQRC3xfEhJKGIxmoxoP+mEyi4SEKOCd/PNXqE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7FBF800E5;
	Tue, 14 Jul 2020 17:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B4CF8019B; Tue, 14 Jul 2020 17:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CDD5F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CDD5F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N+lhi45Y"
Received: by mail-ed1-x536.google.com with SMTP id h28so17576581edz.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language;
 bh=UxTbpT//uTreXUM/0Lg32yUqkXe9c7dhsrjm3sjG1eY=;
 b=N+lhi45YBdfEHK8FLEz2Z7MZ+G4baCQNDI4sipCZlL9ix6Kzd1qjD78DOpJ2NN4Ypt
 5damZ4zOUoLY/C6jPN3KndjnVrPhMWURUaezRkhrH2Fj9stV6u3p/U01yhau/+VA0HF4
 7uJlYetma4beyJysh7R8ENHSU7mgPSEe1uK9WB2Bvv0temRzqzrRV+b4wVt7zV8Mz2d2
 fb9M0KPTQ6h4AXhUqIh9rv5H+biPT9Epmd2O3uvU9ta+DRkH5RSCkQXNCnemAvJQmy0n
 MGKm9lcBiCJ5Zmebs3uZfB/uah8Ti2qCSTnykH2TA1gUwkY/2aBBQI6dMAQX/vJCM6lx
 W7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language;
 bh=UxTbpT//uTreXUM/0Lg32yUqkXe9c7dhsrjm3sjG1eY=;
 b=UECyJieT/GvDRSjOSFQbxS/oeS/YQzCMKoq+lnuYPY8fP2tiSaZ9C9g5WxoSvGjexZ
 ULgKjJmnrczqcb0oj7g48MDDj9w6LEVaYI5xRws+8vusxzL6tyzodSd3lIycgZx8nFHC
 O4yjDQqflWxQgB+1Rs36/ojG32xeQpH1fhOATpasRzb6aUuDlNrfokmb32ZgOX2ZJDt1
 gci5XIw7R2sRuNsK6D+CbESHyuNqmtdo7Wp9XhlpZhNu0ibvR0f0s4IFMgB301XHe2As
 bXdqwllYp6RqNdcbdmZnQqIm3i1tZrCMDXa5LvzIEeNO4ci4+OqiZA7407cD4Jg7ETj3
 X/Ow==
X-Gm-Message-State: AOAM5335SO8ZOS6okevpZZ1ubiKArnJ/Jt9EiXDf8PpXiHKKCEbSsq2J
 /PI+fkSNcU7qF2+qfpcqArM=
X-Google-Smtp-Source: ABdhPJx4k8cjmzqOajr6KJBedildoEu4s0j3KDQKJcFmb6N33cMfs/btTT/EMwZhCFhEPKBoahsANw==
X-Received: by 2002:a50:a1e7:: with SMTP id 94mr4775980edk.165.1594738955798; 
 Tue, 14 Jul 2020 08:02:35 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o14sm12855316eja.121.2020.07.14.08.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:02:35 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Subject: [snd-usb-6fire] Move DMA-buffer off of the stack
Message-ID: <1e255a15-b0ff-088b-2ac2-8f2fc68bfbeb@gmail.com>
Date: Tue, 14 Jul 2020 17:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------096A0602DC2CEC2614F888FD"
Content-Language: en-US
Cc: Torsten Schenk <torsten.schenk@zoho.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a multi-part message in MIME format.
--------------096A0602DC2CEC2614F888FD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

snd-usb-fire currently fails its firmware load with "transfer buffer not
dma capable". Move said buffer off of the stack (has been coordinated
with the original driver author Torsten Schenk)

Signed-off-by: René Herman <rene.herman@gmail.com>

--------------096A0602DC2CEC2614F888FD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-snd-usb-6fire-Move-DMA-buffer-off-the-stack.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-snd-usb-6fire-Move-DMA-buffer-off-the-stack.patch"

From 6a732ea2536217e1aa35c55c966df0e7873d95ca Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
Date: Sun, 12 Jul 2020 01:22:45 +0200
Subject: [PATCH 1/3] [snd-usb-6fire] Move DMA-buffer off the stack
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd-usb-fire currently fails its firmware load with "transfer buffer not dma
capable". Move said buffer off of the stack.

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 sound/usb/6fire/firmware.c | 95 ++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 49 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 69137c14d0dc..502653a89f01 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -355,63 +355,60 @@ static int usb6fire_fw_check(struct usb_interface *intf, const u8 *version)
 
 int usb6fire_fw_init(struct usb_interface *intf)
 {
-	int i;
-	int ret;
 	struct usb_device *device = interface_to_usbdev(intf);
+	int ret, i;
+
 	/* buffer: 8 receiving bytes from device and
 	 * sizeof(EP_W_MAX_PACKET_SIZE) bytes for non-const copy */
-	u8 buffer[12];
+	u8 *buffer = kmalloc(12, GFP_KERNEL);
+
+	if (!buffer)
+		return -ENOMEM;
 
 	ret = usb6fire_fw_ezusb_read(device, 1, 0, buffer, 8);
 	if (ret < 0) {
 		dev_err(&intf->dev,
 			"unable to receive device firmware state.\n");
-		return ret;
-	}
-	if (buffer[0] != 0xeb || buffer[1] != 0xaa || buffer[2] != 0x55) {
-		dev_err(&intf->dev,
-			"unknown device firmware state received from device:");
-		for (i = 0; i < 8; i++)
-			printk(KERN_CONT "%02x ", buffer[i]);
-		printk(KERN_CONT "\n");
-		return -EIO;
-	}
-	/* do we need fpga loader ezusb firmware? */
-	if (buffer[3] == 0x01) {
-		ret = usb6fire_fw_ezusb_upload(intf,
-				"6fire/dmx6firel2.ihx", 0, NULL, 0);
-		if (ret < 0)
-			return ret;
-		return FW_NOT_READY;
+		goto out;
 	}
-	/* do we need fpga firmware and application ezusb firmware? */
-	else if (buffer[3] == 0x02) {
-		ret = usb6fire_fw_check(intf, buffer + 4);
-		if (ret < 0)
-			return ret;
-		ret = usb6fire_fw_fpga_upload(intf, "6fire/dmx6firecf.bin");
-		if (ret < 0)
-			return ret;
-		memcpy(buffer, ep_w_max_packet_size,
-				sizeof(ep_w_max_packet_size));
-		ret = usb6fire_fw_ezusb_upload(intf, "6fire/dmx6fireap.ihx",
-				0x0003,	buffer, sizeof(ep_w_max_packet_size));
-		if (ret < 0)
-			return ret;
-		return FW_NOT_READY;
-	}
-	/* all fw loaded? */
-	else if (buffer[3] == 0x03)
-		return usb6fire_fw_check(intf, buffer + 4);
-	/* unknown data? */
-	else {
-		dev_err(&intf->dev,
-			"unknown device firmware state received from device: ");
-		for (i = 0; i < 8; i++)
-			printk(KERN_CONT "%02x ", buffer[i]);
-		printk(KERN_CONT "\n");
-		return -EIO;
+	if (buffer[0] == 0xeb && buffer[1] == 0xaa && buffer[2] == 0x55) {
+		/* do we need fpga loader ezusb firmware? */
+		if (buffer[3] == 1) {
+			ret = usb6fire_fw_ezusb_upload(intf,
+					"6fire/dmx6firel2.ihx", 0, NULL, 0);
+			if (ret >= 0)
+				ret = FW_NOT_READY;
+			goto out;
+		}
+		/* do we need fpga firmware and application ezusb firmware? */
+		if (buffer[3] == 2) {
+			ret = usb6fire_fw_check(intf, buffer + 4);
+			if (ret < 0)
+				goto out;
+			ret = usb6fire_fw_fpga_upload(intf, "6fire/dmx6firecf.bin");
+			if (ret < 0)
+				goto out;
+			memcpy(buffer, ep_w_max_packet_size,
+					sizeof(ep_w_max_packet_size));
+			ret = usb6fire_fw_ezusb_upload(intf, "6fire/dmx6fireap.ihx",
+					0x0003,	buffer, sizeof(ep_w_max_packet_size));
+			if (ret >= 0)
+				ret = FW_NOT_READY;
+			goto out;
+		}
+		/* all fw loaded? */
+		if (buffer[3] == 3) {
+			ret = usb6fire_fw_check(intf, buffer + 4);
+			goto out;
+		}
 	}
-	return 0;
+	dev_err(&intf->dev,
+		"unknown device firmware state received from device: ");
+	for (i = 0; i < 8; i++)
+		printk(KERN_CONT "%02x ", buffer[i]);
+	printk(KERN_CONT "\n");
+	ret = -EIO;
+
+out:	kfree(buffer);
+	return ret;
 }
-
-- 
2.17.1


--------------096A0602DC2CEC2614F888FD--
