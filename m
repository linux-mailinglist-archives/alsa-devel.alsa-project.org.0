Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9F4395C4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8293D16E4;
	Mon, 25 Oct 2021 14:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8293D16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635164045;
	bh=v30rtrxj73SBSsaMh1xs42dYppy3X1ftgTu3Cs0j0nU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXLUMMy9htcFjGJzKAgsj5dA/j82zdmZhR2Er6oHYmS8dPEpf3j13tc6+JAWcwtoK
	 eszHzYM+QxfaH4NqMaMuYqLKRAutkr6diUfrF8zGu1Kowl+j+a3IXQSMEse4cODTP9
	 Pve33UGmg+HfMvXjI+QO1f4/KjdQUcYVQfece35c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23977F804E6;
	Mon, 25 Oct 2021 14:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 273D4F80271; Mon, 25 Oct 2021 14:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78B86F8010A
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B86F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oHwJpnto"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A844760FDA;
 Mon, 25 Oct 2021 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635163935;
 bh=v30rtrxj73SBSsaMh1xs42dYppy3X1ftgTu3Cs0j0nU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHwJpntodlhDh6K1X4S9eoXw/h86PKhrqpxVd1VYfttyeCkY2ACH1il2Ch9wcctIF
 oMnGqjtlXYkSXXDhgGebrPrKINXOWnj178ic5BdI+5l25PSbwN2UyHlA61xQLFRyP2
 F84M8P+u1tBhlMzttLt//sfGvWFitxSb13YuGY0CzHnu4PigKgT8zZN/iFVbYuG/GO
 0u+wX5YzmAYbTFcwQmbwNhEQMZHZQjWQ0dK2fBg+j1Lox5qcFdAX5/GKnJvnJVKR2V
 yz3sq/hH+DXWgHvfcK4b74b/9W1Gmhf7RwHMwiv2DcHlowXFXh1f6/cXx4iLN7b22D
 h+T7nZLvmzfyQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1meypa-0001iJ-Fi; Mon, 25 Oct 2021 14:11:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] sound: line6: fix control and interrupt message timeouts
Date: Mon, 25 Oct 2021 14:11:42 +0200
Message-Id: <20211025121142.6531-3-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025121142.6531-1-johan@kernel.org>
References: <20211025121142.6531-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
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

USB control and interrupt message timeouts are specified in milliseconds
and should specifically not vary with CONFIG_HZ.

Fixes: 705ececd1c60 ("Staging: add line6 usb driver")
Cc: stable@vger.kernel.org      # 2.6.30
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/line6/driver.c   | 14 +++++++-------
 sound/usb/line6/driver.h   |  2 +-
 sound/usb/line6/podhd.c    |  6 +++---
 sound/usb/line6/toneport.c |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 9602929b7de9..59faa5a9a714 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -113,12 +113,12 @@ int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
 			retval = usb_interrupt_msg(line6->usbdev,
 						usb_sndintpipe(line6->usbdev, properties->ep_ctrl_w),
 						(char *)frag_buf, frag_size,
-						&partial, LINE6_TIMEOUT * HZ);
+						&partial, LINE6_TIMEOUT);
 		} else {
 			retval = usb_bulk_msg(line6->usbdev,
 						usb_sndbulkpipe(line6->usbdev, properties->ep_ctrl_w),
 						(char *)frag_buf, frag_size,
-						&partial, LINE6_TIMEOUT * HZ);
+						&partial, LINE6_TIMEOUT);
 		}
 
 		if (retval) {
@@ -347,7 +347,7 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 	ret = usb_control_msg_send(usbdev, 0, 0x67,
 				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 				   (datalen << 8) | 0x21, address, NULL, 0,
-				   LINE6_TIMEOUT * HZ, GFP_KERNEL);
+				   LINE6_TIMEOUT, GFP_KERNEL);
 	if (ret) {
 		dev_err(line6->ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
@@ -360,7 +360,7 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 		ret = usb_control_msg_recv(usbdev, 0, 0x67,
 					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					   0x0012, 0x0000, &len, 1,
-					   LINE6_TIMEOUT * HZ, GFP_KERNEL);
+					   LINE6_TIMEOUT, GFP_KERNEL);
 		if (ret) {
 			dev_err(line6->ifcdev,
 				"receive length failed (error %d)\n", ret);
@@ -387,7 +387,7 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 	/* receive the result: */
 	ret = usb_control_msg_recv(usbdev, 0, 0x67,
 				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-				   0x0013, 0x0000, data, datalen, LINE6_TIMEOUT * HZ,
+				   0x0013, 0x0000, data, datalen, LINE6_TIMEOUT,
 				   GFP_KERNEL);
 	if (ret)
 		dev_err(line6->ifcdev, "read failed (error %d)\n", ret);
@@ -417,7 +417,7 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 
 	ret = usb_control_msg_send(usbdev, 0, 0x67,
 				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-				   0x0022, address, data, datalen, LINE6_TIMEOUT * HZ,
+				   0x0022, address, data, datalen, LINE6_TIMEOUT,
 				   GFP_KERNEL);
 	if (ret) {
 		dev_err(line6->ifcdev,
@@ -430,7 +430,7 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 
 		ret = usb_control_msg_recv(usbdev, 0, 0x67,
 					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-					   0x0012, 0x0000, status, 1, LINE6_TIMEOUT * HZ,
+					   0x0012, 0x0000, status, 1, LINE6_TIMEOUT,
 					   GFP_KERNEL);
 		if (ret) {
 			dev_err(line6->ifcdev,
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index 71d3da1db8c8..ecf3a2b39c7e 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -27,7 +27,7 @@
 #define LINE6_FALLBACK_INTERVAL 10
 #define LINE6_FALLBACK_MAXPACKETSIZE 16
 
-#define LINE6_TIMEOUT 1
+#define LINE6_TIMEOUT 1000
 #define LINE6_BUFSIZE_LISTEN 64
 #define LINE6_MIDI_MESSAGE_MAXLEN 256
 
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 28794a35949d..b24bc82f89e3 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -190,7 +190,7 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 	ret = usb_control_msg_send(usbdev, 0,
 					0x67, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 					0x11, 0,
-					NULL, 0, LINE6_TIMEOUT * HZ, GFP_KERNEL);
+					NULL, 0, LINE6_TIMEOUT, GFP_KERNEL);
 	if (ret) {
 		dev_err(pod->line6.ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
@@ -200,7 +200,7 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 	ret = usb_control_msg_recv(usbdev, 0, 0x67,
 					USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					0x11, 0x0,
-					init_bytes, 3, LINE6_TIMEOUT * HZ, GFP_KERNEL);
+					init_bytes, 3, LINE6_TIMEOUT, GFP_KERNEL);
 	if (ret) {
 		dev_err(pod->line6.ifcdev,
 			"receive length failed (error %d)\n", ret);
@@ -220,7 +220,7 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 					USB_REQ_SET_FEATURE,
 					USB_TYPE_STANDARD | USB_RECIP_DEVICE | USB_DIR_OUT,
 					1, 0,
-					NULL, 0, LINE6_TIMEOUT * HZ, GFP_KERNEL);
+					NULL, 0, LINE6_TIMEOUT, GFP_KERNEL);
 exit:
 	return ret;
 }
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index 4e5693c97aa4..e33df58740a9 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -128,7 +128,7 @@ static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2)
 
 	ret = usb_control_msg_send(usbdev, 0, 0x67,
 				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-				   cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ,
+				   cmd1, cmd2, NULL, 0, LINE6_TIMEOUT,
 				   GFP_KERNEL);
 
 	if (ret) {
-- 
2.32.0

