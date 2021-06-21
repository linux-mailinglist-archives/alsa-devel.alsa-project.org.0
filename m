Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1C3AF485
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F65F168D;
	Mon, 21 Jun 2021 20:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F65F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299097;
	bh=8jm3sJdL9sFMHzxRHU7oAIRbMGyqMO7x6C+0pf5xeFs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ByGih+AL5/a1Kqc5tQKDKYp3u6bwvXhiyraoEB4RTFFAveyxA6bW/HQPq/HFBeoR2
	 0GB/0CCA9d/hkkDgQPNFOexiHP3y4QlvM5mx65SBfZeECpCBLYYVDvkSOxaYeHnDtX
	 uNGAvDtciER3e5l94nj59HwX/zxGMirDc8cRAVMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C53C4F804E3;
	Mon, 21 Jun 2021 20:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7463BF804E0; Mon, 21 Jun 2021 20:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6860FF80245
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6860FF80245
Received: by m.b4.vu (Postfix, from userid 1000)
 id E044A61E287C; Tue, 22 Jun 2021 03:39:13 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:13 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 02/31] ALSA: usb-audio: scarlett2: Update initialisation
 sequence
Message-ID: <6e5c4fedb74b813872f6a4b7fba30b6c471fa63a.1624294591.git.g@b4.vu>
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

The old initialisation code only works with Gen 2 devices. Replace it
with an initialisation sequence that works on both Gen 2 and Gen 3
devices.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 56 ++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 6b77582d8e3d..ed89e28548c8 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -453,10 +453,12 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 #define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
 
 /* Commands for sending/receiving requests/responses */
+#define SCARLETT2_USB_CMD_INIT 0
 #define SCARLETT2_USB_CMD_REQ  2
 #define SCARLETT2_USB_CMD_RESP 3
 
-#define SCARLETT2_USB_INIT_SEQ  0x00000000
+#define SCARLETT2_USB_INIT_1    0x00000000
+#define SCARLETT2_USB_INIT_2    0x00000002
 #define SCARLETT2_USB_GET_METER 0x00001001
 #define SCARLETT2_USB_GET_MIX   0x00002001
 #define SCARLETT2_USB_SET_MIX   0x00002002
@@ -650,14 +652,19 @@ static int scarlett2_usb(
 	if (err != resp_buf_size) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2 USB response result cmd %x was %d\n",
-			cmd, err);
+			"Scarlett Gen 2 USB response result cmd %x was %d "
+			"expected %d\n",
+			cmd, err, resp_buf_size);
 		err = -EINVAL;
 		goto unlock;
 	}
 
+	/* cmd/seq/size should match except when initialising
+	 * seq sent = 1, response = 0
+	 */
 	if (resp->cmd != req->cmd ||
-	    resp->seq != req->seq ||
+	    (resp->seq != req->seq &&
+		(le16_to_cpu(req->seq) != 1 || resp->seq != 0)) ||
 	    resp_size != le16_to_cpu(resp->size) ||
 	    resp->error ||
 	    resp->pad) {
@@ -675,7 +682,7 @@ static int scarlett2_usb(
 		goto unlock;
 	}
 
-	if (resp_size > 0)
+	if (resp_data && resp_size > 0)
 		memcpy(resp_data, resp->data, resp_size);
 
 unlock:
@@ -1924,13 +1931,12 @@ static int scarlett2_find_fc_interface(struct usb_device *dev,
 	return -EINVAL;
 }
 
-/* Initialise private data, sequence number, and get the USB data */
+/* Initialise private data */
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 				  const struct scarlett2_device_info *info)
 {
 	struct scarlett2_data *private =
 		kzalloc(sizeof(struct scarlett2_data), GFP_KERNEL);
-	int err;
 
 	if (!private)
 		return -ENOMEM;
@@ -1948,12 +1954,35 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
 
-	err = scarlett2_find_fc_interface(mixer->chip->dev, private);
+	return scarlett2_find_fc_interface(mixer->chip->dev, private);
+}
+
+/* Cargo cult proprietary initialisation sequence */
+static int scarlett2_usb_init(struct usb_mixer_interface *mixer)
+{
+	struct usb_device *dev = mixer->chip->dev;
+	struct scarlett2_data *private = mixer->private_data;
+	u8 buf[24];
+	int err;
+
+	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+
+	/* step 0 */
+	err = scarlett2_usb_rx(dev, private->bInterfaceNumber,
+			       SCARLETT2_USB_CMD_INIT, buf, sizeof(buf));
 	if (err < 0)
 		return err;
 
-	/* Initialise the sequence number used for the proprietary commands */
-	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_SEQ, NULL, 0, NULL, 0);
+	/* step 1 */
+	private->scarlett2_seq = 1;
+	err = scarlett2_usb(mixer, SCARLETT2_USB_INIT_1, NULL, 0, NULL, 0);
+	if (err < 0)
+		return err;
+
+	/* step 2 */
+	private->scarlett2_seq = 1;
+	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_2, NULL, 0, NULL, 84);
 }
 
 /* Read configuration from the interface on start */
@@ -2128,11 +2157,16 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 {
 	int err;
 
-	/* Initialise private data, sequence number, and get the USB data */
+	/* Initialise private data */
 	err = scarlett2_init_private(mixer, info);
 	if (err < 0)
 		return err;
 
+	/* Send proprietary USB initialisation sequence */
+	err = scarlett2_usb_init(mixer);
+	if (err < 0)
+		return err;
+
 	/* Read volume levels and controls from the interface */
 	err = scarlett2_read_configs(mixer);
 	if (err < 0)
-- 
2.31.1

