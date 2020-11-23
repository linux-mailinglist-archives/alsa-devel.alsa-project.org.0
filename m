Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F352C020D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCCD31711;
	Mon, 23 Nov 2020 10:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCCD31711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122587;
	bh=qYIwPJbAZ7pdo/HRQSB8WMU5/Gap9p3jhRZH3q/G3jQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AF7w4GUZZOCDcFxPGDGlnlf6aLtV+4kNmvETMI+PXf3wBmDHGHb7zetvUHt3vrhrK
	 h51Cf6yU5OsNu/3Y0FtJoqEEeX2xsGtYo2N8HwV/npNuRhSQe1cbEhlEO3w9xmW9iO
	 zpT1oP59LbS4zzhSXeHBL7YNbgWx93LgyTlqlpNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210B0F80614;
	Mon, 23 Nov 2020 09:55:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69D7EF8055C; Mon, 23 Nov 2020 09:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD0DF804F3
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD0DF804F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E75F3AF82;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 36/41] ALSA: usb-audio: Quirk for BOSS GT-001
Date: Mon, 23 Nov 2020 09:53:42 +0100
Message-Id: <20201123085347.19667-37-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

The capture stream of BOSS GT-001 seems always requiring to be tied
with the playback stream.  OTOH, the playback stream of this device
doesn't seem working in the implicit fb mode, per se, since the
playback must be running before the capture stream.

This patch tries to address the points above:
- Avoid the implicit fb mode for the playback
- Set up a fake sync EP for the capture stream with the hard-coded
  playback stream using the implicit fb mode

Reported-by: Keith Milner <kamilner@superlative.org>
Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5953e22a72c5..676acc20595b 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -403,6 +403,9 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
 		/* BOSS Katana amplifiers do not need quirks */
 		return 0;
+	case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
+		/* BOSS GT-001 needs no implicit fb for playback */
+		return 0;
 	}
 
 	/* Generic UAC2 implicit feedback */
@@ -454,6 +457,30 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	return 1;
 }
 
+static int audioformat_capture_quirk(struct snd_usb_audio *chip,
+				     struct audioformat *fmt,
+				     struct usb_host_interface *alts)
+{
+	struct usb_device *dev = chip->dev;
+
+	switch (chip->usb_id) {
+	case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
+		if (!snd_usb_get_host_interface(chip, 0x01, 0x01))
+			return 0;
+		fmt->sync_ep = 0x0d;
+		fmt->sync_iface = 0x01;
+		fmt->sync_altsetting = 0x01;
+		fmt->sync_ep_idx = 0;
+		fmt->implicit_fb = 1;
+		dev_dbg(&dev->dev, "%d:%d: added fake capture sync sync_ep=%x, iface=%d, alt=%d\n",
+			fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
+			fmt->sync_altsetting);
+		return 1;
+	}
+	return 0;
+
+}
+
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt)
 {
@@ -474,6 +501,10 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 		err = audioformat_implicit_fb_quirk(chip, fmt, alts);
 		if (err > 0)
 			return 0;
+	} else {
+		err = audioformat_capture_quirk(chip, fmt, alts);
+		if (err > 0)
+			return 0;
 	}
 
 	if (altsd->bNumEndpoints < 2)
-- 
2.16.4

