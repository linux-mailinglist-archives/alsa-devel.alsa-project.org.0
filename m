Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86E81DC14
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:27:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828C9DF3;
	Sun, 24 Dec 2023 20:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828C9DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446036;
	bh=nqxEm0p5isJv8hgkvnA9J+iMUBfAukR7TrlEtk7xkjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P3+9ehFESFmQG+ew0FKEbr5e/S+k7A+gkkBQKA9uq31ANVPkqzJkRHmVxdNbpVxK8
	 jFTA6j8kUOfqH8whzloVzLH9ULOK1IfbrEOTpsS0k+iaxk2BPCInLmF95YE3h06lTZ
	 zuXTQCRbyhLreCMmGsaB4ljBpsUmQjFlQzQv76nE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA669F805EB; Sun, 24 Dec 2023 20:26:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CA5F805EB;
	Sun, 24 Dec 2023 20:26:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1BAF80537; Sun, 24 Dec 2023 20:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50243F8027B
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50243F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=mLPoZoBA
Received: by m.b4.vu (Postfix, from userid 1000)
	id B77AA604B9CB; Mon, 25 Dec 2023 05:52:24 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu B77AA604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445744; bh=KFeyHjN/zFYsWRr2wsyVrOFGrr3uGhR5lIrXSVGsT/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLPoZoBAR/erzqoHkg5gJwMBfSEMWv03D1MqBilFvp4YQuIrReS0JPoIeCP1RYWYG
	 mZM5Pl9AXCaj5RCxWi2gc4dVKlMbmU2IaKQ2Bge+srhg2bAkLD/SGsCYOQwWu6CWRX
	 IjT1EjrQKT49bgw8MsbZJlE/Ming4PO1Wu9XCZ4RAlyE35VCi+Jb928e7vO3pJg8b1
	 WkMqz2ku8kQOoVc+sSySEH+X+8zr5s17fx2cwm1wQ4yfSnVtG+lVaPfZl/D67z32qI
	 zEmIxwCm8ElQSi/yIcW/LIen6HnceJRdsELAPIqWQZRDgur9tNE0lkzkucnSG/U8m7
	 +pF7Zks5ACxJA==
Date: Mon, 25 Dec 2023 05:52:24 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 05/23] ALSA: scarlett2: Check presence of mixer using
 mux_assignment
Message-ID: <ef6f4d360c2fe682ab65f83cccbe5be66ccc6296.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: GG3UIM6OUWAGL7R5SJBXKW2LHDMBGGEN
X-Message-ID-Hash: GG3UIM6OUWAGL7R5SJBXKW2LHDMBGGEN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GG3UIM6OUWAGL7R5SJBXKW2LHDMBGGEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the presence of a mixer is determined by checking if the
device uses the GEN_3A config set. Add scarlett2_has_mixer() function
which checks for the presence of mux_assignment entries instead.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 95a9b5c41b3d..fc9f360d0e1e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1680,6 +1680,12 @@ static int scarlett2_usb_get_volume_status(
 				 buf, sizeof(*buf));
 }
 
+/* Return true if the device has a mixer that we can control */
+static int scarlett2_has_mixer(struct scarlett2_data *private)
+{
+	return !!private->info->mux_assignment[0][0].count;
+}
+
 /* Send a USB message to get the volumes for all inputs of one mix
  * and put the values into private->mix[]
  */
@@ -2175,7 +2181,7 @@ static int scarlett2_add_sync_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting sync status */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_sync_ctl,
@@ -4111,7 +4117,7 @@ static int scarlett2_add_meter_ctl(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* devices without a mixer also don't support reporting levels */
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	return scarlett2_add_new_ctl(mixer, &scarlett2_meter_ctl,
@@ -4516,7 +4522,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* the rest of the configuration is for devices with a mixer */
-	if (info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_mixer(private))
 		return 0;
 
 	if (scarlett2_has_config_item(private,
-- 
2.43.0

