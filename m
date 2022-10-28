Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A7610E9F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1E472822;
	Fri, 28 Oct 2022 12:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1E472822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666953375;
	bh=xtuYK78wg8qN8yXrqhdsBsgohu8xLd2QEhJ18xvp2aQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGZSQNDkeoOF7ooK5F9mY1agtG/8H0MMtJeEYmBRwTN3dCV2DVzWq/AHzwMIXsFmr
	 yHWC6AZAG8wJXr8llp7XLJy2Cq+acGIS76xmZuE3nC8pSFDU6iN7S9Yr3NnhZmYxGj
	 hm4DYh3Jv+uUHpzo/nWN1MuC2d41eTj+kw/+ifoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E06A9F80564;
	Fri, 28 Oct 2022 12:34:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87FE6F80095; Fri, 28 Oct 2022 12:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F151AF804D0
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F151AF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="imzO8c9I"
Received: by mail-wr1-x42c.google.com with SMTP id h9so6091992wrt.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTLqcHpLknCfW4rU/oVOZ72CKaRxSFT1z0XfsYLerY4=;
 b=imzO8c9InqFWAAe6UDl0tJeylGXAQfRifIWLxkEBBPkDDUoq2OeAehXep3L+AUcFV4
 LhTomTHllwI5F8+VOPZznHFHmr51Nxp3RPNNaANnkgxfPQD2t443F1HLxZykztKpM1De
 HwfNABEBPfu3PtyydWY7snwBdKmHigdexxAbytchL1D+7bbKKCaTOrHDuLhbPSuR9JX6
 F0iC2zRQ63X4kROMVyd0e1o165TC1h8n9CuneBAEtgSEoBa8TV3/v0Njypss0+tnB1VI
 b/q/x63MDmFqBYBPv3d6FFH/iPDs5+XRVdavLRqWqPaZIL+yEo4tkYBJIuPg6rwQLfQT
 CiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTLqcHpLknCfW4rU/oVOZ72CKaRxSFT1z0XfsYLerY4=;
 b=VAx6uBan9dHC6zOC/wpk15p4wZURBeTMS9brR50zj0/EDdpEnV3BO4emugyOpi/wDV
 DAnW3jqHvwDtYnfopFEOvs5QRFZPuGGugX/9Cek/17ea5yDeC9NDGBDBABnIgzFrNwWw
 NvRJ8T4bkq4xvCuEfNJccp/dpOZfESFqtcohj0mosA9ZU1+Z81Jq3iiy6EQaZbnFwiLN
 4yB32NaSgfvwqT3K6LgavdWl4E+uFkqg5UJj789m1CgiKhIWcKA1K6Y/9lpnd+1BLNIJ
 jtc3IMo/HrRIngKpXNDUUhWwcCKtJSgIvU4brkLuUSKNgS9Mq/BZ+K+Ew5OnJS8b9OTR
 y5vg==
X-Gm-Message-State: ACrzQf0bWZ1F2xSjGEac6F7tB+XA5gcnBHZaflVluuOQQ3azfQkxf23a
 QeIHx3/xZ2SR2fNs/oRltJk=
X-Google-Smtp-Source: AMsMyM7xKnVs7p0u7RjUBpS/H+wM1foxGyZ7zOdVy4011K+n1YCXJ6oaIUI+vH0bMmnXElFL5TCO6g==
X-Received: by 2002:adf:e510:0:b0:235:de50:72ff with SMTP id
 j16-20020adfe510000000b00235de5072ffmr27142953wrm.100.1666953269251; 
 Fri, 28 Oct 2022 03:34:29 -0700 (PDT)
Received: from localhost (94.197.40.204.threembb.co.uk. [94.197.40.204])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff84d000000b0023682011c1dsm3277496wrq.104.2022.10.28.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:34:28 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tsbogend@alpha.franken.de, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 3/3] ASoC: jz4740-i2s: Remove .set_sysclk()
Date: Fri, 28 Oct 2022 11:34:18 +0100
Message-Id: <20221028103418.17578-4-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

.set_sysclk() is effectively unused here. No machine drivers use
jz4740-i2s; and JZ4740_I2S_CLKSRC_EXT is the only selectable clock
source with simple-card, but that is also the default source and
has a fixed frequency, so configuring it would be redundant.

simple-card ignores -ENOTSUPP error codes when setting the sysclock,
so any device trees that do set the sysclock for some reason should
still work.

It's still possible to configure the clock parent manually in the
device tree and control frequency using other simple-card options,
so at the end of the day there's no real loss in functionality.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
Meant to be applied on top of jz4740-i2s cleanups series already
in linux-next.
Link: https://lore.kernel.org/alsa-devel/20221023143328.160866-1-aidanmacdonald.0x0@gmail.com/

 sound/soc/jz4740/jz4740-i2s.c | 32 --------------------------------
 sound/soc/jz4740/jz4740-i2s.h | 10 ----------
 2 files changed, 42 deletions(-)
 delete mode 100644 sound/soc/jz4740/jz4740-i2s.h

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index b620d4462d90..6d9cfe0a5041 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -23,8 +23,6 @@
 #include <sound/initval.h>
 #include <sound/dmaengine_pcm.h>
 
-#include "jz4740-i2s.h"
-
 #define JZ_REG_AIC_CONF		0x00
 #define JZ_REG_AIC_CTRL		0x04
 #define JZ_REG_AIC_I2S_FMT	0x10
@@ -273,35 +271,6 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
-	unsigned int freq, int dir)
-{
-	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	struct clk *parent;
-	int ret = 0;
-
-	switch (clk_id) {
-	case JZ4740_I2S_CLKSRC_EXT:
-		parent = clk_get(NULL, "ext");
-		if (IS_ERR(parent))
-			return PTR_ERR(parent);
-		clk_set_parent(i2s->clk_i2s, parent);
-		break;
-	case JZ4740_I2S_CLKSRC_PLL:
-		parent = clk_get(NULL, "pll half");
-		if (IS_ERR(parent))
-			return PTR_ERR(parent);
-		clk_set_parent(i2s->clk_i2s, parent);
-		ret = clk_set_rate(i2s->clk_i2s, freq);
-		break;
-	default:
-		return -EINVAL;
-	}
-	clk_put(parent);
-
-	return ret;
-}
-
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -318,7 +287,6 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 	.trigger = jz4740_i2s_trigger,
 	.hw_params = jz4740_i2s_hw_params,
 	.set_fmt = jz4740_i2s_set_fmt,
-	.set_sysclk = jz4740_i2s_set_sysclk,
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
diff --git a/sound/soc/jz4740/jz4740-i2s.h b/sound/soc/jz4740/jz4740-i2s.h
deleted file mode 100644
index 4da14eac1145..000000000000
--- a/sound/soc/jz4740/jz4740-i2s.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef _JZ4740_I2S_H
-#define _JZ4740_I2S_H
-
-/* I2S clock source */
-#define JZ4740_I2S_CLKSRC_EXT 0
-#define JZ4740_I2S_CLKSRC_PLL 1
-
-#endif
-- 
2.38.1

