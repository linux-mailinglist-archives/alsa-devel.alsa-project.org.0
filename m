Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B72227C5C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01090167B;
	Tue, 21 Jul 2020 12:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01090167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595325668;
	bh=6sA30XV+Rzi+uhrepSY3mJ9CNaO1cOzmPZ96ufz1Tnk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miowN0sCcyJejxfI1kZaacDm+5kn3Ca50GF3xl593580IygYUVos+L42V4bnP9e+o
	 RWJB0afs7pVrggMhN8/QUwVhAqCLvTFEUcQG6xoVJ7MP1iriBAydMKNLkCZyAeeWcB
	 0MVU29FliMfc+s8iL48PqU7akgO0fG4ECvjxbMms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC6EF8028C;
	Tue, 21 Jul 2020 11:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3806EF8024A; Tue, 21 Jul 2020 11:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51112F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51112F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uerpUqtw"
Received: by mail-ej1-x644.google.com with SMTP id f12so21001211eja.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EaN6m4B+HW5c6N/gdC+oV2bOL95NDEqzPoV4eaRFmy8=;
 b=uerpUqtw3T7DXPJa6fr2yvoIyaNleI2h+uzeC8QwPcvsiR3vUvYfUg+RCR8C945evO
 oqNknGnRTOibvk5olx9JGWat0DpIDCjZgsddGyFkWDFdD5KFyKate9Mvvel6oybYbVIK
 Qse5oGHvOxRjHP6hkzVbwAOvEZDhJ1R/zecvKmhSYelKP02L0oWdudXkyzty5snzMn+G
 srB3eLHhjUZatyoFDQCC7nY5xv2ZG5HDv/oi4Tr0UX0YENBrd8Pg+Dj7Ch9hMkNnx1hz
 8E+1Z/UXInSz+cioX4Il1AMFz174wQdpDm6iHYAk9ndxDz0em+e78wlmlBK6mgeQ88yQ
 hf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EaN6m4B+HW5c6N/gdC+oV2bOL95NDEqzPoV4eaRFmy8=;
 b=QFd90CH0bOXvbg+2q7et3b9C9Vz+9Y0lN9Ci0lXJlQ3juXV5n9FO//HwBRvbYhmi2I
 6yP+0qQ5darZVGaQXrQ8mFQ8D/sbSBH7FVsVVvAK4O42oll8yPdDe1yjHmfnE9qaU1Xh
 0P5EXAbM6ezuL99LxHEaiaHq/pyUxlWMEndMahD4ctPtIxIe+xgSKeZ9/pT+wLi1NCDF
 7vyN3/tdUtA+Ool9N/5w7b/X7v5XTpBokiSKR2QtB9PVBeEKzdsc7Q78Qb0AVOibU68R
 k+S2gxERRes3Sk0SOkRnR+aAHZNUPwCx79smdJ7RXX/YXwWOnqglPyObG/xVDvVtT91+
 xe7g==
X-Gm-Message-State: AOAM5320tAU4/j1Pp6zpBpRkhoK2oVQo4mA4r8GvsTRYGAmk0kEYMofm
 0Ud2RPfxBLRL6ylcfhGM2KFaW/BtubAW7A==
X-Google-Smtp-Source: ABdhPJyVMtCRa+tYrQ7gy/R7ciqd1wTunOltWXBowItQagkXgej5jDRTggurjecM4eVuSV8lMTIZkg==
X-Received: by 2002:a17:906:1414:: with SMTP id
 p20mr24210750ejc.247.1595325491308; 
 Tue, 21 Jul 2020 02:58:11 -0700 (PDT)
Received: from t5500.home
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o17sm16426079ejb.105.2020.07.21.02.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:58:10 -0700 (PDT)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 1/2] Move DMA-buffer off the stack
Date: Tue, 21 Jul 2020 11:57:47 +0200
Message-Id: <20200721095748.16224-2-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721095748.16224-1-rene.herman@gmail.com>
References: <20200721095748.16224-1-rene.herman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

