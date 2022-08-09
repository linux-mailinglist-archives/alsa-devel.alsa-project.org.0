Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344CC58D2ED
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 06:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9692822;
	Tue,  9 Aug 2022 06:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9692822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660019640;
	bh=sxioX7gXQoZ8vp8E4aGrjwE8wDHMdS8ikwLv9kB8rXc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LBnJIMnrI9p3dpU4tBET9Kzd7HWyBdruaAHuY/iwD1N8+qvElN0TIrXMV0V0Vhup8
	 xO/AK8YrTNHIKxeVnXx6TcwqQbGd7SHXQ9BEmz7gAyWgrKFKpJYinzywBCaG9C/q/u
	 n0qO9kDkC6W0Gtjcqy+U2qxsXpwo4CELoC8mQG20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C2DF800E8;
	Tue,  9 Aug 2022 06:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB931F8016C; Tue,  9 Aug 2022 06:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB96F800E8
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 06:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB96F800E8
Received: by m.b4.vu (Postfix, from userid 1000)
 id 0CFC46142184; Tue,  9 Aug 2022 14:02:42 +0930 (ACST)
Date: Tue, 9 Aug 2022 14:02:41 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: scarlett2: Add Focusrite Clarett+ 8Pre support
Message-ID: <20220809043241.GA2749152@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Christian Colglazier <christian@cacolglazier.com>
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

From: Christian Colglazier <christian@cacolglazier.com>

The Focusrite Clarett+ 8Pre uses the same protocol as the Scarlett Gen
2 and Gen 3 product range. This patch adds support for the Clarett+
8Pre by adding appropriate entries to the scarlett2 driver.

The Clarett+ 2Pre and 4Pre, and the Clarett USB product line
presumably use the same protocol as well, so support for them can
easily be added if someone can test.

Signed-off-by: Christian Colglazier <christian@cacolglazier.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_quirks.c        |  1 +
 sound/usb/mixer_scarlett_gen2.c | 91 ++++++++++++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index d35cf54cab33..4a6ee50f69c4 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3238,6 +3238,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8213): /* Focusrite Scarlett 8i6 3rd Gen */
 	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
 	case USB_ID(0x1235, 0x8215): /* Focusrite Scarlett 18i20 3rd Gen */
+	case USB_ID(0x1235, 0x820c): /* Focusrite Clarett+ 8Pre */
 		err = snd_scarlett_gen2_init(mixer);
 		break;
 
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 69a2cd429ee2..9d11bb08667e 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1,13 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *   Focusrite Scarlett Gen 2/3 Driver for ALSA
+ *   Focusrite Scarlett Gen 2/3 and Clarett+ Driver for ALSA
  *
  *   Supported models:
  *   - 6i6/18i8/18i20 Gen 2
  *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
+ *   - Clarett+ 8Pre
  *
  *   Copyright (c) 2018-2022 by Geoffrey D. Bennett <g at b4.vu>
  *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
+ *   Copyright (c) 2022 by Christian Colglazier <christian@cacolglazier.com>
  *
  *   Based on the Scarlett (Gen 1) Driver for ALSA:
  *
@@ -51,6 +53,9 @@
  * Support for phantom power, direct monitoring, speaker switching,
  * and talkback added in May-June 2021.
  *
+ * Support for Clarett+ 8Pre added in Aug 2022 by Christian
+ * Colglazier.
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -203,7 +208,8 @@ enum {
 	SCARLETT2_CONFIG_SET_NO_MIXER = 0,
 	SCARLETT2_CONFIG_SET_GEN_2 = 1,
 	SCARLETT2_CONFIG_SET_GEN_3 = 2,
-	SCARLETT2_CONFIG_SET_COUNT = 3
+	SCARLETT2_CONFIG_SET_CLARETT = 3,
+	SCARLETT2_CONFIG_SET_COUNT = 4
 };
 
 /* Hardware port types:
@@ -841,6 +847,61 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	} },
 };
 
+static const struct scarlett2_device_info clarett_8pre_info = {
+	.usb_id = USB_ID(0x1235, 0x820c),
+
+	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.line_out_hw_vol = 1,
+	.level_input_count = 2,
+	.air_input_count = 8,
+
+	.line_out_descrs = {
+		"Monitor L",
+		"Monitor R",
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  8, 10 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  8 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 20, 18 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,     0,  8 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 14 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,     0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 12 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 22 },
+		{ 0,                            0,  0 },
+	} },
+};
+
 static const struct scarlett2_device_info *scarlett2_devices[] = {
 	/* Supported Gen 2 devices */
 	&s6i6_gen2_info,
@@ -855,6 +916,9 @@ static const struct scarlett2_device_info *scarlett2_devices[] = {
 	&s18i8_gen3_info,
 	&s18i20_gen3_info,
 
+	/* Supported Clarett+ devices */
+	&clarett_8pre_info,
+
 	/* End of list */
 	NULL
 };
@@ -1047,6 +1111,29 @@ static const struct scarlett2_config
 
 	[SCARLETT2_CONFIG_TALKBACK_MAP] = {
 		.offset = 0xb0, .size = 16, .activate = 10 },
+
+/* Clarett+ 8Pre */
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
+	[SCARLETT2_CONFIG_AIR_SWITCH] = {
+		.offset = 0x95, .size = 8, .activate = 8 },
+
+	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+		.offset = 0x8d, .size = 8, .activate = 6 },
 } };
 
 /* proprietary request/response format */
-- 
2.37.1

