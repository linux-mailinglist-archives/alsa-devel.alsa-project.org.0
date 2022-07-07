Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC956AC3C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:50:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B1901678;
	Thu,  7 Jul 2022 21:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B1901678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223459;
	bh=T5jJbEnazMVcoItbd2r700U06xzxu9Fs29EqH4dqJYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9o0V9TxCJYdTV6mQr3bM9qn+wVrk+cOs0GyLdkey37mcLHI7cW/otbRYjj5Nav9F
	 5wnA7BKzk7NhkWVZvJBxnCGwzT8nvT/FH+e4+c7EhsNkaJ/ZUVVBpehz+wdoBUQjxx
	 Qah6b9sWLHJToVPtkHS3Xh5DVqfYdEP6o0CzgdyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8A4F805AF;
	Thu,  7 Jul 2022 21:47:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B3EF8057B; Thu,  7 Jul 2022 21:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01ADEF80551
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01ADEF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QN0fskPg"
Received: by mail-ed1-x536.google.com with SMTP id m16so8957925edb.11
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5dmS78zz1zwy89jfeWA97TI8jj2tS8e0cDJN/8sutk=;
 b=QN0fskPgk1K9lhN3aO2dm5FSQxJQ/Yi9ty3yx86aq8RWe0W2ujYIfeNZ54HzCh+KZf
 H/4GBrWRcKSIn1cdwUfBFLh85Koj9MduC44GtMF5GQ1W3ykhQAU9BMdMTTF8AVAByfxW
 ovcl56s64uqWxO0zpKfCTVSc1r1rmroGVVEyCEoDW125R12eyJOdDpHpOMyUc/szWkqK
 VKmITqT1taSJRAA4GyLxR8znJIm2P1bq5M9m8zx/QBdeWsjQtowrvbc5ofqZTi1l/vRM
 RZWusfTtL+FNIFlZcLdKbCrYxarWmwRa1FWnG9KpLvzcH5yZlik9nE5/ccp9bz3/Aiar
 7kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5dmS78zz1zwy89jfeWA97TI8jj2tS8e0cDJN/8sutk=;
 b=v+7CP22yv45VCeea9ZDEAekfTyCOhfpOQlz4vKHFs7NS1A7pyAG86LMpOt3wUVMIqP
 nXAw3Vct+DlQYibz00etnQYvPVsu4jl8z2vcMcR68s42bf901ZnfpRNoXkCrDupkFDVH
 veMyywZGFMdXrYPTtyrBG2rFaqMZGcK6btVZYajk5WzE/nKpzK4r3jjNMDt3GvNCQJ8k
 lqo69IBuoxKHXiKaNobXOHNBjAb5RJs7kRXvnAb6P7LITbgXFOeIq7pPcQaIcHpOCAQc
 BU2oV2kP5eb7fAOOnbsd4JPVql47kwOeDu8V24yPongK6B3uEFEDwabTmZPd2kdP9hSk
 oNbg==
X-Gm-Message-State: AJIora9gfi9/iTSOfrdUw+/S4IJ00l8PIDU8StQQf/MKwvDeWn1X7Pzh
 h4DzAEDimGhjJqQNdpb3OdI=
X-Google-Smtp-Source: AGRyM1tazEHDxc6kwjfkZuNdpd1A3Q2t59CObFU0/AXY62YGlqvsdleAQ1yghbC2dS996dH6A7LnrA==
X-Received: by 2002:a05:6402:1d53:b0:43a:9ba7:315b with SMTP id
 dz19-20020a0564021d5300b0043a9ba7315bmr6425080edb.350.1657223213482; 
 Thu, 07 Jul 2022 12:46:53 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a1709061c8300b0070759e37183sm19311041ejh.59.2022.07.07.12.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:53 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 09/11] ASoC: jz4740-i2s: Support continuous sample rate
Date: Thu,  7 Jul 2022 20:46:53 +0100
Message-Id: <20220707194655.312892-10-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
References: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The I2S controller on JZ47xx SoCs doesn't impose restrictions on
sample rate and the driver doesn't make any assumptions about it,
so the DAI should advertise a continuous sample rate range.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 9be2f3f1b376..70b9d28a40ce 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -391,13 +391,13 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.symmetric_rate = 1,
@@ -429,13 +429,13 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.ops = &jz4740_i2s_dai_ops,
-- 
2.35.1

