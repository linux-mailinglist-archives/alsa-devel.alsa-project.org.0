Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B4E81DC1E
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:30:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F31E9C;
	Sun, 24 Dec 2023 20:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F31E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446211;
	bh=NmWvtNwrLtWzwW5zmzfru0n3jDcqkG/Kt26wQ8+8w38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VHTUWl5lS2isfnDBRDWoOf1x1e/EdEwsfQR5pE3CbrQhdw1Yn9/nhe6WBTLmPEezd
	 KiO2UWxq5D3JFiVC83LB/ajhUIbVXikn6uuxSz+DzzPCD/alI4b58ZcQRvgL94pZ6u
	 V0OSxoP/mGcPmXKDiYszaAwGQzRz+JF2e7upCzqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CCE3F805C4; Sun, 24 Dec 2023 20:29:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62724F805B0;
	Sun, 24 Dec 2023 20:29:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BD2F80578; Sun, 24 Dec 2023 20:29:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D63FF8027B
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D63FF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=kXrcd0e5
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6E126604B9CB; Mon, 25 Dec 2023 05:58:49 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6E126604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446129; bh=yBUyz1sz38ItTTdvPyLP2EdfKvj0/p7Ni1vyYfWM17I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXrcd0e59P/tM/Ng+yLUZXyww8fPAsjneQo9yWOi1qXL9b/nOirfDnK2fQ0esiEJ5
	 PLs9jMm8S8pwfFtWZjyVjVs+Tqsb3es06Zu86As2EEhrdpAFDd1o+7bvfeH8+WF4au
	 UFF/DFGEoieMAPQOvUbjOJnGbRDOgyu+UmKvosupge6TX3IZuylbbs+ofvAOHQdR08
	 /pmdyfRzMlMcsHw0wbXbI1eR26ADEAbo0wss8mCps50CzdRsmlJ2aeamouv6J84iG+
	 V8ikzscSW8/uTlWaqYSeBBNK5YZIx3ib2cupHeeDET5qHAVjmaAoc5FwgD+bd/j68z
	 IdQESNdgYvhrg==
Date: Mon, 25 Dec 2023 05:58:49 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 15/23] ALSA: scarlett2: Remove struct
 scarlett2_usb_volume_status
Message-ID: <2ee88994857246bf89fab8e62ac279f3bcf96192.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: I3TCBMER6JP647SRUNDQPBK75WPFKPGP
X-Message-ID-Hash: I3TCBMER6JP647SRUNDQPBK75WPFKPGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3TCBMER6JP647SRUNDQPBK75WPFKPGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The struct scarlett2_usb_volume_status matched the config space layout
of a few volume controls that could be read together and were in fixed
locations between Gen 2 and Gen 3 devices.

Gen 4 devices have removed, moved, and new related controls, so this
needs to be cleaned up. By adding SCARLETT2_CONFIG_MASTER_VOLUME (the
only config item that didn't already have its own entry, because it is
read-only), we can remove:
- struct scarlett2_usb_volume_state,
- #define SCARLETT2_USB_VOLUME_STATUS_OFFSET, and
- scarlett2_usb_get_volume_status()
and replace with calls to scarlett2_usb_get_config().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 130 +++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 69 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 898cf2bd9655..b3f76476ce52 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -292,6 +292,7 @@ enum {
 	SCARLETT2_CONFIG_LINE_OUT_VOLUME,
 	SCARLETT2_CONFIG_MUTE_SWITCH,
 	SCARLETT2_CONFIG_SW_HW_SWITCH,
+	SCARLETT2_CONFIG_MASTER_VOLUME,
 	SCARLETT2_CONFIG_LEVEL_SWITCH,
 	SCARLETT2_CONFIG_PAD_SWITCH,
 	SCARLETT2_CONFIG_MSD_SWITCH,
@@ -336,6 +337,9 @@ static const struct scarlett2_config_set scarlett2_config_set_gen2 = {
 		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
 			.offset = 0x66, .size = 8, .activate = 3 },
 
+		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
+			.offset = 0x76, .size = 16 },
+
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 			.offset = 0x7c, .size = 8, .activate = 7 },
 
@@ -387,6 +391,9 @@ static const struct scarlett2_config_set scarlett2_config_set_gen3b = {
 		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
 			.offset = 0x66, .size = 8, .activate = 3 },
 
+		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
+			.offset = 0x76, .size = 16 },
+
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 			.offset = 0x7c, .size = 8, .activate = 7 },
 
