Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDE3DA0CE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4727E1F02;
	Thu, 29 Jul 2021 12:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4727E1F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553139;
	bh=f//4o136kUrwnXRZTFvft8xLbsJtCuXV8CYoiC2vDb8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrauEUXjpId7D8YkNKLZ1feWPmSUkjJYxVEV7BV+Oa7vu3v9ucgHJBOxD90dJ8/eT
	 ZrmV6cz1/Iw+sRp6hN1yKK8XbYN8+B7/vPnvljCCShKsPQdcz36s4pA6+jdv4ToILM
	 7EIA2W8xkqbwU5K4Ek1smGZm+nvoUPTMwtzl0XI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DDBF804E5;
	Thu, 29 Jul 2021 12:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B96CAF804DA; Thu, 29 Jul 2021 12:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F433F800E9
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F433F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="eBKqgcZ8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MXWHup5u"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0CA332242E
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiWHj6PT9MmsvhcRwoya0UOe9XHHlm6C8/9qXpbvTaI=;
 b=eBKqgcZ8b5tYp4DGSHRiIy+59fhR6WeoprMB3TjfjKWVLEffO85dLa2yu9r259gOhiSO3+
 8oPSMymDC/3Lo5ZhP7OF4Ka3DZOTqoLXFOJ5X2oTRErAbS24U3LtX6pVzw4BVuG6UP0sIi
 H6o2+b3ltvVOPYXjWwgsueK8J0oOQoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiWHj6PT9MmsvhcRwoya0UOe9XHHlm6C8/9qXpbvTaI=;
 b=MXWHup5uhYJsltnuUYooCgwY7IjMaQM63A8PTxuB4+pYVaR9WcfnqZlloImFAja5hmAQ4L
 ImnkTFM1S/Gv7DDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 122E0A3BDD;
 Thu, 29 Jul 2021 07:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/15] ALSA: usb-audio: Move clock setup quirk into quirk_flags
Date: Thu, 29 Jul 2021 09:38:52 +0200
Message-Id: <20210729073855.19043-7-tiwai@suse.de>
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

There are a couple of device-specific quirks in the clock setup code,
and those can be moved gracefully to quirk_flags, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c    | 13 ++++---------
 sound/usb/quirks.c   |  4 ++++
 sound/usb/usbaudio.h |  6 ++++++
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 90b03ae03574..81d5ce07d548 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -324,11 +324,8 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 					      sources[ret - 1],
 					      visited, validate);
 		if (ret > 0) {
-			/*
-			 * For Samsung USBC Headset (AKG), setting clock selector again
-			 * will result in incorrect default clock setting problems
-			 */
-			if (chip->usb_id == USB_ID(0x04e8, 0xa051))
+			/* Skip setting clock selector again for some devices */
+			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
@@ -541,10 +538,8 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		 */
 		clock = snd_usb_clock_find_source(chip, fmt, false);
 
-		/* Denon DN-X1600 hardcoded
-		 * Sample rate seems to be set on the hardware itself
-		 */
-		if (chip->usb_id == USB_ID(0x154e, 0x500e))
+		/* Hardcoded sample rates */
+		if (chip->quirk_flags & QUIRK_FLAG_IGNORE_CLOCK_SOURCE)
 			return 0;
 
 		if (clock < 0)
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9f295cb8c3c5..a9d8bde416ce 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1890,6 +1890,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
+		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR),
 	DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
@@ -1906,6 +1908,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
+		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
 		   QUIRK_FLAG_TX_LENGTH),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 8de2b6c51dad..82073ebeac5b 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -140,6 +140,10 @@ extern bool snd_usb_skip_validation;
  *  Add length specifier to transfers
  * QUIRK_FLAG_PLAYBACK_FIRST:
  *  Start playback stream at first even in implement feedback mode
+ * QUIRK_FLAG_SKIP_CLOCK_SELECTOR:
+ *  Skip clock selector setup; the device may reset to invalid state
+ * QUIRK_FLAG_IGNORE_CLOCK_SOURCE:
+ *  Ignore errors from clock source search; i.e. hardcoded clock
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -147,5 +151,7 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_ALIGN_TRANSFER	(1U << 2)
 #define QUIRK_FLAG_TX_LENGTH		(1U << 3)
 #define QUIRK_FLAG_PLAYBACK_FIRST	(1U << 4)
+#define QUIRK_FLAG_SKIP_CLOCK_SELECTOR	(1U << 5)
+#define QUIRK_FLAG_IGNORE_CLOCK_SOURCE	(1U << 6)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

