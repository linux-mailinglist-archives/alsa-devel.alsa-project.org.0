Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE03AF4AB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A89716D0;
	Mon, 21 Jun 2021 20:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A89716D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299307;
	bh=12jQKfA443lYWy0sdmIeoGqdkdS/mYMZZ4TQepsCntw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZsVL1wJQs0xBfnhOMFLri9UMZoRPyXZFBUe1I+svGKr+DZSU7Us+zONUsdRHwlVNr
	 5MWSZBuIlEEIf6JgJgeNWF4H//PmXyh4xv8jYsu/Wd+zTvB7XCiyeo19STmfDqzWor
	 J9SSaPlVd+Jj923wBIg38Yqb6pfek98aJF0pUTpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4CAF80526;
	Mon, 21 Jun 2021 20:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A79B2F80535; Mon, 21 Jun 2021 20:09:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34D88F80517
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D88F80517
Received: by m.b4.vu (Postfix, from userid 1000)
 id B24B961E287F; Tue, 22 Jun 2021 03:39:39 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:39 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 12/31] ALSA: usb-audio: scarlett2: Add mute support
Message-ID: <6fad82174b44633e46cfd96332a038de74d544f2.1624294591.git.g@b4.vu>
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

For each analogue output, in addition to the output volume (gain)
control, the hardware also has a mute control. Add ALSA mute controls
for each analogue output.

If the device has the line_out_hw_vol feature, then the mute control
is disabled along with the output volume control when the switch is
set to HW.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 170 +++++++++++++++++++++++++++-----
 1 file changed, 145 insertions(+), 25 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index e156119a21e8..d30f15d580b5 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -39,7 +39,7 @@
  * This ALSA mixer gives access to:
  *  - input, output, mixer-matrix muxes
  *  - 18x10 mixer-matrix gain stages
- *  - gain/volume controls
+ *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level and pad controls
  *
@@ -195,7 +195,11 @@ enum {
 };
 
 /* Dim/Mute buttons on the 18i20 */
