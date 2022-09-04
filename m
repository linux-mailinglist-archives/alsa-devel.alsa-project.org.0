Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD75AC553
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Sep 2022 18:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFE8164E;
	Sun,  4 Sep 2022 18:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFE8164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662308040;
	bh=LaXxNgUf8JYB+2Z8UOcOgQFFscr+x4xbq5wcLP+Epi4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e1dPBAaZtOrc0xlGRGRals8CHEBepIhMzbi92LIVekLo8rVioGxLrFjhiP5TgFi2R
	 Q5omat+pNhcLVnL4JyjGSeiACguG2mqHTUViFYhBAgSuGYqM6gJ4xnivIBAc75S9us
	 ThLSwz8m+LR9yVVQT7ig9m13vE2dy9oFuDITD8Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1900F8016E;
	Sun,  4 Sep 2022 18:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71A77F8013D; Sun,  4 Sep 2022 18:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5707F800A7
 for <alsa-devel@alsa-project.org>; Sun,  4 Sep 2022 18:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5707F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AfWn+Ace"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="oWtryVbL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 120725F8EE;
 Sun,  4 Sep 2022 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662307970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=J5ixi6JfGN5uyh8AI3Ss2kzBeSqSfwLuVETa8RsnFMU=;
 b=AfWn+Acev966863dlU5dY7Wm0I4B259finuNuK3yZEJF8Q0fn10Ph6QmIGqvpHhpazjOHG
 681j42sDBG7lIv6ppj7gZqCvk/sG6XhwKnKvClz0qNPkf2KSq22dxSOGZNudt8B62p2U9q
 mPTTU29WEPwiCvQuKr7WWeLSSmFFpCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662307970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=J5ixi6JfGN5uyh8AI3Ss2kzBeSqSfwLuVETa8RsnFMU=;
 b=oWtryVbLZy08EocUoQzRpnNXRY8ovFctY23ZqqbwAJ3hN3qTpKz9CT8lk6hmqNqRC2qo3K
 hZMh7Kx5gK/DdODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBDB61348C;
 Sun,  4 Sep 2022 16:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fB/xOIHOFGN+bQAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 04 Sep 2022 16:12:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Register card at the last interface
Date: Sun,  4 Sep 2022 18:12:47 +0200
Message-Id: <20220904161247.16461-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

The USB-audio driver matches per interface, and as default, it
registers the card instance at the very first instance.  This can be a
problem for the devices that have multiple interfaces to be probed, as
the udev rule isn't applied properly for the later appearing
interfaces.  Although we introduced the delayed_register option and
the quirks for covering those shortcomings, it's nothing but a
workaround for specific devices.

This patch is an another attempt to fix the problem in a more generic
way.  Now the driver checks the whole USB device descriptor at the
very first time when an interface is attached to a sound card.  It
looks at each matching interface in the descriptor and remembers the
last matching one.  The snd_card_register() is invoked only when this
last interface is probed.

After this change, the quirks for the delayed registration become
superfluous, hence they are removed along with the patch.  OTOH, the
delayed_register option is still kept, as it might be useful for some
corner cases (e.g. a special driver overtakes the interface probe from
the standard driver, and the last interface probe may miss).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 32 +++++++++++++++++++++++++-------
 sound/usb/quirks.c   | 42 ------------------------------------------
 sound/usb/quirks.h   |  2 --
 sound/usb/usbaudio.h |  1 +
 4 files changed, 26 insertions(+), 51 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 706d249a9ad6..3aea241435fb 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -690,7 +690,7 @@ static bool get_alias_id(struct usb_device *dev, unsigned int *id)
 	return false;
 }
 
-static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
+static int check_delayed_register_option(struct snd_usb_audio *chip)
 {
 	int i;
 	unsigned int id, inum;
@@ -699,14 +699,31 @@ static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
 		if (delayed_register[i] &&
 		    sscanf(delayed_register[i], "%x:%x", &id, &inum) == 2 &&
 		    id == chip->usb_id)
-			return iface < inum;
+			return inum;
 	}
 
-	return false;
+	return -1;
 }
 
 static const struct usb_device_id usb_audio_ids[]; /* defined below */
 
