Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB67A0BD3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 19:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5708AE9;
	Thu, 14 Sep 2023 19:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5708AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694712829;
	bh=5Hrjt+w5YLTC+UzjGeCLxbuRZBj2Dgwl/bCFPgm6Yz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGsaDz9ElAfysmC13lpP57LGKdzyEWuoR3yIFBd1WD4uQUovLXUguPeAJmfDi4ZdI
	 qipD4aouPOe8yxIR++YMV6rH3WIY0yRR6CJkSg3Q2T0a1txRFWByEEnnGz7k/zjCXr
	 nn5zcQDPrjiu/k+8yiv6W3l/tc76+wW4kgU0oAdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6C27F8057D; Thu, 14 Sep 2023 19:32:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40828F80570;
	Thu, 14 Sep 2023 19:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18DBFF80578; Thu, 14 Sep 2023 19:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE1C0F80552
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 19:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1C0F80552
Received: by m.b4.vu (Postfix, from userid 1000)
	id D77CE604F298; Fri, 15 Sep 2023 03:02:16 +0930 (ACST)
Date: Fri, 15 Sep 2023 03:02:16 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Philippe Perrot <philippe@perrot-net.fr>
Subject: [PATCH 2/4] ALSA: scarlett2: Move USB IDs out from device_info struct
Message-ID: <8263368e8d49e6fcebc709817bd82ab79b404468.1694705811.git.g@b4.vu>
References: <cover.1694705811.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694705811.git.g@b4.vu>
Message-ID-Hash: U5WE627RLPXBIOHVJHTRA6CZ2VED6E7D
X-Message-ID-Hash: U5WE627RLPXBIOHVJHTRA6CZ2VED6E7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5WE627RLPXBIOHVJHTRA6CZ2VED6E7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By moving the USB IDs from the device_info struct into
scarlett2_devices[], that will allow for devices with different
USB IDs to share the same device_info.

Tested-by: Philippe Perrot <philippe@perrot-net.fr>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 63 ++++++++++++---------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index ecd148ba6908..e4f1bfc54533 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -317,8 +317,6 @@ struct scarlett2_mux_entry {
 };
 
 struct scarlett2_device_info {
-	u32 usb_id; /* USB device identifier */
-
 	/* Gen 3 devices have an internal MSD mode switch that needs
 	 * to be disabled in order to access the full functionality of
 	 * the device.
@@ -440,8 +438,6 @@ struct scarlett2_data {
 /*** Model-specific data ***/
 
 static const struct scarlett2_device_info s6i6_gen2_info = {
-	.usb_id = USB_ID(0x1235, 0x8203),
-
 	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -486,8 +482,6 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen2_info = {
-	.usb_id = USB_ID(0x1235, 0x8204),
-
 	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.level_input_count = 2,
 	.pad_input_count = 4,
@@ -535,8 +529,6 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen2_info = {
-	.usb_id = USB_ID(0x1235, 0x8201),
-
 	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
 	.line_out_hw_vol = 1,
 
@@ -589,8 +581,6 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 };
 
 static const struct scarlett2_device_info solo_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8211),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
 	.level_input_count = 1,
@@ -602,8 +592,6 @@ static const struct scarlett2_device_info solo_gen3_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8210),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_NO_MIXER,
 	.level_input_count = 2,
@@ -614,8 +602,6 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8212),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.level_input_count = 2,
@@ -660,8 +646,6 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 };
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8213),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.level_input_count = 2,
@@ -713,8 +697,6 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8214),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.line_out_hw_vol = 1,
@@ -783,8 +765,6 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.usb_id = USB_ID(0x1235, 0x8215),
-
 	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3,
 	.line_out_hw_vol = 1,
@@ -848,8 +828,6 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 };
 
 static const struct scarlett2_device_info clarett_8pre_info = {
-	.usb_id = USB_ID(0x1235, 0x820c),
-
 	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
@@ -902,25 +880,30 @@ static const struct scarlett2_device_info clarett_8pre_info = {
 	} },
 };
 
-static const struct scarlett2_device_info *scarlett2_devices[] = {
+struct scarlett2_device_entry {
+	const u32 usb_id; /* USB device identifier */
+	const struct scarlett2_device_info *info;
+};
+
+static const struct scarlett2_device_entry scarlett2_devices[] = {
 	/* Supported Gen 2 devices */
-	&s6i6_gen2_info,
-	&s18i8_gen2_info,
-	&s18i20_gen2_info,
+	{ USB_ID(0x1235, 0x8203), &s6i6_gen2_info },
+	{ USB_ID(0x1235, 0x8204), &s18i8_gen2_info },
+	{ USB_ID(0x1235, 0x8201), &s18i20_gen2_info },
 
 	/* Supported Gen 3 devices */
-	&solo_gen3_info,
-	&s2i2_gen3_info,
-	&s4i4_gen3_info,
-	&s8i6_gen3_info,
-	&s18i8_gen3_info,
-	&s18i20_gen3_info,
+	{ USB_ID(0x1235, 0x8211), &solo_gen3_info },
+	{ USB_ID(0x1235, 0x8210), &s2i2_gen3_info },
+	{ USB_ID(0x1235, 0x8212), &s4i4_gen3_info },
+	{ USB_ID(0x1235, 0x8213), &s8i6_gen3_info },
+	{ USB_ID(0x1235, 0x8214), &s18i8_gen3_info },
+	{ USB_ID(0x1235, 0x8215), &s18i20_gen3_info },
 
 	/* Supported Clarett+ devices */
-	&clarett_8pre_info,
+	{ USB_ID(0x1235, 0x820c), &clarett_8pre_info },
 
 	/* End of list */
-	NULL
+	{ 0, NULL },
 };
 
 /* get the starting port index number for a given port type/direction */
@@ -4072,17 +4055,17 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 
 static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 {
-	const struct scarlett2_device_info **info = scarlett2_devices;
+	const struct scarlett2_device_entry *entry = scarlett2_devices;
 	int err;
 
-	/* Find device in scarlett2_devices */
-	while (*info && (*info)->usb_id != mixer->chip->usb_id)
-		info++;
-	if (!*info)
+	/* Find entry in scarlett2_devices */
+	while (entry->usb_id && entry->usb_id != mixer->chip->usb_id)
+		entry++;
+	if (!entry->usb_id)
 		return -EINVAL;
 
 	/* Initialise private data */
-	err = scarlett2_init_private(mixer, *info);
+	err = scarlett2_init_private(mixer, entry->info);
 	if (err < 0)
 		return err;
 
-- 
2.41.0

