Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BA8A6AA2
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 14:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C736E1928;
	Tue, 16 Apr 2024 14:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C736E1928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713269938;
	bh=Po9JsvvQFIs+av+zg4F0ovlQ3vsrMgHU61mOQKoQK0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k5ki5iGAtTRdgjTrk3arjqlFG8RQcUpFLbTdKC5bE5KVPEHoKWCPbFq3GG1B2NQaQ
	 QpKDqhm4WqfTCuOqoG2L7SAZd2p8L3FTQX751NsSdGjhwU0kfgopeoPwX36cc6tmoB
	 JZTfYQSjGmNFuWSV1Xo7OiY9wtxTXvbRTOFZnrIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD169F80619; Tue, 16 Apr 2024 14:17:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E44EF8060E;
	Tue, 16 Apr 2024 14:17:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FFD5F80236; Tue, 16 Apr 2024 14:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05103F8025A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 14:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05103F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=JOpDsHuy;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=JOpDsHuy
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 7BBF8173312;
	Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269848; bh=Po9JsvvQFIs+av+zg4F0ovlQ3vsrMgHU61mOQKoQK0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOpDsHuyxaK15TREJpEkgMn79dHnBsP/ZdDRnS42f+6ZKCnLLiFQkMyJ8ZexuGW2S
	 Bw+50SWsP2A+QxCq2UwNvBHBFif6fZll6hFHLBr4MYuG/+C1lGwvjV5zb1bTxirZqe
	 ZKSQcN/q854P5LpwKExRdnu4SoqlTpe4ATj7PDo4=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-iAE4tPRGdK; Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 179BA1730F9;
	Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269848; bh=Po9JsvvQFIs+av+zg4F0ovlQ3vsrMgHU61mOQKoQK0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOpDsHuyxaK15TREJpEkgMn79dHnBsP/ZdDRnS42f+6ZKCnLLiFQkMyJ8ZexuGW2S
	 Bw+50SWsP2A+QxCq2UwNvBHBFif6fZll6hFHLBr4MYuG/+C1lGwvjV5zb1bTxirZqe
	 ZKSQcN/q854P5LpwKExRdnu4SoqlTpe4ATj7PDo4=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH 3/3] ALSA:aloop: add support for up to 768kHz sample rate
Date: Tue, 16 Apr 2024 14:17:26 +0200
Message-Id: <20240416121726.628679-4-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416121726.628679-1-pavel.hofman@ivitera.com>
References: <20240416121726.628679-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FSFOOKOO3F5GLHF2OTZ5KLMKVP6ZTWEU
X-Message-ID-Hash: FSFOOKOO3F5GLHF2OTZ5KLMKVP6ZTWEU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSFOOKOO3F5GLHF2OTZ5KLMKVP6ZTWEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many modern codecs support rates up to 768kHz (including DSD1024). Add
support for rates up to 768kHz to the loopback driver.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 sound/drivers/aloop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 44ee2a4bc2b0..d6dd4b8c750a 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -931,9 +931,9 @@ static const struct snd_pcm_hardware loopback_pcm_hardware =
 			 SNDRV_PCM_FMTBIT_DSD_U8 |
 			 SNDRV_PCM_FMTBIT_DSD_U16_LE | SNDRV_PCM_FMTBIT_DSD_U16_BE |
 			 SNDRV_PCM_FMTBIT_DSD_U32_LE | SNDRV_PCM_FMTBIT_DSD_U32_BE),
-	.rates =	SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_192000,
+	.rates =	SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_768000,
 	.rate_min =		8000,
-	.rate_max =		192000,
+	.rate_max =		768000,
 	.channels_min =		1,
 	.channels_max =		32,
 	.buffer_bytes_max =	2 * 1024 * 1024,
-- 
2.25.1

