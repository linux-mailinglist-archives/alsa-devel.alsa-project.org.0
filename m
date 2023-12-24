Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52881DC21
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5DAE8C;
	Sun, 24 Dec 2023 20:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5DAE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446326;
	bh=H8OWmmmx19bOWpQAjZLWpske6jOZ6X9N8OIgOBbFZmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qr5dKWRbXqDIRgCn/D1zsOx7vvaASqmpT2F0MUucL5GL9lxps8kb8JWAC95ebMLRK
	 nUmh3RWdOzhrq5AnK02kUwC5lKCPO4AA7YsvkG/1WT9EbjwysY+38hUD14Gci8ZXst
	 7ttxbkVul7g/lLK8Dq4h9MzNhpihYp/ISin1YT3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09D37F8057F; Sun, 24 Dec 2023 20:31:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 480F1F805B2;
	Sun, 24 Dec 2023 20:31:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDAEAF8057A; Sun, 24 Dec 2023 20:31:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5517F80578
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5517F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=mPBTOMBs
Received: by m.b4.vu (Postfix, from userid 1000)
	id 1ADD8604B9CB; Mon, 25 Dec 2023 06:00:05 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 1ADD8604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446205; bh=MPdWXYyjeLUiVdcoIXauoPNBZqkN1SEaphNqdSEFlV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPBTOMBsnHMCJvUvn932UJoaWds0ITzC6Rrildl1kWpB4IVAQb7rg+hUHGlCkm9Av
	 w8AqQwfqOHBZpDVUOftzq7f7hMQhwk6XSQwM/sE6dnZWitwyF1knce1cHqXcqCkPst
	 HH5jj6mNntqCXEMi9kGoq97AuCO95xh/kRQEbvrTMqXqe5uykm8AOGCdpOBWhNvC7j
	 iYl44xovsm3e/k3NmDro5Q9fS+Cqq3kB7bhYPLO9r5NI19Czb63WIVb7AHbn1aOOj2
	 qr2zOG5j4+0gXzItd4VV2SI7eyICOvOTJpUop5RId4TViTU7pCp623fdslgLZKWxuD
	 d25ZrpF3E4cQg==
Date: Mon, 25 Dec 2023 06:00:05 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 18/23] ALSA: scarlett2: Allow for interfaces without
 per-channel volume
Message-ID: <30f68cb311e27f2cc1351cb846218f7248a90263.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: KRPEQNPUNG4JBVB2QWLOJMZ26YIOFNSN
X-Message-ID-Hash: KRPEQNPUNG4JBVB2QWLOJMZ26YIOFNSN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRPEQNPUNG4JBVB2QWLOJMZ26YIOFNSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently-supported interfaces with a mixer have per-channel volume
controls, but this changes in Gen 4. Add a check so that the Playback
Volume and associated controls don't get created unless the
SCARLETT2_CONFIG_LINE_OUT_VOLUME config item is present.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 68 ++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index e8a93fd339f7..24d7cc85cf04 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3726,6 +3726,13 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
+	/* Remaining controls are only applicable if the device
+	 * has per-channel line-out volume controls.
+	 */
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_LINE_OUT_VOLUME))
+		return 0;
+
 	/* Add volume controls */
 	for (i = 0; i < private->num_line_out; i++) {
 		int index = line_out_remap(private, i);
@@ -4569,7 +4576,6 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	int err, i;
-	s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
 	if (scarlett2_has_config_item(private, SCARLETT2_CONFIG_MSD_SWITCH)) {
 		err = scarlett2_usb_get_config(
@@ -4608,41 +4614,47 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
-	/* read SW line out volume */
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
-		private->num_line_out, &sw_vol);
-	if (err < 0)
-		return err;
-
-	for (i = 0; i < private->num_line_out; i++)
-		private->vol[i] = clamp(
-			sw_vol[i] + SCARLETT2_VOLUME_BIAS,
-			0, SCARLETT2_VOLUME_BIAS);
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_LINE_OUT_VOLUME)) {
+		s16 sw_vol[SCARLETT2_ANALOGUE_MAX];
 
-	/* read SW mute */
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
-		private->num_line_out, &private->mute_switch);
-	if (err < 0)
-		return err;
+		/* read SW line out volume */
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_LINE_OUT_VOLUME,
+			private->num_line_out, &sw_vol);
+		if (err < 0)
+			return err;
 
-	for (i = 0; i < private->num_line_out; i++)
-		private->mute_switch[i] =
-			!!private->mute_switch[i];
+		for (i = 0; i < private->num_line_out; i++)
+			private->vol[i] = clamp(
+				sw_vol[i] + SCARLETT2_VOLUME_BIAS,
+				0, SCARLETT2_VOLUME_BIAS);
 
-	/* read SW/HW switches */
-	if (scarlett2_has_config_item(private,
-				      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
+		/* read SW mute */
 		err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
-			private->num_line_out, &private->vol_sw_hw_switch);
+			mixer, SCARLETT2_CONFIG_MUTE_SWITCH,
+			private->num_line_out, &private->mute_switch);
 		if (err < 0)
 			return err;
 
 		for (i = 0; i < private->num_line_out; i++)
-			private->vol_sw_hw_switch[i] =
-				!!private->vol_sw_hw_switch[i];
+			private->mute_switch[i] =
+				!!private->mute_switch[i];
+
+		/* read SW/HW switches */
+		if (scarlett2_has_config_item(private,
+					      SCARLETT2_CONFIG_SW_HW_SWITCH)) {
+			err = scarlett2_usb_get_config(
+				mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
+				private->num_line_out,
+				&private->vol_sw_hw_switch);
+			if (err < 0)
+				return err;
+
+			for (i = 0; i < private->num_line_out; i++)
+				private->vol_sw_hw_switch[i] =
+					!!private->vol_sw_hw_switch[i];
+		}
 	}
 
 	err = scarlett2_update_volumes(mixer);
-- 
2.43.0

