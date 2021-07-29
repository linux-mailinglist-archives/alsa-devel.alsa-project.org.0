Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B03DA0D2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8061EFB;
	Thu, 29 Jul 2021 12:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8061EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553225;
	bh=NPEyA0M58vyCGBeWH9B8Ps5Ua3cIkFTwhV7npUQARK0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDuGFP5TVC4rXOPLCrhbO9L1S0jrJ/oAxUdUgu7YHpN5yJuhd8qUtgnlymdrsCf98
	 7w+UXV9MR/sgVRwt+5A1CITWs0c+Py9X+wz+6Hr0yLAp8xwFkN2awr4vRxt/CJt15y
	 lLrAW5pBXRZnxncq1mmLl4z9bp2WdeFzB9YGvsN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0725AF804FE;
	Thu, 29 Jul 2021 12:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DF5F804EB; Thu, 29 Jul 2021 12:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3957EF804E3
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3957EF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="GGV91RLT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WDyQNEoq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DA31E201F7
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhN0DbNRWd2VasLVwMtDWhZfkk8+LfUY9GCycNjc7sc=;
 b=GGV91RLTZBAvhb1aUd3j0ukXA+f7KaDj6bEXwpTZH/snCUj6He6nm+4+U9qdofhR0TRzr7
 VHDgXabWn2V7mRZ6rf70SL8bH3YHmyHRLsqlTGSeC4vOo9EB+m/2K0QONX2wM7Rg6sUu9r
 sOoxcXLfV0Oq+yXuSM9FWFTGeIoF6EE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhN0DbNRWd2VasLVwMtDWhZfkk8+LfUY9GCycNjc7sc=;
 b=WDyQNEoqkGe4iKkqFOw+h29j7wJYOsmOu4QIuPXX0o1iAgVCRpVxvs/3dIw/qbR2y+iduq
 y6D6L8HXVJl9H+AQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 23F26A3BE2;
 Thu, 29 Jul 2021 07:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/15] ALSA: usb-audio: Move control message delay quirk into
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:54 +0200
Message-Id: <20210729073855.19043-9-tiwai@suse.de>
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

We apply some delay for the control messages on certain devices as a
workaround, and this can be moved into the quirk_flags as well.
Currently there are three different delay periods (1ms, 5ms and 20ms),
so three different quirk bits are assigned for them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c   | 85 ++++++++++++++------------------------------
 sound/usb/usbaudio.h |  9 +++++
 2 files changed, 35 insertions(+), 59 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a0986e079a66..a6b78cbf5089 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1593,57 +1593,14 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 {
 	struct snd_usb_audio *chip = dev_get_drvdata(&dev->dev);
 
-	if (!chip)
+	if (!chip || (requesttype & USB_TYPE_MASK) != USB_TYPE_CLASS)
 		return;
-	/*
-	 * "Playback Design" products need a 20ms delay after each
-	 * class compliant request
-	 */
-	if (USB_ID_VENDOR(chip->usb_id) == 0x23ba &&
-	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
-		msleep(20);
 
-	/*
-	 * "TEAC Corp." products need a 20ms delay after each
-	 * class compliant request
-	 */
-	if (USB_ID_VENDOR(chip->usb_id) == 0x0644 &&
-	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
+	if (chip->quirk_flags & QUIRK_FLAG_CTL_MSG_DELAY)
 		msleep(20);
-
-	/* ITF-USB DSD based DACs functionality need a delay
-	 * after each class compliant request
-	 */
-	if ((chip->quirk_flags & QUIRK_FLAG_ITF_USB_DSD_DAC)
-	    && (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
-		msleep(20);
-
-	/*
-	 * Plantronics headsets (C320, C320-M, etc) need a delay to avoid
-	 * random microhpone failures.
-	 */
-	if (USB_ID_VENDOR(chip->usb_id) == 0x047f &&
-	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
-		msleep(20);
-
-	/* Zoom R16/24, many Logitech(at least H650e/H570e/BCC950),
-	 * Jabra 550a, Kingston HyperX needs a tiny delay here,
-	 * otherwise requests like get/set frequency return
-	 * as failed despite actually succeeding.
-	 */
-	if ((chip->usb_id == USB_ID(0x1686, 0x00dd) ||
-	     USB_ID_VENDOR(chip->usb_id) == 0x046d  || /* Logitech */
-	     chip->usb_id == USB_ID(0x0b0e, 0x0349) ||
-	     chip->usb_id == USB_ID(0x0951, 0x16ad)) &&
-	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
+	else if (chip->quirk_flags & QUIRK_FLAG_CTL_MSG_DELAY_1M)
 		usleep_range(1000, 2000);
-
-	/*
-	 * Samsung USBC Headset (AKG) need a tiny delay after each
-	 * class compliant request. (Model number: AAM625R or AAM627R)
-	 */
-	if (chip->usb_id == USB_ID(0x04e8, 0xa051) &&
-	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
+	else if (chip->quirk_flags & QUIRK_FLAG_CTL_MSG_DELAY_5M)
 		usleep_range(5000, 6000);
 }
 
@@ -1868,11 +1825,11 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
-		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR),
+		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR | QUIRK_FLAG_CTL_MSG_DELAY_5M),
 	DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
@@ -1884,31 +1841,35 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x3005, /* Marantz HD-DAC1 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x3006, /* Marantz SA-14S1 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
 		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
-		   QUIRK_FLAG_TX_LENGTH),
+		   QUIRK_FLAG_TX_LENGTH | QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
-		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
@@ -1953,10 +1914,16 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	VENDOR_FLG(0x046d, /* Logitech */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	VENDOR_FLG(0x047f, /* Plantronics */
-		   QUIRK_FLAG_GET_SAMPLE_RATE),
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY),
+	VENDOR_FLG(0x0644, /* TEAC Corp. */
+		   QUIRK_FLAG_CTL_MSG_DELAY),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	VENDOR_FLG(0x23ba, /* Playback Design */
+		   QUIRK_FLAG_CTL_MSG_DELAY),
 
 	{} /* terminator */
 };
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 7b41a95eadee..69fa81150f36 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -147,6 +147,12 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_ITF_USB_DSD_DAC:
  *  Indicates the device is for ITF-USB DSD based DACs that need a vendor cmd
  *  to switch between PCM and native DSD mode
+ * QUIRK_FLAG_CTL_MSG_DELAY:
+ *  Add a delay of 20ms at each control message handling
+ * QUIRK_FLAG_CTL_MSG_DELAY_1M:
+ *  Add a delay of 1-2ms at each control message handling
+ * QUIRK_FLAG_CTL_MSG_DELAY_5M:
+ *  Add a delay of 5-6ms at each control message handling
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -157,5 +163,8 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_SKIP_CLOCK_SELECTOR	(1U << 5)
 #define QUIRK_FLAG_IGNORE_CLOCK_SOURCE	(1U << 6)
 #define QUIRK_FLAG_ITF_USB_DSD_DAC	(1U << 7)
+#define QUIRK_FLAG_CTL_MSG_DELAY	(1U << 8)
+#define QUIRK_FLAG_CTL_MSG_DELAY_1M	(1U << 9)
+#define QUIRK_FLAG_CTL_MSG_DELAY_5M	(1U << 10)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

