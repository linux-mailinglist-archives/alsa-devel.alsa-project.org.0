Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3225FC67
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976DA17DE;
	Mon,  7 Sep 2020 16:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976DA17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490678;
	bh=ZsWVCgDo0Rt7GjR+jKLMd25e1+x4CXawRQPMOPI72AQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmgAs2UsbWJPYrg7aztTH3e3VMHLkAPh3egP4xuXtmQkGGTeIWpkR42/KsXyDxKUO
	 0X4xiovX2CEHDf+BopkJ33aJuWhzieLXQCi8XWcmZpbZbzLXWL2rxIWZPQn2xR4XlC
	 OK/9etopck6xdya9PMydKQB//ZOQcVFCWvard0c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 308A7F80332;
	Mon,  7 Sep 2020 16:51:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AE27F802F9; Mon,  7 Sep 2020 16:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C6D2F800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C6D2F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w+oGDZcJ"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBA2821941;
 Mon,  7 Sep 2020 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599490284;
 bh=ZsWVCgDo0Rt7GjR+jKLMd25e1+x4CXawRQPMOPI72AQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=w+oGDZcJ1AnOFW2GymIMwpD+SMrJcU6Knt41xKMT4+uFM/gD2RHsHdtPuI5c8p63F
 NNLou5ZlmHty966X5NXZtQUAMk2Z42LPXavnperqdrom0JEW+g2DGjpXWXgzWKN+fo
 omnbgb3Zf3YXUICszGOMaFFrApnKWAenl2BqMDtk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 07/11] sound: 6fire: move to use usb_control_msg_send() and
 usb_control_msg_recv()
Date: Mon,  7 Sep 2020 16:51:04 +0200
Message-Id: <20200907145108.3766613-8-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 marcel@holtmann.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org
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

The usb_control_msg_send() and usb_control_msg_recv() calls can return
an error if a "short" write/read happens, so move the driver over to
using those calls instead, saving some logic in the wrapper functions
that were being used in this driver.

This also resolves a long-staging bug where data on the stack was being
sent in a USB control message, which was not allowed.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
 - Added reviewed-by from Takashi

 sound/usb/6fire/firmware.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 69137c14d0dc..5b8994070c96 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -158,29 +158,17 @@ static int usb6fire_fw_ihex_init(const struct firmware *fw,
 static int usb6fire_fw_ezusb_write(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret;
-
-	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0), type,
-			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			value, 0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
+	return usb_control_msg_send(device, 0, type,
+				    USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				    value, 0, data, len, HZ);
 }
 
 static int usb6fire_fw_ezusb_read(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret = usb_control_msg(device, usb_rcvctrlpipe(device, 0), type,
-			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE, value,
-			0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
+	return usb_control_msg_recv(device, 0, type,
+				    USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				    value, 0, data, len, HZ);
 }
 
 static int usb6fire_fw_fpga_write(struct usb_device *device,
@@ -230,7 +218,7 @@ static int usb6fire_fw_ezusb_upload(
 	/* upload firmware image */
 	data = 0x01; /* stop ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret < 0) {
+	if (ret) {
 		kfree(rec);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -242,7 +230,7 @@ static int usb6fire_fw_ezusb_upload(
 	while (usb6fire_fw_ihex_next_record(rec)) { /* write firmware */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, rec->address,
 				rec->data, rec->len);
-		if (ret < 0) {
+		if (ret) {
 			kfree(rec);
 			release_firmware(fw);
 			dev_err(&intf->dev,
@@ -257,7 +245,7 @@ static int usb6fire_fw_ezusb_upload(
 	if (postdata) { /* write data after firmware has been uploaded */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, postaddr,
 				postdata, postlen);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&intf->dev,
 				"unable to upload ezusb firmware %s: post urb.\n",
 				fwname);
@@ -267,7 +255,7 @@ static int usb6fire_fw_ezusb_upload(
 
 	data = 0x00; /* resume ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to upload ezusb firmware %s: end message.\n",
 			fwname);
@@ -302,7 +290,7 @@ static int usb6fire_fw_fpga_upload(
 	end = fw->data + fw->size;
 
 	ret = usb6fire_fw_ezusb_write(device, 8, 0, NULL, 0);
-	if (ret < 0) {
+	if (ret) {
 		kfree(buffer);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -327,7 +315,7 @@ static int usb6fire_fw_fpga_upload(
 	kfree(buffer);
 
 	ret = usb6fire_fw_ezusb_write(device, 9, 0, NULL, 0);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to upload fpga firmware: end urb.\n");
 		return ret;
@@ -363,7 +351,7 @@ int usb6fire_fw_init(struct usb_interface *intf)
 	u8 buffer[12];
 
 	ret = usb6fire_fw_ezusb_read(device, 1, 0, buffer, 8);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to receive device firmware state.\n");
 		return ret;
-- 
2.28.0

