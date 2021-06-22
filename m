Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF73B0B09
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 597D7168A;
	Tue, 22 Jun 2021 19:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 597D7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381438;
	bh=uy53UBSqK93zjTXxC1JwL9rGXDuCEmtuJWEU02y4JSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vqgTFfkabVFJgnrITEIBRU355UYCWkb4/Kt2c2/ajoiY96GztSf0zny9oJbtJpkYn
	 uwBcFIP/sv9ZUuT0+DSgVj/t5z99Fhpm6Tt179O/9usBCFUvNCw51ZId7xNLVfIRj/
	 l1+1L3n02gQ0kxEZyMcYNFnZAJOgJL8yTCepeYrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCB7F804E5;
	Tue, 22 Jun 2021 19:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF61F804E5; Tue, 22 Jun 2021 19:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2620BF804D8
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2620BF804D8
Received: by m.b4.vu (Postfix, from userid 1000)
 id A58D261E286D; Wed, 23 Jun 2021 02:31:52 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:31:52 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 04/17] ALSA: usb-audio: scarlett2: Add Gen 3 MSD mode switch
Message-ID: <1cb93bbe585f6b0a74f5dc27450bc87e1f3776dc.1624379707.git.g@b4.vu>
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

Add a control to disable the Gen 3 MSD mode so that the full
functionality of the device is available. Don't create the other
controls until MSD mode is disabled.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 120 +++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 06454d4e58bf..f35420369042 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -44,12 +44,13 @@
  * interface during driver initialisation added in May 2021 (thanks to
  * Vladimir Sadovnikov for figuring out how).
  *
- * This ALSA mixer gives access to:
+ * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level and pad controls
+ *  - disable/enable MSD mode
  *
  * <ditaa>
  *    /--------------\    18chn            20chn     /--------------\
@@ -102,6 +103,14 @@
  *  \--------------/
  * </ditaa>
  *
+ * Gen 3 devices have a Mass Storage Device (MSD) mode where a small
+ * disk with registration and driver download information is presented
+ * to the host. To access the full functionality of the device without
+ * proprietary software, MSD mode can be disabled by:
+ * - holding down the 48V button for five seconds while powering on
+ *   the device, or
+ * - using this driver and alsamixer to change the "MSD Mode" setting
+ *   to Off and power-cycling the device
  */
 
 #include <linux/slab.h>
@@ -120,6 +129,9 @@
 /* device_setup value to enable */
 #define SCARLETT2_ENABLE 0x01
 
+/* device_setup value to allow turning MSD mode back on */
+#define SCARLETT2_MSD_ENABLE 0x02
+
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
 
@@ -279,6 +291,12 @@ struct scarlett2_mux_entry {
 struct scarlett2_device_info {
 	u32 usb_id; /* USB device identifier */
 
+	/* Gen 3 devices have an internal MSD mode switch that needs
+	 * to be disabled in order to access the full functionality of
+	 * the device.
+	 */
+	u8 has_msd_mode;
+
 	/* line out hw volume is sw controlled */
 	u8 line_out_hw_vol;
 
@@ -327,6 +345,7 @@ struct scarlett2_data {
 	u8 level_switch[SCARLETT2_LEVEL_SWITCH_MAX];
 	u8 pad_switch[SCARLETT2_PAD_SWITCH_MAX];
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
+	u8 msd_switch;
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
@@ -489,6 +508,7 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 static const struct scarlett2_device_info s4i4_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8212),
 
+	.has_msd_mode = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -530,6 +550,7 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 static const struct scarlett2_device_info s8i6_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8213),
 
+	.has_msd_mode = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -578,6 +599,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 static const struct scarlett2_device_info s18i8_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8214),
 
+	.has_msd_mode = 1,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -639,6 +661,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 static const struct scarlett2_device_info s18i20_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8215),
 
