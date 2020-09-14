Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B927F269037
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 17:40:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F6D16DD;
	Mon, 14 Sep 2020 17:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F6D16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600098050;
	bh=Lac+oh0BmkC+rJKg3GvLrnq3erNRzPkU1hCh3fX7DZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5TEmJGJLTh3PUxnHA/hbSHOPLvSVzD9a6AH4VJ+WJYZFc1pKGFzKovi7GSOFiLmN
	 Gs5LVPTrzePxDhAhnsDmdscIrdYGi2GJvpnQ92+1wsV+gF3wGyBNMxXZQke32LruYK
	 h0Z+SJn0OMXWcLNNDuJLmjYHqRzKswMQ7VPS3ucg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BAAFF802D2;
	Mon, 14 Sep 2020 17:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53EDBF802D2; Mon, 14 Sep 2020 17:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80105F80150
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 17:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80105F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s+qqpD6S"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 460A0217BA;
 Mon, 14 Sep 2020 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600097886;
 bh=Lac+oh0BmkC+rJKg3GvLrnq3erNRzPkU1hCh3fX7DZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s+qqpD6SUDjRr4uC3qrwB0h4mkyNZeQPS3scNncX7vvfUHm1q8c2CW7jqWlWvlYkO
 hDoFChKszsshTdleYvOk/xbGGFuFTdKRfvmDTR/tquWqXrONldN7SDiMYV+eF8hW5A
 dPCeqVoBJDL+RgdgfxR2GShvIVfJ6Kzz5lhVOubw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 10/11] Bluetooth: ath3k: use usb_control_msg_send() and
 usb_control_msg_recv()
Date: Mon, 14 Sep 2020 17:37:55 +0200
Message-Id: <20200914153756.3412156-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914153756.3412156-1-gregkh@linuxfoundation.org>
References: <20200914153756.3412156-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org
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
an error if a "short" write/read happens, and they can handle data off
of the stack, so move the driver over to using those calls instead,
saving some logic when dynamically allocating memory.

Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3:
 - no change from v2

v2:
 - no change from v1

 drivers/bluetooth/ath3k.c | 90 +++++++++++----------------------------
 1 file changed, 26 insertions(+), 64 deletions(-)

diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
index 4ce270513695..1472cccfd0b3 100644
--- a/drivers/bluetooth/ath3k.c
+++ b/drivers/bluetooth/ath3k.c
@@ -212,19 +212,16 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 	BT_DBG("udev %p", udev);
 
-	pipe = usb_sndctrlpipe(udev, 0);
-
 	send_buf = kmalloc(BULK_SIZE, GFP_KERNEL);
 	if (!send_buf) {
 		BT_ERR("Can't allocate memory chunk for firmware");
 		return -ENOMEM;
 	}
 
