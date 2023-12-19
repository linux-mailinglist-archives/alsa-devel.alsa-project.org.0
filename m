Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B2818E4F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493B3E8C;
	Tue, 19 Dec 2023 18:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493B3E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007607;
	bh=b5MDa03Vi7XKT0qQS1k8UXSPsp5FYy2d/OBD41hAEBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ou/BEqhIx9OByEwo6dvFuzGlDAwxRZw7juKOiXjkYH4blcy6Ejms8DWplyThaa105
	 Dy7omqdXv3X1QTNMSLK1oKMnAsx3oTSbj07edfR21oDl5G2B9p2Vlx10D0Ab2Z0e83
	 XH4nbFqPDzqzrUG1P57tWttFy4goVRb59DepDyo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C280F805F5; Tue, 19 Dec 2023 18:39:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE65F805EF;
	Tue, 19 Dec 2023 18:39:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4537F8055C; Tue, 19 Dec 2023 18:39:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 32C9BF80431
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C9BF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=J40YY9LR
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3DAD0604B9F7; Wed, 20 Dec 2023 04:07:21 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3DAD0604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007441; bh=UPNbemMDS4lDUP7V/e0nZI2I2ad47Wkcxstixw5X+Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J40YY9LRwCJPGApJEpHdQEhpI3svsHm+iZXZ65R5cUmPvpQpsnKs5HSoh3Gi+dVc3
	 vi97nhwn/8PFD4d4dJ92ylslHyLe/mLU0Cno6DwFSRrvOmVPz0D3JajAGKihthSf19
	 d1Wd2P9YYhtHa4sHVkd04I/QFD5Q1N0O/eomZEySqzJoTBnix+/IkvwNLrn+027Puk
	 o7wXGk+2HtAuBrT8cKtMuFg3IXWmTiJMkfG0xxuXJ0+l3LKGA9h6DsTMtwhabWY2OX
	 Wc+HpHDRv3sjjvBeDsy5T4nJflAanRYDi+jpqYbVs9bNxL57MCf84h1CIGYYypIeyv
	 1X83Dfnk905Rw==
Date: Wed, 20 Dec 2023 04:07:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 03/11] ALSA: scarlett2: Add missing error check to
 scarlett2_usb_set_config()
Message-ID: <def110c5c31dbdf0a7414d258838a0a31c0fab67.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: 3Q6UAA5P7VWVNFLQJPGK7FUTBRA6TYN5
X-Message-ID-Hash: 3Q6UAA5P7VWVNFLQJPGK7FUTBRA6TYN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Q6UAA5P7VWVNFLQJPGK7FUTBRA6TYN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

scarlett2_usb_set_config() calls scarlett2_usb_get() but was not
checking the result. Return the error if it fails rather than
continuing with an invalid value.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e15fae6c51a ("ALSA: usb-audio: scarlett2: Allow bit-level access to config")
---
 sound/usb/mixer_scarlett2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a0ba53372f7b..22285d8038c1 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1577,7 +1577,10 @@ static int scarlett2_usb_set_config(
 		size = 1;
 		offset = config_item->offset;
 
-		scarlett2_usb_get(mixer, offset, &tmp, 1);
+		err = scarlett2_usb_get(mixer, offset, &tmp, 1);
+		if (err < 0)
+			return err;
+
 		if (value)
 			tmp |= (1 << index);
 		else
-- 
2.43.0

