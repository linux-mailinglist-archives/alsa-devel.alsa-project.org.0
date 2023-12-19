Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EE818EB5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479C2E79;
	Tue, 19 Dec 2023 18:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479C2E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703008291;
	bh=p8y5YuWQn76CrrZESdP5DcgEcd6hdv+lqNaD0jXCMLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bgtanrc4cLDOTNnUrKi8vAvphNq4gCp+Ycc51UQnyaQjmpKqPug1CNVg047hxRXT/
	 /v6FMyFUbPyhcHfc2mRlkQDdvZ/vUgqq4fTn+WXpBQzffTRow22KBM0lhPut0irSzs
	 Kvtij6kOXUD1Yu/pN36LebOIqUFGJZllu1nK0znU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83986F80579; Tue, 19 Dec 2023 18:51:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF63DF8057A;
	Tue, 19 Dec 2023 18:50:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10AEBF80425; Tue, 19 Dec 2023 18:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34B78F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34B78F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=PcoK4Bd4
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2DB47604B9CB; Wed, 20 Dec 2023 04:20:29 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2DB47604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703008229; bh=sN4jUcW5JJHf7WnupT3n8E5DZ78kAC8RXYMuPJPd1lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcoK4Bd46l8EQ7acWYWmb1jheHdchWqfFjHSa8NXp8RJ4/lDeNdQwPEYCVeynKfvR
	 ArGk+S2om4IixF8grZwYPklyn7JQcHlTasrnNIQDXdOrXOn9C+xRLBxzeM0xNVqlmk
	 NaBhe/27Jb+ljLkOa19qat9Dq02K2oxBwi3x+O+Of45FidQ/lwYib+Yr0JM2+ShdMH
	 W90odDy21LEB5fhSjJoAYutNfFc4LNpIfmiL6HiJqKeoYDO/QhWwSHSFih1ijQlO6N
	 LIMB0at8ofQlHUxtCfWqi6Zf4WH4ybQ9+V6xiirJjtFvK+yOfIeHEDST/H+XdAWOZS
	 Mjp9G9HP6i/8A==
Date: Wed, 20 Dec 2023 04:20:29 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 10/11] ALSA: scarlett2: Add ioctl commands to erase flash
 segments
Message-ID: <227409adb672f174bf3db211e9bda016fb4646ea.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: 52MSHAPKTMY6EC4KHUKNEPYGZBEA5SOF
X-Message-ID-Hash: 52MSHAPKTMY6EC4KHUKNEPYGZBEA5SOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52MSHAPKTMY6EC4KHUKNEPYGZBEA5SOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ioctls:
- SCARLETT2_IOCTL_SELECT_FLASH_SEGMENT
- SCARLETT2_IOCTL_ERASE_FLASH_SEGMENT
- SCARLETT2_IOCTL_GET_ERASE_PROGRESS

The settings or the firmware flash segment can be selected and then
erased (asynchronous operation), and the erase progress can be
monitored.

If the erase progress is not monitored, then subsequent hwdep
operations will block until the erase is complete.

Once the erase is started, ALSA controls that communicate with the
device will all return -EBUSY, and the device must be rebooted.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 include/uapi/sound/scarlett2.h |  20 ++
 sound/usb/mixer_scarlett2.c    | 428 ++++++++++++++++++++++++++++++++-
 2 files changed, 442 insertions(+), 6 deletions(-)

diff --git a/include/uapi/sound/scarlett2.h b/include/uapi/sound/scarlett2.h
index ec0b7da335ff..d0ff38ffa154 100644
--- a/include/uapi/sound/scarlett2.h
+++ b/include/uapi/sound/scarlett2.h
@@ -31,4 +31,24 @@
 /* Reboot */
 #define SCARLETT2_IOCTL_REBOOT _IO('S', 0x61)
 
+/* Select flash segment */
+#define SCARLETT2_SEGMENT_ID_SETTINGS 0
+#define SCARLETT2_SEGMENT_ID_FIRMWARE 1
+#define SCARLETT2_SEGMENT_ID_COUNT 2
+
+#define SCARLETT2_IOCTL_SELECT_FLASH_SEGMENT _IOW('S', 0x62, int)
+
+/* Erase selected flash segment */
+#define SCARLETT2_IOCTL_ERASE_FLASH_SEGMENT _IO('S', 0x63)
+
+/* Get selected flash segment erase progress
+ * 1 through to num_blocks, or 255 for complete
+ */
+struct scarlett2_flash_segment_erase_progress {
+	unsigned char progress;
+	unsigned char num_blocks;
+};
+#define SCARLETT2_IOCTL_GET_ERASE_PROGRESS \
+	_IOR('S', 0x64, struct scarlett2_flash_segment_erase_progress)
+
 #endif /* __UAPI_SOUND_SCARLETT2_H */
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index c0c96d7c19fb..ca09d0cd0cae 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -193,11 +193,6 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 	16345
 };
 
