Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26A216A17
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D54882C;
	Tue,  7 Jul 2020 12:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D54882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117388;
	bh=Jp0LzCFksHxz1MhYVp50BeLiJW+G33mEBGiYvvNuW1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loElz2lsH+c8oHqftxQnHT9PxxtP/1Mm5W+9Pm+O0bvhCZiCH1HIRhiJ2FJC9GAqx
	 nPZvcUFJwnbZGMkj3aH+X9A0YZyHEckuNlNH5CY5/Up6utKoCYDPn/6JWRSGV5nRDM
	 VkWqzcSIL1MjwR/kHDJsIc8HcJI6QHNF402Alrg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA04F802A0;
	Tue,  7 Jul 2020 12:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1837F802FD; Tue,  7 Jul 2020 12:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ABA9F802BD
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ABA9F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="akr9Zsp1"
Received: by mail-wr1-x442.google.com with SMTP id j4so42132060wrp.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsokizqvcQrYmRK4XFUw9AfpZPmtx9CnTkzjsD5Kh2w=;
 b=akr9Zsp1R9zCusMjYHj20g4bdfxR2yvSbDS3HgPMMiM7U4jS+e7z+EtZ2c1Ikm6qSJ
 j50t7qj6FEzIYazt1dQ/z2GMn07rEoyth5ncNZ/VBMThxjPl38ULcQKS+uBtxBd5UUbN
 2fYZzTWY2o1yX4Xhk//N/CTDnmLeaX8+cCylsZtWLK3/gQLvTJFa0lwDJgeuQCumUB+m
 Pg2eQBVR27X5w1MuozculYRrSsmF0Iw/Vd7LE93nW7MdOJGe4VWoDyqRQyyWGfpn/LK6
 LqMF5Thu9gPLoKx5rUeWRdJkOngDQOols03IREwRd6KxBITISTpO+Bmta9r6mlF8pD7W
 OmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YsokizqvcQrYmRK4XFUw9AfpZPmtx9CnTkzjsD5Kh2w=;
 b=POX+Yo1YLWF6yW3JqP6ht3MYgO2UxZmlj6t1Q6ki/pYFYq+mqz941Rjw6cdfLQteLQ
 Gj3BjFaRALWXN2bwMZnuemzLTBNFe+zbBaNrkFW7eFjuWbnThOxb7cedM8ChrgOvCj4U
 FYwLM/mktClN8JdwS6lQIu9A3CmFpbTZAMUr0XHQ3FfPzC6+BUmM8u/DTyv7BCx+sarb
 tvNRarxexcRdqo7qTySIvI1qhS1xitYJ4/AHlG3Kz7dO7VyC1huokjXXwBk2ZCTZ/P32
 pFFgvDWJPiOLE7wCNkPgS8SmEu4dDsMTsRVx0WUueLdbY7KDsAcRhhvS1FxI9cVWKEE7
 MEYA==
X-Gm-Message-State: AOAM533IOJHMQeXW3YsIRp+UDa+XM/bg1nHq9QaB2WoHzR3kjirmu/s/
 vvmyrRxtZEBAwvLj/lLByJGOog==
X-Google-Smtp-Source: ABdhPJyokynAsMCJ9KP59ioOQmggRgChTfyTqf7FPi5nBCxf7ckHFkFUgqw78HQEefo5rpFgheVoXQ==
X-Received: by 2002:adf:f20a:: with SMTP id p10mr56349271wro.41.1594117019816; 
 Tue, 07 Jul 2020 03:16:59 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 09/28] ASoC: fsl: fsl_esai: Fix a bunch of kerneldoc issues
Date: Tue,  7 Jul 2020 11:16:23 +0100
Message-Id: <20200707101642.1747944-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Struct headers require a 'struct $NAME' title, all function parameters
require a description and need to be in the format '@.*:', else the
checker gets confused.  Also demote one kerneldoc header where no effort
was made to document any of the function's params.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_esai.c:30: warning: cannot understand function prototype: 'struct fsl_esai_soc_data '
 sound/soc/fsl/fsl_esai.c:61: warning: cannot understand function prototype: 'struct fsl_esai '
 sound/soc/fsl/fsl_esai.c:170: warning: Function parameter or member 'dai' not described in 'fsl_esai_divisor_cal'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'dai' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'clk_id' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'freq' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Function parameter or member 'dir' not described in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:265: warning: Excess function parameter 'Parameters' description in 'fsl_esai_set_dai_sysclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'dai' not described in 'fsl_esai_set_bclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'tx' not described in 'fsl_esai_set_bclk'
 sound/soc/fsl/fsl_esai.c:364: warning: Function parameter or member 'freq' not described in 'fsl_esai_set_bclk'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_esai.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cbcb70d6f8c83..bb3c405df623c 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -22,7 +22,7 @@
 				SNDRV_PCM_FMTBIT_S24_LE)
 
 /**
- * fsl_esai_soc_data: soc specific data
+ * struct fsl_esai_soc_data - soc specific data
  *
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
@@ -33,7 +33,7 @@ struct fsl_esai_soc_data {
 };
 
 /**
- * fsl_esai: ESAI private data
+ * struct fsl_esai - ESAI private data
  *
  * @dma_params_rx: DMA parameters for receive channel
  * @dma_params_tx: DMA parameters for transmit channel
@@ -160,10 +160,11 @@ static irqreturn_t esai_isr(int irq, void *devid)
  * This function is used to calculate the divisors of psr, pm, fp and it is
  * supposed to be called in set_dai_sysclk() and set_bclk().
  *
+ * @dai: SoC DAI
+ * @tx: current setting is for playback or capture
  * @ratio: desired overall ratio for the paticipating dividers
  * @usefp: for HCK setting, there is no need to set fp divider
  * @fp: bypass other dividers by setting fp directly if fp != 0
- * @tx: current setting is for playback or capture
  */
 static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 				bool usefp, u32 fp)
@@ -252,11 +253,11 @@ static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 /**
  * This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
  *
- * @Parameters:
- * clk_id: The clock source of HCKT/HCKR
+ * @dai: SoC DAI
+ * @clk_id: The clock source of HCKT/HCKR
  *	  (Input from outside; output from inside, FSYS or EXTAL)
- * freq: The required clock rate of HCKT/HCKR
- * dir: The clock direction of HCKT/HCKR
+ * @freq: The required clock rate of HCKT/HCKR
+ * @dir: The clock direction of HCKT/HCKR
  *
  * Note: If the direction is input, we do not care about clk_id.
  */
@@ -357,7 +358,7 @@ static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
-/**
+/*
  * This function configures the related dividers according to the bclk rate
  */
 static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
-- 
2.25.1

