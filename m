Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFE3AF4F5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522F91775;
	Mon, 21 Jun 2021 20:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522F91775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299751;
	bh=OEvWopwjkIhEHsKNLBb0VC2BFURD8/1xBSlZpNsS2sg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ki3dhjlw5DlXOOjPAs1FdugKQZD8TO/Mf+d7SiNmqPuG0Jf5rdrNfEcW0tkjw6qd4
	 hJ4/pnRNoH0YZVvGhr2NWXuPmulD8l1buG8OrHcDpdX0UVXa0vhCwZjdLoJ3prxnvp
	 s7YA46BmTN/wJFAvi5QHjI1qNQY1ufQ0MDBvIxbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08987F805F5;
	Mon, 21 Jun 2021 20:10:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3034BF805E9; Mon, 21 Jun 2021 20:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAE1F805E3
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAE1F805E3
Received: by m.b4.vu (Postfix, from userid 1000)
 id A631B61E286F; Tue, 22 Jun 2021 03:40:21 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:40:21 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 31/31] ALSA: usb-audio: scarlett2: Add support for the
 talkback feature
Message-ID: <743454d3ea48bcbdf7e39744a000547133d3c110.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Add support for the talkback feature of the 18i20 Gen 3.

Co-developed-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 229 +++++++++++++++++++++++++++++++-
 1 file changed, 222 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 8fd850f6aa6e..fcf78b06a519 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -48,8 +48,8 @@
  * Support for Solo/2i2 Gen 3 added in May 2021 (thanks to Alexander
  * Vorona for 2i2 protocol traces).
  *
- * Support for phantom power, direct monitoring, and speaker switching
- * added in May-June 2021.
+ * Support for phantom power, direct monitoring, speaker switching,
+ * and talkback added in May-June 2021.
  *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
@@ -57,7 +57,8 @@
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level, pad, and air controls
- *  - phantom power, direct monitor, and speaker switching controls
+ *  - phantom power, direct monitor, speaker switching, and talkback
+ *    controls
  *  - disable/enable MSD mode
  *
  * <ditaa>
@@ -318,6 +319,9 @@ struct scarlett2_device_info {
 	/* support for main/alt speaker switching */
 	u8 has_speaker_switching;
 
+	/* support for talkback microphone */
+	u8 has_talkback;
+
 	/* the number of analogue inputs with a software switchable
 	 * level control that can be set to line or instrument
 	 */
@@ -396,6 +400,8 @@ struct scarlett2_data {
 	u8 phantom_persistence;
 	u8 direct_monitor_switch;
 	u8 speaker_switching_switch;
+	u8 talkback_switch;
+	u8 talkback_map[SCARLETT2_OUTPUT_MIX_MAX];
 	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -410,6 +416,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
 	struct snd_kcontrol *direct_monitor_ctl;
 	struct snd_kcontrol *speaker_switching_ctl;
+	struct snd_kcontrol *talkback_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -764,6 +771,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.has_mixer = 1,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
+	.has_talkback = 1,
 	.level_input_count = 2,
 	.pad_input_count = 8,
 	.air_input_count = 8,
@@ -923,7 +931,8 @@ enum {
 	SCARLETT2_CONFIG_DIRECT_MONITOR = 10,
 	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 11,
 	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 12,
-	SCARLETT2_CONFIG_COUNT = 13
+	SCARLETT2_CONFIG_TALKBACK_MAP = 13,
+	SCARLETT2_CONFIG_COUNT = 14
 };
 
 /* Location, size, and activation command number for the configuration
@@ -998,6 +1007,9 @@ static const struct scarlett2_config
 
 	[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
 		.offset = 0xa0, .size = 1, .activate = 10 },
+
+	[SCARLETT2_CONFIG_TALKBACK_MAP] = {
+		.offset = 0xb0, .size = 16, .activate = 10 },
 } };
 
 /* proprietary request/response format */
@@ -2356,10 +2368,14 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 	const struct scarlett2_device_info *info = private->info;
 	int err;
 
-	/* monitor_other_enable[0] enables speaker switching */
+	/* monitor_other_enable[0] enables speaker switching
+	 * monitor_other_enable[1] enables talkback
+	 */
 	u8 monitor_other_enable[2];
 
-	/* monitor_other_switch[0] activates the alternate speakers */
+	/* monitor_other_switch[0] activates the alternate speakers
+	 * monitor_other_switch[1] activates talkback
+	 */
 	u8 monitor_other_switch[2];
 
 	private->monitor_other_updated = 0;
@@ -2369,6 +2385,9 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 			mixer, SCARLETT2_CONFIG_DIRECT_MONITOR,
 			1, &private->direct_monitor_switch);
 
+	/* if it doesn't do speaker switching then it also doesn't do
+	 * talkback
+	 */
 	if (!info->has_speaker_switching)
 		return 0;
 
@@ -2389,6 +2408,26 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 	else
 		private->speaker_switching_switch = monitor_other_switch[0] + 1;
 
+	if (info->has_talkback) {
+		const int (*port_count)[SCARLETT2_PORT_DIRNS] =
+			info->port_count;
+		int num_mixes =
+			port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
+		u16 bitmap;
+		int i;
+
+		if (!monitor_other_enable[1])
+			private->talkback_switch = 0;
+		else
+			private->talkback_switch = monitor_other_switch[1] + 1;
+
+		err = scarlett2_usb_get_config(mixer,
+					       SCARLETT2_CONFIG_TALKBACK_MAP,
+					       1, &bitmap);
+		for (i = 0; i < num_mixes; i++, bitmap >>= 1)
+			private->talkback_map[i] = bitmap & 1;
+	}
+
 	return 0;
 }
 
