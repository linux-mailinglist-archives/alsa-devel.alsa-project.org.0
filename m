Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CC25AA09
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31EF41865;
	Wed,  2 Sep 2020 13:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31EF41865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044939;
	bh=4nciSiJuiLfCNDwthm0DHhCLPxmhbcbA96IVDP+fm5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkL9DeySzPNOlZjBjtj3R+AgVhbLG3F8LdaDXPABNCAcfiRcSX6RQSF4lbp8MgG9I
	 Z0Ctr+XxRzQVc2fkCRLW/jwL+7jDadR+t6tRJCGxmuHUW1xZrHxIgJegzY5rXuZ0Qa
	 +tHKrWj1VAjXSX1pvyJBZxsvU3TNS0O4QWk1qeis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC99F8033E;
	Wed,  2 Sep 2020 13:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38A9AF80331; Wed,  2 Sep 2020 13:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63917F80323
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63917F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M7HzxDzx"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95EEF215A4;
 Wed,  2 Sep 2020 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044487;
 bh=4nciSiJuiLfCNDwthm0DHhCLPxmhbcbA96IVDP+fm5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M7HzxDzxQPVsvfs7TUHkC0PUSy8acczLBwrMMXux1FOKUxi9GUr+Y52AGahY94Kf2
 pAt8zbr/wOgDktGUIPKUh9Ae7Ug0YBjQrH84jIFYDXOg8XCdNQV6mEnQebwjR+NpYo
 fnoD5k19JxTQHNrvNx3i5LKytO3PuP4S0JKKHOjo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 7/9] sound: line6: convert to use new usb control function...
Date: Wed,  2 Sep 2020 13:01:10 +0200
Message-Id: <20200902110115.1994491-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
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

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/line6/driver.c   | 69 +++++++++++++++-----------------------
 sound/usb/line6/podhd.c    | 17 ++++------
 sound/usb/line6/toneport.c |  8 ++---
 3 files changed, 37 insertions(+), 57 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 60674ce4879b..601292c51491 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -337,23 +337,18 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 {
 	struct usb_device *usbdev = line6->usbdev;
 	int ret;
-	unsigned char *len;
+	u8 len;
 	unsigned count;
 
 	if (address > 0xffff || datalen > 0xff)
 		return -EINVAL;
 
-	len = kmalloc(1, GFP_KERNEL);
-	if (!len)
-		return -ENOMEM;
-
 	/* query the serial number: */
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      (datalen << 8) | 0x21, address,
-			      NULL, 0, LINE6_TIMEOUT * HZ);
-
-	if (ret < 0) {
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   (datalen << 8) | 0x21, address, NULL, 0,
+				   LINE6_TIMEOUT * HZ);
+	if (ret) {
 		dev_err(line6->ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
@@ -362,45 +357,41 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
-				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
-				      USB_DIR_IN,
-				      0x0012, 0x0000, len, 1,
-				      LINE6_TIMEOUT * HZ);
-		if (ret < 0) {
+		ret = usb_control_msg_recv(usbdev, 0, 0x67,
+					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+					   0x0012, 0x0000, &len, 1,
+					   LINE6_TIMEOUT * HZ);
+		if (ret) {
 			dev_err(line6->ifcdev,
 				"receive length failed (error %d)\n", ret);
 			goto exit;
 		}
 
-		if (*len != 0xff)
+		if (len != 0xff)
 			break;
 	}
 
 	ret = -EIO;
-	if (*len == 0xff) {
+	if (len == 0xff) {
 		dev_err(line6->ifcdev, "read failed after %d retries\n",
 			count);
 		goto exit;
-	} else if (*len != datalen) {
+	} else if (len != datalen) {
 		/* should be equal or something went wrong */
 		dev_err(line6->ifcdev,
 			"length mismatch (expected %d, got %d)\n",
-			(int)datalen, (int)*len);
+			(int)datalen, len);
 		goto exit;
 	}
 
 	/* receive the result: */
-	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-			      0x0013, 0x0000, data, datalen,
-			      LINE6_TIMEOUT * HZ);
-
-	if (ret < 0)
+	ret = usb_control_msg_recv(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+				   0x0013, 0x0000, data, datalen, LINE6_TIMEOUT * HZ);
+	if (ret)
 		dev_err(line6->ifcdev, "read failed (error %d)\n", ret);
 
 exit:
-	kfree(len);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_read_data);
@@ -423,12 +414,10 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	if (!status)
 		return -ENOMEM;
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      0x0022, address, data, datalen,
-			      LINE6_TIMEOUT * HZ);
-
-	if (ret < 0) {
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   0x0022, address, data, datalen, LINE6_TIMEOUT * HZ);
+	if (ret) {
 		dev_err(line6->ifcdev,
 			"write request failed (error %d)\n", ret);
 		goto exit;
@@ -437,14 +426,10 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
-				      0x67,
-				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
-				      USB_DIR_IN,
-				      0x0012, 0x0000,
-				      status, 1, LINE6_TIMEOUT * HZ);
-
-		if (ret < 0) {
+		ret = usb_control_msg_recv(usbdev, 0, 0x67,
+					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+					   0x0012, 0x0000, status, 1, LINE6_TIMEOUT * HZ);
+		if (ret) {
 			dev_err(line6->ifcdev,
 				"receiving status failed (error %d)\n", ret);
 			goto exit;
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index eef45f7fef0d..a1261f55d62b 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -183,29 +183,25 @@ static const struct attribute_group podhd_dev_attr_group = {
 static int podhd_dev_start(struct usb_line6_podhd *pod)
 {
 	int ret;
-	u8 *init_bytes;
+	u8 init_bytes[8];
 	int i;
 	struct usb_device *usbdev = pod->line6.usbdev;
 
-	init_bytes = kmalloc(8, GFP_KERNEL);
-	if (!init_bytes)
-		return -ENOMEM;
-
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
+	ret = usb_control_msg_send(usbdev, 0,
 					0x67, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 					0x11, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(pod->line6.ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
 
 	/* NOTE: looks like some kind of ping message */
-	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
+	ret = usb_control_msg_recv(usbdev, 0, 0x67,
 					USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					0x11, 0x0,
 					init_bytes, 3, LINE6_TIMEOUT * HZ);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(pod->line6.ifcdev,
 			"receive length failed (error %d)\n", ret);
 		goto exit;
@@ -220,13 +216,12 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 			goto exit;
 	}
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
+	ret = usb_control_msg_send(usbdev, 0,
 					USB_REQ_SET_FEATURE,
 					USB_TYPE_STANDARD | USB_RECIP_DEVICE | USB_DIR_OUT,
 					1, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
 exit:
-	kfree(init_bytes);
 	return ret;
 }
 
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index 94dd5e7ab2e6..a9b56085b76a 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -126,11 +126,11 @@ static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2)
 {
 	int ret;
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ);
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ);
 
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&usbdev->dev, "send failed (error %d)\n", ret);
 		return ret;
 	}
-- 
2.28.0

