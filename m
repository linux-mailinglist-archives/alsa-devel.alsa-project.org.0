Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC43DA0ED
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77B81F1A;
	Thu, 29 Jul 2021 12:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77B81F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553722;
	bh=/3P3CzHSKh6y0h7WP0w5r3XogpSNeRsNXKUYj5Ar/WM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BikuGT6P4P9tIqdCJBiynjAgUOItu89CwpcTkUx580pyjeQsmJZpmkWFbZdeK+r+C
	 tRjM+b7nv8iOBT/EOGf0v5rbHX1pzSwDcYrhgRxhiMz/2MvfslHBWK2pWe3GSiQcvt
	 iBh7vKwULm+3qpa+K49Q3KGMZmt9nEHvz/QCMvUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5607CF8026C;
	Thu, 29 Jul 2021 12:13:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90AEDF804DA; Thu, 29 Jul 2021 12:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30B42F80258
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30B42F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MAcYUkCp"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X7FyihHA"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8F5B7224DC
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veiVB6mcS+AwMCxPIJMmloWIxN+vYD+3ripTPHLdfPA=;
 b=MAcYUkCpl/vRFPXfGjQn9i2dWQPZY50+B2A/kKyJ1Abmn7H/tYnM7TEuhmaYiYUB/irC7r
 LGQOxWEpwm0L+TvAahzoQ5PVzpa/e/+1h71bkVYtT51TFiTFCOrqTG+ez3uDkds7sY4o3J
 iKUUNtEXMlpzCvZmBXU63Gk+n8FgSto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veiVB6mcS+AwMCxPIJMmloWIxN+vYD+3ripTPHLdfPA=;
 b=X7FyihHAcdii0OoFjbTovOOSvqkHGsFr2sD3ZoCVP/S/mMIZIuqFZ+VoPA3S4B7VJlo1n3
 t/oMsgIZUShuEiDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 019BEA3C85;
 Thu, 29 Jul 2021 07:44:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/15] ALSA: usb-audio: Move ignore_ctl_error check into
 quirk_flags
Date: Thu, 29 Jul 2021 09:44:01 +0200
Message-Id: <20210729074404.19728-3-tiwai@suse.de>
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

The mixer code has a flag ignore_ctl_error for ignoring the errors
returned from the device wrt mixer accesses, and this is set from the
entries in mixer_maps.c, as well as ignore_ctl_error module option.
Those can be well integrated into the new quirk_flags field, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c       |  5 ++++-
 sound/usb/mixer.c      |  6 ++----
 sound/usb/mixer.h      |  3 +--
 sound/usb/mixer_maps.c | 22 ----------------------
 sound/usb/quirks.c     | 16 +++++++++++++++-
 sound/usb/usbaudio.h   |  3 +++
 6 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index d66a3788111c..9535df39c02f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -804,6 +804,9 @@ static int usb_audio_probe(struct usb_interface *intf,
 
 	dev_set_drvdata(&dev->dev, chip);
 
+	if (ignore_ctl_error)
+		chip->quirk_flags |= QUIRK_FLAG_IGNORE_CTL_ERROR;
+
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
 		usb_disable_autosuspend(interface_to_usbdev(intf));
 
@@ -828,7 +831,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 		err = snd_usb_create_streams(chip, ifnum);
 		if (err < 0)
 			goto __error;
-		err = snd_usb_create_mixer(chip, ifnum, ignore_ctl_error);
+		err = snd_usb_create_mixer(chip, ifnum);
 		if (err < 0)
 			goto __error;
 	}
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index f4cdaf1ba44a..6cb5f4942ae2 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3170,7 +3170,6 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 			state.map = map->map;
 			state.selector_map = map->selector_map;
 			mixer->connector_map = map->connector_map;
-			mixer->ignore_ctl_error |= map->ignore_ctl_error;
 			break;
 		}
 	}
