Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E225FC57
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D4317B5;
	Mon,  7 Sep 2020 16:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D4317B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490511;
	bh=h4qo13MuKIBOL36f408Cp8YPzjpxFs19uVUOnTY6W1w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RcopFHYK8EHvjNBpgtVuRFINf05zTXRK7+ToRQ8e3cCqaI3CTtitFYv/gUUCYb5zY
	 L2xKmR0GG+/HwqOS9M+Kjlx8ieMWe92IfURWEhlkvp4MbV9JoXP7PZ43RNhlmC9Wqb
	 w2Jp7amDRcYsiOTTjEA9P0+NI7EAKNwyaMfgac+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D3C7F802E8;
	Mon,  7 Sep 2020 16:51:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE49F8028D; Mon,  7 Sep 2020 16:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 584ECF8028B
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 584ECF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="liinFBkF"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2730E215A4;
 Mon,  7 Sep 2020 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599490271;
 bh=h4qo13MuKIBOL36f408Cp8YPzjpxFs19uVUOnTY6W1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=liinFBkFyHLaJLIeSey9AzpTVwo5tAq0lxmr747pa6hxz84x2NY96OcOTKndkh0XD
 KV2QLRR7HfaN1g4yS+xd2LBRulccUYEUBCqiwu+w/Y44/YXFkAEBTYnZmdFRXMMOrG
 ///n3xyMGV/pjWpxQjfL2rYb/dkDjwh1OjQTPC/c=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 02/11] USB: add usb_control_msg_send() and
 usb_control_msg_recv()
Date: Mon,  7 Sep 2020 16:50:59 +0200
Message-Id: <20200907145108.3766613-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
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

New core functions to make sending/receiving USB control messages easier
and saner.

In discussions, it turns out that the large majority of users of
usb_control_msg() do so in potentially incorrect ways.  The most common
issue is where a "short" message is received, yet never detected
properly due to "incorrect" error handling.

Handle all of this in the USB core with two new functions to try to make
working with USB control messages simpler.

No more need for dynamic data, messages can be on the stack, and only
"complete" send/receive will work without causing an error.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
 - no change from v1

 drivers/usb/core/message.c | 133 +++++++++++++++++++++++++++++++++++++
 include/linux/usb.h        |   6 ++
 2 files changed, 139 insertions(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6197938dcc2d..6aa49b237717 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -162,6 +162,139 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 }
 EXPORT_SYMBOL_GPL(usb_control_msg);
 
