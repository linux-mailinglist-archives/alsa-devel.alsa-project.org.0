Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6123DA0D0
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3AC61EE0;
	Thu, 29 Jul 2021 12:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3AC61EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553174;
	bh=OVJgOzJ1Mw4yKKIjaFl2q3Q0i1CRxHxb/BIZfOM+QjE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ilLxNbNB5/Skm24EeIMIqkEKdqdZ/8PEzYxSuaxdvOQIHWtp1Y0xTdYKPsZ25R9rM
	 n/XiJ5cBce4eUzxY55zznQ3F71taYK97UV77q0CNOWnl37UOElBkdLMm/+E6IuaJj0
	 ZL6DPNwGKqBqd4h04sK9f7iWE7XQivW3yUXnzuGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F013F804E6;
	Thu, 29 Jul 2021 12:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C97E6F804E2; Thu, 29 Jul 2021 12:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE99CF8026C
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE99CF8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="NTE6ZczE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="elHdeRis"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EFA0C2241D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmoquDlo8NYMC7YhLGMYjSSvXsNRVWUPj10nzY1aZ8E=;
 b=NTE6ZczESmaJSI0eVb3efHwyOJ1F+L2L0kWPsTCFCK8DGHFa3GtQ/TKoHPTViKWczFHKax
 dL8lMT89Bf6pcc0cIPNhiqLR1GWDIeEG52A76LTXjcctnf2iSyy8nEOb+f46mXqxUbH6Ls
 oLdA4MdIxkfdYD3OdCbDUTwQHEzbmOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmoquDlo8NYMC7YhLGMYjSSvXsNRVWUPj10nzY1aZ8E=;
 b=elHdeRisfNSR5hjMtjGKXYmmrTJMj8rYNFq6sAGFV0DouIT0o5/FHXyWG6JV6EvWuw8GOK
 XkVpyyWDeJIEotAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C8274A3BD0;
 Thu, 29 Jul 2021 07:38:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/15] ALSA: usb-audio: Introduce quirk_flags field
Date: Thu, 29 Jul 2021 09:38:47 +0200
Message-Id: <20210729073855.19043-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210729073855.19043-1-tiwai@suse.de>
References: <20210729073855.19043-1-tiwai@suse.de>
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

As more and more device-specific workarounds came up and gathered in
various places, it becomes harder to manage.  Now it's time to clean
up and collect workarounds more consistently and make them more easily
applicable.

This patch is the first step for that: a new field quirk_flags is
introduced in snd_usb_audio struct to contain the bit flags for
various device-specific quirks.  Those are separate one from the
quirks in quirks-table.h; the quirks-table.h entries are for more
intrusive stuff that needs the descriptor override, while the new
quirk_flags is for easier ones that are tied with the vendor:product
IDs.

In this patch, as the first example, we convert the list of devices
and vendors to ignore GET_SAMPLE_RATE, formerly defined in
snb_usb_get_sample_rate_quirk().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     |  3 +-
 sound/usb/clock.c    |  2 +-
 sound/usb/quirks.c   | 98 ++++++++++++++++++++++++++++++--------------
 sound/usb/quirks.h   |  4 +-
 sound/usb/usbaudio.h | 11 +++++
 5 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index a1f8c3a026f5..8fee90b9776e 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -610,6 +610,8 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	INIT_LIST_HEAD(&chip->midi_list);
 	INIT_LIST_HEAD(&chip->mixer_list);
 
+	snd_usb_init_quirk_flags(chip);
+
 	card->private_free = snd_usb_audio_free;
 
 	strcpy(card->driver, "USB-Audio");
@@ -789,7 +791,6 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (!chip->ctrl_intf)
 		chip->ctrl_intf = alts;
 
-	chip->txfr_quirk = 0;
 	err = 1; /* continue */
 	if (quirk && quirk->ifnum != QUIRK_NO_INTERFACE) {
 		/* need some special handlings */
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 14456f61539e..90b03ae03574 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -426,7 +426,7 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 
 	/* Don't check the sample rate for devices which we know don't
 	 * support reading */
-	if (snd_usb_get_sample_rate_quirk(chip))
+	if (chip->quirk_flags & QUIRK_FLAG_GET_SAMPLE_RATE)
 		return 0;
 	/* the firmware is likely buggy, don't repeat to fail too many times */
 	if (chip->sample_rate_read_error > 2)
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 326d1b0ea5e6..9c3d234c8b32 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1518,36 +1518,6 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	}
 }
 
-bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
-{
-	/* devices which do not support reading the sample rate. */
-	switch (chip->usb_id) {
-	case USB_ID(0x041e, 0x4080): /* Creative Live Cam VF0610 */
-	case USB_ID(0x04d8, 0xfeea): /* Benchmark DAC1 Pre */
-	case USB_ID(0x0556, 0x0014): /* Phoenix Audio TMX320VC */
-	case USB_ID(0x05a3, 0x9420): /* ELP HD USB Camera */
-	case USB_ID(0x05a7, 0x1020): /* Bose Companion 5 */
-	case USB_ID(0x074d, 0x3553): /* Outlaw RR2150 (Micronas UAC3553B) */
-	case USB_ID(0x1395, 0x740a): /* Sennheiser DECT */
-	case USB_ID(0x1901, 0x0191): /* GE B850V3 CP2114 audio interface */
-	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
-	case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
-	case USB_ID(0x413c, 0xa506): /* Dell AE515 sound bar */
-	case USB_ID(0x046d, 0x084c): /* Logitech ConferenceCam Connect */
-		return true;
-	}
-
-	/* devices of these vendors don't support reading rate, either */
-	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x045e: /* MS Lifecam */
-	case 0x047f: /* Plantronics */
-	case 0x1de7: /* Phoenix Audio */
-		return true;
-	}
-
-	return false;
-}
-
 /* ITF-USB DSD based DACs need a vendor cmd to switch
  * between PCM and native DSD mode
  */
@@ -1916,3 +1886,71 @@ bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface)
 	/* Register as normal */
 	return false;
 }
+
+/*
+ * driver behavior quirk flags
+ */
+struct usb_audio_quirk_flags_table {
+	u32 id;
+	u32 flags;
+};
+
+#define DEVICE_FLG(vid, pid, _flags) \
+	{ .id = USB_ID(vid, pid), .flags = (_flags) }
+#define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
+
+static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
+	/* Device matches */
+	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x05a7, 0x1020, /* Bose Companion 5 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+
+	/* Vendor matches */
+	VENDOR_FLG(0x045e, /* MS Lifecam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	VENDOR_FLG(0x047f, /* Plantronics */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	VENDOR_FLG(0x1de7, /* Phoenix Audio */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
+
+	{} /* terminator */
+};
+
+void snd_usb_init_quirk_flags(struct snd_usb_audio *chip)
+{
+	const struct usb_audio_quirk_flags_table *p;
+
+	for (p = quirk_flags_table; p->id; p++) {
+		if (chip->usb_id == p->id ||
+		    (!USB_ID_PRODUCT(p->id) &&
+		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
+			usb_audio_dbg(chip,
+				      "Set quirk_flags 0x%x for device %04x:%04x\n",
+				      p->flags, USB_ID_VENDOR(chip->usb_id),
+				      USB_ID_PRODUCT(chip->usb_id));
+			chip->quirk_flags |= p->flags;
+			return;
+		}
+	}
+}
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 67a02303c820..0a49e074ae6a 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -28,8 +28,6 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      const struct audioformat *fmt);
 
-bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip);
-
 int snd_usb_is_big_endian_format(struct snd_usb_audio *chip,
 				 const struct audioformat *fp);
 
@@ -53,4 +51,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 
 bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface);
 
+void snd_usb_init_quirk_flags(struct snd_usb_audio *chip);
+
 #endif /* __USBAUDIO_QUIRKS_H */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 538831cbd925..37195ac26ac9 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -34,6 +34,7 @@ struct snd_usb_audio {
 	atomic_t shutdown;
 	atomic_t usage_count;
 	wait_queue_head_t shutdown_wait;
+	unsigned int quirk_flags;
 	unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
 	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
@@ -129,4 +130,14 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip);
 extern bool snd_usb_use_vmalloc;
 extern bool snd_usb_skip_validation;
 
+/*
+ * Driver behavior quirk flags, stored in chip->quirk_flags
+ *
+ * QUIRK_FLAG_GET_SAMPLE_RATE:
+ *  Skip reading sample rate for devices, as some devices behave inconsistently
+ *  or return error
+ */
+
+#define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
+
 #endif /* __USBAUDIO_H */
-- 
2.26.2