@@ -3495,8 +3494,7 @@ static int snd_usb_mixer_status_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
-int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif,
-			 int ignore_error)
+int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 {
 	static const struct snd_device_ops dev_ops = {
 		.dev_free = snd_usb_mixer_dev_free
@@ -3510,7 +3508,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif,
 	if (!mixer)
 		return -ENOMEM;
 	mixer->chip = chip;
-	mixer->ignore_ctl_error = ignore_error;
+	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
 	mixer->id_elems = kcalloc(MAX_ID_ELEMS, sizeof(*mixer->id_elems),
 				  GFP_KERNEL);
 	if (!mixer->id_elems) {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index ea41e7a1f7bf..876bbc9a71ad 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -97,8 +97,7 @@ struct usb_mixer_elem_info {
 	void *private_data;
 };
 
-int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif,
-			 int ignore_error);
+int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif);
 void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer);
 
 void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid);
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index c5794e83fd80..55eea90ee993 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -28,7 +28,6 @@ struct usbmix_ctl_map {
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
 	const struct usbmix_connector_map *connector_map;
-	int ignore_ctl_error;
 };
 
 /*
@@ -432,7 +431,6 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		.id = USB_ID(0x041e, 0x3000),
 		.map = extigy_map,
-		.ignore_ctl_error = 1,
 	},
 	{
 		.id = USB_ID(0x041e, 0x3010),
@@ -452,28 +450,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.map = audigy2nx_map,
 		.selector_map = audigy2nx_selectors,
 	},
-	{	/* Logitech, Inc. QuickCam Pro for Notebooks */
-		.id = USB_ID(0x046d, 0x0991),
-		.ignore_ctl_error = 1,
-	},
-	{	/* Logitech, Inc. QuickCam E 3500 */
-		.id = USB_ID(0x046d, 0x09a4),
-		.ignore_ctl_error = 1,
-	},
 	{	/* Plantronics GameCom 780 */
 		.id = USB_ID(0x047f, 0xc010),
 		.map = gamecom780_map,
 	},
-	{
-		/* Hercules DJ Console (Windows Edition) */
-		.id = USB_ID(0x06f8, 0xb000),
-		.ignore_ctl_error = 1,
-	},
-	{
-		/* Hercules DJ Console (Macintosh Edition) */
-		.id = USB_ID(0x06f8, 0xd002),
-		.ignore_ctl_error = 1,
-	},
 	{
 		/* Hercules Gamesurround Muse Pocket LT
 		 * (USB 5.1 Channel Audio Adapter)
@@ -492,7 +472,6 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		.id = USB_ID(0x08bb, 0x2702),
 		.map = linex_map,
-		.ignore_ctl_error = 1,
 	},
 	{
 		.id = USB_ID(0x0a92, 0x0091),
@@ -517,7 +496,6 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		.id = USB_ID(0x13e5, 0x0001),
 		.map = scratch_live_map,
-		.ignore_ctl_error = 1,
 	},
 	{
 		.id = USB_ID(0x200c, 0x1018),
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1cffb87e5026..fce3a341adc8 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -531,7 +531,7 @@ static int create_standard_mixer_quirk(struct snd_usb_audio *chip,
 	if (quirk->ifnum < 0)
 		return 0;
 
-	return snd_usb_create_mixer(chip, quirk->ifnum, 0);
+	return snd_usb_create_mixer(chip, quirk->ifnum);
 }
 
 /*
@@ -1796,10 +1796,16 @@ struct usb_audio_quirk_flags_table {
 
 static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	/* Device matches */
+	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x046d, 0x09a4, /* Logitech QuickCam E 3500 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
@@ -1823,8 +1829,14 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
@@ -1833,6 +1845,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index ce31d58f810f..a152f5b08c7a 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -157,6 +157,8 @@ extern bool snd_usb_skip_validation;
  *  Perform sample rate validations at probe
  * QUIRK_FLAG_DISABLE_AUTOSUSPEND:
  *  Disable runtime PM autosuspend
+ * QUIRK_FLAG_IGNORE_CTL_ERROR:
+ *  Ignore errors for mixer access
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -173,5 +175,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_IFACE_DELAY		(1U << 11)
 #define QUIRK_FLAG_VALIDATE_RATES	(1U << 12)
 #define QUIRK_FLAG_DISABLE_AUTOSUSPEND	(1U << 13)
+#define QUIRK_FLAG_IGNORE_CTL_ERROR	(1U << 14)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

