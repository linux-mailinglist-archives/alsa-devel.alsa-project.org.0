Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2743AF4D7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1D6C1753;
	Mon, 21 Jun 2021 20:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1D6C1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299660;
	bh=xKvOQGQII0mrhClzRN1dR/lzrnubjvu1R7rMjJEbDpU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hrAe9Zyq+eJGvmLoOFOgzoiSGEwrEi1e8hDjYKwbyP7LTGku2nStOMQV1+2HGwfea
	 RKZyGwgpbpiZOjeEF24dMFgY2ST3nnNMMNu4H3s0SzYkieXnKsGn7wZjoKvIRz8czl
	 EAQRnx7zFpuEGMETaWid/YMqEJJVjdq5ssHKeNAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B93F805DF;
	Mon, 21 Jun 2021 20:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1410CF805C5; Mon, 21 Jun 2021 20:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D2D6F80570
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D2D6F80570
Received: by m.b4.vu (Postfix, from userid 1000)
 id F2E5561E5F01; Tue, 22 Jun 2021 03:39:58 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:58 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 21/31] ALSA: usb-audio: scarlett2: Add support for Solo and
 2i2 Gen 3
Message-ID: <67c4ef3ef9fff1f89a7de60fbeb0fceb2d0b3561.1624294591.git.g@b4.vu>
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

Add initial support for the Focusrite Scarlett Solo and 2i2 devices:
- They have no mixer
- They don't support reporting sync status or levels
- The configuration space is laid out differently to the other models
- There is no level (line/inst) switch on input 1 of the Solo

Co-developed-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_quirks.c        |  2 +
 sound/usb/mixer_scarlett_gen2.c | 94 ++++++++++++++++++++++++++++-----
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index df7492594e91..0a3cb8fd7d00 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3060,6 +3060,8 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8203): /* Focusrite Scarlett 6i6 2nd Gen */
 	case USB_ID(0x1235, 0x8204): /* Focusrite Scarlett 18i8 2nd Gen */
 	case USB_ID(0x1235, 0x8201): /* Focusrite Scarlett 18i20 2nd Gen */
+	case USB_ID(0x1235, 0x8211): /* Focusrite Scarlett Solo 3rd Gen */
+	case USB_ID(0x1235, 0x8210): /* Focusrite Scarlett 2i2 3rd Gen */
 	case USB_ID(0x1235, 0x8212): /* Focusrite Scarlett 4i4 3rd Gen */
 	case USB_ID(0x1235, 0x8213): /* Focusrite Scarlett 8i6 3rd Gen */
 	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 45b28585dacb..50a90693482f 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -4,9 +4,10 @@
  *
  *   Supported models:
  *   - 6i6/18i8/18i20 Gen 2
- *   - 4i4/8i6/18i8/18i20 Gen 3
+ *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
  *
  *   Copyright (c) 2018-2021 by Geoffrey D. Bennett <g at b4.vu>
+ *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
  *
  *   Based on the Scarlett (Gen 1) Driver for ALSA:
  *
@@ -44,6 +45,9 @@
  * interface during driver initialisation added in May 2021 (thanks to
  * Vladimir Sadovnikov for figuring out how).
  *
+ * Support for Solo/2i2 Gen 3 added in May 2021 (thanks to Alexander
+ * Vorona for 2i2 protocol traces).
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -297,6 +301,11 @@ struct scarlett2_device_info {
 	 */
 	u8 has_msd_mode;
 
+	/* Gen 3 devices without a mixer have a different
+	 * configuration set
+	 */
+	u8 has_mixer;
+
 	/* line out hw volume is sw controlled */
 	u8 line_out_hw_vol;
 
@@ -305,6 +314,9 @@ struct scarlett2_device_info {
 	 */
 	u8 level_input_count;
 
+	/* the first input with a level control (0-based) */
+	u8 level_input_first;
+
 	/* the number of analogue inputs with a software switchable
 	 * 10dB pad control
 	 */
@@ -362,6 +374,7 @@ struct scarlett2_data {
 static const struct scarlett2_device_info s6i6_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8203),
 
+	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -407,6 +420,7 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 static const struct scarlett2_device_info s18i8_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8204),
 
+	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 4,
 
@@ -455,6 +469,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 static const struct scarlett2_device_info s18i20_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8201),
 
+	.has_mixer = 1,
 	.line_out_hw_vol = 1,
 
 	.line_out_descrs = {
@@ -505,10 +520,26 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 	} },
 };
 
+static const struct scarlett2_device_info solo_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8211),
+
+	.has_msd_mode = 1,
+	.level_input_count = 1,
+	.level_input_first = 1,
+};
+
+static const struct scarlett2_device_info s2i2_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8210),
+
+	.has_msd_mode = 1,
+	.level_input_count = 2,
+};
+
 static const struct scarlett2_device_info s4i4_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8212),
 
 	.has_msd_mode = 1,
+	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -551,6 +582,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8213),
 
 	.has_msd_mode = 1,
+	.has_mixer = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -600,6 +632,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8214),
 
 	.has_msd_mode = 1,
+	.has_mixer = 1,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -662,6 +695,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8215),
 
 	.has_msd_mode = 1,
