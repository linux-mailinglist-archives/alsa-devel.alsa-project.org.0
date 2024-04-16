Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73A8A6A95
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 14:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C821909;
	Tue, 16 Apr 2024 14:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C821909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713269906;
	bh=h0FjqXKWDHaiJdhJimUQ5KYctoiR+sYhWz1IQ2fYOKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L3oMV9O0I3KofEURM+Q8B5sWZrB2Lfrn10tjNt52TIbPAC2G7HHtSknj0KC3d8BPZ
	 og6jpArHhfUOAz+nRxxLcYxT6yzopLszfM1mGDx+ZqeFGvvfbJcC1YkULsX4I/9OKX
	 0HUDw6dCjeB3KV+7+Xxi62bnO0tR15pnOZHSUhxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92ED2F805AD; Tue, 16 Apr 2024 14:17:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E3DF805C8;
	Tue, 16 Apr 2024 14:17:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0356DF80494; Tue, 16 Apr 2024 14:17:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BED14F80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED14F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=QNk/gMtQ;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=BcVfCdGQ
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 4BD0217329D;
	Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269848; bh=h0FjqXKWDHaiJdhJimUQ5KYctoiR+sYhWz1IQ2fYOKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNk/gMtQMJy+ZThP/E+ut0L60OTFoYsrA7kWDZ//VgLCpXUGXsbETYSwkiRpGCLz0
	 A4yz4DF5ONqu84+8w7Zfi4+ZL1fZ6qeVYzgFFD6/euS3RNBm//6qDU4zTHYXM4/KLJ
	 QU28R806yiioV1Xyq7T3mCOrhz87lgDiKqz/itkg=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkNrOpZtwDP6; Tue, 16 Apr 2024 14:17:28 +0200 (CEST)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id D1675173704;
	Tue, 16 Apr 2024 14:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713269847; bh=h0FjqXKWDHaiJdhJimUQ5KYctoiR+sYhWz1IQ2fYOKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcVfCdGQuwGDNyX+PGqx8JtoMs07aYJx0pwvGU+ByenpquZzzreERU6lN7itI6oa8
	 oX/dnMFrFbftWrc00teFTGflHsx1Aih2NXyAN+CKmunt/FhTM61d30xU15ciq6LK0a
	 VCq/pc9/mbtS+Z/Ga0Ii6Mqvx897VTDnjSRp+bLg=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH 2/3] ALSA:pcm: add support for 705.6kHz and 768kHz sample
 rates
Date: Tue, 16 Apr 2024 14:17:25 +0200
Message-Id: <20240416121726.628679-3-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416121726.628679-1-pavel.hofman@ivitera.com>
References: <20240416121726.628679-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SOXEAW53AUJ5TJRR3XMKOSUESW5JUXJ6
X-Message-ID-Hash: SOXEAW53AUJ5TJRR3XMKOSUESW5JUXJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOXEAW53AUJ5TJRR3XMKOSUESW5JUXJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many modern codecs support 705.6kHz and 768kHz sample rates. Current HW
params fail to set 705.6kHz and 768kHz sample rates as these are not in the
known-rates list.

Add these new rates to the known-rates list to allow them.

Also add defines in pcm.h so that drivers can use it.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 include/sound/pcm.h     | 5 +++++
 sound/core/pcm_native.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 210096f124ee..61c6054618c8 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -120,6 +120,8 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
 #define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
 #define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuos rates */
@@ -135,6 +137,9 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_8000_384000	(SNDRV_PCM_RATE_8000_192000|\
 					 SNDRV_PCM_RATE_352800|\
 					 SNDRV_PCM_RATE_384000)
+#define SNDRV_PCM_RATE_8000_768000	(SNDRV_PCM_RATE_8000_384000|\
+					 SNDRV_PCM_RATE_705600|\
+					 SNDRV_PCM_RATE_768000)
 #define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
 #define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
 #define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0b76e76823d2..521ba56392a0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2416,7 +2416,7 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 
 static const unsigned int rates[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.25.1

