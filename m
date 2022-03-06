Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E994CEC12
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Mar 2022 16:22:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A8F1756;
	Sun,  6 Mar 2022 16:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A8F1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646580159;
	bh=NLHlhPXCfVdFjwfbdPXpjv+s9yPynh/IEhgqhgQqPgI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjCv4HqZUKL5LBgoGMRdT3Q8cCo2ZZaGFnNHlDa35BxjOFH6qOXulP1zKG/eTqCQS
	 v/XzYNXW7qaW9DxfXnfiqSOYz9SCSLrMtisOphFfthbwYduF2R92oZlLsv5UW7f5HL
	 Sl+jO0aMAfFCU5KulKXDSWIp4h3brH0pG2oTTQZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7F4F804D9;
	Sun,  6 Mar 2022 16:21:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 081F2F804CF; Sun,  6 Mar 2022 16:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF0AF801F5
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 16:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF0AF801F5
Received: by m.b4.vu (Postfix, from userid 1000)
 id 7960F6135FC9; Mon,  7 Mar 2022 01:51:04 +1030 (ACDT)
Date: Mon, 7 Mar 2022 01:51:04 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/2] ALSA: scarlett2: Split scarlett2_config_items[] into 3
 sections
Message-ID: <20969f9ea500684e978c87067fbdc7e73de1f6ed.1646578164.git.g@b4.vu>
References: <cover.1646578164.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646578164.git.g@b4.vu>
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

scarlett2_config_items[] contains the parameters for the configuration
items. The driver previously had two sets of configurations items; one
for devices with no mixer, and one for devices with a mixer. This
patch splits the latter into two (one set for Gen 2 devices and one
set for Gen 3 devices) in preparation for a new item (standalone)
which is present in both but with a different offset.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 74 +++++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 53ebabf42472..22e442208550 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -6,7 +6,7 @@
  *   - 6i6/18i8/18i20 Gen 2
  *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
  *
- *   Copyright (c) 2018-2021 by Geoffrey D. Bennett <g at b4.vu>
+ *   Copyright (c) 2018-2022 by Geoffrey D. Bennett <g at b4.vu>
  *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
  *
  *   Based on the Scarlett (Gen 1) Driver for ALSA:
@@ -195,6 +195,16 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of meters (sum of output port counts) */
 #define SCARLETT2_MAX_METERS 65
 
+/* There are three different sets of configuration parameters across
+ * the devices
+ */
+enum {
+	SCARLETT2_CONFIG_SET_NO_MIXER = 0,
+	SCARLETT2_CONFIG_SET_GEN_2 = 1,
+	SCARLETT2_CONFIG_SET_GEN_3 = 2,
+	SCARLETT2_CONFIG_SET_COUNT = 3
+};
+
 /* Hardware port types:
  * - None (no input to mux)
  * - Analogue I/O
@@ -308,10 +318,8 @@ struct scarlett2_device_info {
 	 */
 	u8 has_msd_mode;
 
-	/* Gen 3 devices without a mixer have a different
-	 * configuration set
-	 */
-	u8 has_mixer;
+	/* which set of configuration parameters the device uses */
+	u8 config_set;
 
 	/* line out hw volume is sw controlled */
 	u8 line_out_hw_vol;
@@ -426,7 +434,7 @@ struct scarlett2_data {
 static const struct scarlett2_device_info s6i6_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8203),
 
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -472,7 +480,7 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 static const struct scarlett2_device_info s18i8_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8204),
 
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.level_input_count = 2,
 	.pad_input_count = 4,
 
@@ -521,7 +529,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 static const struct scarlett2_device_info s18i20_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8201),
 
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.line_out_hw_vol = 1,
 
 	.line_out_descrs = {
@@ -576,6 +584,7 @@ static const struct scarlett2_device_info solo_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8211),
 
 	.has_msd_mode = 1,
+	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
 	.level_input_count = 1,
 	.level_input_first = 1,
 	.air_input_count = 1,
@@ -588,6 +597,7 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8210),
 
 	.has_msd_mode = 1,
+	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
 	.level_input_count = 2,
 	.air_input_count = 2,
 	.phantom_count = 1,
@@ -599,7 +609,7 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8212),
 
 	.has_msd_mode = 1,
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -645,7 +655,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8213),
 
 	.has_msd_mode = 1,
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -698,7 +708,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8214),
 
 	.has_msd_mode = 1,
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.level_input_count = 2,
@@ -768,7 +778,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	.usb_id = USB_ID(0x1235, 0x8215),
 
 	.has_msd_mode = 1,
-	.has_mixer = 1,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.has_talkback = 1,
@@ -944,13 +954,11 @@ struct scarlett2_config {
 	u8 activate;
 };
 
-/* scarlett2_config_items[0] is for devices without a mixer
- * scarlett2_config_items[1] is for devices with a mixer
- */
 static const struct scarlett2_config
-	scarlett2_config_items[2][SCARLETT2_CONFIG_COUNT] =
+	scarlett2_config_items[SCARLETT2_CONFIG_SET_COUNT]
+			      [SCARLETT2_CONFIG_COUNT] =
 
-/* Devices without a mixer (Solo and 2i2 Gen 3) */
+/* Devices without a mixer (Gen 3 Solo and 2i2) */
 { {
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
 		.offset = 0x04, .size = 8, .activate = 6 },
@@ -970,7 +978,27 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_AIR_SWITCH] = {
 		.offset = 0x09, .size = 1, .activate = 8 },
 
-/* Devices with a mixer (Gen 2 and all other Gen 3) */
+/* Gen 2 devices: 6i6, 18i8, 18i20 */
+}, {
+	[SCARLETT2_CONFIG_DIM_MUTE] = {
+		.offset = 0x31, .size = 8, .activate = 2 },
+
+	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+		.offset = 0x34, .size = 16, .activate = 1 },
+
+	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+		.offset = 0x5c, .size = 8, .activate = 1 },
+
+	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+		.offset = 0x66, .size = 8, .activate = 3 },
+
+	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+		.offset = 0x7c, .size = 8, .activate = 7 },
+
+	[SCARLETT2_CONFIG_PAD_SWITCH] = {
+		.offset = 0x84, .size = 8, .activate = 8 },
+
+/* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
 }, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
 		.offset = 0x31, .size = 8, .activate = 2 },
@@ -1175,7 +1203,7 @@ static int scarlett2_usb_get_config(
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-		&scarlett2_config_items[info->has_mixer][config_item_num];
+		&scarlett2_config_items[info->config_set][config_item_num];
 	int size, err, i;
 	u8 *buf_8;
 	u8 value;
@@ -1235,7 +1263,7 @@ static int scarlett2_usb_set_config(
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-	       &scarlett2_config_items[info->has_mixer][config_item_num];
+	       &scarlett2_config_items[info->config_set][config_item_num];
 	struct {
 		__le32 offset;
 		__le32 bytes;
@@ -1692,7 +1720,7 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting sync status */
-	if (!private->info->has_mixer)
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
@@ -3399,7 +3427,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting levels */
-	if (!private->info->has_mixer)
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_meter_ctl,
@@ -3632,7 +3660,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* the rest of the configuration is for devices with a mixer */
-	if (!info->has_mixer)
+	if (info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
 		return 0;
 
 	err = scarlett2_update_sync(mixer);
-- 
2.35.1