-#define SCARLETT2_DIM_MUTE_COUNT 2
+enum {
+	SCARLETT2_BUTTON_MUTE    = 0,
+	SCARLETT2_BUTTON_DIM     = 1,
+	SCARLETT2_DIM_MUTE_COUNT = 2,
+};
 
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute", "Dim"
@@ -258,12 +262,14 @@ struct scarlett2_data {
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
 	u8 vol_sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
+	u8 mute_switch[SCARLETT2_ANALOGUE_MAX];
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
+	struct snd_kcontrol *mute_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
@@ -509,7 +515,8 @@ struct scarlett2_usb_volume_status {
 	/* actual volume of output inc. dim (-18dB) */
 	s16 hw_vol[SCARLETT2_ANALOGUE_MAX];
 
-	u8 pad2[SCARLETT2_ANALOGUE_MAX];
+	/* internal mute buttons */
+	u8 mute_switch[SCARLETT2_ANALOGUE_MAX];
 
 	/* sw (0) or hw (1) controlled */
 	u8 sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
@@ -524,10 +531,11 @@ struct scarlett2_usb_volume_status {
 enum {
 	SCARLETT2_CONFIG_DIM_MUTE = 0,
 	SCARLETT2_CONFIG_LINE_OUT_VOLUME = 1,
-	SCARLETT2_CONFIG_SW_HW_SWITCH = 2,
-	SCARLETT2_CONFIG_LEVEL_SWITCH = 3,
-	SCARLETT2_CONFIG_PAD_SWITCH = 4,
-	SCARLETT2_CONFIG_COUNT = 5
+	SCARLETT2_CONFIG_MUTE_SWITCH = 2,
+	SCARLETT2_CONFIG_SW_HW_SWITCH = 3,
+	SCARLETT2_CONFIG_LEVEL_SWITCH = 4,
+	SCARLETT2_CONFIG_PAD_SWITCH = 5,
+	SCARLETT2_CONFIG_COUNT = 6
 };
 
 /* Location, size, and activation command number for the configuration
@@ -547,6 +555,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
 		.offset = 0x34, .size = 2, .activate = 1 },
 
+	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+		.offset = 0x5c, .size = 1, .activate = 1 },
+
 	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
 		.offset = 0x66, .size = 1, .activate = 3 },
 
@@ -1197,6 +1208,7 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 	int num_line_out =
 		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
 	int err, i;
+	int mute;
 
 	private->vol_updated = 0;
 
@@ -1208,15 +1220,18 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 		volume_status.master_vol + SCARLETT2_VOLUME_BIAS,
 		0, SCARLETT2_VOLUME_BIAS);
 
-	for (i = 0; i < num_line_out; i++) {
-		if (private->vol_sw_hw_switch[i])
-			private->vol[i] = private->master_vol;
-	}
-
 	if (info->line_out_hw_vol)
 		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
 			private->dim_mute[i] = !!volume_status.dim_mute[i];
 
+	mute = private->dim_mute[SCARLETT2_BUTTON_MUTE];
+
+	for (i = 0; i < num_line_out; i++)
+		if (private->vol_sw_hw_switch[i]) {
+			private->vol[i] = private->master_vol;
+			private->mute_switch[i] = mute;
+		}
+
 	return 0;
 }
 
@@ -1321,6 +1336,55 @@ static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 	.tlv = { .p = db_scale_scarlett2_gain }
 };
 
+/*** Mute Switch Controls ***/
+
+static int scarlett2_mute_ctl_get(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+	int index = elem->control;
+
+	ucontrol->value.integer.value[0] = private->mute_switch[index];
+	return 0;
+}
+
+static int scarlett2_mute_ctl_put(struct snd_kcontrol *kctl,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+	int index = elem->control;
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->mute_switch[index];
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->mute_switch[index] = val;
+
+	/* Send mute change to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
+				       index, val);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_mute_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_mute_ctl_get,
+	.put  = scarlett2_mute_ctl_put,
+};
+
 /*** HW/SW Volume Switch Controls ***/
 
 static int scarlett2_sw_hw_enum_ctl_info(struct snd_kcontrol *kctl,
@@ -1348,18 +1412,26 @@ static void scarlett2_vol_ctl_set_writable(struct usb_mixer_interface *mixer,
 					   int index, int value)
 {
 	struct scarlett2_data *private = mixer->private_data;
+	struct snd_card *card = mixer->chip->card;
 
-	/* Set/Clear write bit */
-	if (value)
+	/* Set/Clear write bits */
+	if (value) {
 		private->vol_ctls[index]->vd[0].access |=
 			SNDRV_CTL_ELEM_ACCESS_WRITE;
-	else
+		private->mute_ctls[index]->vd[0].access |=
+			SNDRV_CTL_ELEM_ACCESS_WRITE;
+	} else {
 		private->vol_ctls[index]->vd[0].access &=
 			~SNDRV_CTL_ELEM_ACCESS_WRITE;
+		private->mute_ctls[index]->vd[0].access &=
+			~SNDRV_CTL_ELEM_ACCESS_WRITE;
+	}
 
 	/* Notify of write bit change */
-	snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_INFO,
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
 		       &private->vol_ctls[index]->id);
+	snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO,
+		       &private->mute_ctls[index]->id);
 }
 
 static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
@@ -1387,8 +1459,9 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	 */
 	scarlett2_vol_ctl_set_writable(mixer, index, !val);
 
-	/* Reset volume to master volume */
+	/* Reset volume/mute to master volume/mute */
 	private->vol[index] = private->master_vol;
+	private->mute_switch[index] = private->dim_mute[SCARLETT2_BUTTON_MUTE];
 
 	/* Set SW volume to current HW volume */
 	err = scarlett2_usb_set_config(
@@ -1397,6 +1470,13 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	if (err < 0)
 		goto unlock;
 
+	/* Set SW mute to current HW mute */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
+		index, private->dim_mute[SCARLETT2_BUTTON_MUTE]);
+	if (err < 0)
+		goto unlock;
+
 	/* Send SW/HW switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
 				       index, val);
@@ -1554,9 +1634,13 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_ports *ports = info->ports;
+	int num_line_out =
+		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
 
 	int index = elem->control;
-	int oval, val, err = 0;
+	int oval, val, err = 0, i;
 
 	mutex_lock(&private->data_mutex);
 
@@ -1574,6 +1658,15 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 	if (err == 0)
 		err = 1;
 
+	if (index == SCARLETT2_BUTTON_MUTE)
+		for (i = 0; i < num_line_out; i++)
+			if (private->vol_sw_hw_switch[i]) {
+				private->mute_switch[i] = val;
+				snd_ctl_notify(mixer->chip->card,
+					       SNDRV_CTL_EVENT_MASK_INFO,
+					       &private->mute_ctls[i]->id);
+			}
+
 unlock:
 	mutex_unlock(&private->data_mutex);
 	return err;
@@ -1627,7 +1720,20 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 
-		/* Make the fader read-only if the SW/HW switch is set to HW */
+		/* Mute Switch */
+		snprintf(s, sizeof(s),
+			 "Line %02d Mute Playback Switch",
+			 i + 1);
+		err = scarlett2_add_new_ctl(mixer,
+					    &scarlett2_mute_ctl,
+					    i, 1, s,
+					    &private->mute_ctls[i]);
+		if (err < 0)
+			return err;
+
+		/* Make the fader and mute controls read-only if the
+		 * SW/HW switch is set to HW
+		 */
 		if (private->vol_sw_hw_switch[i])
 			scarlett2_vol_ctl_set_writable(mixer, i, 0);
 
@@ -2109,12 +2215,16 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	if (info->line_out_hw_vol)
+		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
+			private->dim_mute[i] = !!volume_status.dim_mute[i];
+
 	private->master_vol = clamp(
 		volume_status.master_vol + SCARLETT2_VOLUME_BIAS,
 		0, SCARLETT2_VOLUME_BIAS);
 
 	for (i = 0; i < num_line_out; i++) {
-		int volume;
+		int volume, mute;
 
 		private->vol_sw_hw_switch[i] =
 			info->line_out_hw_vol
@@ -2126,11 +2236,12 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		volume = clamp(volume + SCARLETT2_VOLUME_BIAS,
 			       0, SCARLETT2_VOLUME_BIAS);
 		private->vol[i] = volume;
-	}
 
-	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
-			private->dim_mute[i] = !!volume_status.dim_mute[i];
+		mute = private->vol_sw_hw_switch[i]
+			 ? private->dim_mute[SCARLETT2_BUTTON_MUTE]
+			 : volume_status.mute_switch[i];
+		private->mute_switch[i] = mute;
+	}
 
 	for (i = 0; i < num_mixer_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
@@ -2185,8 +2296,12 @@ static void scarlett2_notify_monitor(
 static void scarlett2_notify_dim_mute(
 	struct usb_mixer_interface *mixer)
 {
+	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_ports *ports = info->ports;
+	int num_line_out =
+		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
 	int i;
 
 	private->vol_updated = 1;
@@ -2195,8 +2310,13 @@ static void scarlett2_notify_dim_mute(
 		return;
 
 	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
-		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->dim_mute_ctls[i]->id);
+
+	for (i = 0; i < num_line_out; i++)
+		if (private->vol_sw_hw_switch[i])
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &private->mute_ctls[i]->id);
 }
 
 /* Interrupt callback */
-- 
2.31.1

