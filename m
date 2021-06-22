Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82C3B0B13
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B221672;
	Tue, 22 Jun 2021 19:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B221672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381571;
	bh=DShmZevEwEeYro5hYDl4vzj1Fb6tHPol8gYIr4fQ6tk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8W7dvUKJROkb3To4xZRz8Z+hZneSC2WGeVMAULAYqEPc81vhRzm3mYPUeNBgIWwC
	 84RGvbx0VGuhgQ8ddvzwmrU2hwbbREeNRB/xG2tkfOwtrQq90453+vOouLL9v4kHht
	 CQRtVDQw81I+Q8KveJhzWZhZAMYmV/Oh/V60tzPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ECE2F804D6;
	Tue, 22 Jun 2021 19:03:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53242F804E3; Tue, 22 Jun 2021 19:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC76F80268
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC76F80268
Received: by m.b4.vu (Postfix, from userid 1000)
 id 90BEA61E286D; Wed, 23 Jun 2021 02:33:08 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:33:08 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 10/17] ALSA: usb-audio: scarlett2: Add direct monitor support
Message-ID: <61d23dc4feb3b046d870ad7203e66ff2bd1d278c.1624379707.git.g@b4.vu>
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

The Solo and 2i2 devices don't have a mixer but they do have a "direct
monitor" switch. Add support for getting and setting the state of this
switch.

Co-developed-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 161 ++++++++++++++++++++++++++++++--
 1 file changed, 154 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index bc4f29cfb2f3..2912854f64c1 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -48,7 +48,8 @@
  * Support for Solo/2i2 Gen 3 added in May 2021 (thanks to Alexander
  * Vorona for 2i2 protocol traces).
  *
- * Support for phantom power added in May 2021.
+ * Support for phantom power and direct monitoring added in May-June
+ * 2021.
  *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
@@ -56,7 +57,7 @@
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level, pad, and air controls
- *  - phantom power controls
+ *  - phantom power and direct monitor controls
  *  - disable/enable MSD mode
  *
  * <ditaa>
