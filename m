Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147F216A0A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA9A42;
	Tue,  7 Jul 2020 12:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA9A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117365;
	bh=9anm3FkVKfmBb4XXKTunqBgnT6EhpaxDcnHMSeJA3mI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8pFst+8iBJmT2VOIsB+lt2QFwldAaTctgKuI6kFYfApd6bcZIirKomEPmVNw8BeQ
	 A5xqsPfivGW7B60zjnNRxiB8ivVmxXhqp8slp9bNYwRW2SqMGGC3sT4JVq/QVjtREw
	 bfdhhdQnJTtkSa8feJxFp4wvzD+HhHs2xcJqqGDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C62AF80308;
	Tue,  7 Jul 2020 12:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E15DF802FE; Tue,  7 Jul 2020 12:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21CDBF802BE
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21CDBF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y0gY2Sy9"
Received: by mail-wr1-x443.google.com with SMTP id f7so41530816wrw.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZEmbLq4aOW35ukJy4E78RGy/Qq2YYTCi7Pk4jUv8mI=;
 b=Y0gY2Sy9AnIXxGPBMPafdM/OU+9ALGKd8+XAf10BdrSVdmVXMQ3Drjdux2AMMLpIff
 I9bHd7e1F6GPWDyeNwpRf5NJl51RBzzacMIqXloYMMCBSl8luOL9X9Vlh2wVEddLyVzH
 X/EglPfk6GL5tncqxuYjwHRyb9k89v9BbmrAsS/STklgO/FkJI/85N9CuLpAYoYifrY8
 m9rysfNJHAiL9ccDW9o8UiDwstNbizR9NdPn2J2Sl1EeTmUz+hEEOxWPUxRA1Ze5DYoF
 uvYdXCkL+aLfmYJDTbvIyEzfu1DeN08knBxZdKrkCHIPtTnNlqsFQH5mepXeDajhBjxs
 UYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZEmbLq4aOW35ukJy4E78RGy/Qq2YYTCi7Pk4jUv8mI=;
 b=cwrp8kGFL/6li0E+L52uwNvMulQBTGu18dS6e1wzgGM7EDrYu0S/2Q++4Sxc7SKUsF
 6q43wgprK8ZYOhvud4IsbQhimVy6t84kxIo/BpdSeCnwieSIFoMPJRME52NMrNPn5iYy
 jQk71SaSytIWMCB/BJijnqDWPgap5+rdhVtwfIOFGfmh33QaMFjdhcrX5lDBUyz/YoUE
 LJgzYFNxXYupEILEU6RKPtogOnrWBuLompNoysUzl/U1s08GsvbzN8pAcIHA09TzpcOg
 c5cZlRX9GqBTV1TiIx6BK8QNiCmXexpEs7iIA6X+Fz95QHK9K8AeX9K4RCqztjiyqtr3
 UV3g==
X-Gm-Message-State: AOAM530oSh6bVBOLTcrAhIbpPPDd1h8PFtQQYXwkOpYYUn7Ib4ljmoYC
 HQgAU44DlEZs1m09j3pRXAtPgg==
X-Google-Smtp-Source: ABdhPJxbWYN/EZ506zCfhQGem0UtKR9JftLPkvuSL9odppwn/+9aRct/FXJzmr1kyNsbYQyI9tSEhw==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr52127368wro.125.1594117014212; 
 Tue, 07 Jul 2020 03:16:54 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 05/28] ASoC: fsl: fsl_ssi: Demote obvious misuse of kerneldoc
 to standard comment blocks
Date: Tue,  7 Jul 2020 11:16:19 +0100
Message-Id: <20200707101642.1747944-6-lee.jones@linaro.org>
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

