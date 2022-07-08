Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDB56BD2D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:05:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123B385D;
	Fri,  8 Jul 2022 18:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123B385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296319;
	bh=P9Fm1XSTIY0uOTq6i4lVtXi0IhCVZoj/+hGU5U+J2F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6z7UYTnSZPLkB4uFDixSQlhm22y0Zhr17yWKgW8NiBm1Aj44WB3EQhdSIQMsV4/A
	 Ww4uTBhJvwzFGPppEQVCGrw4Q70e4mRVgr+g7k+a39yHG0/OHLi/HTTMIJbUnA+0TT
	 /npbVu5VdxQmWJtbPJ1+ewgkKU8KVhPGGUDUObJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCEBF8055C;
	Fri,  8 Jul 2022 18:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 780EDF80578; Fri,  8 Jul 2022 18:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9DA1F8053E
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9DA1F8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JrVZj545"
Received: by mail-wr1-x42c.google.com with SMTP id v14so31161349wra.5
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=JrVZj545gKjyjInXBmGFNi1/5u5LhTbQlTuuL88Dw62fc1OmsB4AgRf+fYH0/92I3A
 qfEDXSpGnXazLvb2CW6zQTq/n3xADlsATH04jUnxETqjGUemWQOLvywQYWvR8w4fxFUn
 CIWU19zjViU7dbGkYllCk+CQhszMzqyD/toOvOl08dosZcJ4DNTYCHtLerKKSaeReQjX
 wEhMv3D2JaNN2tdC7gPufz3X88ccUcR2dUrljtCovyl2kiwluOOicjicePZQh9E+nG/V
 PKJwOHmpAqvW0bho/5n4uIoKM876mvhrBsBCxnr7ETfU4fFqLWmddm77Ol04NNedIEen
 YGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=l2kJDDXjC7THVNFne760DVi7Ig/c+3pB+TOrL1kU2yhuygvzfQE+hYsB8SkSOOhRrT
 YDjY9apGX0SQq9YJsadow4ATELEWTUlbnnvWkdpRT7s5t46hGy8/s/INTUuZFY8cVsO5
 MyqYBY81Mc+DA+NbSdHYU7c3pj6+2BYVKEZ3SLENVeYEz9/z6qe6IGYZhrTDislLF1/t
 Eg3tUZ+uRDumJ0uTqkq0DLIRveiKqZtFe2rH1vJELKoOWcT8NmLIQaBm921LKmKDHKMy
 aREDkAa6BEOb0IftxkWnRLHXtiXQTwgYKUYwsHM2eSv/lulnOc0aAlo0x1TXQk5hSd3f
 GVCw==
X-Gm-Message-State: AJIora87fn2qRaTkUPB/jDqU6CNGGkecnZvuYlkg7R/FJRETdei3IPuF
 /zqRMF9qlCNjQmnanFR2Xco=
X-Google-Smtp-Source: AGRyM1tjz8KRw+tJbCVQyjxrDMngBJEW69XO19U2dEQlOCPb7N85+rE+augPujbkk4XS8vXkx7okZQ==
X-Received: by 2002:a5d:59a5:0:b0:21d:205b:3c5b with SMTP id
 p5-20020a5d59a5000000b0021d205b3c5bmr4057242wrr.97.1657296139441; 
 Fri, 08 Jul 2022 09:02:19 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003a2d47d3051sm2955204wmq.41.2022.07.08.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:18 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 08/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Fri,  8 Jul 2022 17:02:41 +0100
Message-Id: <20220708160244.21933-9-aidanmacdonald.0x0@gmail.com>
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