+/**
+ * usb_control_msg_send - Builds a control "send" message, sends it off and waits for completion
+ * @dev: pointer to the usb device to send the message to
+ * @endpoint: endpoint to send the message to
+ * @request: USB message request value
+ * @requesttype: USB message request type value
+ * @value: USB message value
+ * @index: USB message index value
+ * @driver_data: pointer to the data to send
+ * @size: length in bytes of the data to send
+ * @timeout: time in msecs to wait for the message to complete before timing
+ *	out (if 0 the wait is forever)
+ *
+ * Context: !in_interrupt ()
+ *
+ * This function sends a control message to a specified endpoint that is not
+ * expected to fill in a response (i.e. a "send message") and waits for the
+ * message to complete, or timeout.
+ *
+ * Do not use this function from within an interrupt context. If you need
+ * an asynchronous message, or need to send a message from within interrupt
+ * context, use usb_submit_urb(). If a thread in your driver uses this call,
+ * make sure your disconnect() method can wait for it to complete. Since you
+ * don't have a handle on the URB used, you can't cancel the request.
+ *
+ * The data pointer can be made to a reference on the stack, or anywhere else,
+ * as it will not be modified at all.  This does not have the restriction that
+ * usb_control_msg() has where the data pointer must be to dynamically allocated
+ * memory (i.e. memory that can be successfully DMAed to a device).
+ *
+ * Return: If successful, 0 is returned, Otherwise, a negative error number.
+ */
+int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
+			 __u8 requesttype, __u16 value, __u16 index,
+			 const void *driver_data, __u16 size, int timeout)
+{
+	unsigned int pipe = usb_sndctrlpipe(dev, endpoint);
+	int ret;
+	u8 *data = NULL;
+
+	if (usb_pipe_type_check(dev, pipe))
+		return -EINVAL;
+
+	if (size) {
+		data = kmemdup(driver_data, size, GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+	}
+
+	ret = usb_control_msg(dev, pipe, request, requesttype, value, index,
+			      data, size, timeout);
+	kfree(data);
+
+	if (ret < 0)
+		return ret;
+	if (ret == size)
+		return 0;
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(usb_control_msg_send);
+
+/**
+ * usb_control_msg_recv - Builds a control "receive" message, sends it off and waits for completion
+ * @dev: pointer to the usb device to send the message to
+ * @endpoint: endpoint to send the message to
+ * @request: USB message request value
+ * @requesttype: USB message request type value
+ * @value: USB message value
+ * @index: USB message index value
+ * @driver_data: pointer to the data to be filled in by the message
+ * @size: length in bytes of the data to be received
+ * @timeout: time in msecs to wait for the message to complete before timing
+ *	out (if 0 the wait is forever)
+ *
+ * Context: !in_interrupt ()
+ *
+ * This function sends a control message to a specified endpoint that is
+ * expected to fill in a response (i.e. a "receive message") and waits for the
+ * message to complete, or timeout.
+ *
+ * Do not use this function from within an interrupt context. If you need
+ * an asynchronous message, or need to send a message from within interrupt
+ * context, use usb_submit_urb(). If a thread in your driver uses this call,
+ * make sure your disconnect() method can wait for it to complete. Since you
+ * don't have a handle on the URB used, you can't cancel the request.
+ *
+ * The data pointer can be made to a reference on the stack, or anywhere else
+ * that can be successfully written to.  This function does not have the
+ * restriction that usb_control_msg() has where the data pointer must be to
+ * dynamically allocated memory (i.e. memory that can be successfully DMAed to a
+ * device).
+ *
+ * The "whole" message must be properly received from the device in order for
+ * this function to be successful.  If a device returns less than the expected
+ * amount of data, then the function will fail.  Do not use this for messages
+ * where a variable amount of data might be returned.
+ *
+ * Return: If successful, 0 is returned, Otherwise, a negative error number.
+ */
+int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
+			 __u8 requesttype, __u16 value, __u16 index,
+			 void *driver_data, __u16 size, int timeout)
+{
+	unsigned int pipe = usb_rcvctrlpipe(dev, endpoint);
+	int ret;
+	u8 *data;
+
+	if (!size || !driver_data || usb_pipe_type_check(dev, pipe))
+		return -EINVAL;
+
+	data = kmalloc(size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = usb_control_msg(dev, pipe, request, requesttype, value, index,
+			      data, size, timeout);
+
+	if (ret < 0)
+		goto exit;
+
+	if (ret == size) {
+		memcpy(driver_data, data, size);
+		ret = 0;
+	} else {
+		ret = -EINVAL;
+	}
+
+exit:
+	kfree(data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(usb_control_msg_recv);
+
 /**
  * usb_interrupt_msg - Builds an interrupt urb, sends it off and waits for completion
  * @usb_dev: pointer to the usb device to send the message to
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 0b3963d7ec38..a5460f08126e 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1802,6 +1802,12 @@ extern int usb_bulk_msg(struct usb_device *usb_dev, unsigned int pipe,
 	int timeout);
 
 /* wrappers around usb_control_msg() for the most common standard requests */
+int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
+			 __u8 requesttype, __u16 value, __u16 index,
+			 const void *data, __u16 size, int timeout);
+int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
+			 __u8 requesttype, __u16 value, __u16 index,
+			 void *data, __u16 size, int timeout);
 extern int usb_get_descriptor(struct usb_device *dev, unsigned char desctype,
 	unsigned char descindex, void *buf, int size);
 extern int usb_get_status(struct usb_device *dev,
-- 
2.28.0

