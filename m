Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C281DC26
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4775EB6;
	Sun, 24 Dec 2023 20:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4775EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446409;
	bh=xk9IOw4z56Z91NZZI1hbAe7Xiqu6Bj9Pgyo/QOU3BQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MaPPNmxanTip8bGG7v6iPDQmchgGaRz1ZYU9Y2a7QyG3Xya5oWQ2TyajDmgjregIT
	 ZwschYdi7UfvrCD0Nd2UFd5KZovQuHR9T+oA1dEm0hNYXqfe+Ayc9gSWajRq3dlzEA
	 fyhH30dWlqojP/0Uj2FmntECd7C1l58FIyrzKHIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EAAFF8063C; Sun, 24 Dec 2023 20:32:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D382F805E1;
	Sun, 24 Dec 2023 20:32:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16AFDF8057E; Sun, 24 Dec 2023 20:32:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9445F801EB
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9445F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=MkGEtcAg
Received: by m.b4.vu (Postfix, from userid 1000)
	id 1D282604B9CB; Mon, 25 Dec 2023 06:01:14 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 1D282604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446274; bh=+cYfs+U8RcqeWqLNqcrjHQx34hzA8bE03CiFBhX/VwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkGEtcAgwV//xEri3AJreZjbq+fyyC5lpd2rhA3Q5IqWC51+klYLIWCaI+qnjVwZj
	 38ibavfcWinTEvwnP3luhjraTMcTVI9LXdC0IFaQMSMmKh8P+P+5C8YD1/wISJu0fm
	 3bdZ0/ZGZ2Kgg/05PWdz7MZnOA5RQEOg5f7vkCpQj7ETYNj2EWn7XznxrBycL2Jwlv
	 uW3k7wNExiq7KcYTmFAFNMA5gKWTkc6qGdWI1eSjzds1+wxlBRiFVq9ZuauXuriAkr
	 xzgs5ml54GEEsVRuKgjCf6NwwhKLTL/S3DgUvVGbQgIHZKRCqN9QEhPidnIu/w7bp6
	 co0p3Mo82i2NA==
Date: Mon, 25 Dec 2023 06:01:14 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 23/23] ALSA: scarlett2: Split direct_monitor out from
 monitor_other
Message-ID: <9b56a483e3e9c1447684f18239a88652c1f01445.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: UFE66XYHJVWOZJOQNAKOHMBYFT5O4OFQ
X-Message-ID-Hash: UFE66XYHJVWOZJOQNAKOHMBYFT5O4OFQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFE66XYHJVWOZJOQNAKOHMBYFT5O4OFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The notification value for monitor_other on the large interfaces is
the same as the notification value for direct_monitor on the 3rd Gen
small interfaces. Add a separate scarlett3a_notifications array and
split out the direct_monitor handling.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 289 ++++++++++++++++++++----------------
 1 file changed, 158 insertions(+), 131 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 14597428ed05..e25f004e50e4 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -277,8 +277,10 @@ static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer);
 static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer);
+static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer);
+
+/* Arrays of notification callback functions */
 