@@ -338,6 +339,11 @@ struct scarlett2_device_info {
 	/* the number of inputs each phantom switch controls */
 	u8 inputs_per_phantom;
 
+	/* the number of direct monitor options
+	 * (0 = none, 1 = mono only, 2 = mono/stereo)
+	 */
+	u8 direct_monitor;
+
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
@@ -365,6 +371,7 @@ struct scarlett2_data {
 	u8 sync_updated;
 	u8 vol_updated;
 	u8 input_other_updated;
+	u8 monitor_other_updated;
 	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
@@ -376,6 +383,7 @@ struct scarlett2_data {
 	u8 air_switch[SCARLETT2_AIR_SWITCH_MAX];
 	u8 phantom_switch[SCARLETT2_PHANTOM_SWITCH_MAX];
 	u8 phantom_persistence;
+	u8 direct_monitor_switch;
 	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
@@ -386,6 +394,7 @@ struct scarlett2_data {
 	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
 	struct snd_kcontrol *air_ctls[SCARLETT2_AIR_SWITCH_MAX];
 	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
+	struct snd_kcontrol *direct_monitor_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
 };
@@ -550,6 +559,7 @@ static const struct scarlett2_device_info solo_gen3_info = {
 	.air_input_count = 1,
 	.phantom_count = 1,
 	.inputs_per_phantom = 1,
+	.direct_monitor = 1,
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
@@ -560,6 +570,7 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 	.air_input_count = 2,
 	.phantom_count = 1,
 	.inputs_per_phantom = 2,
+	.direct_monitor = 2,
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
@@ -824,10 +835,11 @@ static int scarlett2_get_port_start_num(
 /*** USB Interactions ***/
 
 /* Notifications from the interface */
-#define SCARLETT2_USB_NOTIFY_SYNC        0x00000008
-#define SCARLETT2_USB_NOTIFY_DIM_MUTE    0x00200000
-#define SCARLETT2_USB_NOTIFY_MONITOR     0x00400000
-#define SCARLETT2_USB_NOTIFY_INPUT_OTHER 0x00800000
+#define SCARLETT2_USB_NOTIFY_SYNC          0x00000008
+#define SCARLETT2_USB_NOTIFY_DIM_MUTE      0x00200000
+#define SCARLETT2_USB_NOTIFY_MONITOR       0x00400000
+#define SCARLETT2_USB_NOTIFY_INPUT_OTHER   0x00800000
+#define SCARLETT2_USB_NOTIFY_MONITOR_OTHER 0x01000000
 
 /* Commands for sending/receiving requests/responses */
 #define SCARLETT2_USB_CMD_INIT 0
@@ -888,7 +900,8 @@ enum {
 	SCARLETT2_CONFIG_AIR_SWITCH = 7,
 	SCARLETT2_CONFIG_PHANTOM_SWITCH = 8,
 	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE = 9,
-	SCARLETT2_CONFIG_COUNT = 10
+	SCARLETT2_CONFIG_DIRECT_MONITOR = 10,
+	SCARLETT2_CONFIG_COUNT = 11
 };
 
 /* Location, size, and activation command number for the configuration
@@ -917,6 +930,9 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
 		.offset = 0x06, .size = 8, .activate = 3 },
 
+	[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+		.offset = 0x07, .size = 8, .activate = 4 },
+
 	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 		.offset = 0x08, .size = 1, .activate = 7 },
 
@@ -2270,6 +2286,112 @@ static const struct snd_kcontrol_new scarlett2_phantom_persistence_ctl = {
 	.put  = scarlett2_phantom_persistence_ctl_put,
 };
 
+/*** Direct Monitor Control ***/
+
+static int scarlett2_update_monitor_other(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	private->monitor_other_updated = 0;
+
+	if (info->direct_monitor)
+		return scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_DIRECT_MONITOR,
+			1, &private->direct_monitor_switch);
+
+	return 0;
+}
+
+static int scarlett2_direct_monitor_ctl_get(
+	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	mutex_lock(&private->data_mutex);
+	if (private->monitor_other_updated)
+		scarlett2_update_monitor_other(mixer);
+	ucontrol->value.enumerated.item[0] = private->direct_monitor_switch;
+	mutex_unlock(&private->data_mutex);
+
+	return 0;
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
+
+	if (!info->direct_monitor)
+		return 0;
+
+	return scarlett2_add_new_ctl(
+		mixer, &scarlett2_direct_monitor_ctl[info->direct_monitor - 1],
+		0, 1, "Direct Monitor Playback Switch",
+		&private->direct_monitor_ctl);
+}
+
 /*** Dim/Mute Controls ***/
 
 static int scarlett2_dim_mute_ctl_get(struct snd_kcontrol *kctl,
@@ -2988,6 +3110,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = scarlett2_update_monitor_other(mixer);
+	if (err < 0)
+		return err;
+
 	/* the rest of the configuration is for devices with a mixer */
 	if (!info->has_mixer)
 		return 0;
@@ -3129,6 +3255,20 @@ static void scarlett2_notify_input_other(
 			       &private->phantom_ctls[i]->id);
 }
 
+/* Notify on "monitor other" change (direct monitor) */
+static void scarlett2_notify_monitor_other(
+	struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	struct snd_card *card = mixer->chip->card;
+
+	private->monitor_other_updated = 1;
+
+	if (private->info->direct_monitor)
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &private->direct_monitor_ctl->id);
+}
+
 /* Interrupt callback */
 static void scarlett2_notify(struct urb *urb)
 {
@@ -3149,6 +3289,8 @@ static void scarlett2_notify(struct urb *urb)
 		scarlett2_notify_dim_mute(mixer);
 	if (data & SCARLETT2_USB_NOTIFY_INPUT_OTHER)
 		scarlett2_notify_input_other(mixer);
+	if (data & SCARLETT2_USB_NOTIFY_MONITOR_OTHER)
+		scarlett2_notify_monitor_other(mixer);
 
 requeue:
 	if (ustatus != -ENOENT &&
@@ -3255,6 +3397,11 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Create the direct monitor control */
+	err = scarlett2_add_direct_monitor_ctl(mixer);
+	if (err < 0)
+		return err;
+
 	/* Set up the interrupt polling */
 	err = scarlett2_init_notify(mixer);
 	if (err < 0)
-- 
2.31.1

