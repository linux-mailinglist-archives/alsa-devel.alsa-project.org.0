Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2B56940A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A591689;
	Wed,  6 Jul 2022 23:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A591689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142065;
	bh=tYwUmMK0VrvMopbk1PYj9YCGIO/tNsuHQILMFbK+dWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnDBboQEfGpWOkakcJ74esL/4+AdrVWWFmDIkY8Rt70Ct6uYQBGuTX05vnn1w1aNX
	 t26I+1FARxSzBfPxBUs0xA6Jq4Hp2IKb3DmHHtVhMKF6jQwtFl50B0H3FBkUZum3mf
	 9C6mlcXkTUInlEFKLgaOWlBwNWTNhGk5v4IRYtig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C01C2F80539;
	Wed,  6 Jul 2022 23:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC14F8052E; Wed,  6 Jul 2022 23:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC08F80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC08F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R1bLn1X4"
Received: by mail-ed1-x530.google.com with SMTP id g1so13166817edb.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KTTKYV8d4X6LUcp6wXzH0WT3BXkDsllwJZTXbqSmykQ=;
 b=R1bLn1X4PkihjzuE2uP75+eHLVZo2WXW1pFTzT2PqlznkGgRYaS1K/+Yh9x0Qm/nqV
 p6NLLc9Znui4245+E6usa817XsEYc557TEo9/1LXkKqafISR5mBTxvp2x3mZpEVFiwQp
 V6A/eR25hbRUDopT9XgLpzFaXMYCZP2ZAZ7V0ljAbdt9J3SzuTzMWXhFiBD6vs1YadsR
 FPpKK1mzey2CHqBFtUb0KP4aiJwe/x4zOmEctCccmyBL7M8367TxrUXgNE/VOFx90OR6
 uFudHjmOREFiWz/iUYzHd72WDE/T/dR6Gbt+PRm5mRFPG4oEPXG3BEt+hbZZUY+zECii
 ZTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KTTKYV8d4X6LUcp6wXzH0WT3BXkDsllwJZTXbqSmykQ=;
 b=i72btWEQUXNpa/EdQYcy3aNB5GH5Bcng25JLizGO3LoFoeOU7f2CTW/P4vgleYrshJ
 Ceo8xGc8nIY31n/8pF/MhLcH9s6fK/f4JU8VJckS5ABQtEc3OkrvJzWlVBZpwZTKA+CF
 HAZr8mfex+gRnN4/YNcUFdYd60JLyDre46Incg77Qu1X1R/c3wX9/WGUa1RbkGQKZKoM
 vM6N+YuBGoGZ/n43yd1C59giXkK+NgssXhSAwOyuMChcBf6ttjeratQgBIHcStHbpNpp
 0bamq8Whr1B6K8LTF6CpMszJuDju+4lnVvty90E8Y8AUmVyJO/bkkDTnvEqHtSLD1qm3
 k7lQ==
X-Gm-Message-State: AJIora+DxRFXSVR+ia3hTjaaQmTWRMY0+XlZ5lagJuiLUHUFJefqoRRq
 BzNcl+6kqwGPkjP3yiW6uAU=
X-Google-Smtp-Source: AGRyM1uBRFBoE3bP3pt0o5jp3L85/DNosrc9hL7YrPp7PRYgApGHyCFwxFsWRBsshbHio/+XTSxeRA==
X-Received: by 2002:a05:6402:1518:b0:43a:103f:eaab with SMTP id
 f24-20020a056402151800b0043a103feaabmr30996636edw.280.1657141960593; 
 Wed, 06 Jul 2022 14:12:40 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056402111100b0043a6e807febsm6569925edv.46.2022.07.06.14.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:40 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 02/11] ASoC: jz4740-i2s: Refactor DMA channel setup
Date: Wed,  6 Jul 2022 22:13:21 +0100
Message-Id: <20220706211330.120198-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
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

It's simpler to set up the playback and capture DMA settings
at driver probe time instead of during DAI probing.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 298ff0a83931..ecd8df70d39c 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -95,7 +95,6 @@ struct i2s_soc_info {
 struct jz4740_i2s {
 	struct resource *mem;
 	void __iomem *base;
-	dma_addr_t phys_base;
 
 	struct clk *clk_aic;
 	struct clk *clk_i2s;
@@ -370,21 +369,6 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 	return 0;
 }
 
-static void jz4740_i2s_init_pcm_config(struct jz4740_i2s *i2s)
-{
-	struct snd_dmaengine_dai_dma_data *dma_data;
-
-	/* Playback */
-	dma_data = &i2s->playback_dma_data;
-	dma_data->maxburst = 16;
-	dma_data->addr = i2s->phys_base + JZ_REG_AIC_FIFO;
-
-	/* Capture */
-	dma_data = &i2s->capture_dma_data;
-	dma_data->maxburst = 16;
-	dma_data->addr = i2s->phys_base + JZ_REG_AIC_FIFO;
-}
-
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -395,7 +379,6 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	jz4740_i2s_init_pcm_config(i2s);
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
@@ -529,7 +512,11 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->base))
 		return PTR_ERR(i2s->base);
 
-	i2s->phys_base = mem->start;
+	i2s->playback_dma_data.maxburst = 16;
+	i2s->playback_dma_data.addr = mem->start + JZ_REG_AIC_FIFO;
+
+	i2s->capture_dma_data.maxburst = 16;
+	i2s->capture_dma_data.addr = mem->start + JZ_REG_AIC_FIFO;
 
 	i2s->clk_aic = devm_clk_get(dev, "aic");
 	if (IS_ERR(i2s->clk_aic))
-- 
2.35.1