@@ -2626,6 +2665,171 @@ static int scarlett2_add_speaker_switch_ctl(
 		&private->speaker_switching_ctl);
 }
 
+/*** Talkback and Talkback Map Controls ***/
+
+static int scarlett2_talkback_enum_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const values[3] = {
+		"Disabled", "Off", "On"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
+}
+
+static int scarlett2_talkback_enum_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->monitor_other_updated)
+		scarlett2_update_monitor_other(mixer);
+	ucontrol->value.enumerated.item[0] = private->talkback_switch;
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
+}
+
+static int scarlett2_talkback_enum_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->talkback_switch;
+	val = min(ucontrol->value.enumerated.item[0], 2U);
+
+	if (oval == val)
+		goto unlock;
+
+	private->talkback_switch = val;
+
+	/* enable/disable talkback */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+		1, !!val);
+	if (err < 0)
+		goto unlock;
+
+	/* if talkback is enabled, select main or alt */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+		1, val == 2);
+	if (err < 0)
+		goto unlock;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_talkback_enum_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett2_talkback_enum_ctl_info,
+	.get  = scarlett2_talkback_enum_ctl_get,
+	.put  = scarlett2_talkback_enum_ctl_put,
+};
+
+static int scarlett2_talkback_map_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int index = elem->control;
+
+	ucontrol->value.integer.value[0] = private->talkback_map[index];
+
+	return 0;
+}
+
+static int scarlett2_talkback_map_ctl_put(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] =
+		private->info->port_count;
+	int num_mixes = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
+
+	int index = elem->control;
+	int oval, val, err = 0, i;
+	u16 bitmap = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->talkback_map[index];
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->talkback_map[index] = val;
+
+	for (i = 0; i < num_mixes; i++)
+		bitmap |= private->talkback_map[i] << i;
+
+	/* Send updated bitmap to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_TALKBACK_MAP,
+				       0, bitmap);
+	if (err < 0)
+		goto unlock;
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_talkback_map_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_talkback_map_ctl_get,
+	.put  = scarlett2_talkback_map_ctl_put,
+};
+
+static int scarlett2_add_talkback_ctls(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
+	int num_mixes = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
+	int err, i;
+	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+
+	if (!info->has_talkback)
+		return 0;
+
+	err = scarlett2_add_new_ctl(
+		mixer, &scarlett2_talkback_enum_ctl,
+		0, 1, "Talkback Playback Enum",
+		&private->talkback_ctl);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < num_mixes; i++) {
+		snprintf(s, sizeof(s),
+			 "Talkback Mix %c Playback Switch", i + 'A');
+		err = scarlett2_add_new_ctl(mixer, &scarlett2_talkback_map_ctl,
+					    i, 1, s, NULL);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 /*** Dim/Mute Controls ***/
 
 static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
@@ -3521,7 +3725,9 @@ static void scarlett2_notify_input_other(
 			       &private->phantom_ctls[i]->id);
 }
 
-/* Notify on "monitor other" change (direct monitor, speaker switching) */
+/* Notify on "monitor other" change (direct monitor, speaker
+ * switching, talkback)
+ */
 static void scarlett2_notify_monitor_other(
 	struct usb_mixer_interface *mixer)
 {
@@ -3541,6 +3747,10 @@ static void scarlett2_notify_monitor_other(
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->speaker_switching_ctl->id);
 
+	if (info->has_talkback)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->talkback_ctl->id);
+
 	/* if speaker switching was recently enabled or disabled,
 	 * invalidate the dim/mute and mux enum controls
 	 */
@@ -3696,6 +3906,11 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Create the talkback controls */
+	err = scarlett2_add_talkback_ctls(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.31.1

