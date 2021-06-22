Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9B3B0B1D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943471689;
	Tue, 22 Jun 2021 19:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943471689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381682;
	bh=dZ35OdHPM/kas2O7erHCa3xe7bhepZw+yHeAebAs+n0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXOJFvaK4oH+oBtsyYYqv5WZrrxK8NFnm5qLb7xlfV5NSNDTModDxxNKmrPNgG35b
	 bazg+Td+EANo3EYLnPDEZLcA+dTadqi7SwsYEDP9EAZZn2K2UBLOf6rsXjMLfrwYIL
	 VkNKnfCTv2yppRov8wZIhHorUbQuhTfIqBb+KtHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F65F804EC;
	Tue, 22 Jun 2021 19:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37945F804E7; Tue, 22 Jun 2021 19:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EB35F8051B
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB35F8051B
Received: by m.b4.vu (Postfix, from userid 1000)
 id C00F761E287C; Wed, 23 Jun 2021 02:33:58 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:33:58 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 15/17] ALSA: usb-audio: scarlett2: Add speaker switching
 support
Message-ID: <874193a534cd0aeb6f2e108ae761cadd2dc25ad2.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
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

The 18i8 and 18i20 Gen 3 support "speaker switching". Add a Speaker
Switch control which can be set to Off/Main/Alt.

When speaker switching is enabled or disabled, the interface may
change the state of the Analog Outputs 3 and 4 routing and the global
mute button, so use a flag private->speaker_switching_switched to note
that those should be checked when the next "monitor other"
notification is received.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 248 +++++++++++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 279196feb811..ffa2ee8d034c 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -48,8 +48,8 @@
  * Support for Solo/2i2 Gen 3 added in May 2021 (thanks to Alexander
  * Vorona for 2i2 protocol traces).
  *
- * Support for phantom power and direct monitoring added in May-June
- * 2021.
+ * Support for phantom power, direct monitoring, and speaker switching
+ * added in May-June 2021.
  *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
@@ -57,7 +57,7 @@
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level, pad, and air controls
- *  - phantom power and direct monitor controls
+ *  - phantom power, direct monitor, and speaker switching controls
  *  - disable/enable MSD mode
  *
  * <ditaa>
@@ -315,6 +315,9 @@ struct scarlett2_device_info {
 	/* line out hw volume is sw controlled */
 	u8 line_out_hw_vol;
 
+	/* support for main/alt speaker switching */
+	u8 has_speaker_switching;
+
 	/* the number of analogue inputs with a software switchable
 	 * level control that can be set to line or instrument
 	 */
@@ -379,6 +382,7 @@ struct scarlett2_data {
 	u8 input_other_updated;
 	u8 monitor_other_updated;
 	u8 mux_updated;
+	u8 speaker_switching_switched;
 	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
@@ -391,6 +395,7 @@ struct scarlett2_data {
 	u8 phantom_switch[SCARLETT2_PHANTOM_SWITCH_MAX];
 	u8 phantom_persistence;
 	u8 direct_monitor_switch;
+	u8 speaker_switching_switch;
 	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -404,6 +409,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
 	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
 	struct snd_kcontrol *direct_monitor_ctl;
+	struct snd_kcontrol *speaker_switching_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -687,6 +693,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.has_msd_mode = 1,
 	.has_mixer = 1,
 	.line_out_hw_vol = 1,
+	.has_speaker_switching = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 4,
@@ -756,6 +763,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.has_msd_mode = 1,
 	.has_mixer = 1,
 	.line_out_hw_vol = 1,
+	.has_speaker_switching = 1,
 	.level_input_count = 2,
 	.pad_input_count = 8,
 	.air_input_count = 8,
@@ -913,7 +921,9 @@ enum {
 	SCARLETT2_CONFIG_PHANTOM_SWITCH = 8,
 	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 9,
 	SCARLETT2_CONFIG_DIRECT_MONITOR = 10,
-	SCARLETT2_CONFIG_COUNT = 11
+	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH = 11,
+	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE = 12,
+	SCARLETT2_CONFIG_COUNT = 13
 };
 
 /* Location, size, and activation command number for the configuration
@@ -982,6 +992,12 @@ static const struct scarlett2_config
 
 	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
 		.offset = 0x9e, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH] = {
+		.offset = 0x9f, .size = 1, .activate = 10 },
+
+	[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
+		.offset = 0xa0, .size = 1, .activate = 10 },
 } };
 
 /* proprietary request/response format */
@@ -1862,6 +1878,18 @@ static const struct snd_kcontrol_new scarlett2_mute_ctl = {
 
 /*** HW/SW Volume Switch Controls ***/
 
+static void scarlett2_sw_hw_ctl_ro(struct scarlett2_data *private, int index)
+{
+	private->sw_hw_ctls[index]->vd[0].access &=
+		~SNDRV_CTL_ELEM_ACCESS_WRITE;
+}
+
+static void scarlett2_sw_hw_ctl_rw(struct scarlett2_data *private, int index)
+{
+	private->sw_hw_ctls[index]->vd[0].access |=
+		SNDRV_CTL_ELEM_ACCESS_WRITE;
+}
+
 static int scarlett2_sw_hw_enum_ctl_info(struct snd_kcontrol *kctl,
 					 struct snd_ctl_elem_info *uinfo)
 {
@@ -2325,6 +2353,13 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
+	int err;
+
+	/* monitor_other_enable[0] enables speaker switching */
+	u8 monitor_other_enable[2];
+
+	/* monitor_other_switch[0] activates the alternate speakers */
+	u8 monitor_other_switch[2];
 
 	private->monitor_other_updated = 0;
 
@@ -2333,6 +2368,26 @@ static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
 			mixer, SCARLETT2_CONFIG_DIRECT_MONITOR,
 			1, &private->direct_monitor_switch);
 
+	if (!info->has_speaker_switching)
+		return 0;
+
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+		2, monitor_other_enable);
+	if (err < 0)
+		return err;
+
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+		2, monitor_other_switch);
+	if (err < 0)
+		return err;
+
+	if (!monitor_other_enable[0])
+		private->speaker_switching_switch = 0;
+	else
+		private->speaker_switching_switch = monitor_other_switch[0] + 1;
+
 	return 0;
 }
 
@@ -2425,6 +2480,151 @@ static int scarlett2_add_direct_monitor_ctl(struct usb_mixer_interface *mixer)
 		&private->direct_monitor_ctl);
 }
 
