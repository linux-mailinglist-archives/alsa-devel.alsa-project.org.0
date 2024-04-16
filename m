Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BC8A6A94
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 14:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDA9EC1;
	Tue, 16 Apr 2024 14:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDA9EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713269895;
	bh=FgviWFGwf9CMO7Zp1Ce05FWvQLhIYD6uwo7L3B7g/Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XzELC3n4Rte9mQgratXC0M5A+hhOQlA3gVxpcS7nzqZeGsIdJBfpmb64ZvdmAIQ1y
	 njSoe7zO3zKTLrJih04VrSYdajH+LmMPsf3Lx14bPIzPzYFQ/JlDD93UEmWK5UNRT2
	 lCpboWoLytARl2IC13NdcYkEOQmr7IFbSipbFQZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C75F805A9; Tue, 16 Apr 2024 14:17:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02367F8025A;
	Tue, 16 Apr 2024 14:17:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F6AEF80496; Tue, 16 Apr 2024 14:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 516B4F80236
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516B4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=d7pHGA3p;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=dJH2apKX
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 15D171722D3;
	Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269848; bh=FgviWFGwf9CMO7Zp1Ce05FWvQLhIYD6uwo7L3B7g/Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7pHGA3p7v59QvkDqdBilYZX2k8+KPoa6LTdEKiPDnXbI3nKpQigMxYJGTi4xVhas
	 GSif7Mobr2UciA0Fy0m9d6jtYKrimrfQvbKt07T6bxqJHfr/c/ha+HkmIpE/gqZwgS
	 QX8Hi++TGeZQ1pfS58f9d478boL+ggdxAAySGoX0=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvXwtzzLDrO7; Tue, 16 Apr 2024 14:17:27 +0200 (CEST)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 96ECD173697;
	Tue, 16 Apr 2024 14:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269847; bh=FgviWFGwf9CMO7Zp1Ce05FWvQLhIYD6uwo7L3B7g/Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJH2apKXw3hYcBBiyGDCj3ZSJwVsMqt5F76PVaJoJc53sb3hZE5zsyrdafIAT2NSp
	 40ZYLZGghfXjE1bAFI+Dpbe+Nz2ntwtABgzxBHv1mBG3qLSqZSGsjRYuqhF82JoNgg
	 gWvZouebm8TOAZWcxfpaHNWOoIot7FE9TjJScYvU=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH 1/3] ALSA:aloop: add DSD formats
Date: Tue, 16 Apr 2024 14:17:24 +0200
Message-Id: <20240416121726.628679-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416121726.628679-1-pavel.hofman@ivitera.com>
References: <20240416121726.628679-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RDDNYDFJ2HLDA5XLQTBZ5LLUIZ4OZMFF
X-Message-ID-Hash: RDDNYDFJ2HLDA5XLQTBZ5LLUIZ4OZMFF
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDDNYDFJ2HLDA5XLQTBZ5LLUIZ4OZMFF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The snd-aloop loopback driver does not modify or access the actual samples
in any way, defines no volume or mute controls, it's strictly bitperfect.
Therefore DSD formats can be supported without any modification.

Add all DSD formats to the list of supported formats.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 sound/drivers/aloop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 892c4e29c0a3..44ee2a4bc2b0 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -927,7 +927,10 @@ static const struct snd_pcm_hardware loopback_pcm_hardware =
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |
 			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
-			 SNDRV_PCM_FMTBIT_FLOAT_LE | SNDRV_PCM_FMTBIT_FLOAT_BE),
+			 SNDRV_PCM_FMTBIT_FLOAT_LE | SNDRV_PCM_FMTBIT_FLOAT_BE |
+			 SNDRV_PCM_FMTBIT_DSD_U8 |
+			 SNDRV_PCM_FMTBIT_DSD_U16_LE | SNDRV_PCM_FMTBIT_DSD_U16_BE |
+			 SNDRV_PCM_FMTBIT_DSD_U32_LE | SNDRV_PCM_FMTBIT_DSD_U32_BE),
 	.rates =	SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_192000,
 	.rate_min =		8000,
 	.rate_max =		192000,
-- 
2.25.1

