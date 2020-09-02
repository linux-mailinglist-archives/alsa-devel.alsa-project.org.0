Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1425AA05
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536C01801;
	Wed,  2 Sep 2020 13:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536C01801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044877;
	bh=v32AraO7yjFkMJz0mt4d1Okcjvs/K5ZJWJv43lokdps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpiBdDQ5RIDDL33s7NYYBLqJWJVzxPje1BJMmrEpYytwBKoMgqQ7XgmEPCGX+QvqA
	 HQPfN1fXAwRXBcpet6IqwL9lnjsDgJp2IaCRntHT+6mYoeiQYHA8F+774L2XGMauoP
	 UaC4jyxXMMcT/SNbepzSWo/8tBKNJkBaBYsMJ9kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A92F80323;
	Wed,  2 Sep 2020 13:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B915AF80317; Wed,  2 Sep 2020 13:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C2A0F802F7
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2A0F802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PE6YtdqF"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CB0621532;
 Wed,  2 Sep 2020 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044479;
 bh=v32AraO7yjFkMJz0mt4d1Okcjvs/K5ZJWJv43lokdps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PE6YtdqFQSObJgm6eKWbFiXFhV2xf0aKsUxyi9CWsQPXJppogOln708tbIh3dtFys
 Q+Fbx7j5eGQh9xI/QcqEjVbRCIj9S34txmeRZO2R/wE9w9+UgQKdlhEn7XOgiPTqWr
 xHp2RbTkAWlIIyOsk8RawJUAg7DFpaRFApa5dRNU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 05/10] USB: legousbtower: use usb_control_msg_recv()
Date: Wed,  2 Sep 2020 13:01:07 +0200
Message-Id: <20200902110115.1994491-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Juergen Stuber <starblue@users.sourceforge.net>, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 legousb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 tiwai@suse.com, stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org
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

The usb_control_msg_recv() function can handle data on the stack, as
well as properly detecting short reads, so move to use that function
instead of the older usb_control_msg() call.  This ends up removing a
lot of extra lines in the driver.

Cc: Juergen Stuber <starblue@users.sourceforge.net>
Cc: legousb-devel@lists.sourceforge.net
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/legousbtower.c | 60 +++++++++++----------------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index f922544056de..c3583df4c324 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -308,15 +308,9 @@ static int tower_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 	struct usb_interface *interface;
-	struct tower_reset_reply *reset_reply;
+	struct tower_reset_reply reset_reply;
 	int result;
 
-	reset_reply = kmalloc(sizeof(*reset_reply), GFP_KERNEL);
-	if (!reset_reply) {
-		retval = -ENOMEM;
-		goto exit;
-	}
-
 	nonseekable_open(inode, file);
 	subminor = iminor(inode);
 
@@ -347,15 +341,11 @@ static int tower_open(struct inode *inode, struct file *file)
 	}
 
 	/* reset the tower */
-	result = usb_control_msg(dev->udev,
-				 usb_rcvctrlpipe(dev->udev, 0),
-				 LEGO_USB_TOWER_REQUEST_RESET,
-				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				 0,
-				 0,
-				 reset_reply,
-				 sizeof(*reset_reply),
-				 1000);
+	result = usb_control_msg_recv(dev->udev, 0,
+				      LEGO_USB_TOWER_REQUEST_RESET,
+				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				      0, 0,
+				      &reset_reply, sizeof(reset_reply), 1000);
 	if (result < 0) {
 		dev_err(&dev->udev->dev,
 			"LEGO USB Tower reset control request failed\n");
@@ -394,7 +384,6 @@ static int tower_open(struct inode *inode, struct file *file)
 	mutex_unlock(&dev->lock);
 
 exit:
-	kfree(reset_reply);
 	return retval;
 }
 
@@ -753,7 +742,7 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	struct device *idev = &interface->dev;
 	struct usb_device *udev = interface_to_usbdev(interface);
 	struct lego_usb_tower *dev;
-	struct tower_get_version_reply *get_version_reply = NULL;
+	struct tower_get_version_reply get_version_reply;
 	int retval = -ENOMEM;
 	int result;
 
@@ -798,34 +787,25 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	dev->interrupt_in_interval = interrupt_in_interval ? interrupt_in_interval : dev->interrupt_in_endpoint->bInterval;
 	dev->interrupt_out_interval = interrupt_out_interval ? interrupt_out_interval : dev->interrupt_out_endpoint->bInterval;
 
-	get_version_reply = kmalloc(sizeof(*get_version_reply), GFP_KERNEL);
-	if (!get_version_reply) {
-		retval = -ENOMEM;
-		goto error;
-	}
-
 	/* get the firmware version and log it */
-	result = usb_control_msg(udev,
-				 usb_rcvctrlpipe(udev, 0),
-				 LEGO_USB_TOWER_REQUEST_GET_VERSION,
-				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				 0,
-				 0,
-				 get_version_reply,
-				 sizeof(*get_version_reply),
-				 1000);
-	if (result != sizeof(*get_version_reply)) {
-		if (result >= 0)
-			result = -EIO;
+	result = usb_control_msg_recv(udev, 0,
+				      LEGO_USB_TOWER_REQUEST_GET_VERSION,
+				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				      0,
+				      0,
+				      &get_version_reply,
+				      sizeof(get_version_reply),
+				      1000);
+	if (!result) {
 		dev_err(idev, "get version request failed: %d\n", result);
 		retval = result;
 		goto error;
 	}
 	dev_info(&interface->dev,
 		 "LEGO USB Tower firmware version is %d.%d build %d\n",
-		 get_version_reply->major,
-		 get_version_reply->minor,
-		 le16_to_cpu(get_version_reply->build_no));
+		 get_version_reply.major,
+		 get_version_reply.minor,
+		 le16_to_cpu(get_version_reply.build_no));
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(interface, dev);
@@ -844,11 +824,9 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 		 USB_MAJOR, dev->minor);
 
 exit:
-	kfree(get_version_reply);
 	return retval;
 
 error:
-	kfree(get_version_reply);
 	tower_delete(dev);
 	return retval;
 }
-- 
2.28.0

