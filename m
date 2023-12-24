Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718981DC13
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC42E7C;
	Sun, 24 Dec 2023 20:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC42E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446015;
	bh=35XS75HqNmQz8YN8WQkMND/3w+nO3ufTkYZX0oNISb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s6JOMTCrbz8qztCZkNH+KaPhu+BKQwfvfhRIXRjtWJ4TrjqtBVTZYNd5lpAuH0t+p
	 8YkXZgsdT3enc9xQhOiPIDE98zTPvYcxn5Vf485xJN1s8rrq1zv+FoFh+bwlO9IPrV
	 t/bECA9f1qt8cpCp+mcItQ3BiwxlRADWc5SJ0Tls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F76F805C9; Sun, 24 Dec 2023 20:26:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B27F805BF;
	Sun, 24 Dec 2023 20:26:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 509F8F80557; Sun, 24 Dec 2023 20:22:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E80EDF800F5
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E80EDF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=rrEDg5uC
Received: by m.b4.vu (Postfix, from userid 1000)
	id 76BD5604B9CB; Mon, 25 Dec 2023 05:51:40 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 76BD5604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445700; bh=yUrs2QYAjQLNJwKFAZmVirh9QQKRH6ig6PgoW1Liv7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrEDg5uCVecyaszp92hBu0lr9XuBEhlv2tMFqPYTQhfzLkCTLNTlYadP0Rqf61PYM
	 Up/GAt3QwnZtFeSnnbxyMOfkSf8pO5d5TGl+HyYHuXQtzhfj4TQGCz/79/JnAAcyql
	 VtFM6t2dNOKodq3rmSJRfI+LF8rBPAWh5k4OYDyOdQlYUQtyAA55x3+hdSx7qH60+E
	 X1okV8Sg2pUnwK+RN/RIeZ5e/ijUMyhhRWzo93sSsGSFQ2nBh+M4jaVbiK5zzsEhvE
	 vGgrVStzk1sjoRbJ7A3B7WocKu4ygCErhgJnZDO5hrBCIC/WtQ8r/4fccf3nPn8vNM
	 mqZTYiqnGb5xA==
Date: Mon, 25 Dec 2023 05:51:40 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 03/23] ALSA: scarlett2: Infer standalone switch from config
 items
Message-ID: <59c30885b02d65feaab2c338cf46889d72d01813.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: 3BVYNAOT56GFAMWZSUCB4YSU7TCJLXF5
X-Message-ID-Hash: 3BVYNAOT56GFAMWZSUCB4YSU7TCJLXF5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BVYNAOT56GFAMWZSUCB4YSU7TCJLXF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rather than assuming the standalone switch is present for all devices
with a mixer, instead check for the presence of the
SCARLETT2_CONFIG_STANDALONE_SWITCH config item.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 85a93dd0f354..88571abd4a8d 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -4244,7 +4244,8 @@ static int scarlett2_add_standalone_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
-	if (private->info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
+	if (!scarlett2_has_config_item(private,
+				       SCARLETT2_CONFIG_STANDALONE_SWITCH))
 		return 0;
 
 	/* Add standalone control */
@@ -4512,11 +4513,14 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 	if (info->config_set == SCARLETT2_CONFIG_SET_GEN_3A)
 		return 0;
 
-	err = scarlett2_usb_get_config(
-		mixer, SCARLETT2_CONFIG_STANDALONE_SWITCH,
-		1, &private->standalone_switch);
-	if (err < 0)
-		return err;
+	if (scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_STANDALONE_SWITCH)) {
+		err = scarlett2_usb_get_config(
+			mixer, SCARLETT2_CONFIG_STANDALONE_SWITCH,
+			1, &private->standalone_switch);
+		if (err < 0)
+			return err;
+	}
 
 	err = scarlett2_update_sync(mixer);
 	if (err < 0)
-- 
2.43.0