-/* Array of notification callback functions */
 static const struct scarlett2_notification scarlett2_notifications[] = {
 	{ 0x00000001, NULL }, /* ack, gets ignored */
 	{ 0x00000008, scarlett2_notify_sync },
@@ -289,6 +291,13 @@ static const struct scarlett2_notification scarlett2_notifications[] = {
 	{ 0, NULL }
 };
 
+static const struct scarlett2_notification scarlett3a_notifications[] = {
+	{ 0x00000001, NULL }, /* ack, gets ignored */
+	{ 0x00800000, scarlett2_notify_input_other },
+	{ 0x01000000, scarlett2_notify_direct_monitor },
+	{ 0, NULL }
+};
+
 /* Configuration parameters that can be read and written */
 enum {
 	SCARLETT2_CONFIG_DIM_MUTE,
@@ -379,7 +388,7 @@ static const struct scarlett2_config_set scarlett2_config_set_gen2b = {
 
 /* Gen 3 devices without a mixer (Solo and 2i2) */
 static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
-	.notifications = scarlett2_notifications,
+	.notifications = scarlett3a_notifications,
 	.items = {
 		[SCARLETT2_CONFIG_MSD_SWITCH] = {
 			.offset = 0x04, .size = 8, .activate = 6 },
@@ -690,6 +699,7 @@ struct scarlett2_data {
 	u8 input_air_updated;
 	u8 input_phantom_updated;
 	u8 monitor_other_updated;
+	u8 direct_monitor_updated;
 	u8 mux_updated;
 	u8 speaker_switching_switched;
 	u8 sync;
@@ -3127,7 +3137,7 @@ static const struct snd_kcontrol_new scarlett2_phantom_persistence_ctl = {
 	.put  = scarlett2_phantom_persistence_ctl_put,
 };
 
-/*** Direct Monitor Control ***/
+/*** Speaker Switching Control ***/
 
 static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 {
@@ -3147,11 +3157,6 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 
 	private->monitor_other_updated = 0;
 
-	if (info->direct_monitor)
-		return scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_DIRECT_MONITOR,
-			1, &private->direct_monitor_switch);
-
 	/* if it doesn't do speaker switching then it also doesn't do
 	 * talkback
 	 */
@@ -3196,119 +3201,6 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
-static int scarlett2_direct_monitor_ctl_get(
-	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
-{
-	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
-	int err = 0;
-
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
-
-	if (private->monitor_other_updated) {
-		err = scarlett2_update_monitor_other(mixer);
-		if (err < 0)
-			goto unlock;
-	}
-	ucontrol->value.enumerated.item[0] = private->direct_monitor_switch;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
-}
-
-static int scarlett2_direct_monitor_ctl_put(
-	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
-{
-	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct usb_mixer_interface *mixer = elem->head.mixer;
-	struct scarlett2_data *private = mixer->private_data;
-
-	int index = elem->control;
-	int oval, val, err = 0;
-
-	mutex_lock(&private->data_mutex);
-
-	if (private->hwdep_in_use) {
-		err = -EBUSY;
-		goto unlock;
-	}
-
-	oval = private->direct_monitor_switch;
-	val = min(ucontrol->value.enumerated.item[0], 2U);
-
-	if (oval == val)
-		goto unlock;
-
-	private->direct_monitor_switch = val;
-
-	/* Send switch change to the device */
-	err = scarlett2_usb_set_config(
-		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR, index, val);
-	if (err == 0)
-		err = 1;
-
-unlock:
-	mutex_unlock(&private->data_mutex);
-	return err;
-}
-
-static int scarlett2_direct_monitor_stereo_enum_ctl_info(
-	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
-{
-	static const char *const values[3] = {
-		"Off", "Mono", "Stereo"
-	};
-
-	return snd_ctl_enum_info(uinfo, 1, 3, values);
-}
-
-/* Direct Monitor for Solo is mono-only and only needs a boolean control
- * Direct Monitor for 2i2 is selectable between Off/Mono/Stereo
- */
-static const struct snd_kcontrol_new scarlett2_direct_monitor_ctl[2] = {
-	{
-		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "",
-		.info = snd_ctl_boolean_mono_info,
-		.get  = scarlett2_direct_monitor_ctl_get,
-		.put  = scarlett2_direct_monitor_ctl_put,
-	},
-	{
-		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "",
-		.info = scarlett2_direct_monitor_stereo_enum_ctl_info,
-		.get  = scarlett2_direct_monitor_ctl_get,
-		.put  = scarlett2_direct_monitor_ctl_put,
-	}
-};
-
-static int scarlett2_add_direct_monitor_ctl(struct usb_mixer_interface *mixer)
-{
-	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
-	const char *s;
-
-	if (!info->direct_monitor)
-		return 0;
-
-	s = info->direct_monitor == 1
-	      ? "Direct Monitor Playback Switch"
-	      : "Direct Monitor Playback Enum";
-
-	return scarlett2_add_new_ctl(
-		mixer, &scarlett2_direct_monitor_ctl[info->direct_monitor - 1],
-		0, 1, s, &private->direct_monitor_ctl);
-}
-
-/*** Speaker Switching Control ***/
-
 static int scarlett2_speaker_switch_enum_ctl_info(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
 {
@@ -4014,6 +3906,133 @@ static int scarlett2_add_mixer_ctls(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*** Direct Monitor Control ***/
+
+static int scarlett2_update_direct_monitor(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->direct_monitor_updated = 0;
+
+	if (!private->info->direct_monitor)
+		return 0;
+
+	return scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR,
+		1, &private->direct_monitor_switch);
+}
+
+static int scarlett2_direct_monitor_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+	int err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	if (private->direct_monitor_updated) {
+		err = scarlett2_update_direct_monitor(mixer);
+		if (err < 0)
+			goto unlock;
+	}
+	ucontrol->value.enumerated.item[0] = private->direct_monitor_switch;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_direct_monitor_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int index = elem->control;
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	if (private->hwdep_in_use) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	oval = private->direct_monitor_switch;
+	val = min(ucontrol->value.enumerated.item[0], 2U);
+
+	if (oval == val)
+		goto unlock;
+
+	private->direct_monitor_switch = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_DIRECT_MONITOR, index, val);
+	if (err == 0)
+		err = 1;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static int scarlett2_direct_monitor_stereo_enum_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const values[3] = {
+		"Off", "Mono", "Stereo"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
+}
+
+/* Direct Monitor for Solo is mono-only and only needs a boolean control
+ * Direct Monitor for 2i2 is selectable between Off/Mono/Stereo
+ */
+static const struct snd_kcontrol_new scarlett2_direct_monitor_ctl[2] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "",
+		.info = snd_ctl_boolean_mono_info,
+		.get  = scarlett2_direct_monitor_ctl_get,
+		.put  = scarlett2_direct_monitor_ctl_put,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "",
+		.info = scarlett2_direct_monitor_stereo_enum_ctl_info,
+		.get  = scarlett2_direct_monitor_ctl_get,
+		.put  = scarlett2_direct_monitor_ctl_put,
+	}
+};
+
+static int scarlett2_add_direct_monitor_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	const char *s;
+
+	if (!info->direct_monitor)
+		return 0;
+
+	s = info->direct_monitor == 1
+	      ? "Direct Monitor Playback Switch"
+	      : "Direct Monitor Playback Enum";
+
+	return scarlett2_add_new_ctl(
+		mixer, &scarlett2_direct_monitor_ctl[info->direct_monitor - 1],
+		0, 1, s, &private->direct_monitor_ctl);
+}
+
 /*** Mux Source Selection Controls ***/
 
 static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
@@ -4639,7 +4658,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	err = scarlett2_update_monitor_other(mixer);
+	err = scarlett2_update_direct_monitor(mixer);
 	if (err < 0)
 		return err;
 
@@ -4647,6 +4666,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (!scarlett2_has_mixer(private))
 		return 0;
 
+	err = scarlett2_update_monitor_other(mixer);
+	if (err < 0)
+		return err;
+
 	if (scarlett2_has_config_item(private,
 				      SCARLETT2_CONFIG_STANDALONE_SWITCH)) {
 		err = scarlett2_usb_get_config(
@@ -4843,9 +4866,7 @@ static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
 	scarlett2_notify_input_phantom(mixer);
 }
 
-/* Notify on "monitor other" change (direct monitor, speaker
- * switching, talkback)
- */
+/* Notify on "monitor other" change (speaker switching, talkback) */
 static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
@@ -4854,12 +4875,6 @@ static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer)
 
 	private->monitor_other_updated = 1;
 
-	if (info->direct_monitor) {
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
-			       &private->direct_monitor_ctl->id);
-		return;
-	}
-
 	if (info->has_speaker_switching)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->speaker_switching_ctl->id);
@@ -4885,6 +4900,18 @@ static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer)
 	}
 }
 
+/* Notify on direct monitor switch change */
+static void scarlett2_notify_direct_monitor(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+
+	private->direct_monitor_updated = 1;
+
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+		       &private->direct_monitor_ctl->id);
+}
+
 /* Interrupt callback */
 static void scarlett2_notify(struct urb *urb)
 {
-- 
2.43.0

