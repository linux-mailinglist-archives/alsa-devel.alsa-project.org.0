Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7681DC15
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12351DF1;
	Sun, 24 Dec 2023 20:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12351DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446047;
	bh=RMB6HChmLsRqCncR3QTd3DrBqLlaPa68YGl3ddhv6YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VPHfymd2PyMJzb+cjVkJPUOlp7RO6t1+mvn/aXS3u1S5KH/+ZbuJbVXF0nfHZoSXe
	 u1msrnd3/tGe+rCQKZicOvZOeGuRnXiAt1b8Fak0nE23IITBF12lXhmoQz3eUBbgZ1
	 qljrRPDtkGt1Vb8cH/7UCBvZ++S2h3v9muMtW2UM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93534F805FD; Sun, 24 Dec 2023 20:26:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6161EF8060D;
	Sun, 24 Dec 2023 20:26:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D6AF8027B; Sun, 24 Dec 2023 20:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B40CF8016D
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B40CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=J32w5kDz
Received: by m.b4.vu (Postfix, from userid 1000)
	id 0B20D604B9CB; Mon, 25 Dec 2023 05:52:47 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 0B20D604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445767; bh=WPbFVvOnODYjsM5Y+C0JH7HiECdgjq0wPHopET0ybuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J32w5kDzyBX9bRk56NR1aaQM25LYhWKbu3LY6iPH4IvWjZxNMyo+kw4B7Fdrrrdhs
	 sIhafoVfUGnzZGMIYKsqlxaQXmEETPH8cBt0jNsX8h4ufVmDhYUFkqOVA90assLTnV
	 /tSqYUg6k4a6pp6JuGfIHaYOGLYHQs0GoWHgKWC3NkElOtWoJGXNPcCam6jG2NFl1e
	 nV9oQh03Wx9sL96uidvuicWliDCvVkFVfXTkasgd1cCikWWSQBuOZ6H67DI0+w+4ie
	 fhbT0LW7ZrOyoejKHaKDVEqk1CG65A9Cs+jMa0O1rph7XvTsqTy2U3CSauVMNu1+59
	 fAqd6Pw3F9hew==
Date: Mon, 25 Dec 2023 05:52:47 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/23] ALSA: scarlett2: Add config set struct
Message-ID: <bfdb04cd6239af9a8c26a52da0537980f77c0437.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: 3JCBOVX4B73322GRAWQSNSDKRHDVQDB5
X-Message-ID-Hash: 3JCBOVX4B73322GRAWQSNSDKRHDVQDB5
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JCBOVX4B73322GRAWQSNSDKRHDVQDB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add struct scarlett2_config_set so that data which is common to all
devices in a config set can be stored there rather than in the
model-specific data.

Accordingly, rename scarlett2_config_items[] to
scarlett2_config_sets[].

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 167 +++++++++++++++++++-----------------
 1 file changed, 89 insertions(+), 78 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index fc9f360d0e1e..6884b41b6dd6 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1226,119 +1226,130 @@ struct scarlett2_config {
 	u8 activate;
 };
 
-static const struct scarlett2_config
-	scarlett2_config_items[SCARLETT2_CONFIG_SET_COUNT]
-			      [SCARLETT2_CONFIG_COUNT] =
+struct scarlett2_config_set {
+	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
+};
+
+static const struct scarlett2_config_set
+	scarlett2_config_sets[SCARLETT2_CONFIG_SET_COUNT] =
 
 /* Gen 2 devices: 6i6, 18i8, 18i20 */
-{ {
-	[SCARLETT2_CONFIG_DIM_MUTE] = {
-		.offset = 0x31, .size = 8, .activate = 2 },
+{ [SCARLETT2_CONFIG_SET_GEN_2] = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
 
-	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-		.offset = 0x34, .size = 16, .activate = 1 },
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
 
-	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-		.offset = 0x5c, .size = 8, .activate = 1 },
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
 
-	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-		.offset = 0x66, .size = 8, .activate = 3 },
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
 
-	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x7c, .size = 8, .activate = 7 },
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
 
-	[SCARLETT2_CONFIG_PAD_SWITCH] = {
-		.offset = 0x84, .size = 8, .activate = 8 },
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
 
-	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-		.offset = 0x8d, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x8d, .size = 8, .activate = 6 },
+	},
 
 /* Gen 3 devices without a mixer (Solo and 2i2) */
-}, {
-	[SCARLETT2_CONFIG_MSD_SWITCH] = {
-		.offset = 0x04, .size = 8, .activate = 6 },
+}, [SCARLETT2_CONFIG_SET_GEN_3A] = {
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x04, .size = 8, .activate = 6 },
 
