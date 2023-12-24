Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B90481DC22
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E17EA1;
	Sun, 24 Dec 2023 20:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E17EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446336;
	bh=c8fGvH8LV0hkfT64oWBmaLMsrT7orMiT8KMsbPUUtws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8XRGnLfxTwBEZ8S/gIX68NgsxZ2CMsYG5z3wDaSj8Pewg27vmyNUb6r+OegImC6x
	 SbFqUovNchZvVniE05fk4YD52+LcdoBcdTK7o4hEsbaFT4lGZNKsc40qXS0pTGR2VK
	 zjkLNCKPjmzJCgML4buiWyAysHav0YN2S364jdj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5472BF805C9; Sun, 24 Dec 2023 20:31:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D079EF805E0;
	Sun, 24 Dec 2023 20:31:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C087F805BD; Sun, 24 Dec 2023 20:31:40 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 38D22F8055A
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D22F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=l1ROG/z+
Received: by m.b4.vu (Postfix, from userid 1000)
	id 1A785604B9CB; Mon, 25 Dec 2023 06:00:15 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 1A785604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446215; bh=8xi2vPYExE3qOuwPyc1YBuFNPQDSs+8oaJipBpVD3Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1ROG/z+/GdCf4PcKYtSh7FMaZHDBqZKTYcHfyMCMfoyi9V5BHR0+2qTAp4KbcbEG
	 2s5VwCVpaTKDDT053NkRSD1m6nrTWc9iQ0N8bAgt8M8iCAY8d290kMbX0A4FyKOoVY
	 tI31ALB30r+djq4Z8EJDb5++DEmIo7/rU/2Snl6Bz/NqmVU8NtvTahfDVDRrhEwgXW
	 ueDJ7XCDlLqEtKdLYkqHxz4YG+VVvgdJaAdA7CMooh5BAi5ta0G202/BmSeRogFgRn
	 YawIK6pDWbm6l9OxqALADaQ7yXK9bFyIIF346CO274dIUg3+O7oLj8gANg3SUik7gy
	 z/fxZuxrTRNqg==
Date: Mon, 25 Dec 2023 06:00:15 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 19/23] ALSA: scarlett2: Add scarlett2_mixer_value_to_db()
Message-ID: <7adf869852aba2819fddb850b0ea8df5f7d73931.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: TQHEWQZLR45FXDMKDBNGOHOJ5EFFVYSJ
X-Message-ID-Hash: TQHEWQZLR45FXDMKDBNGOHOJ5EFFVYSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQHEWQZLR45FXDMKDBNGOHOJ5EFFVYSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor scarlett2_usb_get_mix(), moving the scarlett2_mixer_values[]
lookup into scarlett2_mixer_value_to_db().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 24d7cc85cf04..efe95a25998b 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1763,6 +1763,19 @@ static int scarlett2_has_mixer(struct scarlett2_data *private)
 	return !!private->info->mux_assignment[0][0].count;
 }
 
+/* Map from mixer value to (db + 80) * 2
+ * (reverse of scarlett2_mixer_values[])
+ */
+static int scarlett2_mixer_value_to_db(int value)
+{
+	int i;
+
+	for (i = 0; i < SCARLETT2_MIXER_VALUE_COUNT; i++)
+		if (scarlett2_mixer_values[i] >= value)
+			return i;
+	return SCARLETT2_MIXER_MAX_VALUE;
+}
+
 /* Send a USB message to get the volumes for all inputs of one mix
  * and put the values into private->mix[]
  */
@@ -1772,7 +1785,7 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 	struct scarlett2_data *private = mixer->private_data;
 
 	int num_mixer_in = private->num_mix_in;
-	int err, i, j, k;
+	int err, i, j;
 
 	struct {
 		__le16 mix_num;
@@ -1790,16 +1803,9 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 	if (err < 0)
 		return err;
 
-	for (i = 0, j = mix_num * num_mixer_in; i < num_mixer_in; i++, j++) {
-		u16 mixer_value = le16_to_cpu(data[i]);
-
-		for (k = 0; k < SCARLETT2_MIXER_VALUE_COUNT; k++)
-			if (scarlett2_mixer_values[k] >= mixer_value)
-				break;
-		if (k == SCARLETT2_MIXER_VALUE_COUNT)
-			k = SCARLETT2_MIXER_MAX_VALUE;
-		private->mix[j] = k;
-	}
+	for (i = 0, j = mix_num * num_mixer_in; i < num_mixer_in; i++, j++)
+		private->mix[j] = scarlett2_mixer_value_to_db(
+			le16_to_cpu(data[i]));
 
 	return 0;
 }
-- 
2.43.0

