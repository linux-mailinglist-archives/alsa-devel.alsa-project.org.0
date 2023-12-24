Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A24CA81DC11
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:22:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5870CDF4;
	Sun, 24 Dec 2023 20:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5870CDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703445735;
	bh=nZo4muGunrVA+n075+BnY2kLXit710fuHqVKWtrpRfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYMn05sa1wHHs77FHHFB7nXuEJSD11Jc0JpOmJROUj4hVfdqSMvy3FYqGPdD305TS
	 51cijegN+bSP58+n9dqwBkrqm+PCbZWxT8sW+Jwk50g6TgPE58w7CkdfwHaBaZNtH+
	 baqZwc7KO/qDpRJ0HR++ntnq7vyd1P2qkwLF59jQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F00F8057A; Sun, 24 Dec 2023 20:21:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C7EEF80588;
	Sun, 24 Dec 2023 20:21:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CFFEF80537; Sun, 24 Dec 2023 20:21:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E7572F80563
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:20:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7572F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=bU3G+1AH
Received: by m.b4.vu (Postfix, from userid 1000)
	id 11C8D604B9CB; Mon, 25 Dec 2023 05:50:52 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 11C8D604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445652; bh=7LpCnNlhXobkAVT1NO8tzjGm+lJkQJ/0tDKAfOR7RbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU3G+1AH1cHrlEIFAjAC2faBFAYkQtnSEtpYSIOgAdVHk2wLyUn7XUCHFQsRdZhgL
	 6VHJFIJ58TkzxkTVMZAfxLrHl8cjG1IAMztg1jvzlPRBareDwHv4T8y7yziQNwIRt7
	 zu3CoItj2vLgW7QMonUQUAWc4IAy7hk2Zf7nN3oKDOfw3sixTCRszlvMhXJ5aW9Yhf
	 r09M37CEKWNoNC73eEjnvPC2t8gf2qtvZj8STwjIXhcSKK1trLto4oZILTF8YrQrAr
	 nneyenyRDT9/F7GqkaQPy3BSej7RrRdWkgXtjYeUiW9bcaS1YkPfIS4in7XYpTxYOC
	 WEY15akZ6AUPA==
Date: Mon, 25 Dec 2023 05:50:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 02/23] ALSA: scarlett2: Infer has_msd_mode from config items
Message-ID: <ecbf3740e6b30a245333528ae4c504f37a9bc6bf.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: 2NOI6QUPB2BGE6KL66UUXWDGIMLVJTVH
X-Message-ID-Hash: 2NOI6QUPB2BGE6KL66UUXWDGIMLVJTVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NOI6QUPB2BGE6KL66UUXWDGIMLVJTVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rather than storing has_msd_mode in the per-device structure, infer
this from the presence of the SCARLETT2_CONFIG_MSD_SWITCH entry in the
device's configuration set.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 6ab8b4c52357..85a93dd0f354 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -355,12 +355,6 @@ struct scarlett2_meter_entry {
 };
 
 struct scarlett2_device_info {
-	/* Gen 3 devices have an internal MSD mode switch that needs
-	 * to be disabled in order to access the full functionality of
-	 * the device.
-	 */
-	u8 has_msd_mode;
-
 	/* which set of configuration parameters the device uses */
 	u8 config_set;
 
@@ -652,7 +646,6 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 };
 
 static const struct scarlett2_device_info solo_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 1,
 	.level_input_first = 1,
@@ -663,7 +656,6 @@ static const struct scarlett2_device_info solo_gen3_info = {
 };
 
 static const struct scarlett2_device_info s2i2_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3A,
 	.level_input_count = 2,
 	.air_input_count = 2,
@@ -673,7 +665,6 @@ static const struct scarlett2_device_info s2i2_gen3_info = {
 };
 
 static const struct scarlett2_device_info s4i4_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -723,7 +714,6 @@ static const struct scarlett2_device_info s4i4_gen3_info = {
 };
 
 static const struct scarlett2_device_info s8i6_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.level_input_count = 2,
 	.pad_input_count = 2,
@@ -782,7 +772,6 @@ static const struct scarlett2_device_info s8i6_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i8_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
@@ -863,7 +852,6 @@ static const struct scarlett2_device_info s18i8_gen3_info = {
 };
 
 static const struct scarlett2_device_info s18i20_gen3_info = {
-	.has_msd_mode = 1,
 	.config_set = SCARLETT2_CONFIG_SET_GEN_3B,
 	.line_out_hw_vol = 1,
 	.has_speaker_switching = 1,
@@ -1518,6 +1506,19 @@ static int scarlett2_usb_get(
 			     &req, sizeof(req), buf, size);
 }
 
+/* Return true if the given configuration item is present in the
+ * configuration set used by this device.
+ */
+static int scarlett2_has_config_item(
+	struct scarlett2_data *private, int config_item_num)
+{
+	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_config *config_item =
+		&scarlett2_config_items[info->config_set][config_item_num];
+
+	return !!config_item->offset;
+}
+
 /* Send a USB message to get configuration parameters; result placed in *buf */
 static int scarlett2_usb_get_config(
 	struct usb_mixer_interface *mixer,
@@ -4170,9 +4171,8 @@ static const struct snd_kcontrol_new scarlett2_msd_ctl = {
 static int scarlett2_add_msd_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_device_info *info = private->info;
 
-	if (!info->has_msd_mode)
+	if (!scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH))
 		return 0;
 
 	/* If MSD mode is off, hide the switch by default */
@@ -4488,7 +4488,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
-	if (info->has_msd_mode) {
+	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
 		err = scarlett2_usb_get_config(
 			mixer, SCARLETT2_CONFIG_MSD_SWITCH,
 			1, &private->msd_switch);
-- 
2.43.0

