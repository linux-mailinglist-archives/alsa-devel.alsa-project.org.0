Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975956B76C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF64E1635;
	Fri,  8 Jul 2022 12:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF64E1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277133;
	bh=P9Fm1XSTIY0uOTq6i4lVtXi0IhCVZoj/+hGU5U+J2F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMeLvNneVjfqzCjoB5ky102XCuJrXxrqee1XSLmt8jEaWhcn1lo/3E3s88Qe6avO7
	 hC03b6cYSPQw81gxP0HOp89dEzwsSFcs6RRRFlJWn0dk2JiUNLHo0UhwDz/0/He6my
	 Xp1H3DpofYt8O8rKTyOSoAefNQm/8nOH2kBMn47E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6356DF80543;
	Fri,  8 Jul 2022 12:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AACCCF80579; Fri,  8 Jul 2022 12:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8EECF8055C
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EECF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i6OWV/92"
Received: by mail-wr1-x42f.google.com with SMTP id z12so20367240wrq.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=i6OWV/92LT28oKE/r10nP1hSnecmy52xHdwW7+PExPIeyIo60ViMK3o+LM3lhKdqfN
 y2usMEvqE66oVgFktWdbpIQsFHdBi/Xik+ttUc8D6SiIe2K1TkSQkMFBRXQNGMugEdzD
 FRHmC23XrGkT+kq7VYVU95Ufy893xx6K6GiGyUDISqTvBfmFURjM79iX2TPfQT8Xln1V
 s+yCFwpSxXBMFg5ieCO4RCvBT6DQbS9v4iyo13UGPiebLYOg8LCk/hIPtNnYZ4xQwlvl
 l9rnQaqTxAuP/hx70B3kMGMl0CxKfeF69tlbwABnze/iNEeD92nAFr3AhxlY6lFcF9Vg
 IEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrBZyUMKAO+r+T5351QHb8EDm0TdiafQ1X7zK7zqsrw=;
 b=6SR/lZySI8a9EjwbPkdxfK35MzjRxNMiA5mmMHU2jNYn7LUR0UHhPuMhdQd42iH7lz
 fY0/XxiyCzlHd78aljk3vzSEP0SlViEOP1IEBIYSf5tYavLaCM/OUTcEdDWEwxsGskfz
 n7lLua37EC2FoYz7n4dlmlaafSHChoEXHtZg4t35LvxNX2WUvgN8dglLC78tgr6EF0zo
 Kk4peVdK5vkXCDVkm2qwai/zMJZAcsXwgR3iqxSOrl04likztdLJrKU1N1wTBVzzmKP+
 4D6UNQc+Tfmhxk1U5+N8CeFZwNWpnSF+iL+cSDu7Jkq72vKpF5aP+sV4N1LiueHx9u41
 Qwqg==
X-Gm-Message-State: AJIora8wAlkH/Jhw+9LefbRod6AXj3n56O6/nhSCpkHHHyXwB5UDs88C
 RGkDDEO2dX2+UZNwsEEw32M=
X-Google-Smtp-Source: AGRyM1v+jJXeggIYc2T0HZS/ovtBNml8Jl40sPF0RkPGGSiCB0rtY4MSmn5EKfR/tsEF+h55bznkfg==
X-Received: by 2002:a05:6000:1a8d:b0:21d:9055:96a6 with SMTP id
 f13-20020a0560001a8d00b0021d905596a6mr2207409wry.245.1657276952542; 
 Fri, 08 Jul 2022 03:42:32 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 t10-20020adfe10a000000b00210320d9fbfsm48837106wrz.18.2022.07.08.03.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:32 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 08/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Fri,  8 Jul 2022 11:43:01 +0100
Message-Id: <20220708104304.51415-9-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
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

