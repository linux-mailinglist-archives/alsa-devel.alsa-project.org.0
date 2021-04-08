Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B95357DB5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 09:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC981661;
	Thu,  8 Apr 2021 09:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC981661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617868720;
	bh=1cZszZXUqLfAjLhlz1wdV+f2SVRfn5QYYlSKpn4xeak=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O4qRwbDpDlgu8/17ikACP68SLt+2hgg5OpREXq/rAPbnLku5UkAE3OaUtDoH8WQqJ
	 hL6yhcWKg5kzrQCcYcjrDddQDwAkyOpWqRyA0RzTmLnGEza7tpgmrWtnf5RO/1VqvT
	 M1a5Ebt0yAkq8GUiw/y16M9wXgMR1Np7n7HNuMu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C2AF800BD;
	Thu,  8 Apr 2021 09:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ECC8F8020B; Thu,  8 Apr 2021 09:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD99F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 09:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD99F800BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77BA8AF10
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 07:56:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Skip probe of UA-101 devices
Date: Thu,  8 Apr 2021 09:56:56 +0200
Message-Id: <20210408075656.30184-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

UA-101 device and co are supported by another driver, snd-ua101, but
the USB audio class driver (snd-usb-audio) catches all and this
resulted in the lack of functionality like missing MIDI devices.

This patch introduces a sort of deny-listing for those devices to just
return -ENODEV at probe in snd-usb-audio driver, so that it falls back
to the probe by snd-ua101.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212477
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         |  2 ++
 sound/usb/quirks-table.h | 21 +++++++++++++++++++++
 sound/usb/usbaudio.h     |  1 +
 3 files changed, 24 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index b6f4c0848e66..a482287a2d7f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -715,6 +715,8 @@ static int usb_audio_probe(struct usb_interface *intf,
 		quirk = get_alias_quirk(dev, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
+	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)
+		return -ENODEV;
 
 	err = snd_usb_apply_boot_quirk(dev, intf, quirk, id);
 	if (err < 0)
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 1165a5ac60f2..1f555d7b7752 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1674,6 +1674,27 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+
+/* UA101 and co are supported by another driver */
+{
+	USB_DEVICE(0x0582, 0x0044), /* UA-1000 high speed */
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_NODEV_INTERFACE
+	},
+},
+{
+	USB_DEVICE(0x0582, 0x007d), /* UA-101 high speed */
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_NODEV_INTERFACE
+	},
+},
+{
+	USB_DEVICE(0x0582, 0x008d), /* UA-101 full speed */
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_NODEV_INTERFACE
+	},
+},
+
 /* this catches most recent vendor-specific Roland devices */
 {
 	.match_flags = USB_DEVICE_ID_MATCH_VENDOR |
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 60b9dd7df6bb..7f91ec1c5646 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -75,6 +75,7 @@ struct snd_usb_audio {
  */
 
 /* special values for .ifnum */
+#define QUIRK_NODEV_INTERFACE		-3	/* return -ENODEV */
 #define QUIRK_NO_INTERFACE		-2
 #define QUIRK_ANY_INTERFACE		-1
 
-- 
2.26.2

