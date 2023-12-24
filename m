Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A138681DC20
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A146E7F;
	Sun, 24 Dec 2023 20:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A146E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446276;
	bh=qqMSLPksOosY7hz6ylmI0nSjy9lcyXy8vXUTPbiT++U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMkbFQAlc5KjEF4tbewKb+kfuqHH1qwbzN7uBGP+xI/EFd4hnQvvim8u/mC0k4aLH
	 nc3KfXp5HkVaBkQP4jX3CqeCJjQvkEgdADg188PLj6R5mLeKaBiyX2ukRyopcCL5b0
	 q9WrH907P6wbgqLxM3ICqe4/85TYifugpPCJepx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05147F805E4; Sun, 24 Dec 2023 20:30:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C16F805A1;
	Sun, 24 Dec 2023 20:30:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74323F805D3; Sun, 24 Dec 2023 20:30:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E0E6F8015B
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0E6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=POx7HiuA
Received: by m.b4.vu (Postfix, from userid 1000)
	id 23645604B9CB; Mon, 25 Dec 2023 05:59:26 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 23645604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446166; bh=uTs3ihStZMMCJ2YFywuDKABp6F9xZHmw0jxxTY1iht8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POx7HiuANHmIwooO5y+IDgC/15gZPq3IaoJrzAgiguqiPx0BntN//nLSEbEhsRJrr
	 PhCNt50XUJAOd7NEJgRMZA2NznD69yjqqseSX0x7v3i14MUD5iCNKMW/X8sf/v6h+o
	 Bm+g9MKDqU/U0JjYuNVPl1SMyMb3Z2AERu0Is3Q+jm+I/UPPGShvCSDk/RSZhUJOr8
	 yeelQh86EN+rgp0jumoJNtdYJ2oAtXuDR9+A7dbXbw/YouCCwuXU6dIDkaEw8fmwLX
	 7zz1NyAaHiDtAstiItEAfu776hpeZR7U2OUas9rbXAqn6i/qONIOhyJHluxpYB4Oy/
	 YrTG88JMjRhJQ==
Date: Mon, 25 Dec 2023 05:59:26 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 17/23] ALSA: scarlett2: Remove line_out_hw_vol device info
 entry
Message-ID: <307c4f8d6d2e034f3e386b51d72a39d77c8a9fce.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: GVGA4MC5J7MTAQ77UG2RFITK76WCFVCX
X-Message-ID-Hash: GVGA4MC5J7MTAQ77UG2RFITK76WCFVCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVGA4MC5J7MTAQ77UG2RFITK76WCFVCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By splitting config set gen2 into gen2a/b (for 6i6/18i8 vs 18i20), and
gen3b into gen3b/c (for 4i4/8i6 vs 18i8/18i20), we can use
scarlett2_has_config_item() instead of the per-device line_out_hw_vol.

As Gen 4 has a master volume control but no SW/HW switches, check for
both SCARLETT2_CONFIG_MASTER_VOLUME and SCARLETT2_CONFIG_SW_HW_SWITCH
as needed, even though for Gen 2 and Gen 3 the former implies the
latter.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 145 ++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 49 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1393b7da436d..e8a93fd339f7 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -321,8 +321,31 @@ struct scarlett2_config_set {
 	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
 };
 
-/* Gen 2 devices: 6i6, 18i8, 18i20 */
-static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
+/* Gen 2 devices without SW/HW volume switch: 6i6, 18i8 */
+
+static const struct scarlett2_config_set scarlett2_config_set_gen2a = {
+	.notifications = scarlett2_notifications,
+	.items = {
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
+
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
+
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x8d, .size = 8, .activate = 6 },
+	}
+};
+
+/* Gen 2 devices with SW/HW volume switch: 18i20 */
+
+static const struct scarlett2_config_set scarlett2_config_set_gen2b = {
 	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
@@ -375,8 +398,41 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
 	}
 };
 
-/* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
+/* Gen 3 devices without SW/HW volume switch: 4i4, 8i6 */
 static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
