Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7B3B0B11
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F5A166B;
	Tue, 22 Jun 2021 19:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F5A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381545;
	bh=W28cl9AYmaGHLqW8is47jipNJPsznQ1iAvxRadPUjm0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pU3yv/R2AuYX7S2LvqSbQ/+xGOTZYQnZH+IqIG5WCmOKhPMse8JfDAg8xdNB74vYP
	 ovgrrBQad1FrK7p5AX996t669DePSU46nq6nvg6PppBTSq0E7akjwyzb1rshXIlnfh
	 w/qjp/DPdYrlvbIYIMec9NxcPrWZnDzIB/py+rmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D884CF80507;
	Tue, 22 Jun 2021 19:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B32D3F804FF; Tue, 22 Jun 2021 19:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28C50F80506
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C50F80506
Received: by m.b4.vu (Postfix, from userid 1000)
 id A91AB61E287C; Wed, 23 Jun 2021 02:32:40 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:32:40 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/17] ALSA: usb-audio: scarlett2: Add phantom power switch
 support
Message-ID: <5837ce8a8c686560fc8f40b4204dd2a10721869b.1624379707.git.g@b4.vu>
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

Some inputs on Gen 3 models support software-selectable phantom power.
Add support for getting and setting the state of those switches and
the "Phantom Power Persistence" switch.

Co-developed-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 197 +++++++++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 696d9703436a..bc4f29cfb2f3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -48,12 +48,15 @@
  * Support for Solo/2i2 Gen 3 added in May 2021 (thanks to Alexander
  * Vorona for 2i2 protocol traces).
  *
+ * Support for phantom power added in May 2021.
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level, pad, and air controls
+ *  - phantom power controls
  *  - disable/enable MSD mode
  *
  * <ditaa>
@@ -174,6 +177,7 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 #define SCARLETT2_LEVEL_SWITCH_MAX 2
 #define SCARLETT2_PAD_SWITCH_MAX 8
 #define SCARLETT2_AIR_SWITCH_MAX 8
+#define SCARLETT2_PHANTOM_SWITCH_MAX 2
 
 /* Maximum number of inputs to the mixer */
 #define SCARLETT2_INPUT_MIX_MAX 25