+	.has_msd_mode = 1,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 8,
@@ -786,7 +809,8 @@ enum {
 	SCARLETT2_CONFIG_SW_HW_SWITCH = 3,
 	SCARLETT2_CONFIG_LEVEL_SWITCH = 4,
 	SCARLETT2_CONFIG_PAD_SWITCH = 5,
-	SCARLETT2_CONFIG_COUNT = 6
+	SCARLETT2_CONFIG_MSD_SWITCH = 6,
+	SCARLETT2_CONFIG_COUNT = 7
 };
 
 /* Location, size, and activation command number for the configuration
@@ -817,6 +841,9 @@ static const struct scarlett2_config
 
 	[SCARLETT2_CONFIG_PAD_SWITCH] = {
 		.offset = 0x84, .size = 1, .activate = 8 },
+
+	[SCARLETT2_CONFIG_MSD_SWITCH] = {
+		.offset = 0x9d, .size = 1, .activate = 6 },
 };
 
 /* proprietary request/response format */
@@ -1016,7 +1043,8 @@ static int scarlett2_usb_set_config(
 		return err;
 
 	/* Schedule the change to be written to NVRAM */
-	schedule_delayed_work(&private->work, msecs_to_jiffies(2000));
+	if (config_item->activate != SCARLETT2_USB_CONFIG_SAVE)
+		schedule_delayed_work(&private->work, msecs_to_jiffies(2000));
 
 	return 0;
 }
@@ -2351,6 +2379,71 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 				     "Level Meter", NULL);
 }
 
+/*** MSD Controls ***/
+
+static int scarlett2_msd_ctl_get(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct scarlett2_data *private = elem->head.mixer->private_data;
+
+	ucontrol->value.integer.value[0] = private->msd_switch;
+	return 0;
+}
+
+static int scarlett2_msd_ctl_put(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
+
+	int oval, val, err = 0;
+
+	mutex_lock(&private->data_mutex);
+
+	oval = private->msd_switch;
+	val = !!ucontrol->value.integer.value[0];
+
+	if (oval == val)
+		goto unlock;
+
+	private->msd_switch = val;
+
+	/* Send switch change to the device */
+	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_MSD_SWITCH,
+				       0, val);
+
+unlock:
+	mutex_unlock(&private->data_mutex);
+	return err;
+}
+
+static const struct snd_kcontrol_new scarlett2_msd_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "",
+	.info = snd_ctl_boolean_mono_info,
+	.get  = scarlett2_msd_ctl_get,
+	.put  = scarlett2_msd_ctl_put,
+};
+
+static int scarlett2_add_msd_ctl(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	if (!info->has_msd_mode)
+		return 0;
+
+	/* If MSD mode is off, hide the switch by default */
+	if (!private->msd_switch && !(mixer->chip->setup & SCARLETT2_MSD_ENABLE))
+		return 0;
+
+	/* Add MSD control */
+	return scarlett2_add_new_ctl(mixer, &scarlett2_msd_ctl,
+				     0, 1, "MSD Mode", NULL);
+}
+
 /*** Cleanup/Suspend Callbacks ***/
 
 static void scarlett2_private_free(struct usb_mixer_interface *mixer)
@@ -2488,6 +2581,18 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
+	if (info->has_msd_mode) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_MSD_SWITCH,
+			1, &private->msd_switch);
+		if (err < 0)
+			return err;
+
+		/* no other controls are created if MSD mode is on */
+		if (private->msd_switch)
+			return 0;
+	}
+
 	err = scarlett2_update_input_other(mixer);
 	if (err < 0)
 		return err;
@@ -2710,6 +2815,15 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* Create the MSD control */
+	err = scarlett2_add_msd_ctl(mixer);
+	if (err < 0)
+		return err;
+
+	/* If MSD mode is enabled, don't create any other controls */
+	if (((struct scarlett2_data *)mixer->private_data)->msd_switch)
+		return 0;
+
 	/* Create the analogue output controls */
 	err = scarlett2_add_line_out_ctls(mixer);
 	if (err < 0)
-- 
2.31.1

