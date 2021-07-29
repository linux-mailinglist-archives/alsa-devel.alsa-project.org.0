Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64303DA0D4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F7131F16;
	Thu, 29 Jul 2021 12:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F7131F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553263;
	bh=TpsC/UGv+Tu97+MrZbZzFZ3B+KbYQQOckiVCgy9W3Yo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcElMWB3QToFD61RhM2DD+DkhKcqiCYySmr6hUOB2ajl2X0sXw7PHiT1jQcOk7/cC
	 IXZCoFKd1sOcqA+ZdPu5Oe2BbcOx1DHrEp+dm1S8seUaZsaPpC7xweCiNTMe3Q8aUE
	 4akq0gjr3m15t4+fAt5O/i/OI5bNKSDfTLEDOIiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B95EEF80511;
	Thu, 29 Jul 2021 12:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F417F804E4; Thu, 29 Jul 2021 12:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431F8F804E4
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431F8F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="n6psEGQB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="dQbKe+ok"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DAE5C201F8
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsZNzEUe2qW2iFrWxSYwr1bm9Rp3F3nbichFbX7Oz50=;
 b=n6psEGQB2FhY6qboLs2pQSordFzXBsQo7utLGEhLsPcxbPFeHE5I7enYmtL3JAhclJv1iB
 j9WXRnXQrJlwjveSSrZ6APiI6+Bq8piq24+043575Ol77Nn01T9aXneBRuXUKvqts3DpG4
 61/FPjwPS5XX/KCkzOPOprZksAVasD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsZNzEUe2qW2iFrWxSYwr1bm9Rp3F3nbichFbX7Oz50=;
 b=dQbKe+okqrMtYvEAimK4LZvPqfU8gTLEXX2ybSeN94dhK6D5Kcp4uJ81FkNqfpCLYo/fOy
 oieuKRI29U/s2HAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 287D8A3BE6;
 Thu, 29 Jul 2021 07:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/15] ALSA: usb-audio: Move interface setup delay into
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:55 +0200
Message-Id: <20210729073855.19043-10-tiwai@suse.de>
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

Yet another delay is applied at switching the interface.  This can be
moved to quirk_flags, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c |  3 ++-
 sound/usb/quirks.c   | 29 ++++++++---------------------
 sound/usb/quirks.h   |  1 -
 sound/usb/usbaudio.h |  3 +++
 4 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 6016e97faf69..d33685874a6b 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -808,7 +808,8 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 		return err;
 	}
 
-	snd_usb_set_interface_quirk(chip);
+	if (chip->quirk_flags & QUIRK_FLAG_IFACE_DELAY)
+		msleep(50);
 	return 0;
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a6b78cbf5089..f47078209bcc 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1570,22 +1570,6 @@ void snd_usb_endpoint_start_quirk(struct snd_usb_endpoint *ep)
 		ep->tenor_fb_quirk = 1;
 }
 
-void snd_usb_set_interface_quirk(struct snd_usb_audio *chip)
-{
-	if (!chip)
-		return;
-	/*
-	 * "Playback Design" products need a 50ms delay after setting the
-	 * USB interface.
-	 */
-	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x23ba: /* Playback Design */
-	case 0x0644: /* TEAC Corp. */
-		msleep(50);
-		break;
-	}
-}
-
 /* quirk applied after snd_usb_ctl_msg(); not applied during boot quirks */
 void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 			   __u8 request, __u8 requesttype, __u16 value,
@@ -1841,11 +1825,14 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
+		   QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
@@ -1919,11 +1906,11 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	VENDOR_FLG(0x047f, /* Plantronics */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY),
 	VENDOR_FLG(0x0644, /* TEAC Corp. */
-		   QUIRK_FLAG_CTL_MSG_DELAY),
+		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	VENDOR_FLG(0x23ba, /* Playback Design */
-		   QUIRK_FLAG_CTL_MSG_DELAY),
+		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
 
 	{} /* terminator */
 };
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 0a49e074ae6a..31abb7cb01a5 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -33,7 +33,6 @@ int snd_usb_is_big_endian_format(struct snd_usb_audio *chip,
 
 void snd_usb_endpoint_start_quirk(struct snd_usb_endpoint *ep);
 
-void snd_usb_set_interface_quirk(struct snd_usb_audio *chip);
 void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 			   __u8 request, __u8 requesttype, __u16 value,
 			   __u16 index, void *data, __u16 size);
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 69fa81150f36..57b5dcf211d4 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -153,6 +153,8 @@ extern bool snd_usb_skip_validation;
  *  Add a delay of 1-2ms at each control message handling
  * QUIRK_FLAG_CTL_MSG_DELAY_5M:
  *  Add a delay of 5-6ms at each control message handling
+ * QUIRK_FLAG_IFACE_DELAY:
+ *  Add a delay of 50ms at each interface setup
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -166,5 +168,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_CTL_MSG_DELAY	(1U << 8)
 #define QUIRK_FLAG_CTL_MSG_DELAY_1M	(1U << 9)
 #define QUIRK_FLAG_CTL_MSG_DELAY_5M	(1U << 10)
+#define QUIRK_FLAG_IFACE_DELAY		(1U << 11)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

