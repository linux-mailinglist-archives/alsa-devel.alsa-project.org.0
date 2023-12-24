Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E081DC1F
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:31:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15C2EA1;
	Sun, 24 Dec 2023 20:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15C2EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446260;
	bh=sm1marMdAu021M5/t7M9aqFIkf5fLIdmsWLdJVEejEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGhk1pzBVnpFpWPQlHPxI3wyR22/ZZNah/TrYtXFcHMILlbh4HWQ62uM8tbeHV188
	 ygp9ZSHYPAraHpD8KNeO8ZESjkp+CYtDTm+sAQvvKHSYTnHnKqxcWbSbS4p6SbUFI2
	 0PHlUQpG526khna8QkYn28ED0yHafhVSU15E5L3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF4AF805BD; Sun, 24 Dec 2023 20:30:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2555DF805B5;
	Sun, 24 Dec 2023 20:30:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA49FF80589; Sun, 24 Dec 2023 20:30:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2E0EF80537
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E0EF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=eRmUCfTF
Received: by m.b4.vu (Postfix, from userid 1000)
	id 9E2E0604B9CB; Mon, 25 Dec 2023 05:59:14 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 9E2E0604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446154; bh=AOH0L5pnCAa8PxWf1PuI2dpJVX3q5VQRkjTAe5+4AnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRmUCfTFv28QU4DKB7WBg8TyfSSGlFHSQEFa+VUZQtmpm3+qUt+U2XawiRvv3R/Cc
	 p5ResCpj1B5BJLScLzmOz7T8APF1NnhIEhF8ctvWO9PJBr+BXxbCP0Cui3/iI0HMIl
	 mkMUY0jUND6lvy7SM5fE0nSqw44TxAIgIenWMrLEtWUKn8UR6h3WpUn5HruD2dCHZA
	 tpouHX0f4skv8AUe6OroItLFRQ1KbWh7Uh+XSJEMIP1BitTeoeepl4qXyxP9GpP/v7
	 W8qJufwfHgsy+kw9UxFLr+VoSJyELugvQ5jRRSgmj+8CDG7rSLVZ5gx7vhspRnnurM
	 kULVmb4CdTWgA==
Date: Mon, 25 Dec 2023 05:59:14 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 16/23] ALSA: scarlett2: Split dim_mute_update from vol_updated
Message-ID: <bf63f48bcc68ae739bd9948c8ee2f87ee7af22a2.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: UDMX4FK4X7O326L2WZRSNUAWAXEZCSW6
X-Message-ID-Hash: UDMX4FK4X7O326L2WZRSNUAWAXEZCSW6
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDMX4FK4X7O326L2WZRSNUAWAXEZCSW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Scarlett Gen 2 and Gen 3 devices combine volume and dim/mute
notifications. The Scarlett 4i4 Gen 4 has volume change notification
but no dim/mute control so split dim_mute_update out from vol_update.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 63 ++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index b3f76476ce52..1393b7da436d 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -628,6 +628,7 @@ struct scarlett2_data {
 	u16 scarlett2_seq;
 	u8 sync_updated;
 	u8 vol_updated;
+	u8 dim_mute_updated;
 	u8 input_other_updated;
 	u8 monitor_other_updated;
 	u8 mux_updated;
@@ -2222,7 +2223,6 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	s16 vol;
 	int err, i;
-	int mute;
 
 	private->vol_updated = 0;
 
@@ -2238,22 +2238,9 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 	private->master_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
 				    0, SCARLETT2_VOLUME_BIAS);
 
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_DIM_MUTE,
-		SCARLETT2_DIM_MUTE_COUNT, private->dim_mute);
-	if (err < 0)
-		return err;
-
-	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
-		private->dim_mute[i] = !!private->dim_mute[i];
-
-	mute = private->dim_mute[SCARLETT2_BUTTON_MUTE];
-
 	for (i = 0; i < private->num_line_out; i++)
-		if (private->vol_sw_hw_switch[i]) {
+		if (private->vol_sw_hw_switch[i])
 			private->vol[i] = private->master_vol;
-			private->mute_switch[i] = mute;
-		}
 
 	return 0;
 }
@@ -2401,6 +2388,36 @@ static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 
 /*** Mute Switch Controls ***/
 
+static int scarlett2_update_dim_mute(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	int err, i;
+	u8 mute;
+
+	private->dim_mute_updated = 0;
+
+	if (!info->line_out_hw_vol)
+		return 0;
+
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_DIM_MUTE,
+		SCARLETT2_DIM_MUTE_COUNT, private->dim_mute);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
+		private->dim_mute[i] = !!private->dim_mute[i];
+
+	mute = private->dim_mute[SCARLETT2_BUTTON_MUTE];
+
+	for (i = 0; i < private->num_line_out; i++)
+		if (private->vol_sw_hw_switch[i])
+			private->mute_switch[i] = mute;
+
+	return 0;
+}
+
 static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *ucontrol)
 {
@@ -2417,8 +2434,8 @@ static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->vol_updated) {
-		err = scarlett2_update_volumes(mixer);
+	if (private->dim_mute_updated) {
+		err = scarlett2_update_dim_mute(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -3575,8 +3592,8 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 		goto unlock;
 	}
 
-	if (private->vol_updated) {
-		err = scarlett2_update_volumes(mixer);
+	if (private->dim_mute_updated) {
+		err = scarlett2_update_dim_mute(mixer);
 		if (err < 0)
 			goto unlock;
 	}
@@ -4582,6 +4599,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = scarlett2_update_dim_mute(mixer);
+	if (err < 0)
+		return err;
+
 	for (i = 0; i < private->num_mix_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
 		if (err < 0)
@@ -4633,11 +4654,11 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	private->vol_updated = 1;
-
 	if (!info->line_out_hw_vol)
 		return;
 
+	private->dim_mute_updated = 1;
+
 	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->dim_mute_ctls[i]->id);
-- 
2.43.0

