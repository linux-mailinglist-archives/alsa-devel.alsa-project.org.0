Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD46569412
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF506169E;
	Wed,  6 Jul 2022 23:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF506169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142166;
	bh=1w24V6JPivJ0E9dzOUnwq+qeELjWdImiWJ/nueTtvlw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nSgCF+vbzx/h4ZIqkY/ow/MSn+0BMNAAL9jeiXtMwpsRwGCm3W4VeVBlFmK4ZS/lT
	 Muij6SOit82G3Angh7izPkJVGBpkXxJqt5ivOLBnzpgFu4kkYC4JLdHrKZ39jdvaVy
	 7Z/y9gSGAylTtCS3RQB/+QucUI2Srlafav8F31Lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6754F80578;
	Wed,  6 Jul 2022 23:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C74F8055A; Wed,  6 Jul 2022 23:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D74AF8053D
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D74AF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="krbHqmBR"
Received: by mail-ej1-x634.google.com with SMTP id sb34so29106527ejc.11
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvGXj3ls7TV90GptpGG1jLpCJVEsDU4cCv/CoE+6bpM=;
 b=krbHqmBRYekWzAlAtpO7sBN1ST+0G/8miKAo7OHmnIWBpNlinUrotSvvT1yBHIz7YZ
 OyA0CScteMVUjoIYc46Nonj3i80xglBJ6e+iyHV6uvOdKNYDlOhNUl+WnjJiwGbFFCxh
 z4t6U2R1AecTXan3+SfE7tpGRpqIJm6FfEWSnhdOnKS3f03WV5e5Jz3aEjJ2r0ovXzO2
 HAT5CoieAPJbEzTrdWLBOAAre8VodDEtdXeYkqWMdq1SK01rx400RfpXfIGc1mZ4Vqua
 LRW3/AqfZgF0KSC7VpEQxfBIjTEQc3zjvjgWv7vkfjQt+UeSYixIPe26dxRUW2BKr60E
 VoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvGXj3ls7TV90GptpGG1jLpCJVEsDU4cCv/CoE+6bpM=;
 b=EZdFCy5ZlfFsdwpR4lfAN1Yz7Y/GLkr7rN2mPgDAGaquoZoZ5pPJz5Cjnm34sarOef
 R/7Q3d3mmJe7ABMCoBStPOvWaUlPGeqDKBPpsR0/jCVrCExB7cLtKvZMTaM9NTXS5OPC
 qzRNTpWP/ZpakBKhHrljRzp8p1G99ugV44LR7HXk02ji7ailg5UwOMGNPkNos3fOYoUO
 CpRBn1RYdIi2F4WevvIvA2MpglAxmQdzhcbH8Orz4Xr1ETbJM9DYId7CyAeyPryYaQrr
 wD/eNbUAkfm58pth4b04mZuFAOH/Vf/f8vSMO4Hcr0BH+cvB6S+ULHk9D4ceEOKdiA/D
 2HMQ==
X-Gm-Message-State: AJIora8mRFU/6NXwLDukG5sJlQvdV5us1ef5CLm8mgc+T43UqFpzlAdV
 Aew0269Xp7aDTKKJqrqmoGQ=
X-Google-Smtp-Source: AGRyM1tENucyCQc6o1kqm7tKl+HfBOTrbZHO+IO7+Og4B6UEcwWEmeiPcizBD5QYh/RTI6pu23BzEQ==
X-Received: by 2002:a17:906:149b:b0:726:2968:e32a with SMTP id
 x27-20020a170906149b00b007262968e32amr42064953ejc.71.1657141967428; 
 Wed, 06 Jul 2022 14:12:47 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a17090676d100b007121b22b376sm2164813ejn.105.2022.07.06.14.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:46 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 06/11] ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params
 callback
Date: Wed,  6 Jul 2022 22:13:25 +0100
Message-Id: <20220706211330.120198-7-aidanmacdonald.0x0@gmail.com>
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

Get rid of a couple of macros and improve readability by using
FIELD_PREP() and GENMASK() for the sample size setting.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 8bb9449d13d3..3c3cf78bf848 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -3,6 +3,7 @@
  *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -49,8 +50,8 @@
 #define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
 #define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
+#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
+#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
 #define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
 #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
@@ -65,9 +66,6 @@
 #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
 #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
-
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
 #define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
@@ -245,8 +243,9 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK;
-		ctrl |= sample_size << JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET;
+		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
+		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
+
 		if (params_channels(params) == 1)
 			ctrl |= JZ_AIC_CTRL_MONO_TO_STEREO;
 		else
@@ -254,8 +253,8 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 
 		div_field = i2s->field_i2sdiv_playback;
 	} else {
-		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
-		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
+		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE;
+		ctrl |= FIELD_PREP(JZ_AIC_CTRL_INPUT_SAMPLE_SIZE, sample_size);
 
 		div_field = i2s->field_i2sdiv_capture;
 	}
-- 
2.35.1

