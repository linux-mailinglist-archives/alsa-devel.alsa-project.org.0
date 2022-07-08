Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495056BD2F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0D61F7;
	Fri,  8 Jul 2022 18:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0D61F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296364;
	bh=T5jJbEnazMVcoItbd2r700U06xzxu9Fs29EqH4dqJYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsDJnV6rGihkwdtZtuvhlvgU1J3ZuuwaEg6Tr161o+/dkZULkWJMVHiB//ycRtELu
	 0MXWXJ1BXL0y+P9bXxjtfg71EhUcr3+8/qyxehZYhB01jPuaZRf6iC5UHu+4iou+KH
	 zA0etLamt99WrQ4gl6dVDexFm8FFANQ0LWP1FDh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB56F8058C;
	Fri,  8 Jul 2022 18:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9AACF8055B; Fri,  8 Jul 2022 18:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88AF3F8055C
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88AF3F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oO7fgm9e"
Received: by mail-wr1-x432.google.com with SMTP id h17so18000592wrx.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5dmS78zz1zwy89jfeWA97TI8jj2tS8e0cDJN/8sutk=;
 b=oO7fgm9eyOrsYEnp7lII/3SEHnt7odEcVUlFpDHfaflg14fCrV81pk8Y9E0odXWY1t
 c56FzzHYw+rOYdiZ2O2dGkPnvGzMaq4ZXzInxsYtSHMc55u/K7LtaW/frH7WmFvd3x1q
 7aIXyPEkQMeuAvDHD4hQ1lF0Aa+LU+xWs3Av7W+JEIqY5tVeYziuqc2juIyODqQDn3KN
 opMTI7WhTb/s3A7luoWOgJLqjN+Zm10p14Ifw2vaRR0Pb2fMcho6WMRO9ZsSILZZqJJV
 G0m9y2MeUjR8HQ7lnOWz6oRwVxsY9dqlNTXrqOpwbHD+lFrFsnQeZpY/VZ7+iSYIgQKZ
 fAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5dmS78zz1zwy89jfeWA97TI8jj2tS8e0cDJN/8sutk=;
 b=sJLhrkPcAZHtZ6sXscp12KJFNJL4jonww+rI073+0BnR7NtXc49RlbdF8QcjchRt6/
 9USssGkH/inuWuH+UDBiA7AGYjfwd4vDMZm8zELYTx5zhXuVBGsmOPw8fPxukBmhJkxP
 oSBS9UV/6p41gIW2FG28WraUlO0Rx+42eeuVfTGuG3YtRvWUBZfwbi8n5dvlPZMKswMF
 f5wjgGbN7fXWgi1t39WonnF/yUwE9jqP4+lTu2mRaInrbHlbIAReCuI5nvtP14kyngPV
 zudtv3m3bmf+MD6kyR1+uiQYKZnPGpUqu8uD02OXjBMNqyNCQCEaarA0ZtqCxL4j6DsL
 +RIw==
X-Gm-Message-State: AJIora/8fEDSVHsEiushYpndtg7Vd6jknICmuRghxTCOmTB2u+g2mj+o
 +rT3WFfjWFmtKlTfI5r/oXQ=
X-Google-Smtp-Source: AGRyM1sIVKhAH2NqKkrY/QEJBblVnvI2M+yCTtt2LnMsL42SB0xHvfPkgeu9SUMyCQUzmrBKWfCmzg==
X-Received: by 2002:adf:e30b:0:b0:21d:8f3e:a370 with SMTP id
 b11-20020adfe30b000000b0021d8f3ea370mr3961120wrj.124.1657296141163; 
 Fri, 08 Jul 2022 09:02:21 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d5911000000b0021bbdc3375fsm17499281wrd.68.2022.07.08.09.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:20 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 09/11] ASoC: jz4740-i2s: Support continuous sample rate
Date: Fri,  8 Jul 2022 17:02:42 +0100
Message-Id: <20220708160244.21933-10-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
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

