Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB141E1D56
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 10:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA4F1743;
	Tue, 26 May 2020 10:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA4F1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590481805;
	bh=NXmqFAeYMrTs3joMGA6w/bxPcdboCBqoUK0ya9bd+y8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dB4y28/FL5BrugfT9Uthe8nGf/XRDkLuDecfxvDJdXdlDl8v6QlS078d/AU8V0cIh
	 3qlOt0HEHiQK2HOsDgU+n+i7BCDHuEOsMmFZZZK8RmiuNltZNZXAgWsnKzBydDzXR5
	 Tfc1X7Fpp5EtsgH2U6uVI+99RiprdxveKDfrMLy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59096F8015C;
	Tue, 26 May 2020 10:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F46DF80150; Tue, 26 May 2020 10:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3CD6F80146
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 10:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3CD6F80146
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA9A9AB3D;
 Tue, 26 May 2020 08:28:14 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Quirks for Gigabyte TRX40 Aorus Master
 onboard audio
Date: Tue, 26 May 2020 10:28:10 +0200
Message-Id: <20200526082810.29506-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Linus Torvalds <torvalds@linux-foundation.org>
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

Gigabyte TRX40 Aorus Master is equipped with two USB-audio devices,
a Realtek ALC1220-VB codec (USB ID 0414:a001) and an ESS SABRE9218 DAC
(USB ID 0414:a000).  The latter serves solely for the headphone output
on the front panel while the former serves for the rest I/Os (mostly
for the I/Os in the rear panel but also including the front mic).

Both chips do work more or less with the unmodified USB-audio driver,
but there are a few glitches.  The ALC1220-VB returns an error for an
inquiry to some jacks, as already seen on other TRX40-based mobos.
However this machine has a slightly incompatible configuration, hence
the existing mapping cannot be used as is.

Meanwhile the ESS chip seems working without any quirk.  But since
both audio devices don't provide any specific names, both cards appear
as "USB-Audio", and it's quite confusing for users.

This patch is an attempt to overcome those issues:

- The specific mapping table for ALC1220-VB is provided, reducing the
  non-working nodes and renaming the badly chosen controls.
  The connector map isn't needed here unlike other TRX40 quirks.

- For both USB IDs (0414:a000 and 0414:a001), provide specific card
  name strings, so that user-space can identify more easily; and more
  importantly, UCM profile can be applied to each.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_maps.c   | 19 +++++++++++++++++++
 sound/usb/quirks-table.h | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index bfdc6ad52785..9af7aa93f6fa 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -397,6 +397,21 @@ static const struct usbmix_connector_map trx40_mobo_connector_map[] = {
 	{}
 };
 
+/* Rear panel + front mic on Gigabyte TRX40 Aorus Master with ALC1220-VB */
+static const struct usbmix_name_map aorus_master_alc1220vb_map[] = {
+	{ 17, NULL },			/* OT, IEC958?, disabled */
+	{ 19, NULL, 12 }, /* FU, Input Gain Pad - broken response, disabled */
+	{ 16, "Line Out" },		/* OT */
+	{ 22, "Line Out Playback" },	/* FU */
+	{ 7, "Line" },			/* IT */
+	{ 19, "Line Capture" },		/* FU */
+	{ 8, "Mic" },			/* IT */
+	{ 20, "Mic Capture" },		/* FU */
+	{ 9, "Front Mic" },		/* IT */
+	{ 21, "Front Mic Capture" },	/* FU */
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -526,6 +541,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x1b1c, 0x0a42),
 		.map = corsair_virtuoso_map,
 	},
+	{	/* Gigabyte TRX40 Aorus Master (rear panel + front mic) */
+		.id = USB_ID(0x0414, 0xa001),
+		.map = aorus_master_alc1220vb_map,
+	},
 	{	/* Gigabyte TRX40 Aorus Pro WiFi */
 		.id = USB_ID(0x0414, 0xa002),
 		.map = trx40_mobo_map,
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 6313c30f5c85..eb89902a83be 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3566,4 +3566,29 @@ ALC1220_VB_DESKTOP(0x0db0, 0x543d), /* MSI TRX40 */
 ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */
 #undef ALC1220_VB_DESKTOP
 
+/* Two entries for Gigabyte TRX40 Aorus Master:
+ * TRX40 Aorus Master has two USB-audio devices, one for the front headphone
+ * with ESS SABRE9218 DAC chip, while another for the rest I/O (the rear
+ * panel and the front mic) with Realtek ALC1220-VB.
+ * Here we provide two distinct names for making UCM profiles easier.
+ */
+{
+	USB_DEVICE(0x0414, 0xa000),
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.vendor_name = "Gigabyte",
+		.product_name = "Aorus Master Front Headphone",
+		.profile_name = "Gigabyte-Aorus-Master-Front-Headphone",
+		.ifnum = QUIRK_NO_INTERFACE
+	}
+},
+{
+	USB_DEVICE(0x0414, 0xa001),
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
+		.vendor_name = "Gigabyte",
+		.product_name = "Aorus Master Main Audio",
+		.profile_name = "Gigabyte-Aorus-Master-Main-Audio",
+		.ifnum = QUIRK_NO_INTERFACE
+	}
+},
+
 #undef USB_DEVICE_VENDOR_SPEC
-- 
2.16.4