+	.has_mixer = 1,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.pad_input_count = 8,
@@ -724,6 +758,8 @@ static const struct scarlett2_device_info *scarlett2_devices[] = {
 	&s18i20_gen2_info,
 
 	/* Supported Gen 3 devices */
+	&solo_gen3_info,
+	&s2i2_gen3_info,
 	&s4i4_gen3_info,
 	&s8i6_gen3_info,
 	&s18i8_gen3_info,
@@ -776,7 +812,7 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_VOLUME_STATUS_OFFSET 0x31
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
-/* volume status is read together (matches scarlett2_config_items[]) */
+/* volume status is read together (matches scarlett2_config_items[1]) */
 struct scarlett2_usb_volume_status {
 	/* dim/mute buttons */
 	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
@@ -822,8 +858,22 @@ struct scarlett2_config {
 	u8 activate;
 };
 
+/* scarlett2_config_items[0] is for devices without a mixer
+ * scarlett2_config_items[1] is for devices with a mixer
+ */
 static const struct scarlett2_config
-		scarlett2_config_items[SCARLETT2_CONFIG_COUNT] = {
+	scarlett2_config_items[2][SCARLETT2_CONFIG_COUNT] =
+
+/* Devices without a mixer (Solo and 2i2 Gen 3) */
+{ {
+	[SCARLETT2_CONFIG_MSD_SWITCH] = {
+		.offset = 0x04, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+		.offset = 0x08, .size = 1, .activate = 7 },
+
+/* Devices with a mixer (Gen 2 and all other Gen 3) */
+}, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
 		.offset = 0x31, .size = 8, .activate = 2 },
 
@@ -844,7 +894,7 @@ static const struct scarlett2_config
 
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
 		.offset = 0x9d, .size = 8, .activate = 6 },
-};
+} };
 
 /* proprietary request/response format */
 struct scarlett2_usb_packet {
@@ -1006,8 +1056,10 @@ static int scarlett2_usb_get_config(
 	struct usb_mixer_interface *mixer,
 	int config_item_num, int count, void *buf)
 {
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-		&scarlett2_config_items[config_item_num];
+		&scarlett2_config_items[info->has_mixer][config_item_num];
 	int size, err, i;
 	u8 value;
 
@@ -1055,8 +1107,10 @@ static int scarlett2_usb_set_config(
 	struct usb_mixer_interface *mixer,
 	int config_item_num, int index, int value)
 {
+	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-	       &scarlett2_config_items[config_item_num];
+	       &scarlett2_config_items[info->has_mixer][config_item_num];
 	struct {
 		__le32 offset;
 		__le32 bytes;
@@ -1065,7 +1119,6 @@ static int scarlett2_usb_set_config(
 	__le32 req2;
 	int offset, size;
 	int err;
-	struct scarlett2_data *private = mixer->private_data;
 
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
@@ -1506,6 +1559,10 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
+	/* devices without a mixer also don't support reporting sync status */
+	if (!private->info->has_mixer)
+		return 0;
+
 	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
 				     0, 1, "Sync Status", &private->sync_ctl);
 }
@@ -1824,7 +1881,8 @@ static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
 	if (info->level_input_count) {
 		int err = scarlett2_usb_get_config(
 			mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
-			info->level_input_count, private->level_switch);
+			info->level_input_count + info->level_input_first,
+			private->level_switch);
 		if (err < 0)
 			return err;
 	}
@@ -1856,12 +1914,14 @@ static int scarlett2_level_enum_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
+
+	int index = elem->control + info->level_input_first;
 
 	mutex_lock(&private->data_mutex);
 	if (private->input_other_updated)
 		scarlett2_update_input_other(mixer);
-	ucontrol->value.enumerated.item[0] =
-		private->level_switch[elem->control];
+	ucontrol->value.enumerated.item[0] = private->level_switch[index];
 	mutex_unlock(&private->data_mutex);
 
 	return 0;
@@ -1873,8 +1933,9 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
+	const struct scarlett2_device_info *info = private->info;
 
-	int index = elem->control;
+	int index = elem->control + info->level_input_first;
 	int oval, val, err = 0;
 
 	mutex_lock(&private->data_mutex);
@@ -2130,7 +2191,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input level (line/inst) controls */
 	for (i = 0; i < info->level_input_count; i++) {
-		snprintf(s, sizeof(s), fmt, i + 1, "Level", "Enum");
+		snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_first,
+			 "Level", "Enum");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_level_enum_ctl,
 					    i, 1, s, &private->level_ctls[i]);
 		if (err < 0)
@@ -2411,6 +2473,10 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
+	/* devices without a mixer also don't support reporting levels */
+	if (!private->info->has_mixer)
+		return 0;
+
 	return scarlett2_add_new_ctl(mixer, &scarlett2_meter_ctl,
 				     0, private->num_mux_dsts,
 				     "Level Meter", NULL);
@@ -2634,6 +2700,10 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	/* the rest of the configuration is for devices with a mixer */
+	if (!info->has_mixer)
+		return 0;
+
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
 		return err;
-- 
2.31.1

