Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A43413DA0F1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E981F45;
	Thu, 29 Jul 2021 12:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E981F45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553789;
	bh=eD8ohp1mUBOUrMSRMP93X1EkOkS5Skk1q0MftNP4qJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgPOuqBoA6X+6jyiaStgcjpzYchZjAk8pczdqm8nkx/T4mEiig8KCQaPrxRPt5r9A
	 ciWAMxNO6ohwpGwCvrxFd3YUKKl/Dk9CxOR06xKADbBPBOW1c3su5MUwB28VHM8SAH
	 hlryuxZ/aHwhjMtZ2zBwZVjaCISBTmFhbm9F7n1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F0DF804F1;
	Thu, 29 Jul 2021 12:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11745F804EB; Thu, 29 Jul 2021 12:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A5EF80276
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A5EF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="lLUNrhrO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="QV2Ng1S6"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5A4192249B
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zaCPKvDzrsxg9zHkA7ICYv1SsrsEwnl9u8raHhf/s8=;
 b=lLUNrhrOzVghRJXRqbleY3KfhuXD5Y25OUnAt6GmI/gQbW8LAnyvAyoiNBGX/awzuA9NfD
 7rPsN/Z3vXSotk8vq5DPlu0+UxQNw4RPBdiKFaqjxk4fmjIxuSZzt4RgVOb5eFD5yZUMQ7
 r/jqMp+E6QXRZdINvQcRvG83BHN7SeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zaCPKvDzrsxg9zHkA7ICYv1SsrsEwnl9u8raHhf/s8=;
 b=QV2Ng1S6b+mRk1SqZF20nt+qMpyMIRKnC3RvKD1SIZsLWZkzj7/8D/Pn7XZRNbnScMb8VH
 trGVlvJZrGbg+TCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E717BA3C83;
 Thu, 29 Jul 2021 07:44:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/15] ALSA: usb-audio: Move autosuspend quirk into quirk_flags
Date: Thu, 29 Jul 2021 09:44:00 +0200
Message-Id: <20210729074404.19728-2-tiwai@suse.de>
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

The auto-suspend suppression workaround for Lenovo machines are
handled in quirks-table.h.  Now it's more easier to handle with
quirk_flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         |  5 ++++-
 sound/usb/quirks-table.h | 17 -----------------
 sound/usb/quirks.c       | 14 ++++----------
 sound/usb/usbaudio.h     |  5 +++--
 4 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 8c32a784f1e4..d66a3788111c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -804,6 +804,9 @@ static int usb_audio_probe(struct usb_interface *intf,
 
 	dev_set_drvdata(&dev->dev, chip);
 
+	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
+		usb_disable_autosuspend(interface_to_usbdev(intf));
+
 	/*
 	 * For devices with more than one control interface, we assume the
 	 * first contains the audio controls. We might need a more specific
@@ -929,7 +932,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 		}
 	}
 
-	if (chip->quirk_type == QUIRK_SETUP_DISABLE_AUTOSUSPEND)
+	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
 		usb_enable_autosuspend(interface_to_usbdev(intf));
 
 	chip->num_interfaces--;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index b5e82363cf47..e03043f7dad3 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2730,23 +2730,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
-/* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
-{
-	USB_DEVICE(0x17aa, 0x1046),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.ifnum = QUIRK_ANY_INTERFACE,
-		.type = QUIRK_SETUP_DISABLE_AUTOSUSPEND
-	}
-},
-/* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
-{
-	USB_DEVICE(0x17aa, 0x104d),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.ifnum = QUIRK_ANY_INTERFACE,
-		.type = QUIRK_SETUP_DISABLE_AUTOSUSPEND
-	}
-},
-
 /* Native Instruments MK2 series */
 {
 	/* Komplete Audio 6 */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index dc667b8c92f2..1cffb87e5026 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -534,15 +534,6 @@ static int create_standard_mixer_quirk(struct snd_usb_audio *chip,
 	return snd_usb_create_mixer(chip, quirk->ifnum, 0);
 }
 
-static int setup_disable_autosuspend(struct snd_usb_audio *chip,
-				       struct usb_interface *iface,
-				       struct usb_driver *driver,
-				       const struct snd_usb_audio_quirk *quirk)
-{
-	usb_disable_autosuspend(interface_to_usbdev(iface));
-	return 1;	/* Continue with creating streams and mixer */
-}
-
 /*
  * audio-interface quirks
  *
@@ -580,7 +571,6 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 		[QUIRK_AUDIO_FIXED_ENDPOINT] = create_fixed_stream_quirk,
 		[QUIRK_AUDIO_EDIROL_UAXX] = create_uaxx_quirk,
 		[QUIRK_AUDIO_STANDARD_MIXER] = create_standard_mixer_quirk,
-		[QUIRK_SETUP_DISABLE_AUTOSUSPEND] = setup_disable_autosuspend,
 	};
 
 	if (quirk->type < QUIRK_TYPE_COUNT) {
@@ -1855,6 +1845,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
 		   QUIRK_FLAG_TX_LENGTH | QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x17aa, 0x1046, /* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
+		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
+	DEVICE_FLG(0x17aa, 0x104d, /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
+		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index ea0e3deb2a23..ce31d58f810f 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -101,8 +101,6 @@ enum quirk_type {
 	QUIRK_AUDIO_FIXED_ENDPOINT,
 	QUIRK_AUDIO_EDIROL_UAXX,
 	QUIRK_AUDIO_STANDARD_MIXER,
-	QUIRK_SETUP_FMT_AFTER_RESUME,
-	QUIRK_SETUP_DISABLE_AUTOSUSPEND,
 
 	QUIRK_TYPE_COUNT
 };
@@ -157,6 +155,8 @@ extern bool snd_usb_skip_validation;
  *  Add a delay of 50ms at each interface setup
  * QUIRK_FLAG_VALIDATE_RATES:
  *  Perform sample rate validations at probe
+ * QUIRK_FLAG_DISABLE_AUTOSUSPEND:
+ *  Disable runtime PM autosuspend
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -172,5 +172,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_CTL_MSG_DELAY_5M	(1U << 10)
 #define QUIRK_FLAG_IFACE_DELAY		(1U << 11)
 #define QUIRK_FLAG_VALIDATE_RATES	(1U << 12)
+#define QUIRK_FLAG_DISABLE_AUTOSUSPEND	(1U << 13)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

