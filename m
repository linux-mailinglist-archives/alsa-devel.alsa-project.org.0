Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF6956B76A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440AD1669;
	Fri,  8 Jul 2022 12:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440AD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277097;
	bh=dzCxSrv8ljaSGGZ6QMINaHagXiEqZqRIMpm6c/3kxqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SsuRfayp1xcNgzP/rsxRmzpyObM932YbI/VdYFJFLq/KSQqPJAy4FBrlKuuR303Dl
	 Nvhf38zbMyj+QeMUpNnfnoX40Ot+aB0JgN+7UTr2n9TGQ+OipEMCvg9KR8pTsyAQKY
	 i9aSor+m7qBS63KoMc/vgWSjGy3bRdb1I6XBd3gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CB5F8056F;
	Fri,  8 Jul 2022 12:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39ADF80559; Fri,  8 Jul 2022 12:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02850F80539
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02850F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ceIr3ukM"
Received: by mail-wr1-x434.google.com with SMTP id q9so29971765wrd.8
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15R8fRtnipOyDZjBwDRNBD+rUnFt8ovWDJg/qvPn+8w=;
 b=ceIr3ukM+hWb4In065oEO0rhCRfhtl2CpRcw7XazOuErKfGAHIYBa/tt5bH84urMd+
 2Hw38epD97vbse1aBe7tJnzjR2orBXReLWo1DZKvGlq8MJG0/ZT4iS9I1CzM1NU7z/pX
 I6YTq/Jhg4+xVAzcz5LcVFoZdyfjMtxY1kyxkalp7bBGSG2UUr7JdRIWAQgVGvC3nvnW
 K3T89ATC6op8meMZ6BnWBkt0L43lH14xJIK4J/+gqEmpU8ePwy5sevlsPV12qV/JYE8v
 amYfn/CuJRwBl72Pm6pEnQ2K6X7ep7nHv+QpdjZ1MuXvGeinlz0hTuJI9zMrf3A7ywTD
 sWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15R8fRtnipOyDZjBwDRNBD+rUnFt8ovWDJg/qvPn+8w=;
 b=JHxEJhWdRIhCb3CAJvPf/LdztfI/CX3424pr0ubOeDVUlXsO0zn8lKH3TDZqGdptII
 dDjyDiHtaYmUgNGzediOEpGqlvFrGCuQUIwRr3GGnRH698VYAOvimpQkOGxlwNPFNjYL
 O9Xg3B4Ez6HsLve9V5yEPAUiJfjzcrfl9zLmmNEjBbHhL6x6xFpcdjgxMaIVoT9ihey+
 nX1TrY2K2IPxzWzjI4iWCnfYF8CFutE0SiCQdqnON7dKzUUGGDMsXU1k+hUMs0ld7qAa
 xWwYBNjMxAMEm8iorth/SkBuJUeGxRP5kC2KyfaOwkh42ij7OAVTZiN58vQSDm09XZoM
 6+3w==
X-Gm-Message-State: AJIora8xylNgA+lKn1w+OfEYxJO3FZl0/KKA0UKHnEz7EMvoXfgJu2vR
 9Jkjvt+IwtFday4nEvVbPXM=
X-Google-Smtp-Source: AGRyM1sX9iL3gWuizivh0wJx64Svn3M5RpjVOAxMeBM90o8CTKr/sYUcIUr721EP2+Ly1BGSeYCISw==
X-Received: by 2002:adf:fd02:0:b0:21d:6f22:7857 with SMTP id
 e2-20020adffd02000000b0021d6f227857mr2695711wrr.633.1657276947690; 
 Fri, 08 Jul 2022 03:42:27 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 r11-20020adfce8b000000b0021d77625d90sm8639798wrn.79.2022.07.08.03.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:27 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 05/11] ASoC: jz4740-i2s: Use FIELD_PREP() macros in
 hw_params callback
Date: Fri,  8 Jul 2022 11:42:58 +0100
Message-Id: <20220708104304.51415-6-aidanmacdonald.0x0@gmail.com>
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

Get rid of a couple of macros and improve readability by using
FIELD_PREP() and GENMASK() for the sample size setting.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 043f100a9cfa..d0791dfa9c7b 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -3,6 +3,7 @@
  *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -42,8 +43,8 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
 #define JZ_AIC_CONF_ENABLE BIT(0)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
+#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
+#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
 #define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
 #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
@@ -61,9 +62,6 @@
 #define JZ4760_AIC_CTRL_TFLUSH BIT(8)
 #define JZ4760_AIC_CTRL_RFLUSH BIT(7)
 
-#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
-#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
-
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
 #define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
 #define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
@@ -248,8 +246,9 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -257,8 +256,8 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 
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

