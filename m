Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC53DA0CD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0151EF3;
	Thu, 29 Jul 2021 12:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0151EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553124;
	bh=bxZBBWLc8LMiR3XtRkLZrfEtW3veVuOTwcp+pFwgP0k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rtinwIrxRpKq6iRRU/IWAO2nUaGJ4JX0Zvvad4Y5Os2cCwUduEf8B00j2jmMKoPt2
	 QIcKybsJRLXGKd0dpRhYhWEj5dfoHCD9PyB2T5nxMLQzwPujxU1G6lVZzefoLT3VsV
	 MjiRIXj/iUFxQKgYW9Layl6qyXYGVY+lHw/GSMPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 777F2F804DF;
	Thu, 29 Jul 2021 12:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 707FCF804DF; Thu, 29 Jul 2021 12:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C69F80258
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C69F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BsIGteJm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="++Gn/IxT"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1760622430
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YV2qSuA2rqJi8CGdklifxL91kR66oWZ50kxsTKTV5C8=;
 b=BsIGteJmVvrUxVXQcVBqyzqMEUTInXG3DL460e3RkoWhPtmDp/qcasr3gkokSEqUzRhD84
 y2vg7iiCHWs8rpPVzmYTEg6xsbgZvMNkYgXsPC8IFrRZZhXQCrtDqcp55RIrvUAiU76WNM
 q+A7JqrDB/w4cD51sQDkTaqqIAsgDQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YV2qSuA2rqJi8CGdklifxL91kR66oWZ50kxsTKTV5C8=;
 b=++Gn/IxTTMur55MRJM2HNDEE1VnZ2GLf04tUBy0ahFDxBNouAFh7k0/fAd2THgfwajjTjo
 Ye2Uf3tWcCRUTQAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E5A05A3BD7;
 Thu, 29 Jul 2021 07:38:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/15] ALSA: usb-audio: Move txfr_quirk handling to quirk_flags
Date: Thu, 29 Jul 2021 09:38:49 +0200
Message-Id: <20210729073855.19043-4-tiwai@suse.de>
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

The txfr_quirk field was meant for aligning the transfer, and it's set
for certain devices in quirks-table.h.  Now we can move that stuff
also to the new quirk_flags gracefully, and reduce the quirks-table.h
entries (that are exposed to module device table).

As the quirks-table.h entries are also with the name string override,
provide the corresponding entries to the usb_audio_names[] table,
too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         | 21 ++++++++++++++++
 sound/usb/quirks-table.h | 52 +---------------------------------------
 sound/usb/quirks.c       | 52 ++++++++++++++++------------------------
 sound/usb/stream.c       |  2 +-
 sound/usb/usbaudio.h     |  6 +++--
 5 files changed, 48 insertions(+), 85 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 5f5095890a29..8c32a784f1e4 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -378,6 +378,9 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 
 	DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
 