-	memcpy(send_buf, firmware->data, FW_HDR_SIZE);
-	err = usb_control_msg(udev, pipe, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
-			      0, 0, send_buf, FW_HDR_SIZE,
-			      USB_CTRL_SET_TIMEOUT);
-	if (err < 0) {
+	err = usb_control_msg_send(udev, 0, USB_REQ_DFU_DNLOAD, USB_TYPE_VENDOR,
+				   0, 0, firmware->data, FW_HDR_SIZE,
+				   USB_CTRL_SET_TIMEOUT);
+	if (err) {
 		BT_ERR("Can't change to loading configuration err");
 		goto error;
 	}
@@ -259,44 +256,17 @@ static int ath3k_load_firmware(struct usb_device *udev,
 
 static int ath3k_get_state(struct usb_device *udev, unsigned char *state)
 {
-	int ret, pipe = 0;
-	char *buf;
-
-	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	pipe = usb_rcvctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_GETSTATE,
-			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-			      buf, sizeof(*buf), USB_CTRL_SET_TIMEOUT);
-
-	*state = *buf;
-	kfree(buf);
-
-	return ret;
+	return usb_control_msg_recv(udev, 0, ATH3K_GETSTATE,
+				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+				    state, 1, USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_get_version(struct usb_device *udev,
 			struct ath3k_version *version)
 {
-	int ret, pipe = 0;
-	struct ath3k_version *buf;
-	const int size = sizeof(*buf);
-
-	buf = kmalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	pipe = usb_rcvctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_GETVERSION,
-			      USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
-			      buf, size, USB_CTRL_SET_TIMEOUT);
-
-	memcpy(version, buf, size);
-	kfree(buf);
-
-	return ret;
+	return usb_control_msg_recv(udev, 0, ATH3K_GETVERSION,
+				    USB_TYPE_VENDOR | USB_DIR_IN, 0, 0,
+				    version, sizeof(*version), USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_load_fwfile(struct usb_device *udev,
@@ -316,13 +286,10 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	}
 
 	size = min_t(uint, count, FW_HDR_SIZE);
-	memcpy(send_buf, firmware->data, size);
 
-	pipe = usb_sndctrlpipe(udev, 0);
-	ret = usb_control_msg(udev, pipe, ATH3K_DNLOAD,
-			USB_TYPE_VENDOR, 0, 0, send_buf,
-			size, USB_CTRL_SET_TIMEOUT);
-	if (ret < 0) {
+	ret = usb_control_msg_send(udev, 0, ATH3K_DNLOAD, USB_TYPE_VENDOR, 0, 0,
+				   firmware->data, size, USB_CTRL_SET_TIMEOUT);
+	if (ret) {
 		BT_ERR("Can't change to loading configuration err");
 		kfree(send_buf);
 		return ret;
@@ -355,23 +322,19 @@ static int ath3k_load_fwfile(struct usb_device *udev,
 	return 0;
 }
 
-static int ath3k_switch_pid(struct usb_device *udev)
+static void ath3k_switch_pid(struct usb_device *udev)
 {
-	int pipe = 0;
-
-	pipe = usb_sndctrlpipe(udev, 0);
-	return usb_control_msg(udev, pipe, USB_REG_SWITCH_VID_PID,
-			USB_TYPE_VENDOR, 0, 0,
-			NULL, 0, USB_CTRL_SET_TIMEOUT);
+	usb_control_msg_send(udev, 0, USB_REG_SWITCH_VID_PID, USB_TYPE_VENDOR,
+			     0, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_set_normal_mode(struct usb_device *udev)
 {
 	unsigned char fw_state;
-	int pipe = 0, ret;
+	int ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to normal mode err");
 		return ret;
 	}
@@ -381,10 +344,9 @@ static int ath3k_set_normal_mode(struct usb_device *udev)
 		return 0;
 	}
 
-	pipe = usb_sndctrlpipe(udev, 0);
-	return usb_control_msg(udev, pipe, ATH3K_SET_NORMAL_MODE,
-			USB_TYPE_VENDOR, 0, 0,
-			NULL, 0, USB_CTRL_SET_TIMEOUT);
+	return usb_control_msg_send(udev, 0, ATH3K_SET_NORMAL_MODE,
+				    USB_TYPE_VENDOR, 0, 0, NULL, 0,
+				    USB_CTRL_SET_TIMEOUT);
 }
 
 static int ath3k_load_patch(struct usb_device *udev)
@@ -397,7 +359,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	int ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to load ram patch err");
 		return ret;
 	}
@@ -408,7 +370,7 @@ static int ath3k_load_patch(struct usb_device *udev)
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -449,13 +411,13 @@ static int ath3k_load_syscfg(struct usb_device *udev)
 	int clk_value, ret;
 
 	ret = ath3k_get_state(udev, &fw_state);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get state to change to load configuration err");
 		return -EBUSY;
 	}
 
 	ret = ath3k_get_version(udev, &fw_version);
-	if (ret < 0) {
+	if (ret) {
 		BT_ERR("Can't get version to change to load ram patch err");
 		return ret;
 	}
@@ -529,7 +491,7 @@ static int ath3k_probe(struct usb_interface *intf,
 			return ret;
 		}
 		ret = ath3k_set_normal_mode(udev);
-		if (ret < 0) {
+		if (ret) {
 			BT_ERR("Set normal mode failed");
 			return ret;
 		}
-- 
2.28.0

