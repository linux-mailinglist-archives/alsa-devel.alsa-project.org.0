Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EF56AC38
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F54A15E0;
	Thu,  7 Jul 2022 21:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F54A15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223413;
	bh=P9Fm1XSTIY0uOTq6i4lVtXi0IhCVZoj/+hGU5U+J2F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IichEbWeYPwArGS/TeHsMx5viCex9VquZyH8WZ/AXRFpij/pDpTO5AFphD6B0NlTF
	 UPkpjBpsVEnbmMa6E671yrrITg8k9LOXQCdWPz9+Mam15D1pzAUAog4+nVPj/vqI+6
	 2dQrNN5zX9IjGJNEms9XEIWZ7DqZAs92wbgRNq0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F76F8057D;
	Thu,  7 Jul 2022 21:47:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393EDF80552; Thu,  7 Jul 2022 21:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75C9FF80553
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75C9FF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EI57jaou"
Received: by mail-ej1-x62f.google.com with SMTP id os14so3968958ejb.4
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=EI57jaoukrphqp3TGEHy7fOkxzbStIw3JqSqI3EzDM5ls+Gi75CklycaO4AbIez7rB
 WGvz7jHwXGDDno/wwWcIHVbRrxsqug2JSPoV1T3jZE53YBJ2lHqDTBBFpbmK1qS3ibIZ
 1aE9ETohYdF3czui4p8owQJpmwabGBKA8rydiMnH4ErU62ztkjJoI6FdaSv5ez7fIraS
 TFrlRzul+ikdFTK7QTAsKZ7uKknH2lDGRPVKPgSSNVrOpDF6AUgx2zTmmblGpUfieRk4
 e6PMKkl6pJfXDf0HS2L5q6IulNjkyvvhfUVgfF8eIVFI8H0urRCjDSdv6uYttboPfTRN
 r2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=UUIpyaEsFO0vUw3QD3QO0APQFLD/Baq69QRUCWYWXgyAERWEwk5KEpBrs4NywZnwqp
 Bq87P9/knIvCCSGAiQXMQ9EiYiI+1UuK9FkF8RzxBzhpPWbT8igDmwx3cCabOoHpaewv
 XeNkzSSP4lYAXGuWORMquGEJJ1DJl61PFTxdGzaapchh0QjUUz59oMY6roap08tw15J3
 docXEqvZzm81cfeC3iQRmLkA5zOp/4DHs3eraaGVF9nYtjZXBq4Kl196lE4tGwAoJyqi
 dwdq4gR2DfJUm7iSOSCfSfvzvePTmh85nlFV9wxottSsgjXnMLLBle/I4w5TK6x0zdYV
 GQMA==
X-Gm-Message-State: AJIora/rNN4U6ro1oszNyb27hlWA6DM1AMZdm2xUgHTevccn55/Fzhji
 Git1zbZIZuKkXaXUbYS91a8=
X-Google-Smtp-Source: AGRyM1vDCGR1VMWAd0Cbe+xX8sE4qvCVqEpC/UwMMZH0fOB21yq70892HxS4uckFeNtmivBNwjVnJw==
X-Received: by 2002:a17:907:961f:b0:726:9aee:f061 with SMTP id
 gb31-20020a170907961f00b007269aeef061mr45319537ejc.45.1657223212001; 
 Thu, 07 Jul 2022 12:46:52 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 u3-20020aa7db83000000b0043580ac5888sm28516552edt.82.2022.07.07.12.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:51 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 08/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Thu,  7 Jul 2022 20:46:52 +0100
Message-Id: <20220707194655.312892-9-aidanmacdonald.0x0@gmail.com>
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

The audio controller on JZ47xx SoCs can transfer 20- and 24-bit
samples in the FIFO, so allow those formats to be used with the
I2S driver. Although the FIFO doesn't care about the in-memory
sample format, we only support 4-byte format variants because the
DMA controller on these SoCs cannot transfer in 3-byte multiples.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index a41398c24d0e..9be2f3f1b376 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -238,9 +238,15 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_FORMAT_S8:
 		sample_size = 0;
 		break;
-	case SNDRV_PCM_FORMAT_S16:
+	case SNDRV_PCM_FORMAT_S16_LE:
 		sample_size = 1;
 		break;
+	case SNDRV_PCM_FORMAT_S20_LE:
+		sample_size = 3;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		sample_size = 4;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -375,7 +381,9 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
-		SNDRV_PCM_FMTBIT_S16_LE)
+			 SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-- 
2.35.1