@@ -435,6 +442,9 @@ static const struct scarlett2_config_set scarlett2_config_set_clarett = {
 		[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
 			.offset = 0x66, .size = 8, .activate = 3 },
 
+		[SCARLETT2_CONFIG_MASTER_VOLUME] = {
+			.offset = 0x76, .size = 16 },
+
 		[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
 			.offset = 0x7c, .size = 8, .activate = 7 },
 
@@ -1330,7 +1340,6 @@ static int scarlett2_get_port_start_num(
 
 #define SCARLETT2_USB_CONFIG_SAVE 6
 
-#define SCARLETT2_USB_VOLUME_STATUS_OFFSET 0x31
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
 #define SCARLETT2_FLASH_BLOCK_SIZE 4096
@@ -1341,31 +1350,6 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_SEGMENT_SETTINGS_NAME "App_Settings"
 #define SCARLETT2_SEGMENT_FIRMWARE_NAME "App_Upgrade"
 
-/* volume status is read together (matches scarlett2_config_items[1]) */
-struct scarlett2_usb_volume_status {
-	/* dim/mute buttons */
-	u8 dim_mute[SCARLETT2_DIM_MUTE_COUNT];
-
-	u8 pad1;
-
-	/* software volume setting */
-	s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
-
-	/* actual volume of output inc. dim (-18dB) */
-	s16 hw_vol[SCARLETT2_ANALOGUE_MAX];
-
-	/* internal mute buttons */
-	u8 mute_switch[SCARLETT2_ANALOGUE_MAX];
-
-	/* sw (0) or hw (1) controlled */
-	u8 sw_hw_switch[SCARLETT2_ANALOGUE_MAX];
-
-	u8 pad3[6];
-
-	/* front panel volume knob */
-	s16 master_vol;
-} __packed;
-
 /* proprietary request/response format */
 struct scarlett2_usb_packet {
 	__le32 cmd;
@@ -1725,15 +1709,6 @@ static int scarlett2_usb_get_sync_status(
 	return 0;
 }
 
-/* Send a USB message to get volume status; result placed in *buf */
-static int scarlett2_usb_get_volume_status(
-	struct usb_mixer_interface *mixer,
-	struct scarlett2_usb_volume_status *buf)
-{
-	return scarlett2_usb_get(mixer, SCARLETT2_USB_VOLUME_STATUS_OFFSET,
-				 buf, sizeof(*buf));
-}
-
 /* Return true if the device has a mixer that we can control */
 static int scarlett2_has_mixer(struct scarlett2_data *private)
 {
@@ -2245,23 +2220,32 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	struct scarlett2_usb_volume_status volume_status;
+	s16 vol;
 	int err, i;
 	int mute;
 
 	private->vol_updated = 0;
 
-	err = scarlett2_usb_get_volume_status(mixer, &volume_status);
+	if (!info->line_out_hw_vol)
+		return 0;
+
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_MASTER_VOLUME,
+		1, &vol);
 	if (err < 0)
 		return err;
 
-	private->master_vol = clamp(
-		volume_status.master_vol + SCARLETT2_VOLUME_BIAS,
-		0, SCARLETT2_VOLUME_BIAS);
+	private->master_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
+				    0, SCARLETT2_VOLUME_BIAS);
 
-	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
-			private->dim_mute[i] = !!volume_status.dim_mute[i];
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_DIM_MUTE,
+		SCARLETT2_DIM_MUTE_COUNT, private->dim_mute);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
+		private->dim_mute[i] = !!private->dim_mute[i];
 
 	mute = private->dim_mute[SCARLETT2_BUTTON_MUTE];
 
@@ -4518,8 +4502,8 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
+	s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
 	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
 		err = scarlett2_usb_get_config(
@@ -4558,38 +4542,46 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	err = scarlett2_usb_get_volume_status(mixer, &volume_status);
+	/* read SW line out volume */
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+		private->num_line_out, &sw_vol);
 	if (err < 0)
 		return err;
 
-	if (info->line_out_hw_vol)
-		for (i = 0; i < SCARLETT2_DIM_MUTE_COUNT; i++)
-			private->dim_mute[i] = !!volume_status.dim_mute[i];
+	for (i = 0; i < private->num_line_out; i++)
+		private->vol[i] = clamp(
+			sw_vol[i] + SCARLETT2_VOLUME_BIAS,
+			0, SCARLETT2_VOLUME_BIAS);
+
+	/* read SW mute */
+	err = scarlett2_usb_get_config(
+		mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
+		private->num_line_out, &private->mute_switch);
+	if (err < 0)
+		return err;
 
-	private->master_vol = clamp(
-		volume_status.master_vol + SCARLETT2_VOLUME_BIAS,
-		0, SCARLETT2_VOLUME_BIAS);
+	for (i = 0; i < private->num_line_out; i++)
+		private->mute_switch[i] =
+			!!private->mute_switch[i];
 
-	for (i = 0; i < private->num_line_out; i++) {
-		int volume, mute;
-
-		private->vol_sw_hw_switch[i] =
-			info->line_out_hw_vol
-				&& volume_status.sw_hw_switch[i];
-
-		volume = private->vol_sw_hw_switch[i]
-			   ? volume_status.master_vol
-			   : volume_status.sw_vol[i];
-		volume = clamp(volume + SCARLETT2_VOLUME_BIAS,
-			       0, SCARLETT2_VOLUME_BIAS);
-		private->vol[i] = volume;
-
-		mute = private->vol_sw_hw_switch[i]
-			 ? private->dim_mute[SCARLETT2_BUTTON_MUTE]
-			 : volume_status.mute_switch[i];
-		private->mute_switch[i] = mute;
+	/* read SW/HW switches */
+	if (info->line_out_hw_vol) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
+			private->num_line_out, &private->vol_sw_hw_switch);
+		if (err < 0)
+			return err;
+
+		for (i = 0; i < private->num_line_out; i++)
+			private->vol_sw_hw_switch[i] =
+				!!private->vol_sw_hw_switch[i];
 	}
 
+	err = scarlett2_update_volumes(mixer);
+	if (err < 0)
+		return err;
+
 	for (i = 0; i < private->num_mix_out; i++) {
 		err = scarlett2_usb_get_mix(mixer, i);
 		if (err < 0)
-- 
2.43.0

