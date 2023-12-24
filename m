Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B818E81DC16
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63117E73;
	Sun, 24 Dec 2023 20:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63117E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446068;
	bh=xKH3sQQQQyrIlvWutR9aUX0URt43es7KiAfeUWClI1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lPVThPjUaGPYR0h4UjKPPl4GydXAum4TvzvB/ruUe67h7H0LfCrCDYjmsNYEUZxBR
	 lp3CM0xPEe8X81hhqGzbegkpqVHol3QXD4y1leiQXON16QQWN7mvdjVshpr95OIT0I
	 8abLQf45niuosVpmv5Fn8l8Dj64REOmw1XJewbgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D27ACF80679; Sun, 24 Dec 2023 20:26:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68948F80623;
	Sun, 24 Dec 2023 20:26:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D477CF8016D; Sun, 24 Dec 2023 20:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 550D1F800BD
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 550D1F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=I2cg8hN7
Received: by m.b4.vu (Postfix, from userid 1000)
	id CE4FB604B9CB; Mon, 25 Dec 2023 05:53:40 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu CE4FB604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445820; bh=z1Wd0cZB/Jt4DD24Bw+Qwqz82dbDk0s5v8dDThahWm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2cg8hN7gheTfvKv2AWHSX9wG1luFxn8Y7b83NmPW4n55umK9PxGLDx+dyzQ+ER4f
	 0zrTT+laKXFzlotRqA26yjFLK5OaF+YyKf25+QDg8ZHYkErRmhCfDRD0hFfPldUcuf
	 STW4YbnLuuJ22BjIo8TvryzbG5GUybxdDdtcxtJtwCNQlaJYV8WOFbLYoyv7gdBeKe
	 y9wv2EpoZFgJXDNoVe0+qjgKDX3LncgMSWPETCkb3f7sJm+ZiiivzfyxckBCV3sHCf
	 u2p2ZWMRz6ClgCaKJAlZqj/ifTIkAGM5bC1TMkrVEykMfga/dD/NiNQ65pELeY6ihl
	 7hj1m8E4lGNTA==
Date: Mon, 25 Dec 2023 05:53:40 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 07/23] ALSA: scarlett2: Remove scarlett2_config_sets array
Message-ID: <61f69519fb6fbb677e066891a3a6771aeeec106d.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: GAYAVFLD6TPEIKIYVPKMOZSVT5GMPER7
X-Message-ID-Hash: GAYAVFLD6TPEIKIYVPKMOZSVT5GMPER7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAYAVFLD6TPEIKIYVPKMOZSVT5GMPER7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace array index into config sets with a pointer to a config set.
Copy the config_set pointer to the scarlett2_data struct.

This simplifies both the definition and use of the config sets.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 361 +++++++++++++++++-------------------
 1 file changed, 173 insertions(+), 188 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6884b41b6dd6..bff777a93d65 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -219,17 +219,6 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 /* Maximum number of meters (sum of output port counts) */
 #define SCARLETT2_MAX_METERS 65
 