-/* Flash segments that we may manipulate */
-#define SCARLETT2_SEGMENT_ID_SETTINGS 0
-#define SCARLETT2_SEGMENT_ID_FIRMWARE 1
-#define SCARLETT2_SEGMENT_ID_COUNT 2
-
 /* Maximum number of analogue outputs */
 #define SCARLETT2_ANALOGUE_MAX 10
 
@@ -267,6 +262,13 @@ enum {
 	SCARLETT2_DIM_MUTE_COUNT = 2,
 };
 
+/* Flash Write State */
+enum {
+	SCARLETT2_FLASH_WRITE_STATE_IDLE = 0,
+	SCARLETT2_FLASH_WRITE_STATE_SELECTED = 1,
+	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2
+};
+
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
@@ -427,6 +429,9 @@ struct scarlett2_data {
 	struct usb_mixer_interface *mixer;
 	struct mutex usb_mutex; /* prevent sending concurrent USB requests */
 	struct mutex data_mutex; /* lock access to this data */
+	u8 hwdep_in_use;
+	u8 selected_flash_segment_id;
+	u8 flash_write_state;
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
 	const char *series_name;
@@ -2137,6 +2142,11 @@ static int scarlett2_sync_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->sync_updated) {
 		err = scarlett2_update_sync(mixer);
 		if (err < 0)
@@ -2233,6 +2243,11 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
@@ -2272,6 +2287,11 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
@@ -2295,6 +2315,11 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->vol[index];
 	val = ucontrol->value.integer.value[0];
 
@@ -2352,6 +2377,11 @@ static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
@@ -2375,6 +2405,11 @@ static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->mute_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2514,6 +2549,11 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->vol_sw_hw_switch[index];
 	val = !!ucontrol->value.enumerated.item[0];
 
@@ -2611,6 +2651,11 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->input_other_updated) {
 		err = scarlett2_update_input_other(mixer);
 		if (err < 0)
@@ -2636,6 +2681,11 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->level_switch[index];
 	val = !!ucontrol->value.enumerated.item[0];
 
@@ -2675,6 +2725,11 @@ static int scarlett2_pad_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->input_other_updated) {
 		err = scarlett2_update_input_other(mixer);
 		if (err < 0)
@@ -2700,6 +2755,11 @@ static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->pad_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2739,6 +2799,11 @@ static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->input_other_updated) {
 		err = scarlett2_update_input_other(mixer);
 		if (err < 0)
@@ -2763,6 +2828,11 @@ static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->air_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2802,6 +2872,11 @@ static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->input_other_updated) {
 		err = scarlett2_update_input_other(mixer);
 		if (err < 0)
@@ -2827,6 +2902,11 @@ static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->phantom_switch[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2878,6 +2958,11 @@ static int scarlett2_phantom_persistence_ctl_put(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->phantom_persistence;
 	val = !!ucontrol->value.integer.value[0];
 
@@ -2988,6 +3073,11 @@ static int scarlett2_direct_monitor_ctl_get(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->monitor_other_updated) {
 		err = scarlett2_update_monitor_other(mixer);
 		if (err < 0)
@@ -3012,6 +3102,11 @@ static int scarlett2_direct_monitor_ctl_put(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->direct_monitor_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
@@ -3101,6 +3196,11 @@ static int scarlett2_speaker_switch_enum_ctl_get(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->monitor_other_updated) {
 		err = scarlett2_update_monitor_other(mixer);
 		if (err < 0)
@@ -3181,6 +3281,11 @@ static int scarlett2_speaker_switch_enum_ctl_put(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->speaker_switching_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
@@ -3262,6 +3367,11 @@ static int scarlett2_talkback_enum_ctl_get(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->monitor_other_updated) {
 		err = scarlett2_update_monitor_other(mixer);
 		if (err < 0)
@@ -3285,6 +3395,11 @@ static int scarlett2_talkback_enum_ctl_put(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->talkback_switch;
 	val = min(ucontrol->value.enumerated.item[0], 2U);
 
@@ -3349,6 +3464,11 @@ static int scarlett2_talkback_map_ctl_put(
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->talkback_map[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -3423,6 +3543,11 @@ static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->vol_updated) {
 		err = scarlett2_update_volumes(mixer);
 		if (err < 0)
@@ -3451,6 +3576,11 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->dim_mute[index];
 	val = !!ucontrol->value.integer.value[0];
 
@@ -3695,6 +3825,11 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->mix[index];
 	val = clamp(ucontrol->value.integer.value[0],
 		    0L, (long)SCARLETT2_MIXER_MAX_VALUE);
@@ -3808,6 +3943,11 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	if (private->mux_updated) {
 		err = scarlett2_usb_get_mux(mixer);
 		if (err < 0)
@@ -3831,6 +3971,11 @@ static int scarlett2_mux_src_enum_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->mux[index];
 	val = min(ucontrol->value.enumerated.item[0],
 		  private->num_mux_srcs - 1U);
@@ -3915,6 +4060,11 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	err = scarlett2_usb_get_meter_levels(elem->head.mixer, elem->channels,
 					     meter_levels);
 	if (err < 0)
@@ -3983,6 +4133,11 @@ static int scarlett2_msd_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->msd_switch;
 	val = !!ucontrol->value.integer.value[0];
 
@@ -4050,6 +4205,11 @@ static int scarlett2_standalone_ctl_put(struct snd_kcontrol *kctl,
 
 	mutex_lock(&private->data_mutex);
 
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
 	oval = private->standalone_switch;
 	val = !!ucontrol->value.integer.value[0];
 
@@ -4712,12 +4872,241 @@ static int snd_scarlett2_controls_create(
 
 /*** hwdep interface ***/
 
-/* Reboot the device. */
+/* Set private->hwdep_in_use; prevents access to the ALSA controls
+ * while doing a config erase/firmware upgrade.
+ */
+static void scarlett2_lock(struct scarlett2_data *private)
+{
+	mutex_lock(&private->data_mutex);
+	private->hwdep_in_use = 1;
+	mutex_unlock(&private->data_mutex);
+}
+
+/* Call SCARLETT2_USB_GET_ERASE to get the erase progress */
+static int scarlett2_get_erase_progress(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num, err;
+	u8 erase_resp;
+
+	struct {
+		__le32 segment_num;
+		__le32 pad;
+	} __packed erase_req;
+
+	segment_id = private->selected_flash_segment_id;
+	segment_num = private->flash_segment_nums[segment_id];
+
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Send the erase progress request */
+	erase_req.segment_num = cpu_to_le32(segment_num);
+	erase_req.pad = 0;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_ERASE,
+			    &erase_req, sizeof(erase_req),
+			    &erase_resp, sizeof(erase_resp));
+	if (err < 0)
+		return err;
+
+	return erase_resp;
+}
+
+/* Repeatedly call scarlett2_get_erase_progress() until it returns
+ * 0xff (erase complete) or we've waited 10 seconds (it usually takes
+ * <3 seconds).
+ */
+static int scarlett2_wait_for_erase(struct usb_mixer_interface *mixer)
+{
+	int i, err;
+
+	for (i = 0; i < 100; i++) {
+		err = scarlett2_get_erase_progress(mixer);
+		if (err < 0)
+			return err;
+
+		if (err == 0xff)
+			return 0;
+
+		msleep(100);
+	}
+
+	return -ETIMEDOUT;
+}
+
+/* Reboot the device; wait for the erase to complete if one is in
+ * progress.
+ */
 static int scarlett2_reboot(struct usb_mixer_interface *mixer)
 {
+	struct scarlett2_data *private = mixer->private_data;
+
+	if (private->flash_write_state ==
+	      SCARLETT2_FLASH_WRITE_STATE_ERASING) {
+		int err = scarlett2_wait_for_erase(mixer);
+
+		if (err < 0)
+			return err;
+	}
+
 	return scarlett2_usb(mixer, SCARLETT2_USB_REBOOT, NULL, 0, NULL, 0);
 }
 
+/* Select a flash segment for erasing (and possibly writing to) */
+static int scarlett2_ioctl_select_flash_segment(
+	struct usb_mixer_interface *mixer,
+	unsigned long arg)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num;
+
+	if (get_user(segment_id, (int __user *)arg))
+		return -EFAULT;
+
+	/* Check the segment ID and segment number */
+	if (segment_id < 0 || segment_id >= SCARLETT2_SEGMENT_ID_COUNT)
+		return -EINVAL;
+
+	segment_num = private->flash_segment_nums[segment_id];
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX) {
+		usb_audio_err(mixer->chip,
+			      "%s: invalid segment number %d\n",
+			      __func__, segment_id);
+		return -EFAULT;
+	}
+
+	/* If erasing, wait for it to complete */
+	if (private->flash_write_state == SCARLETT2_FLASH_WRITE_STATE_ERASING) {
+		int err = scarlett2_wait_for_erase(mixer);
+
+		if (err < 0)
+			return err;
+	}
+
+	/* Save the selected segment ID and set the state to SELECTED */
+	private->selected_flash_segment_id = segment_id;
+	private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_SELECTED;
+
+	return 0;
+}
+
+/* Erase the previously-selected flash segment */
+static int scarlett2_ioctl_erase_flash_segment(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num, err;
+
+	struct {
+		__le32 segment_num;
+		__le32 pad;
+	} __packed erase_req;
+
+	if (private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_SELECTED)
+		return -EINVAL;
+
+	segment_id = private->selected_flash_segment_id;
+	segment_num = private->flash_segment_nums[segment_id];
+
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Prevent access to ALSA controls that access the device from
+	 * here on
+	 */
+	scarlett2_lock(private);
+
+	/* Send the erase request */
+	erase_req.segment_num = cpu_to_le32(segment_num);
+	erase_req.pad = 0;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_ERASE_SEGMENT,
+			    &erase_req, sizeof(erase_req),
+			    NULL, 0);
+	if (err < 0)
+		return err;
+
+	/* On success, change the state from SELECTED to ERASING */
+	private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_ERASING;
+
+	return 0;
+}
+
+/* Get the erase progress from the device */
+static int scarlett2_ioctl_get_erase_progress(
+	struct usb_mixer_interface *mixer,
+	unsigned long arg)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	struct scarlett2_flash_segment_erase_progress progress;
+	int segment_id, segment_num, err;
+	u8 erase_resp;
+
+	struct {
+		__le32 segment_num;
+		__le32 pad;
+	} __packed erase_req;
+
+	/* Check that we're erasing */
+	if (private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_ERASING)
+		return -EINVAL;
+
+	segment_id = private->selected_flash_segment_id;
+	segment_num = private->flash_segment_nums[segment_id];
+
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Send the erase progress request */
+	erase_req.segment_num = cpu_to_le32(segment_num);
+	erase_req.pad = 0;
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_ERASE,
+			    &erase_req, sizeof(erase_req),
+			    &erase_resp, sizeof(erase_resp));
+	if (err < 0)
+		return err;
+
+	progress.progress = erase_resp;
+	progress.num_blocks = private->flash_segment_blocks[segment_id];
+
+	if (copy_to_user((void __user *)arg, &progress, sizeof(progress)))
+		return -EFAULT;
+
+	/* If the erase is complete, change the state from ERASING to
+	 * IDLE.
+	 */
+	if (progress.progress == 0xff)
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_IDLE;
+
+	return 0;
+}
+
+static int scarlett2_hwdep_open(struct snd_hwdep *hw, struct file *file)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct scarlett2_data *private = mixer->private_data;
+
+	/* If erasing, wait for it to complete */
+	if (private->flash_write_state ==
+	      SCARLETT2_FLASH_WRITE_STATE_ERASING) {
+		int err = scarlett2_wait_for_erase(mixer);
+
+		if (err < 0)
+			return err;
+	}
+
+	/* Set the state to IDLE */
+	private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_IDLE;
+
+	return 0;
+}
+
 static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 				 unsigned int cmd, unsigned long arg)
 {
@@ -4732,11 +5121,36 @@ static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	case SCARLETT2_IOCTL_REBOOT:
 		return scarlett2_reboot(mixer);
 
+	case SCARLETT2_IOCTL_SELECT_FLASH_SEGMENT:
+		return scarlett2_ioctl_select_flash_segment(mixer, arg);
+
+	case SCARLETT2_IOCTL_ERASE_FLASH_SEGMENT:
+		return scarlett2_ioctl_erase_flash_segment(mixer);
+
+	case SCARLETT2_IOCTL_GET_ERASE_PROGRESS:
+		return scarlett2_ioctl_get_erase_progress(mixer, arg);
+
 	default:
 		return -ENOIOCTLCMD;
 	}
 }
 
+static int scarlett2_hwdep_release(struct snd_hwdep *hw, struct file *file)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct scarlett2_data *private = mixer->private_data;
+
+	/* Return from the SELECTED or WRITE state to IDLE.
+	 * The ERASING state is left as-is, and checked on next open.
+	 */
+	if (private &&
+	    private->hwdep_in_use &&
+	    private->flash_write_state != SCARLETT2_FLASH_WRITE_STATE_ERASING)
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_IDLE;
+
+	return 0;
+}
+
 static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_hwdep *hw;
@@ -4748,7 +5162,9 @@ static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 
 	hw->private_data = mixer;
 	hw->exclusive = 1;
+	hw->ops.open = scarlett2_hwdep_open;
 	hw->ops.ioctl = scarlett2_hwdep_ioctl;
+	hw->ops.release = scarlett2_hwdep_release;
 
 	return 0;
 }
-- 
2.43.0