-	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
-		.offset = 0x05, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+			.offset = 0x05, .size = 8, .activate = 6 },
 
-	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-		.offset = 0x06, .size = 8, .activate = 3 },
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x06, .size = 8, .activate = 3 },
 
-	[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
-		.offset = 0x07, .size = 8, .activate = 4 },
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x07, .size = 8, .activate = 4 },
 
-	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x08, .size = 1, .activate = 7 },
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x08, .size = 1, .activate = 7 },
 
-	[SCARLETT2_CONFIG_AIR_SWITCH] = {
-		.offset = 0x09, .size = 1, .activate = 8 },
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x09, .size = 1, .activate = 8 },
+	},
 
 /* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
-}, {
-	[SCARLETT2_CONFIG_DIM_MUTE] = {
-		.offset = 0x31, .size = 8, .activate = 2 },
+}, [SCARLETT2_CONFIG_SET_GEN_3B] = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
 
-	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-		.offset = 0x34, .size = 16, .activate = 1 },
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
 
-	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-		.offset = 0x5c, .size = 8, .activate = 1 },
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
 
-	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-		.offset = 0x66, .size = 8, .activate = 3 },
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
 
-	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x7c, .size = 8, .activate = 7 },
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
 
-	[SCARLETT2_CONFIG_PAD_SWITCH] = {
-		.offset = 0x84, .size = 8, .activate = 8 },
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
 
-	[SCARLETT2_CONFIG_AIR_SWITCH] = {
-		.offset = 0x8c, .size = 8, .activate = 8 },
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x8c, .size = 8, .activate = 8 },
 
-	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-		.offset = 0x95, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x95, .size = 8, .activate = 6 },
 
-	[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-		.offset = 0x9c, .size = 1, .activate = 8 },
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x9c, .size = 1, .activate = 8 },
 
-	[SCARLETT2_CONFIG_MSD_SWITCH] = {
-		.offset = 0x9d, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x9d, .size = 8, .activate = 6 },
 
-	[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
-		.offset = 0x9e, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+			.offset = 0x9e, .size = 8, .activate = 6 },
 
-	[SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH] = {
-		.offset = 0x9f, .size = 1, .activate = 10 },
+		[SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH] = {
+			.offset = 0x9f, .size = 1, .activate = 10 },
 
-	[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
-		.offset = 0xa0, .size = 1, .activate = 10 },
+		[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
+			.offset = 0xa0, .size = 1, .activate = 10 },
 
-	[SCARLETT2_CONFIG_TALKBACK_MAP] = {
-		.offset = 0xb0, .size = 16, .activate = 10 },
+		[SCARLETT2_CONFIG_TALKBACK_MAP] = {
+			.offset = 0xb0, .size = 16, .activate = 10 },
+	},
 
 /* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
-}, {
-	[SCARLETT2_CONFIG_DIM_MUTE] = {
-		.offset = 0x31, .size = 8, .activate = 2 },
+}, [SCARLETT2_CONFIG_SET_CLARETT] = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
 
-	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-		.offset = 0x34, .size = 16, .activate = 1 },
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
 
-	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-		.offset = 0x5c, .size = 8, .activate = 1 },
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
 
-	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-		.offset = 0x66, .size = 8, .activate = 3 },
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
 
-	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x7c, .size = 8, .activate = 7 },
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
 
-	[SCARLETT2_CONFIG_AIR_SWITCH] = {
-		.offset = 0x95, .size = 8, .activate = 8 },
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x95, .size = 8, .activate = 8 },
 
-	[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-		.offset = 0x8d, .size = 8, .activate = 6 },
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x8d, .size = 8, .activate = 6 },
+	}
 } };
 
 /* proprietary request/response format */
@@ -1514,7 +1525,7 @@ static int scarlett2_has_config_item(
 {
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-		&scarlett2_config_items[info->config_set][config_item_num];
+		&scarlett2_config_sets[info->config_set].items[config_item_num];
 
 	return !!config_item->offset;
 }
@@ -1527,7 +1538,7 @@ static int scarlett2_usb_get_config(
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-		&scarlett2_config_items[info->config_set][config_item_num];
+	    &scarlett2_config_sets[info->config_set].items[config_item_num];
 	int size, err, i;
 	u8 *buf_8;
 	u8 value;
@@ -1589,7 +1600,7 @@ static int scarlett2_usb_set_config(
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-	       &scarlett2_config_items[info->config_set][config_item_num];
+	    &scarlett2_config_sets[info->config_set].items[config_item_num];
 	struct {
 		__le32 offset;
 		__le32 bytes;
-- 
2.43.0