-/* There are different sets of configuration parameters across the
- * devices, dependent on series and model.
- */
-enum {
-	SCARLETT2_CONFIG_SET_GEN_2,
-	SCARLETT2_CONFIG_SET_GEN_3A,
-	SCARLETT2_CONFIG_SET_GEN_3B,
-	SCARLETT2_CONFIG_SET_CLARETT,
-	SCARLETT2_CONFIG_SET_COUNT
-};
-
 /* Hardware port types:
  * - None (no input to mux)
  * - Analogue I/O
@@ -274,6 +263,161 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
 
+/* Configuration parameters that can be read and written */
+enum {
+	SCARLETT2_CONFIG_DIM_MUTE,
+	SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+	SCARLETT2_CONFIG_MUTE_SWITCH,
+	SCARLETT2_CONFIG_SW_HW_SWITCH,
+	SCARLETT2_CONFIG_LEVEL_SWITCH,
+	SCARLETT2_CONFIG_PAD_SWITCH,
+	SCARLETT2_CONFIG_MSD_SWITCH,
+	SCARLETT2_CONFIG_AIR_SWITCH,
+	SCARLETT2_CONFIG_STANDALONE_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_SWITCH,
+	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+	SCARLETT2_CONFIG_DIRECT_MONITOR,
+	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
+	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
+	SCARLETT2_CONFIG_TALKBACK_MAP,
+	SCARLETT2_CONFIG_COUNT
+};
+
+/* Location, size, and activation command number for the configuration
+ * parameters. Size is in bits and may be 1, 8, or 16.
+ */
+struct scarlett2_config {
+	u8 offset;
+	u8 size;
+	u8 activate;
+};
+
+struct scarlett2_config_set {
+	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
+};
+
+/* Gen 2 devices: 6i6, 18i8, 18i20 */
+static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
+
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
+
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
+
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
+
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x8d, .size = 8, .activate = 6 },
+	}
+};
+
+/* Gen 3 devices without a mixer (Solo and 2i2) */
+static const struct scarlett2_config_set scarlett2_config_set_gen3a = {
+	.items = {
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x04, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+			.offset = 0x05, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x06, .size = 8, .activate = 3 },
+
+		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
+			.offset = 0x07, .size = 8, .activate = 4 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x08, .size = 1, .activate = 7 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x09, .size = 1, .activate = 8 },
+	}
+};
+
+/* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
+static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
+
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
+
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
+
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
+
+		[SCARLETT2_CONFIG_PAD_SWITCH] = {
+			.offset = 0x84, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x8c, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x95, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
+			.offset = 0x9c, .size = 1, .activate = 8 },
+
+		[SCARLETT2_CONFIG_MSD_SWITCH] = {
+			.offset = 0x9d, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
+			.offset = 0x9e, .size = 8, .activate = 6 },
+
+		[SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH] = {
+			.offset = 0x9f, .size = 1, .activate = 10 },
+
+		[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
+			.offset = 0xa0, .size = 1, .activate = 10 },
+
+		[SCARLETT2_CONFIG_TALKBACK_MAP] = {
+			.offset = 0xb0, .size = 16, .activate = 10 },
+	}
+};
+
+/* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
+static const struct scarlett2_config_set scarlett2_config_set_clarett = {
+	.items = {
+		[SCARLETT2_CONFIG_DIM_MUTE] = {
+			.offset = 0x31, .size = 8, .activate = 2 },
+
+		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
+			.offset = 0x34, .size = 16, .activate = 1 },
+
+		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
+			.offset = 0x5c, .size = 8, .activate = 1 },
+
+		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
+			.offset = 0x66, .size = 8, .activate = 3 },
+
+		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
+			.offset = 0x7c, .size = 8, .activate = 7 },
+
+		[SCARLETT2_CONFIG_AIR_SWITCH] = {
+			.offset = 0x95, .size = 8, .activate = 8 },
+
+		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
+			.offset = 0x8d, .size = 8, .activate = 6 },
+	}
+};
+
 /* Description of each hardware port type:
  * - id: hardware ID of this port type
  * - src_descr: printf format string for mux input selections
@@ -356,7 +500,7 @@ struct scarlett2_meter_entry {
 
 struct scarlett2_device_info {
 	/* which set of configuration parameters the device uses */
-	u8 config_set;
+	const struct scarlett2_config_set *config_set;
 
 	/* line out hw volume is sw controlled */
 	u8 line_out_hw_vol;