+/* look for the last interface that matches with our ids and remember it */
+static void find_last_interface(struct snd_usb_audio *chip)
+{
+	struct usb_host_config *config = chip->dev->actconfig;
+	struct usb_interface *intf;
+	int i;
+
+	if (!config)
+		return;
+	for (i = 0; i < config->desc.bNumInterfaces; i++) {
+		intf = config->interface[i];
+		if (usb_match_id(intf, usb_audio_ids))
+			chip->last_iface = intf->altsetting[0].desc.bInterfaceNumber;
+	}
+	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
+}
+
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
 get_alias_quirk(struct usb_device *dev, unsigned int id)
@@ -813,6 +830,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 			err = -ENODEV;
 			goto __error;
 		}
+		find_last_interface(chip);
 	}
 
 	if (chip->num_interfaces >= MAX_CARD_INTERFACES) {
@@ -862,11 +880,11 @@ static int usb_audio_probe(struct usb_interface *intf,
 		chip->need_delayed_register = false; /* clear again */
 	}
 
-	/* we are allowed to call snd_card_register() many times, but first
-	 * check to see if a device needs to skip it or do anything special
+	/* register card if we reach to the last interface or to the specified
+	 * one given via option
 	 */
-	if (!snd_usb_registration_quirk(chip, ifnum) &&
-	    !check_delayed_register_option(chip, ifnum)) {
+	if (check_delayed_register_option(chip) == ifnum ||
+	    chip->last_iface == ifnum) {
 		err = snd_card_register(chip->card);
 		if (err < 0)
 			goto __error;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5b4d8f5eade2..8c3b0be909eb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1728,48 +1728,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 	}
 }
 
-/*
- * registration quirk:
- * the registration is skipped if a device matches with the given ID,
- * unless the interface reaches to the defined one.  This is for delaying
- * the registration until the last known interface, so that the card and
- * devices appear at the same time.
- */
-
-struct registration_quirk {
-	unsigned int usb_id;	/* composed via USB_ID() */
-	unsigned int interface;	/* the interface to trigger register */
-};
-
-#define REG_QUIRK_ENTRY(vendor, product, iface) \
-	{ .usb_id = USB_ID(vendor, product), .interface = (iface) }
-
-static const struct registration_quirk registration_quirks[] = {
-	REG_QUIRK_ENTRY(0x0951, 0x16d8, 2),	/* Kingston HyperX AMP */
-	REG_QUIRK_ENTRY(0x0951, 0x16ed, 2),	/* Kingston HyperX Cloud Alpha S */
-	REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),	/* Kingston HyperX Cloud Flight S */
-	REG_QUIRK_ENTRY(0x0ecb, 0x1f46, 2),	/* JBL Quantum 600 */
-	REG_QUIRK_ENTRY(0x0ecb, 0x1f47, 2),	/* JBL Quantum 800 */
-	REG_QUIRK_ENTRY(0x0ecb, 0x1f4c, 2),	/* JBL Quantum 400 */
-	REG_QUIRK_ENTRY(0x0ecb, 0x2039, 2),	/* JBL Quantum 400 */
-	REG_QUIRK_ENTRY(0x0ecb, 0x203c, 2),	/* JBL Quantum 600 */
-	REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),	/* JBL Quantum 800 */
-	{ 0 }					/* terminator */
-};
-
-/* return true if skipping registration */
-bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface)
-{
-	const struct registration_quirk *q;
-
-	for (q = registration_quirks; q->usb_id; q++)
-		if (chip->usb_id == q->usb_id)
-			return iface < q->interface;
-
-	/* Register as normal */
-	return false;
-}
-
 /*
  * driver behavior quirk flags
  */
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 31abb7cb01a5..f9bfd5ac7bab 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -48,8 +48,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  struct audioformat *fp,
 					  int stream);
 
-bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface);
-
 void snd_usb_init_quirk_flags(struct snd_usb_audio *chip);
 
 #endif /* __USBAUDIO_QUIRKS_H */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index ffbb4b0d09a0..2c6575029b1c 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -37,6 +37,7 @@ struct snd_usb_audio {
 	unsigned int quirk_flags;
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	int num_interfaces;
+	int last_iface;
 	int num_suspended_intf;
 	int sample_rate_read_error;
 
-- 
2.35.3

