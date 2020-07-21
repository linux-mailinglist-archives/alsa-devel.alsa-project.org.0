Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C884322790B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 08:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787D91670;
	Tue, 21 Jul 2020 08:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787D91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595314299;
	bh=qwd680oEWQ7WGl5w5BQsaPW//h+uZLpNvA5C3anA0qI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lk8L7U/MRVQPESoC7kDCC1QsrXfhr9ohDtdYy78yhTLDZyFJoVn1Qg/t4SW84ieEO
	 1KcnZIlozjh5ik3Sgl1o7gZPdVDMhxIJU9cV2ZpIEbuaqTEbGjC3siB0v9wOPEHZlJ
	 8vH10F2PtpzZWnHSl9D+OIOEc6fBmW9EJqCAoa4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0472F8028D;
	Tue, 21 Jul 2020 08:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A9BF80274; Tue, 21 Jul 2020 08:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A50F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 08:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A50F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sZgs1SIa"
Received: by mail-ed1-x544.google.com with SMTP id z17so14484309edr.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSF3hMHgz9hdrCAB5ODB7ZElTfNn931RvYzpdemYwos=;
 b=sZgs1SIaP47pkhLFliiMMWq/WPMbkrQBqVM3mj2ZNlmSmkPNLq8qJZFcqJueeHXyS2
 L7i2Hog/0+BDh0+XcNjLrYehKyBs8th8QZ8tJ39+N7iEJC0dksnv2PSC310UiDYuJRiw
 y8s3wHlshEP4HP8qriFiHJFJ5KSz34bAJCASXgOZYocZstGGXjOPIlvADK+mcr79MDW0
 /LogjI+Pp1VlarYks2nfTW2bUqMfMWLsFrKM+LllVk8R9UhDPHgz3vVz5W4HoC+t6dIu
 L94VWM27fY3ENSNXneE5ULaOjvwUmjw8B5Ufa8L3vzXJMl4uHtU1dH/MntfNc0t59zpc
 9pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSF3hMHgz9hdrCAB5ODB7ZElTfNn931RvYzpdemYwos=;
 b=pi/2a/7nrOy6orZMflTZXjMmLQduinfId7q0MpdQou3gNdEVrWHr/38mA9tFXN03Qm
 vx4diwI1/e13bFYIgKsJByOP4ar6TZyUaZrfAZgHb6eyCnTJB+s1eV6Es866VILscbYY
 C+/J+6wGWWwQgKiHGuyzwBqOJwo0A4r1tCpGs5FuHC3H8xmIoyGirH8ZwuhoNdsHjFe3
 UFZNqI4/Stu03FyAmAKIciljBnI1UDA4kFEvVTYw/PDp1Ysxy4R5lO29mwp7Lv7F6+yL
 RVvuF807+FRGrnlqrYbrOTq2lxGUSwCtafLbq43LDAZD9yrjlrCZ/ADipItl66+TKEHc
 C48w==
X-Gm-Message-State: AOAM532j7YDHHtihOjFdH3f4Lz/lpHCbFMOJ3bqbHLBx4HxbW6gezlDz
 qpUq/xRDc/usIYOWiIeP5P7unpk8bE9RuA==
X-Google-Smtp-Source: ABdhPJzW+tjyQJg+tpuIC7T0t9FZniAwD4Mxa/KB3ZhTZF9967POPGjfU6VQ9IHdFKrHCF03tayepA==
X-Received: by 2002:aa7:cf02:: with SMTP id a2mr25182427edy.263.1595314136437; 
 Mon, 20 Jul 2020 23:48:56 -0700 (PDT)
Received: from t5500.home
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id r13sm10491462ejx.104.2020.07.20.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:48:55 -0700 (PDT)
Received: by t5500.home (Postfix, from userid 1000)
 id A4E72A82E12; Tue, 21 Jul 2020 08:48:53 +0200 (CEST)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/3] snd-usb-6fire: Move DMA-buffer off of the stack
Date: Tue, 21 Jul 2020 08:48:51 +0200
Message-Id: <20200721064853.9516-2-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721064853.9516-1-rene.herman@gmail.com>
References: <20200721064853.9516-1-rene.herman@gmail.com>
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
 firmware.c | 95 ++++++++++++++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 49 deletions(-)

diff --git a/firmware.c b/firmware.c
index 69137c1..502653a 100644
--- a/firmware.c
+++ b/firmware.c
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