@@ -429,6 +573,7 @@ struct scarlett2_data {
 	u8 flash_write_state;
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
+	const struct scarlett2_config_set *config_set;
 	const char *series_name;
 	__u8 bInterfaceNumber;
 	__u8 bEndpointAddress;
@@ -485,7 +630,7 @@ struct scarlett2_data {
 /*** Model-specific data ***/
 
 static const struct scarlett2_device_info s6i6_gen2_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
+	.config_set = &scarlett2_config_set_gen2,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 
@@ -535,7 +680,7 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen2_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
+	.config_set = &scarlett2_config_set_gen2,
 	.level_input_count = 2,
 	.pad_input_count = 4,
 
@@ -588,7 +733,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen2_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_2,
+	.config_set = &scarlett2_config_set_gen2,
 	.line_out_hw_vol = 1,
 
 	.line_out_descrs = {
@@ -646,7 +791,7 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 };
 
 static const struct scarlett2_device_info solo_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
+	.config_set = &scarlett2_config_set_gen3a,
 	.level_input_count = 1,
 	.level_input_first = 1,
 	.air_input_count = 1,
@@ -656,7 +801,7 @@ static const struct scarlett2_device_info solo_gen3_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
+	.config_set = &scarlett2_config_set_gen3a,
 	.level_input_count = 2,
 	.air_input_count = 2,
 	.phantom_count = 1,
@@ -665,7 +810,7 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
+	.config_set = &scarlett2_config_set_gen3b,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -714,7 +859,7 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 };
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
+	.config_set = &scarlett2_config_set_gen3b,
 	.level_input_count = 2,
 	.pad_input_count = 2,
 	.air_input_count = 2,
@@ -772,7 +917,7 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
+	.config_set = &scarlett2_config_set_gen3b,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.level_input_count = 2,
@@ -852,7 +997,7 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
+	.config_set = &scarlett2_config_set_gen3b,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
 	.has_talkback = 1,
@@ -923,7 +1068,7 @@ static const struct scarlett2_device_info s18i20_gen3_info = {
 };
 
 static const struct scarlett2_device_info clarett_2pre_info = {
-	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.config_set = &scarlett2_config_set_clarett,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 2,
@@ -971,7 +1116,7 @@ static const struct scarlett2_device_info clarett_2pre_info = {
 };
 
 static const struct scarlett2_device_info clarett_4pre_info = {
-	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.config_set = &scarlett2_config_set_clarett,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 4,
@@ -1024,7 +1169,7 @@ static const struct scarlett2_device_info clarett_4pre_info = {
 };
 
 static const struct scarlett2_device_info clarett_8pre_info = {
-	.config_set = SCARLETT2_CONFIG_SET_CLARETT,
+	.config_set = &scarlett2_config_set_clarett,
 	.line_out_hw_vol = 1,
 	.level_input_count = 2,
 	.air_input_count = 8,
@@ -1197,161 +1342,6 @@ struct scarlett2_usb_volume_status {
 	s16 master_vol;
 } __packed;
 
-/* Configuration parameters that can be read and written */
-enum {
-	SCARLETT2_CONFIG_DIM_MUTE,
-	SCARLETT2_CONFIG_LINE_OUT_VOLUME,
-	SCARLETT2_CONFIG_MUTE_SWITCH,
-	SCARLETT2_CONFIG_SW_HW_SWITCH,
-	SCARLETT2_CONFIG_LEVEL_SWITCH,
-	SCARLETT2_CONFIG_PAD_SWITCH,
-	SCARLETT2_CONFIG_MSD_SWITCH,
-	SCARLETT2_CONFIG_AIR_SWITCH,
-	SCARLETT2_CONFIG_STANDALONE_SWITCH,
-	SCARLETT2_CONFIG_PHANTOM_SWITCH,
-	SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
-	SCARLETT2_CONFIG_DIRECT_MONITOR,
-	SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH,
-	SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE,
-	SCARLETT2_CONFIG_TALKBACK_MAP,
-	SCARLETT2_CONFIG_COUNT
-};
-
-/* Location, size, and activation command number for the configuration
- * parameters. Size is in bits and may be 1, 8, or 16.
- */
-struct scarlett2_config {
-	u8 offset;
-	u8 size;
-	u8 activate;
-};
-
-struct scarlett2_config_set {
-	const struct scarlett2_config items[SCARLETT2_CONFIG_COUNT];
-};
-
-static const struct scarlett2_config_set
-	scarlett2_config_sets[SCARLETT2_CONFIG_SET_COUNT] =
-
-/* Gen 2 devices: 6i6, 18i8, 18i20 */
-{ [SCARLETT2_CONFIG_SET_GEN_2] = {
-	.items = {
-		[SCARLETT2_CONFIG_DIM_MUTE] = {
-			.offset = 0x31, .size = 8, .activate = 2 },
-
-		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-			.offset = 0x34, .size = 16, .activate = 1 },
-
-		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-			.offset = 0x5c, .size = 8, .activate = 1 },
-
-		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-			.offset = 0x66, .size = 8, .activate = 3 },
-
-		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x7c, .size = 8, .activate = 7 },
-
-		[SCARLETT2_CONFIG_PAD_SWITCH] = {
-			.offset = 0x84, .size = 8, .activate = 8 },
-
-		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-			.offset = 0x8d, .size = 8, .activate = 6 },
-	},
-
-/* Gen 3 devices without a mixer (Solo and 2i2) */
-}, [SCARLETT2_CONFIG_SET_GEN_3A] = {
-	.items = {
-		[SCARLETT2_CONFIG_MSD_SWITCH] = {
-			.offset = 0x04, .size = 8, .activate = 6 },
-
-		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
-			.offset = 0x05, .size = 8, .activate = 6 },
-
-		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-			.offset = 0x06, .size = 8, .activate = 3 },
-
-		[SCARLETT2_CONFIG_DIRECT_MONITOR] = {
-			.offset = 0x07, .size = 8, .activate = 4 },
-
-		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x08, .size = 1, .activate = 7 },
-
-		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x09, .size = 1, .activate = 8 },
-	},
-
-/* Gen 3 devices: 4i4, 8i6, 18i8, 18i20 */
-}, [SCARLETT2_CONFIG_SET_GEN_3B] = {
-	.items = {
-		[SCARLETT2_CONFIG_DIM_MUTE] = {
-			.offset = 0x31, .size = 8, .activate = 2 },
-
-		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-			.offset = 0x34, .size = 16, .activate = 1 },
-
-		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-			.offset = 0x5c, .size = 8, .activate = 1 },
-
-		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-			.offset = 0x66, .size = 8, .activate = 3 },
-
-		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x7c, .size = 8, .activate = 7 },
-
-		[SCARLETT2_CONFIG_PAD_SWITCH] = {
-			.offset = 0x84, .size = 8, .activate = 8 },
-
-		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x8c, .size = 8, .activate = 8 },
-
-		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-			.offset = 0x95, .size = 8, .activate = 6 },
-
-		[SCARLETT2_CONFIG_PHANTOM_SWITCH] = {
-			.offset = 0x9c, .size = 1, .activate = 8 },
-
-		[SCARLETT2_CONFIG_MSD_SWITCH] = {
-			.offset = 0x9d, .size = 8, .activate = 6 },
-
-		[SCARLETT2_CONFIG_PHANTOM_PERSISTENCE] = {
-			.offset = 0x9e, .size = 8, .activate = 6 },
-
-		[SCARLETT2_CONFIG_MONITOR_OTHER_SWITCH] = {
-			.offset = 0x9f, .size = 1, .activate = 10 },
-
-		[SCARLETT2_CONFIG_MONITOR_OTHER_ENABLE] = {
-			.offset = 0xa0, .size = 1, .activate = 10 },
-
-		[SCARLETT2_CONFIG_TALKBACK_MAP] = {
-			.offset = 0xb0, .size = 16, .activate = 10 },
-	},
-
-/* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
-}, [SCARLETT2_CONFIG_SET_CLARETT] = {
-	.items = {
-		[SCARLETT2_CONFIG_DIM_MUTE] = {
-			.offset = 0x31, .size = 8, .activate = 2 },
-
-		[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-			.offset = 0x34, .size = 16, .activate = 1 },
-
-		[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-			.offset = 0x5c, .size = 8, .activate = 1 },
-
-		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-			.offset = 0x66, .size = 8, .activate = 3 },
-
-		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-			.offset = 0x7c, .size = 8, .activate = 7 },
-
-		[SCARLETT2_CONFIG_AIR_SWITCH] = {
-			.offset = 0x95, .size = 8, .activate = 8 },
-
-		[SCARLETT2_CONFIG_STANDALONE_SWITCH] = {
-			.offset = 0x8d, .size = 8, .activate = 6 },
-	}
-} };
-
 /* proprietary request/response format */
 struct scarlett2_usb_packet {
 	__le32 cmd;
@@ -1523,11 +1513,7 @@ static int scarlett2_usb_get(
 static int scarlett2_has_config_item(
 	struct scarlett2_data *private, int config_item_num)
 {
-	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_config *config_item =
-		&scarlett2_config_sets[info->config_set].items[config_item_num];
-
-	return !!config_item->offset;
+	return !!private->config_set->items[config_item_num].offset;
 }
 
 /* Send a USB message to get configuration parameters; result placed in *buf */
@@ -1536,9 +1522,8 @@ static int scarlett2_usb_get_config(
 	int config_item_num, int count, void *buf)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-	    &scarlett2_config_sets[info->config_set].items[config_item_num];
+		&private->config_set->items[config_item_num];
 	int size, err, i;
 	u8 *buf_8;
 	u8 value;
@@ -1598,9 +1583,8 @@ static int scarlett2_usb_set_config(
 	int config_item_num, int index, int value)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_config *config_item =
-	    &scarlett2_config_sets[info->config_set].items[config_item_num];
+		&private->config_set->items[config_item_num];
 	struct {
 		__le32 offset;
 		__le32 bytes;
@@ -4365,6 +4349,7 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	mixer->private_suspend = scarlett2_private_suspend;
 
 	private->info = entry->info;
+	private->config_set = entry->info->config_set;
 	private->series_name = entry->series_name;
 	scarlett2_count_mux_io(private);
 	private->scarlett2_seq = 0;
-- 
2.43.0