+	DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
+	DEVICE_NAME(0x05e1, 0x0480, "Hauppauge", "Woodbury"),
+
 	/* ASUS ROG Strix */
 	PROFILE_NAME(0x0b05, 0x1917,
 		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
@@ -406,6 +409,8 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 	PROFILE_NAME(0x0db0, 0x543d,
 		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
 
+	DEVICE_NAME(0x0fd9, 0x0008, "Hauppauge", "HVR-950Q"),
+
 	/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
 	DEVICE_NAME(0x103d, 0x0100, "Stanton", "ScratchAmp"),
 	DEVICE_NAME(0x103d, 0x0101, "Stanton", "ScratchAmp"),
@@ -424,6 +429,22 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 	PROFILE_NAME(0x26ce, 0x0a01,
 		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
 
+	DEVICE_NAME(0x2040, 0x7200, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7201, "Hauppauge", "HVR-950Q-MXL"),
+	DEVICE_NAME(0x2040, 0x7210, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7211, "Hauppauge", "HVR-950Q-MXL"),
+	DEVICE_NAME(0x2040, 0x7213, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7217, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x721b, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x721e, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x721f, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7240, "Hauppauge", "HVR-850"),
+	DEVICE_NAME(0x2040, 0x7260, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7280, "Hauppauge", "HVR-950Q"),
+	DEVICE_NAME(0x2040, 0x7281, "Hauppauge", "HVR-950Q-MXL"),
+	DEVICE_NAME(0x2040, 0x8200, "Hauppauge", "Woodbury"),
+
 	{ } /* terminator */
 };
 
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index d644b31c4c7f..b5e82363cf47 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2802,52 +2802,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
-/*
- * Auvitek au0828 devices with audio interface.
- * This should be kept in sync with drivers/media/usb/au0828/au0828-cards.c
- * Please notice that some drivers are DVB only, and don't need to be
- * here. That's the case, for example, of DVICO_FUSIONHDTV7.
- */
-
-#define AU0828_DEVICE(vid, pid, vname, pname) { \
-	USB_AUDIO_DEVICE(vid, pid), \
-	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) { \
-		.vendor_name = vname, \
-		.product_name = pname, \
-		.ifnum = QUIRK_ANY_INTERFACE, \
-		.type = QUIRK_AUDIO_ALIGN_TRANSFER, \
-	} \
-}
-
-AU0828_DEVICE(0x2040, 0x7200, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7240, "Hauppauge", "HVR-850"),
-AU0828_DEVICE(0x2040, 0x7210, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7217, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x721b, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x721e, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x721f, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7280, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x0fd9, 0x0008, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7201, "Hauppauge", "HVR-950Q-MXL"),
-AU0828_DEVICE(0x2040, 0x7211, "Hauppauge", "HVR-950Q-MXL"),
-AU0828_DEVICE(0x2040, 0x7281, "Hauppauge", "HVR-950Q-MXL"),
-AU0828_DEVICE(0x05e1, 0x0480, "Hauppauge", "Woodbury"),
-AU0828_DEVICE(0x2040, 0x8200, "Hauppauge", "Woodbury"),
-AU0828_DEVICE(0x2040, 0x7260, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7213, "Hauppauge", "HVR-950Q"),
-AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
-
-/* Syntek STK1160 */
-{
-	USB_AUDIO_DEVICE(0x05e1, 0x0408),
-	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
-		.vendor_name = "Syntek",
-		.product_name = "STK1160",
-		.ifnum = QUIRK_ANY_INTERFACE,
-		.type = QUIRK_AUDIO_ALIGN_TRANSFER
-	}
-},
-
 /* Digidesign Mbox */
 {
 	/* Thanks to Clemens Ladisch <clemens@ladisch.de> */
@@ -3810,7 +3764,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
  * MacroSilicon MS2109 based HDMI capture cards
  *
  * These claim 96kHz 1ch in the descriptors, but are actually 48kHz 2ch.
- * They also need QUIRK_AUDIO_ALIGN_TRANSFER, which makes one wonder if
+ * They also need QUIRK_FLAG_ALIGN_TRANSFER, which makes one wonder if
  * they pretend to be 96kHz mono as a workaround for stereo being broken
  * by that...
  *
@@ -3825,10 +3779,6 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		.ifnum = QUIRK_ANY_INTERFACE,
 		.type = QUIRK_COMPOSITE,
 		.data = &(const struct snd_usb_audio_quirk[]) {
-			{
-				.ifnum = 2,
-				.type = QUIRK_AUDIO_ALIGN_TRANSFER,
-			},
 			{
 				.ifnum = 2,
 				.type = QUIRK_AUDIO_STANDARD_MIXER,
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 798aec4298f4..5dce068f613a 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -75,19 +75,6 @@ static int ignore_interface_quirk(struct snd_usb_audio *chip,
 }
 
 
-/*
- * Allow alignment on audio sub-slot (channel samples) rather than
- * on audio slots (audio frames)
- */
-static int create_align_transfer_quirk(struct snd_usb_audio *chip,
-				       struct usb_interface *iface,
-				       struct usb_driver *driver,
-				       const struct snd_usb_audio_quirk *quirk)
-{
-	chip->txfr_quirk = 1;
-	return 1;	/* Continue with creating streams and mixer */
-}
-
 static int create_any_midi_quirk(struct snd_usb_audio *chip,
 				 struct usb_interface *intf,
 				 struct usb_driver *driver,
@@ -595,7 +582,6 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 		[QUIRK_AUDIO_STANDARD_INTERFACE] = create_standard_audio_quirk,
 		[QUIRK_AUDIO_FIXED_ENDPOINT] = create_fixed_stream_quirk,
 		[QUIRK_AUDIO_EDIROL_UAXX] = create_uaxx_quirk,
-		[QUIRK_AUDIO_ALIGN_TRANSFER] = create_align_transfer_quirk,
 		[QUIRK_AUDIO_STANDARD_MIXER] = create_standard_mixer_quirk,
 		[QUIRK_SETUP_DISABLE_AUTOSUSPEND] = setup_disable_autosuspend,
 	};
@@ -1913,52 +1899,56 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x05a7, 0x1020, /* Bose Companion 5 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x05e1, 0x0408, /* Syntek STK1160 */
+		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7210, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7211, /* Hauppauge HVR-950Q-MXL */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7213, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7217, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x721b, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x721e, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x721f, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7240, /* Hauppauge HVR-850 */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7260, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7270, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7280, /* Hauppauge HVR-950Q */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7281, /* Hauppauge HVR-950Q-MXL */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x8200, /* Hauppauge Woodbury */
-		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
+		   QUIRK_FLAG_ALIGN_TRANSFER),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ee9aa1dcf0d8..541ab19101eb 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -89,7 +89,7 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 	subs->stream = as;
 	subs->direction = stream;
 	subs->dev = as->chip->dev;
-	subs->txfr_quirk = as->chip->txfr_quirk;
+	subs->txfr_quirk = !!(as->chip->quirk_flags & QUIRK_FLAG_ALIGN_TRANSFER);
 	subs->tx_length_quirk = as->chip->tx_length_quirk;
 	subs->speed = snd_usb_get_speed(subs->dev);
 	subs->pkt_offset_adj = 0;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index ece244637798..170e96865061 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -35,7 +35,6 @@ struct snd_usb_audio {
 	atomic_t usage_count;
 	wait_queue_head_t shutdown_wait;
 	unsigned int quirk_flags;
-	unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
 	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	unsigned int playback_first:1;	/* for implicit fb: don't wait for the first capture URBs */
@@ -103,7 +102,6 @@ enum quirk_type {
 	QUIRK_AUDIO_STANDARD_INTERFACE,
 	QUIRK_AUDIO_FIXED_ENDPOINT,
 	QUIRK_AUDIO_EDIROL_UAXX,
-	QUIRK_AUDIO_ALIGN_TRANSFER,
 	QUIRK_AUDIO_STANDARD_MIXER,
 	QUIRK_SETUP_FMT_AFTER_RESUME,
 	QUIRK_SETUP_DISABLE_AUTOSUSPEND,
@@ -137,9 +135,13 @@ extern bool snd_usb_skip_validation;
  *  or return error
  * QUIRK_FLAG_SHARE_MEDIA_DEVICE:
  *  Create Media Controller API entries
+ * QUIRK_FLAG_ALIGN_TRANSFER:
+ *  Allow alignment on audio sub-slot (channel samples) rather than on audio
+ *  slots (audio frames)
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
 #define QUIRK_FLAG_SHARE_MEDIA_DEVICE	(1U << 1)
+#define QUIRK_FLAG_ALIGN_TRANSFER	(1U << 2)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

