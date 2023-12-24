Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78C81DC12
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA57D83E;
	Sun, 24 Dec 2023 20:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA57D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446003;
	bh=66XP0NrNcLnwnhbJsgPLsUcTGNtLnRxrKzvVVatQFdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t3Xts9IQNf3m5sYjEASyscE6bLNmErxV5rocsxIkQFZ7hKpbLsDehtzAK6grz7DA3
	 ajgb7B3dZLoXhlhIWQL/Y8CJSGiup+PjgqTVL0ejXbu5HCDlQkqcEJn8DB3fT1LbvE
	 SiTp6EjR5HXRHc4+Xt/udgJveGyFaQEUTDeNbsCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AF94F8057E; Sun, 24 Dec 2023 20:26:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8FF8F8057B;
	Sun, 24 Dec 2023 20:26:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A746F8055C; Sun, 24 Dec 2023 20:22:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D7B2F805AB
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7B2F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=lcY1Seh/
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5B978604B9CB; Mon, 25 Dec 2023 05:51:56 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5B978604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445716; bh=OY/9fOdaQOzNy9mF7EvxrQBR6hsz3YCcaEvGqBUeKN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcY1Seh/OVvZKqbGGV2vt2H3Oz0RKbiNax2CmWnhgV1DVDQdvTvcVAixHKA86OTUC
	 JGbcxlh/aYJ/O101wgfG7voj9zF3pbx3XHy2K/WZwCR/q4JiEAOP+rPBFQGAvI8TgC
	 I7h6arSRHuYZai/31z5H0xiNYRIYxfFCbN7cYTZsqZOW/+i0TdcnYNLMV2veNTfCxt
	 mEizapYzI3CXv2Xkr7Axc//s7Xstv4VMGajX5GbZGpmUN+Ieq2MBTEjgTPL9kkbmST
	 Pa3g8L1WAtQZ+BV4eKYCitDmZBhDtZVp1irgUk8UzQbGRv9XP/2ZFVOwG9QsBAYmFy
	 HmaKLwT5MXxDA==
Date: Mon, 25 Dec 2023 05:51:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 04/23] ALSA: scarlett2: Check for phantom persistence config
 item
Message-ID: <3ccaf8069280827bd6c44f103fcb770bd50b7e2e.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: 52IJ43WHBHBE5Z77D47PJAWQP6S7SRNE
X-Message-ID-Hash: 52IJ43WHBHBE5Z77D47PJAWQP6S7SRNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52IJ43WHBHBE5Z77D47PJAWQP6S7SRNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for the phantom persistence config item to not exist. This is
needed for the Scarlett Gen 4 series.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 88571abd4a8d..95a9b5c41b3d 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2621,11 +2621,15 @@ static int scarlett2_update_input_other(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;
 
-		err = scarlett2_usb_get_config(
-			mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
-			1, &private->phantom_persistence);
-		if (err < 0)
-			return err;
+		if (scarlett2_has_config_item(
+				private,
+				SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
+			err = scarlett2_usb_get_config(
+				mixer, SCARLETT2_CONFIG_PHANTOM_PERSISTENCE,
+				1, &private->phantom_persistence);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	return 0;
@@ -3779,7 +3783,9 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 				return err;
 		}
 	}
-	if (info->phantom_count) {
+	if (info->phantom_count &&
+	    scarlett2_has_config_item(private,
+				      SCARLETT2_CONFIG_PHANTOM_PERSISTENCE)) {
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_phantom_persistence_ctl, 0, 1,
 			"Phantom Power Persistence Capture Switch", NULL);
-- 
2.43.0