No attempt has been made to document any of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_ssi.c:380: warning: Function parameter or member 'irq' not described in 'fsl_ssi_isr'
 sound/soc/fsl/fsl_ssi.c:380: warning: Function parameter or member 'dev_id' not described in 'fsl_ssi_isr'
 sound/soc/fsl/fsl_ssi.c:406: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_config_enable'
 sound/soc/fsl/fsl_ssi.c:406: warning: Function parameter or member 'tx' not described in 'fsl_ssi_config_enable'
 sound/soc/fsl/fsl_ssi.c:506: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_config_disable'
 sound/soc/fsl/fsl_ssi.c:506: warning: Function parameter or member 'tx' not described in 'fsl_ssi_config_disable'
 sound/soc/fsl/fsl_ssi.c:583: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_setup_regvals'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'substream' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:675: warning: Function parameter or member 'hw_params' not described in 'fsl_ssi_set_bclk'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'substream' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'hw_params' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:798: warning: Function parameter or member 'dai' not described in 'fsl_ssi_hw_params'
 sound/soc/fsl/fsl_ssi.c:1003: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_dai_fmt'
 sound/soc/fsl/fsl_ssi.c:1003: warning: Function parameter or member 'fmt' not described in 'fsl_ssi_set_dai_fmt'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'dai' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'tx_mask' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'rx_mask' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'slots' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1018: warning: Function parameter or member 'slot_width' not described in 'fsl_ssi_set_dai_tdm_slot'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'substream' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'cmd' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1065: warning: Function parameter or member 'dai' not described in 'fsl_ssi_trigger'
 sound/soc/fsl/fsl_ssi.c:1245: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_hw_init'
 sound/soc/fsl/fsl_ssi.c:1274: warning: Function parameter or member 'ssi' not described in 'fsl_ssi_hw_clean'
 sound/soc/fsl/fsl_ssi.c:1292: warning: Function parameter or member 's' not described in 'make_lowercase'

Also use correct formatting when documenting structs:

 sound/soc/fsl/fsl_ssi.c:258: warning: cannot understand function prototype: 'struct fsl_ssi '

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_ssi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 1a2fa7f181423..5717d664cde1e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -203,7 +203,7 @@ struct fsl_ssi_soc_data {
 };
 
 /**
- * fsl_ssi: per-SSI private data
+ * struct fsl_ssi - per-SSI private data
  *
  * @regs: Pointer to the regmap registers
  * @irq: IRQ of this SSI
@@ -373,7 +373,7 @@ static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
 		SND_SOC_DAIFMT_CBM_CFS;
 }
 
-/**
+/*
  * Interrupt handler to gather states
  */
 static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
@@ -394,7 +394,7 @@ static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/**
+/*
  * Set SCR, SIER, STCR and SRCR registers with cached values in regvals
  *
  * Notes:
@@ -474,7 +474,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	ssi->streams |= BIT(dir);
 }
 
-/**
+/*
  * Exclude bits that are used by the opposite stream
  *
  * When both streams are active, disabling some bits for the current stream
@@ -494,7 +494,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 #define ssi_excl_shared_bits(vals, avals, aactive) \
 	((vals) & _ssi_xor_shared_bits(vals, avals, aactive))
 
-/**
+/*
  * Unset SCR, SIER, STCR and SRCR registers with cached values in regvals
  *
  * Notes:
@@ -576,7 +576,7 @@ static void fsl_ssi_tx_ac97_saccst_setup(struct fsl_ssi *ssi)
 	}
 }
 
-/**
+/*
  * Cache critical bits of SIER, SRCR, STCR and SCR to later set them safely
  */
 static void fsl_ssi_setup_regvals(struct fsl_ssi *ssi)
@@ -660,7 +660,7 @@ static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 	clk_disable_unprepare(ssi->clk);
 }
 
-/**
+/*
  * Configure Digital Audio Interface bit clock
  *
  * Note: This function can be only called when using SSI as DAI master
@@ -781,7 +781,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/**
+/*
  * Configure SSI based on PCM hardware parameters
  *
  * Notes:
@@ -996,7 +996,7 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 	return 0;
 }
 
-/**
+/*
  * Configure Digital Audio Interface (DAI) Format
  */
 static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -1010,7 +1010,7 @@ static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return _fsl_ssi_set_dai_fmt(ssi, fmt);
 }
 
-/**
+/*
  * Set TDM slot number and slot width
  */
 static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
@@ -1054,7 +1054,7 @@ static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 	return 0;
 }
 
-/**
+/*
  * Start or stop SSI and corresponding DMA transaction.
  *
  * The DMA channel is in external master start and pause mode, which
@@ -1238,7 +1238,7 @@ static struct snd_ac97_bus_ops fsl_ssi_ac97_ops = {
 	.write = fsl_ssi_ac97_write,
 };
 
-/**
+/*
  * Initialize SSI registers
  */
 static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
@@ -1267,7 +1267,7 @@ static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 	return 0;
 }
 
-/**
+/*
  * Clear SSI registers
  */
 static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
@@ -1285,7 +1285,7 @@ static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 		regmap_update_bits(ssi->regs, REG_SSI_SCR, SSI_SCR_SSIEN, 0);
 	}
 }
-/**
+/*
  * Make every character in a string lower-case
  */
 static void make_lowercase(char *s)
-- 
2.25.1