+	.notifications = scarlett2_notifications,
+	.items = {
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
+
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
+
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x8c, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x95, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x9c, .size = 1, .activate = 8 },
+
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x9d, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+			.offset = 0x9e, .size = 8, .activate = 6 },
+	}
+};
+
+/* Gen 3 devices with SW/HW volume switch: 18i8, 18i20 */
+static const struct scarlett2_config_set scarlett2_config_set_gen3c = {
 	.notifications = scarlett2_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_DIM_MUTE] = {
@@ -540,9 +596,6 @@ struct scarlett2_device_info {
 	/* which set of configuration parameters the device uses */
 	const struct scarlett2_config_set *config_set;
 
-	/* line out hw volume is sw controlled */
-	u8 line_out_hw_vol;
-
 	/* support for main/alt speaker switching */
 	u8 has_speaker_switching;
 
@@ -672,7 +725,7 @@ struct scarlett2_data {
 /*** Model-specific data ***/
 
 static const struct scarlett2_device_info s6i6_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2,
+	.config_set = &scarlett2_config_set_gen2a,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -722,7 +775,7 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2,
+	.config_set = &scarlett2_config_set_gen2a,
 	.level_input_count = 2,
 	.pad_input_count = 4,
 
@@ -775,8 +828,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen2_info = {
-	.config_set = &scarlett2_config_set_gen2,
-	.line_out_hw_vol = 1,
+	.config_set = &scarlett2_config_set_gen2b,
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -959,8 +1011,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3b,
-	.line_out_hw_vol = 1,
+	.config_set = &scarlett2_config_set_gen3c,
 	.has_speaker_switching = 1,
 	.level_input_count = 2,
 	.pad_input_count = 4,
@@ -1039,8 +1090,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.config_set = &scarlett2_config_set_gen3b,
-	.line_out_hw_vol = 1,
+	.config_set = &scarlett2_config_set_gen3c,
 	.has_speaker_switching = 1,
 	.has_talkback = 1,
 	.level_input_count = 2,
@@ -1111,7 +1161,6 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 
 static const struct scarlett2_device_info clarett_2pre_info = {
 	.config_set = &scarlett2_config_set_clarett,
-	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 2,
 
@@ -1159,7 +1208,6 @@ static const struct scarlett2_device_info clarett_2pre_info = {
 
 static const struct scarlett2_device_info clarett_4pre_info = {
 	.config_set = &scarlett2_config_set_clarett,
-	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 4,
 
@@ -1212,7 +1260,6 @@ static const struct scarlett2_device_info clarett_4pre_info = {
 
 static const struct scarlett2_device_info clarett_8pre_info = {
 	.config_set = &scarlett2_config_set_clarett,
-	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 8,
 
@@ -2220,27 +2267,28 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	s16 vol;
 	int err, i;
 
 	private->vol_updated = 0;
 
-	if (!info->line_out_hw_vol)
-		return 0;
-
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_MASTER_VOLUME,
-		1, &vol);
-	if (err < 0)
-		return err;
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_MASTER_VOLUME)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_MASTER_VOLUME,
+			1, &vol);
+		if (err < 0)
+			return err;
 
-	private->master_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
-				    0, SCARLETT2_VOLUME_BIAS);
+		private->master_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
+					    0, SCARLETT2_VOLUME_BIAS);
 
-	for (i = 0; i < private->num_line_out; i++)
-		if (private->vol_sw_hw_switch[i])
-			private->vol[i] = private->master_vol;
+		if (scarlett2_has_config_item(private,
+					      SCARLETT2_CONFIG_SW_HW_SWITCH))
+			for (i = 0; i < private->num_line_out; i++)
+				if (private->vol_sw_hw_switch[i])
+					private->vol[i] = private->master_vol;
+	}
 
 	return 0;
 }
@@ -2391,13 +2439,12 @@ static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 static int scarlett2_update_dim_mute(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 	u8 mute;
 
 	private->dim_mute_updated = 0;
 
-	if (!info->line_out_hw_vol)
+	if (!scarlett2_has_config_item(private, SCARLETT2_CONFIG_SW_HW_SWITCH))
 		return 0;
 
 	err = scarlett2_usb_get_config(
@@ -3669,7 +3716,8 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
 	/* Add R/O HW volume control */
-	if (info->line_out_hw_vol) {
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_MASTER_VOLUME)) {
 		snprintf(s, sizeof(s), "Master HW Playback Volume");
 		err = scarlett2_add_new_ctl(mixer,
 					    &scarlett2_master_volume_ctl,
@@ -3708,14 +3756,16 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 
-		/* Make the fader and mute controls read-only if the
-		 * SW/HW switch is set to HW
-		 */
-		if (private->vol_sw_hw_switch[index])
-			scarlett2_vol_ctl_set_writable(mixer, i, 0);
-
 		/* SW/HW Switch */
-		if (info->line_out_hw_vol) {
+		if (scarlett2_has_config_item(private,
+					      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
+
+			/* Make the fader and mute controls read-only if the
+			 * SW/HW switch is set to HW
+			 */
+			if (private->vol_sw_hw_switch[index])
+				scarlett2_vol_ctl_set_writable(mixer, i, 0);
+
 			snprintf(s, sizeof(s),
 				 "Line Out %02d Volume Control Playback Enum",
 				 i + 1);
@@ -3735,7 +3785,7 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 	}
 
 	/* Add dim/mute controls */
-	if (info->line_out_hw_vol)
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_DIM_MUTE))
 		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++) {
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_dim_mute_ctl,
@@ -4518,7 +4568,6 @@ static int scarlett2_get_flash_segment_nums(struct usb_mixer_interface *mixer)
 static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	int err, i;
 	s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
@@ -4583,7 +4632,8 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			!!private->mute_switch[i];
 
 	/* read SW/HW switches */
-	if (info->line_out_hw_vol) {
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
 		err = scarlett2_usb_get_config(
 			mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
 			private->num_line_out, &private->vol_sw_hw_switch);
@@ -4628,11 +4678,9 @@ static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	/* if line_out_hw_vol is 0, there are no controls to update */
-	if (!info->line_out_hw_vol)
+	if (!scarlett2_has_config_item(private, SCARLETT2_CONFIG_SW_HW_SWITCH))
 		return;
 
 	private->vol_updated = 1;
@@ -4651,10 +4699,9 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	int i;
 
-	if (!info->line_out_hw_vol)
+	if (!scarlett2_has_config_item(private, SCARLETT2_CONFIG_SW_HW_SWITCH))
 		return;
 
 	private->dim_mute_updated = 1;
-- 
2.43.0

