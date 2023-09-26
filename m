Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED947AEFDA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 17:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0403DF;
	Tue, 26 Sep 2023 17:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0403DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695742960;
	bh=R54AdJQN+LR+UZfzrA2FwCOViL7syTQ/vxAErTNAH8o=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lCwthvDcAdQEZnzejK9sdv7q2V4QWGpVKqSECdkpqh2/AdhKEoddJH4WOeutlfT3G
	 q6WD8rtSan91CVTBgtzlswyOW+tofOdxv1YYcNw0EZIVMYd6155zgzgundd5Ar23QI
	 gPgUnwcU0/jDBCBrkhdehWbwjV87yVarFURwQIX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0332DF800AE; Tue, 26 Sep 2023 17:41:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF711F80166;
	Tue, 26 Sep 2023 17:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB235F8016A; Tue, 26 Sep 2023 17:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64DA4F8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 17:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64DA4F8001D
Received: by m.b4.vu (Postfix, from userid 1000)
	id CEFD36142196; Wed, 27 Sep 2023 01:11:30 +0930 (ACST)
Date: Wed, 27 Sep 2023 01:11:30 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: scarlett2: Add Focusrite Clarett+ 2Pre and 4Pre support
Message-ID: <ZRL7qjC3tYQllT3H@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: ZIXHJ5ONSPR5XCHW4TEFJIBOS2WMCLMY
X-Message-ID-Hash: ZIXHJ5ONSPR5XCHW4TEFJIBOS2WMCLMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIXHJ5ONSPR5XCHW4TEFJIBOS2WMCLMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Focusrite Clarett+ series uses the same protocol as the Scarlett
Gen 2 and Gen 3 series. This patch adds support for the Clarett+ 2Pre
and Clarett+ 4Pre similarly to the existing 8Pre support by adding
appropriate entries to the scarlett2 driver.

The Clarett 2Pre USB and 4Pre USB presumably use the same protocol as
well, so support for them can easily be added if someone can test.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_quirks.c        |  2 +
 sound/usb/mixer_scarlett_gen2.c | 97 ++++++++++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 9911859d2750..0db94ead1b93 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3421,6 +3421,8 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
 	case USB_ID(0x1235, 0x8215): /* Focusrite Scarlett 18i20 3rd Gen */
 	case USB_ID(0x1235, 0x8208): /* Focusrite Clarett 8Pre USB */
+	case USB_ID(0x1235, 0x820a): /* Focusrite Clarett+ 2Pre */
+	case USB_ID(0x1235, 0x820b): /* Focusrite Clarett+ 4Pre */
 	case USB_ID(0x1235, 0x820c): /* Focusrite Clarett+ 8Pre */
 		err = snd_scarlett_gen2_init(mixer);
 		break;
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 481a80e160de..57e7fdff6905 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -6,7 +6,7 @@
  *   - 6i6/18i8/18i20 Gen 2
  *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
  *   - Clarett 8Pre USB
- *   - Clarett+ 8Pre
+ *   - Clarett+ 2Pre/4Pre/8Pre
  *
  *   Copyright (c) 2018-2023 by Geoffrey D. Bennett <g at b4.vu>
  *   Copyright (c) 2020-2021 by Vladimir Sadovnikov <sadko4u@gmail.com>
@@ -60,6 +60,10 @@
  * Support for Clarett USB 8Pre added in Sep 2023 (thanks to Philippe
  * Perrot for confirmation).
  *
+ * Support for Clarett+ 4Pre and 2Pre added in Sep 2023 (thanks to
+ * Gregory Rozzo for donating a 4Pre, and David Sherwood and Patrice
+ * Peterson for usbmon output).
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -832,6 +836,95 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 	} },
 };
 
+static const struct scarlett2_device_info clarett_2pre_info = {
+	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.line_out_hw_vol = 1,
+	.level_input_count = 2,
+	.air_input_count = 2,
+
+	.line_out_descrs = {
+		"Monitor L",
+		"Monitor R",
+		"Headphones L",
+		"Headphones R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  2,  4 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  0 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  0 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = {  4, 12 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 12 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 26 },
+		{ 0,                            0,  0 },
+	} },
+};
+
+static const struct scarlett2_device_info clarett_4pre_info = {
+	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.line_out_hw_vol = 1,
+	.level_input_count = 2,
+	.air_input_count = 4,
+
+	.line_out_descrs = {
+		"Monitor L",
+		"Monitor R",
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  8,  6 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  0 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = {  8, 18 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 14 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 12 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 24 },
+		{ 0,                            0,  0 },
+	} },
+};
+
 static const struct scarlett2_device_info clarett_8pre_info = {
 	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
 	.line_out_hw_vol = 1,
@@ -907,6 +1000,8 @@ static const struct scarlett2_device_entry scarlett2_devices[] = {
 
 	/* Supported Clarett USB/Clarett+ devices */
 	{ USB_ID(0x1235, 0x8208), &clarett_8pre_info, "Clarett USB" },
+	{ USB_ID(0x1235, 0x820a), &clarett_2pre_info, "Clarett+" },
+	{ USB_ID(0x1235, 0x820b), &clarett_4pre_info, "Clarett+" },
 	{ USB_ID(0x1235, 0x820c), &clarett_8pre_info, "Clarett+" },
 
 	/* End of list */
-- 
2.41.0