+/*** Speaker Switching Control ***/
+
+static int scarlett2_speaker_switch_enum_ctl_info(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const values[3] = {
+		"Off", "Main", "Alt"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 3, values);
+}
+
+static int scarlett2_speaker_switch_enum_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->monitor_other_updated)
+		scarlett2_update_monitor_other(mixer);
+	ucontrol->value.enumerated.item[0] = private->speaker_switching_switch;
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
+}
+
+/* when speaker switching gets enabled, switch the main/alt speakers
+ * to HW volume and disable those controls
+ */
+static void scarlett2_speaker_switch_enable(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		int index = line_out_remap(private, i);
+
+		/* switch the main/alt speakers to HW volume */
+		if (!private->vol_sw_hw_switch[index])
+			scarlett2_sw_hw_change(private->mixer, i, 1);
+
+		/* disable the line out SW/HW switch */
+		scarlett2_sw_hw_ctl_ro(private, i);
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->sw_hw_ctls[i]->id);
+	}
+
+	/* when the next monitor-other notify comes in, update the mux
+	 * configuration
+	 */
+	private->speaker_switching_switched = 1;
+}
+
+/* when speaker switching gets disabled, reenable the hw/sw controls
+ * and invalidate the routing
+ */
+static void scarlett2_speaker_switch_disable(struct usb_mixer_interface *mixer)
+{
+	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	int i;
+
+	/* enable the line out SW/HW switch */
+	for (i = 0; i < 4; i++) {
+		scarlett2_sw_hw_ctl_rw(private, i);
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+			       &private->sw_hw_ctls[i]->id);
+	}
+
+	/* when the next monitor-other notify comes in, update the mux
+	 * configuration
+	 */
+	private->speaker_switching_switched = 1;
+}
+
+static int scarlett2_speaker_switch_enum_ctl_put(
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
+	oval = private->speaker_switching_switch;
+	val = min(ucontrol->value.enumerated.item[0], 2U);
+
+	if (oval == val)
+		goto unlock;
+
+	private->speaker_switching_switch = val;
+
+	/* enable/disable speaker switching */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+		0, !!val);
+	if (err < 0)
+		goto unlock;
+
+	/* if speaker switching is enabled, select main or alt */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+		0, val == 2);
+	if (err < 0)
+		goto unlock;
+
+	/* update controls if speaker switching gets enabled or disabled */
+	if (!oval && val)
+		scarlett2_speaker_switch_enable(mixer);
+	else if (oval && !val)
+		scarlett2_speaker_switch_disable(mixer);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_speaker_switch_enum_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = scarlett2_speaker_switch_enum_ctl_info,
+	.get  = scarlett2_speaker_switch_enum_ctl_get,
+	.put  = scarlett2_speaker_switch_enum_ctl_put,
+};
+
+static int scarlett2_add_speaker_switch_ctl(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	if (!info->has_speaker_switching)
+		return 0;
+
+	return scarlett2_add_new_ctl(
+		mixer, &scarlett2_speaker_switch_enum_ctl,
+		0, 1, "Speaker Switching Playback Enum",
+		&private->speaker_switching_ctl);
+}
+
 /*** Dim/Mute Controls ***/
 
 static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
@@ -2567,6 +2767,12 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 						    &private->sw_hw_ctls[i]);
 			if (err < 0)
 				return err;
+
+			/* Make the switch read-only if the line is
+			 * involved in speaker switching
+			 */
+			if (private->speaker_switching_switch && i < 4)
+				scarlett2_sw_hw_ctl_ro(private, i);
 		}
 	}
 
@@ -3314,18 +3520,41 @@ static void scarlett2_notify_input_other(
 			       &private->phantom_ctls[i]->id);
 }
 
-/* Notify on "monitor other" change (direct monitor) */
+/* Notify on "monitor other" change (direct monitor, speaker switching) */
 static void scarlett2_notify_monitor_other(
 	struct usb_mixer_interface *mixer)
 {
-	struct scarlett2_data *private = mixer->private_data;
 	struct snd_card *card = mixer->chip->card;
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 
 	private->monitor_other_updated = 1;
 
-	if (private->info->direct_monitor)
+	if (info->direct_monitor) {
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->direct_monitor_ctl->id);
+		return;
+	}
+
+	if (info->has_speaker_switching)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->speaker_switching_ctl->id);
+
+	/* if speaker switching was recently enabled or disabled,
+	 * invalidate the dim/mute and mux enum controls
+	 */
+	if (private->speaker_switching_switched) {
+		int i;
+
+		scarlett2_notify_dim_mute(mixer);
+
+		private->speaker_switching_switched = 0;
+		private->mux_updated = 1;
+
+		for (i = 0; i < private->num_mux_dsts; i++)
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &private->mux_ctls[i]->id);
+	}
 }
 
 /* Interrupt callback */
@@ -3461,6 +3690,11 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Create the speaker switching control */
+	err = scarlett2_add_speaker_switch_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.31.1

