Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC53B0B10
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4ECA166F;
	Tue, 22 Jun 2021 19:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4ECA166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381527;
	bh=yjaAXGMGdUTCVlfLPhzELS0zy9TQYPT0XEfZEiR4H/o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xu4iZgm/VRFr53911qL0gbIqELvrtbSKznfLZWfnm0jJE4awlK3vwPD5MhMahDSi0
	 jMPMyC+y0/rETTEFV9lNc5JoAXBr0V4jLksHv1YsE8zd3W/QqEgyczV2HZjBa4ylf5
	 XdMs/TR+CjxVCA3UfCaHJ7bkmU6WSxmC5uTKpgNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16598F804F3;
	Tue, 22 Jun 2021 19:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E849F804FE; Tue, 22 Jun 2021 19:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E63FEF804F3
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E63FEF804F3
Received: by m.b4.vu (Postfix, from userid 1000)
 id 7487F61E286F; Wed, 23 Jun 2021 02:32:36 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:32:36 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 08/17] ALSA: usb-audio: scarlett2: Add "air" switch support
Message-ID: <44d448a4150b9c068754759c9fdd2bfe21484487.1624379707.git.g@b4.vu>
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

Some inputs on Gen 3 models have an "air" feature which can be enabled
from the driver or (model-dependent) from the front panel. Add support
for getting and setting the state of those switches.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 106 ++++++++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 0a56211a65ab..696d9703436a 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -53,7 +53,7 @@
  *  - mixer-matrix gain stages
  *  - gain/volume/mute controls
  *  - level meters
- *  - line/inst level and pad controls
+ *  - line/inst level, pad, and air controls
  *  - disable/enable MSD mode
  *
  * <ditaa>
@@ -173,6 +173,7 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of level and pad switches */
 #define SCARLETT2_LEVEL_SWITCH_MAX 2
 #define SCARLETT2_PAD_SWITCH_MAX 8
+#define SCARLETT2_AIR_SWITCH_MAX 8
 
 /* Maximum number of inputs to the mixer */
 #define SCARLETT2_INPUT_MIX_MAX 25
@@ -322,6 +323,11 @@ struct scarlett2_device_info {
 	 */
 	u8 pad_input_count;
 
+	/* the number of analogue inputs with a software switchable
+	 * "air" control
+	 */
+	u8 air_input_count;
+
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
@@ -357,6 +363,7 @@ struct scarlett2_data {
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
+	u8 air_switch[SCARLETT2_AIR_SWITCH_MAX];
 	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -365,6 +372,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
 	struct snd_kcontrol *level_ctls[SCARLETT2_LEVEL_SWITCH_MAX];
 	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
+	struct snd_kcontrol *air_ctls[SCARLETT2_AIR_SWITCH_MAX];
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -526,6 +534,7 @@ static const struct scarlett2_device_info solo_gen3_info = {
 	.has_msd_mode = 1,
 	.level_input_count = 1,
 	.level_input_first = 1,
+	.air_input_count = 1,
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
@@ -533,6 +542,7 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 
 	.has_msd_mode = 1,
 	.level_input_count = 2,
+	.air_input_count = 2,
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
@@ -542,6 +552,7 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
+	.air_input_count = 2,
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -585,6 +596,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
+	.air_input_count = 2,
 
 	.line_out_descrs = {
 		"Headphones 1 L",
@@ -636,6 +648,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
+	.air_input_count = 4,
 
 	.line_out_descrs = {
 		"Monitor L",
@@ -699,6 +712,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 8,
+	.air_input_count = 8,
 
 	.line_out_descrs = {
 		"Monitor 1 L",
@@ -846,7 +860,8 @@ enum {
 	SCARLETT2_CONFIG_LEVEL_SWITCH = 4,
 	SCARLETT2_CONFIG_PAD_SWITCH = 5,
 	SCARLETT2_CONFIG_MSD_SWITCH = 6,
-	SCARLETT2_CONFIG_COUNT = 7
+	SCARLETT2_CONFIG_AIR_SWITCH = 7,
+	SCARLETT2_CONFIG_COUNT = 8
 };
 
 /* Location, size, and activation command number for the configuration
@@ -872,6 +887,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 		.offset = 0x08, .size = 1, .activate = 7 },
 
+	[SCARLETT2_CONFIG_AIR_SWITCH] = {
+		.offset = 0x09, .size = 1, .activate = 8 },
+
 /* Devices with a mixer (Gen 2 and all other Gen 3) */
 }, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
@@ -892,6 +910,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_PAD_SWITCH] = {
 		.offset = 0x84, .size = 8, .activate = 8 },
 
+	[SCARLETT2_CONFIG_AIR_SWITCH] = {
+		.offset = 0x8c, .size = 8, .activate = 8 },
+
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
 		.offset = 0x9d, .size = 8, .activate = 6 },
 } };
@@ -1100,9 +1121,7 @@ static void scarlett2_config_save_work(struct work_struct *work)
 	scarlett2_config_save(private->mixer);
 }
 
-/* Send a USB message to set a configuration parameter (volume level,
- * sw/hw volume switch, line/inst level switch, or pad switch)
- */
+/* Send a USB message to set a SCARLETT2_CONFIG_* parameter */
 static int scarlett2_usb_set_config(
 	struct usb_mixer_interface *mixer,
 	int config_item_num, int index, int value)
@@ -1900,6 +1919,14 @@ static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	if (info->air_input_count) {
+		int err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_AIR_SWITCH,
+			info->air_input_count, private->air_switch);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -2030,6 +2057,61 @@ static const struct snd_kcontrol_new scarlett2_pad_ctl = {
 	.put  = scarlett2_pad_ctl_put,
 };
 
+/*** Air Switch Controls ***/
+
+static int scarlett2_air_ctl_get(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->input_other_updated)
+		scarlett2_update_input_other(mixer);
+	ucontrol->value.integer.value[0] = private->air_switch[elem->control];
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
+}
+
+static int scarlett2_air_ctl_put(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
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
+	oval = private->air_switch[index];
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->air_switch[index] = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_AIR_SWITCH,
+				       index, val);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_air_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_air_ctl_get,
+	.put  = scarlett2_air_ctl_put,
+};
+
 /*** Dim/Mute Controls ***/
 
 static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
@@ -2213,6 +2295,15 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Add input air controls */
+	for (i = 0; i < info->air_input_count; i++) {
+		snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
+		err = scarlett2_add_new_ctl(mixer, &scarlett2_air_ctl,
+					    i, 1, s, &private->air_ctls[i]);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -2821,7 +2912,7 @@ static void scarlett2_notify_dim_mute(
 				       &private->mute_ctls[i]->id);
 }
 
-/* Notify on "input other" change (level/pad) */
+/* Notify on "input other" change (level/pad/air) */
 static void scarlett2_notify_input_other(
 	struct usb_mixer_interface *mixer)
 {
@@ -2838,6 +2929,9 @@ static void scarlett2_notify_input_other(
 	for (i = 0; i < info->pad_input_count; i++)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &private->pad_ctls[i]->id);
+	for (i = 0; i < info->air_input_count; i++)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->air_ctls[i]->id);
 }
 
 /* Interrupt callback */
-- 
2.31.1

