Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A335F5F9469
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2604F16E5;
	Mon, 10 Oct 2022 01:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2604F16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359759;
	bh=eDeBSiIKixe6Te7PK8P1+e7QjUkM90YCHsUhK7/2fM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXEzBTcCjiKXVh8VXrbcZU4h2lDXIuN9fgQ86EX7LWNU/E5mSo6FIXi5uPpsbhXHa
	 dW20L0saa+vexd3BeM77LMlMikm4q5j8kIf6i3GmIFP5QdRHWukoKYpOWxjn+9JgLH
	 whK2pf8xoKgCzjgRuvkHPmvZ+uiX8jHRIAGKhnvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB63FF8052E;
	Mon, 10 Oct 2022 01:55:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3055F80517; Mon, 10 Oct 2022 01:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63B80F80137
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B80F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z+UbWONW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26F6460D17;
 Sun,  9 Oct 2022 23:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607AC433C1;
 Sun,  9 Oct 2022 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359699;
 bh=eDeBSiIKixe6Te7PK8P1+e7QjUkM90YCHsUhK7/2fM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+UbWONWr3ti3tfeUJQCm7qtIwU6HLWrXt74+Zzvi7RviEgAEFkZyMBLqSM8iIDPE
 v4myRFsSgF4tGckxGlDm5o2e9guEa9CetA1fh3M2OeExJXK4O+23M2GSiiXcYUwLe0
 yJBx3XTPQ5ei3d2qWRXRpd0iCnFJBzhBbMDqfF7ORAWoJ81DR/N28ii6uFsGQ19HSO
 NufFhy9GH1jF/W+IAlot+0JrPjGdMZ0KMtAZp1LoKRV8LIDxKvgCGTsmj+GHLHaCFi
 yDhOF76B3eEjcsFXz5i0BLx5yvikjdO9LrEOzt6SBG2IMbXSmIfsO+jzkuVCQM85rD
 fJ3ryWECN1QhA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 11/25] ALSA: usb-audio: Register card at the last
 interface
Date: Sun,  9 Oct 2022 19:54:11 -0400
Message-Id: <20221009235426.1231313-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 connerknoxpublic@gmail.com, Takashi Iwai <tiwai@suse.de>,
 gregkh@linuxfoundation.org, sdoregor@sdore.me, cyrozap@gmail.com,
 tiwai@suse.com, giun7a@gmail.com, bp@suse.de
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 6392dcd1d0c7034ccf630ec55fc9e5810ecadf3b ]

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

Link: https://lore.kernel.org/r/20220904161247.16461-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/card.c     | 32 +++++++++++++++++++++++++-------
 sound/usb/quirks.c   | 42 ------------------------------------------
 sound/usb/quirks.h   |  2 --
 sound/usb/usbaudio.h |  1 +
 4 files changed, 26 insertions(+), 51 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 713b84d8d42f..207c212eabde 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -689,7 +689,7 @@ static bool get_alias_id(struct usb_device *dev, unsigned int *id)
 	return false;
 }
 
-static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
+static int check_delayed_register_option(struct snd_usb_audio *chip)
 {
 	int i;
 	unsigned int id, inum;
@@ -698,14 +698,31 @@ static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
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
@@ -812,6 +829,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 			err = -ENODEV;
 			goto __error;
 		}
+		find_last_interface(chip);
 	}
 
 	if (chip->num_interfaces >= MAX_CARD_INTERFACES) {
@@ -861,11 +879,11 @@ static int usb_audio_probe(struct usb_interface *intf,
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
index 194c75c45628..eadac586bcc8 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2030,48 +2030,6 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
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
index 044cd7ab27cb..39c3c61a7e49 100644
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
2.35.1

