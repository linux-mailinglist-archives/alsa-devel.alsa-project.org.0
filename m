Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E83DA0D5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DDA1F1B;
	Thu, 29 Jul 2021 12:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DDA1F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553281;
	bh=CPdtfVZzMRAvmQYpSuaKuyyE2E2wFXHlVwp26yEMrMk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7p+BVLNN23K7ScTjXvRts4lu+bfoAtjYfoKdgB0Gf3O/SjoJ1e59FhFnNQGWf0Co
	 tIHerwWzZ/lIcH2s7PPlwfBCY+L0vP2TxxOGxCPakwB3KHQ9+C+Bub2cCgYUmWdVMs
	 6EKjzJJqJiix+scvn5AAihvwkywdstUJsDn8VhPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A1DF8051B;
	Thu, 29 Jul 2021 12:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 046E9F8051C; Thu, 29 Jul 2021 12:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0B1FF800EB
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B1FF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="lO2vmRXI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="L7m3E6ZI"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E3A1020200
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2h/i9Q0NX6D3h7H924Js3Wb8qtbOzcG3hjGZezJDeg=;
 b=lO2vmRXIZZyzwWJ5RpGGryOdWQB7+xbG/2qFYRM1MGWQO65gGtY0XBte3IcRwH2n8dlUv2
 Iuo9z7KEG3jaCsDewuigUjooMuII7RegFtfEmPozRjBzbcwDcfRsaP/XeLyXcLOTBWJa0s
 PfCHeH16j1qRlj5cFZPRy+EFYq9XsI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2h/i9Q0NX6D3h7H924Js3Wb8qtbOzcG3hjGZezJDeg=;
 b=L7m3E6ZIkpv9EYE//4cASmY4MfU+dHiPHtdkWO/zBdBPupBfiQV+DZrzH0b7gLSOgCkrbb
 k50y7us7zQ8++2DQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 15F19A3BE1;
 Thu, 29 Jul 2021 07:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/15] ALSA: usb-audio: Move ITF-USB DSD quirk handling into
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:53 +0200
Message-Id: <20210729073855.19043-8-tiwai@suse.de>
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

The devices with ITF-USB DSD type are listed in another function, and
this can be integrated into the quirk_flags easily.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c   | 41 +++++++++++++++++++----------------------
 sound/usb/usbaudio.h |  4 ++++
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a9d8bde416ce..a0986e079a66 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1501,32 +1501,13 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	}
 }
 
-/* ITF-USB DSD based DACs need a vendor cmd to switch
- * between PCM and native DSD mode
- */
-static bool is_itf_usb_dsd_dac(unsigned int id)
-{
-	switch (id) {
-	case USB_ID(0x154e, 0x1002): /* Denon DCD-1500RE */
-	case USB_ID(0x154e, 0x1003): /* Denon DA-300USB */
-	case USB_ID(0x154e, 0x3005): /* Marantz HD-DAC1 */
-	case USB_ID(0x154e, 0x3006): /* Marantz SA-14S1 */
-	case USB_ID(0x1852, 0x5065): /* Luxman DA-06 */
-	case USB_ID(0x0644, 0x8043): /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
-	case USB_ID(0x0644, 0x8044): /* Esoteric D-05X */
-	case USB_ID(0x0644, 0x804a): /* TEAC UD-301 */
-		return true;
-	}
-	return false;
-}
-
 int snd_usb_select_mode_quirk(struct snd_usb_audio *chip,
 			      const struct audioformat *fmt)
 {
 	struct usb_device *dev = chip->dev;
 	int err;
 
-	if (is_itf_usb_dsd_dac(chip->usb_id)) {
+	if (chip->quirk_flags & QUIRK_FLAG_ITF_USB_DSD_DAC) {
 		/* First switch to alt set 0, otherwise the mode switch cmd
 		 * will not be accepted by the DAC
 		 */
@@ -1633,7 +1614,7 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 	/* ITF-USB DSD based DACs functionality need a delay
 	 * after each class compliant request
 	 */
-	if (is_itf_usb_dsd_dac(chip->usb_id)
+	if ((chip->quirk_flags & QUIRK_FLAG_ITF_USB_DSD_DAC)
 	    && (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
 		msleep(20);
 
@@ -1749,7 +1730,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	}
 
 	/* ITF-USB DSD based DACs */
-	if (is_itf_usb_dsd_dac(chip->usb_id)) {
+	if (chip->quirk_flags & QUIRK_FLAG_ITF_USB_DSD_DAC) {
 		iface = usb_ifnum_to_if(chip->dev, fp->iface);
 
 		/* Altsetting 2 support native DSD if the num of altsets is
@@ -1902,16 +1883,32 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+	DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+	DEVICE_FLG(0x154e, 0x3005, /* Marantz HD-DAC1 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
+	DEVICE_FLG(0x154e, 0x3006, /* Marantz SA-14S1 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
 	DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
 		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
 		   QUIRK_FLAG_TX_LENGTH),
+	DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
+		   QUIRK_FLAG_ITF_USB_DSD_DAC),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 82073ebeac5b..7b41a95eadee 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -144,6 +144,9 @@ extern bool snd_usb_skip_validation;
  *  Skip clock selector setup; the device may reset to invalid state
  * QUIRK_FLAG_IGNORE_CLOCK_SOURCE:
  *  Ignore errors from clock source search; i.e. hardcoded clock
+ * QUIRK_FLAG_ITF_USB_DSD_DAC:
+ *  Indicates the device is for ITF-USB DSD based DACs that need a vendor cmd
+ *  to switch between PCM and native DSD mode
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -153,5 +156,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_PLAYBACK_FIRST	(1U << 4)
 #define QUIRK_FLAG_SKIP_CLOCK_SELECTOR	(1U << 5)
 #define QUIRK_FLAG_IGNORE_CLOCK_SOURCE	(1U << 6)
+#define QUIRK_FLAG_ITF_USB_DSD_DAC	(1U << 7)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

