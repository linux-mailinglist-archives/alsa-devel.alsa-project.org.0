Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7703AF484
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865DD16AD;
	Mon, 21 Jun 2021 20:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865DD16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299063;
	bh=wPFFXdYca3FG49efhTEHUy21h9Y6mhP2zcat9zpEj/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikaF+SbOsmeapc1Pxg6i46rQrv1l2Xwy0LFoiiK/kBCjRpTNFwvcaqu1vUNFgTCUD
	 PenL1L0Opke0Ytl5ptr0H7rWXxvoNQQPgIhTufgBQ+LgUUhWQoNk4xx2uB4+uuvjAY
	 esSx4mefio7EDYKvxf53dWjwerl3N+JrZxiAE/S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76233F804E1;
	Mon, 21 Jun 2021 20:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D2EF804D9; Mon, 21 Jun 2021 20:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F994F80137
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F994F80137
Received: by m.b4.vu (Postfix, from userid 1000)
 id CDA9161E2871; Tue, 22 Jun 2021 03:39:06 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:06 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/31] ALSA: usb-audio: scarlett2: Add usb_tx/rx functions
Message-ID: <720d1d6f227fc8f5d7d6191a8de62db796940235.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Pull out snd_usb_ctl_msg() calls from scarlett2_usb() and put into
scarlett2_usb_tx() and scarlett2_usb_rx() functions.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 44 +++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 2e1937b072ee..6b77582d8e3d 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -453,8 +453,8 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 #define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
 
 /* Commands for sending/receiving requests/responses */
-#define SCARLETT2_USB_VENDOR_SPECIFIC_CMD_REQ  2
-#define SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP 3
+#define SCARLETT2_USB_CMD_REQ  2
+#define SCARLETT2_USB_CMD_RESP 3
 
 #define SCARLETT2_USB_INIT_SEQ  0x00000000
 #define SCARLETT2_USB_GET_METER 0x00001001
@@ -576,12 +576,31 @@ static void scarlett2_fill_request_header(struct scarlett2_data *private,
 	req->pad = 0;
 }
 
+static int scarlett2_usb_tx(struct usb_device *dev, int interface,
+			    void *buf, u16 size)
+{
+	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			SCARLETT2_USB_CMD_REQ,
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			0, interface, buf, size);
+}
+
+static int scarlett2_usb_rx(struct usb_device *dev, int interface,
+			    u32 usb_req, void *buf, u16 size)
+{
+	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			usb_req,
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			0, interface, buf, size);
+}
+
 /* Send a proprietary format request to the Scarlett interface */
 static int scarlett2_usb(
 	struct usb_mixer_interface *mixer, u32 cmd,
 	void *req_data, u16 req_size, void *resp_data, u16 resp_size)
 {
 	struct scarlett2_data *private = mixer->private_data;
+	struct usb_device *dev = mixer->chip->dev;
 	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
 	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
 	struct scarlett2_usb_packet *req, *resp = NULL;
@@ -608,14 +627,8 @@ static int scarlett2_usb(
 	if (req_size)
 		memcpy(req->data, req_data, req_size);
 
-	err = snd_usb_ctl_msg(mixer->chip->dev,
-			usb_sndctrlpipe(mixer->chip->dev, 0),
-			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_REQ,
-			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
-			0,
-			private->bInterfaceNumber,
-			req,
-			req_buf_size);
+	err = scarlett2_usb_tx(dev, private->bInterfaceNumber,
+			       req, req_buf_size);
 
 	if (err != req_buf_size) {
 		usb_audio_err(
@@ -628,14 +641,9 @@ static int scarlett2_usb(
 
 	/* send a second message to get the response */
 
-	err = snd_usb_ctl_msg(mixer->chip->dev,
-			usb_rcvctrlpipe(mixer->chip->dev, 0),
-			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
-			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-			0,
-			private->bInterfaceNumber,
-			resp,
-			resp_buf_size);
+	err = scarlett2_usb_rx(dev, private->bInterfaceNumber,
+			       SCARLETT2_USB_CMD_RESP,
+			       resp, resp_buf_size);
 
 	/* validate the response */
 
-- 
2.31.1

