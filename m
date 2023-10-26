Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A77D87FA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 20:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD497868;
	Thu, 26 Oct 2023 20:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD497868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698343423;
	bh=3NfJbs8vjcgpTEva5H1IJNaX6ajRaN/FtCF16NkLjKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jectCoIBHo/pFfFvG2KRDCh+Xokt9wqkM7lVcutxSFdI98WKonStIVqHRoxySsx8r
	 bBdUaYsN4ruuei212nq2oc4gQ/WnB8lqjHF6ZNDqQayxObd0hNOJo3uHJsDGWW3vwq
	 rAXFaM91qszw8/s+ZD/QzTVT4JaQ2vV07ZUbkURw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB3EF80557; Thu, 26 Oct 2023 20:02:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F408F8020D;
	Thu, 26 Oct 2023 20:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47DC2F80165; Thu, 26 Oct 2023 20:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E9C4F8019B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 20:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E9C4F8019B
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2AADB604F28E; Fri, 27 Oct 2023 04:32:39 +1030 (ACDT)
Date: Fri, 27 Oct 2023 04:32:39 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ALSA: scarlett2: Rename Gen 3 config sets
Message-ID: <19ae5eea7fc499945efa8eeda7fcd8afe73f62d9.1698342632.git.g@b4.vu>
References: <cover.1698342632.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698342632.git.g@b4.vu>
Message-ID-Hash: IKT66FAQF76JO6BXKP6RMKQX6GL3Y3VG
X-Message-ID-Hash: IKT66FAQF76JO6BXKP6RMKQX6GL3Y3VG
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKT66FAQF76JO6BXKP6RMKQX6GL3Y3VG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The config sets are named NO_MIXER, GEN_2, GEN_3, and CLARETT
currently. Rename NO_MIXER and GEN_3 to GEN_3A and GEN_3B respectively
as NO_MIXER is only for the smaller Gen 3 devices.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 74 ++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1a9d62b67323..2f9619bc6d4f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -213,15 +213,15 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of meters (sum of output port counts) */
 #define SCARLETT2_MAX_METERS 65
 
-/* There are three different sets of configuration parameters across
- * the devices
+/* There are different sets of configuration parameters across the
+ * devices, dependent on series and model.
  */
 enum {
-	SCARLETT2_CONFIG_SET_NO_MIXER = 0,
-	SCARLETT2_CONFIG_SET_GEN_2 = 1,
-	SCARLETT2_CONFIG_SET_GEN_3 = 2,
+	SCARLETT2_CONFIG_SET_GEN_2   = 0,
+	SCARLETT2_CONFIG_SET_GEN_3A  = 1,
+	SCARLETT2_CONFIG_SET_GEN_3B  = 2,
 	SCARLETT2_CONFIG_SET_CLARETT = 3,
-	SCARLETT2_CONFIG_SET_COUNT = 4
+	SCARLETT2_CONFIG_SET_COUNT   = 4
 };
 
 /* Hardware port types:
@@ -595,7 +595,7 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 
 static const struct scarlett2_device_info solo_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 1,
 	.level_input_first = 1,
 	.air_input_count = 1,
@@ -606,7 +606,7 @@ static const struct scarlett2_device_info solo_gen3_info = {
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 2,
 	.air_input_count = 2,
 	.phantom_count = 1,
@@ -616,7 +616,7 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -660,7 +660,7 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -711,7 +711,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.level_input_count = 2,
@@ -779,7 +779,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
 	.has_msd_mode = 1,
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
+	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.has_talkback = 1,
@@ -1116,28 +1116,8 @@ static const struct scarlett2_config
 	scarlett2_config_items[SCARLETT2_CONFIG_SET_COUNT]
 			      [SCARLETT2_CONFIG_COUNT] =
 
-/* Devices without a mixer (Gen 3 Solo and 2i2) */
-{ {
-	[SCARLETT2_CONFIG_MSD_SWITCH] = {
-		.offset = 0x04, .size = 8, .activate = 6 },
-
-	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
-		.offset = 0x05, .size = 8, .activate = 6 },
-
-	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-		.offset = 0x06, .size = 8, .activate = 3 },
-
-	[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
-		.offset = 0x07, .size = 8, .activate = 4 },
-
-	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x08, .size = 1, .activate = 7 },
-
-	[SCARLETT2_CONFIG_AIR_SWITCH] = {
-		.offset = 0x09, .size = 1, .activate = 8 },
-
 /* Gen 2 devices: 6i6, 18i8, 18i20 */
-}, {
+{ {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
 		.offset = 0x31, .size = 8, .activate = 2 },
 
@@ -1159,6 +1139,26 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
 		.offset = 0x8d, .size = 8, .activate = 6 },
 
+/* Gen 3 devices without a mixer (Solo and 2i2) */
+}, {
+	[SCARLETT2_CONFIG_MSD_SWITCH] = {
+		.offset = 0x04, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+		.offset = 0x05, .size = 8, .activate = 6 },
+
+	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+		.offset = 0x06, .size = 8, .activate = 3 },
+
+	[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+		.offset = 0x07, .size = 8, .activate = 4 },
+
+	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+		.offset = 0x08, .size = 1, .activate = 7 },
+
+	[SCARLETT2_CONFIG_AIR_SWITCH] = {
+		.offset = 0x09, .size = 1, .activate = 8 },
+
 /* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
 }, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
@@ -1907,7 +1907,7 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting sync status */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
@@ -3614,7 +3614,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting levels */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_meter_ctl,
@@ -3744,7 +3744,7 @@ static int scarlett2_add_standalone_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
+	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
 	/* Add standalone control */
@@ -3911,7 +3911,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* the rest of the configuration is for devices with a mixer */
-	if (info->config_set == SCARLETT2_CONFIG_SET_NO_MIXER)
+	if (info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
 	err = scarlett2_usb_get_config(
-- 
2.41.0