@@ -328,6 +332,12 @@ struct scarlett2_device_info {
 	 */
 	u8 air_input_count;
 
+	/* the number of phantom (48V) software switchable controls */
+	u8 phantom_count;
+
+	/* the number of inputs each phantom switch controls */
+	u8 inputs_per_phantom;
+
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
@@ -364,6 +374,8 @@ struct scarlett2_data {
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
 	u8 air_switch[SCARLETT2_AIR_SWITCH_MAX];
+	u8 phantom_switch[SCARLETT2_PHANTOM_SWITCH_MAX];
+	u8 phantom_persistence;
 	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -373,6 +385,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *level_ctls[SCARLETT2_LEVEL_SWITCH_MAX];
 	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
 	struct snd_kcontrol *air_ctls[SCARLETT2_AIR_SWITCH_MAX];
+	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -535,6 +548,8 @@ static const struct scarlett2_device_info solo_gen3_info = {
 	.level_input_count = 1,
 	.level_input_first = 1,
 	.air_input_count = 1,
+	.phantom_count = 1,
+	.inputs_per_phantom = 1,
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
@@ -543,6 +558,8 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 	.has_msd_mode = 1,
 	.level_input_count = 2,
 	.air_input_count = 2,
+	.phantom_count = 1,
+	.inputs_per_phantom = 2,
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
@@ -553,6 +570,8 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
+	.phantom_count = 1,
+	.inputs_per_phantom = 2,
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -597,6 +616,8 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
+	.phantom_count = 1,
+	.inputs_per_phantom = 2,
 
 	.line_out_descrs = {
 		"Headphones 1 L",
@@ -649,6 +670,8 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 4,
+	.phantom_count = 2,
+	.inputs_per_phantom = 2,
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -713,6 +736,8 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.level_input_count = 2,
 	.pad_input_count = 8,
 	.air_input_count = 8,
+	.phantom_count = 2,
+	.inputs_per_phantom = 4,
 
 	.line_out_descrs = {
 		"Monitor 1 L",
@@ -861,7 +886,9 @@ enum {
 	SCARLETT2_CONFIG_PAD_SWITCH = 5,
 	SCARLETT2_CONFIG_MSD_SWITCH = 6,
 	SCARLETT2_CONFIG_AIR_SWITCH = 7,
-	SCARLETT2_CONFIG_COUNT = 8
+	SCARLETT2_CONFIG_PHANTOM_SWITCH = 8,
+	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 9,
+	SCARLETT2_CONFIG_COUNT = 10
 };
 
 /* Location, size, and activation command number for the configuration
@@ -884,6 +911,12 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
 		.offset = 0x04, .size = 8, .activate = 6 },
 
+	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+		.offset = 0x05, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+		.offset = 0x06, .size = 8, .activate = 3 },
+
 	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 		.offset = 0x08, .size = 1, .activate = 7 },
 
@@ -913,8 +946,14 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_AIR_SWITCH] = {
 		.offset = 0x8c, .size = 8, .activate = 8 },
 
+	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+		.offset = 0x9c, .size = 1, .activate = 8 },
+
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
 		.offset = 0x9d, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+		.offset = 0x9e, .size = 8, .activate = 6 },
 } };
 
 /* proprietary request/response format */
@@ -1927,6 +1966,20 @@ static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	if (info->phantom_count) {
+		int err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
+			info->phantom_count, private->phantom_switch);
+		if (err < 0)
+			return err;
+
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+			1, &private->phantom_persistence);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -2112,6 +2165,111 @@ static const struct snd_kcontrol_new scarlett2_air_ctl = {
 	.put  = scarlett2_air_ctl_put,
 };
 
+/*** Phantom Switch Controls ***/
+
+static int scarlett2_phantom_ctl_get(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->input_other_updated)
+		scarlett2_update_input_other(mixer);
+	ucontrol->value.integer.value[0] =
+		private->phantom_switch[elem->control];
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
+}
+
+static int scarlett2_phantom_ctl_put(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *ucontrol)
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
+	oval = private->phantom_switch[index];
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->phantom_switch[index] = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PHANTOM_SWITCH,
+				       index, val);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_phantom_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_phantom_ctl_get,
+	.put  = scarlett2_phantom_ctl_put,
+};
+
+/*** Phantom Persistence Control ***/
+
+static int scarlett2_phantom_persistence_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->phantom_persistence;
+	return 0;
+}
+
+static int scarlett2_phantom_persistence_ctl_put(
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
+	oval = private->phantom_persistence;
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->phantom_persistence = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(
+		mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE, index, val);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_phantom_persistence_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_phantom_persistence_ctl_get,
+	.put  = scarlett2_phantom_persistence_ctl_put,
+};
+
 /*** Dim/Mute Controls ***/
 
 static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
@@ -2275,6 +2433,7 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	const char *fmt = "Line In %d %s Capture %s";
+	const char *fmt2 = "Line In %d-%d %s Capture %s";
 
 	/* Add input level (line/inst) controls */
 	for (i = 0; i < info->level_input_count; i++) {
@@ -2304,6 +2463,39 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Add input phantom controls */
+	if (info->inputs_per_phantom == 1) {
+		for (i = 0; i < info->phantom_count; i++) {
+			snprintf(s, sizeof(s), fmt, i + 1,
+				 "Phantom Power", "Switch");
+			err = scarlett2_add_new_ctl(
+				mixer, &scarlett2_phantom_ctl,
+				i, 1, s, &private->phantom_ctls[i]);
+			if (err < 0)
+				return err;
+		}
+	} else if (info->inputs_per_phantom > 1) {
+		for (i = 0; i < info->phantom_count; i++) {
+			int from = i * info->inputs_per_phantom + 1;
+			int to = (i + 1) * info->inputs_per_phantom;
+
+			snprintf(s, sizeof(s), fmt2, from, to,
+				 "Phantom Power", "Switch");
+			err = scarlett2_add_new_ctl(
+				mixer, &scarlett2_phantom_ctl,
+				i, 1, s, &private->phantom_ctls[i]);
+			if (err < 0)
+				return err;
+		}
+	}
+	if (info->phantom_count) {
+		err = scarlett2_add_new_ctl(
+			mixer, &scarlett2_phantom_persistence_ctl, 0, 1,
+			"Phantom Power Persistence Capture Switch", NULL);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -2932,6 +3124,9 @@ static void scarlett2_notify_input_other(
 	for (i = 0; i < info->air_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->air_ctls[i]->id);
+	for (i = 0; i < info->phantom_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->phantom_ctls[i]->id);
 }
 
 /* Interrupt callback */
-- 
2.31.1

