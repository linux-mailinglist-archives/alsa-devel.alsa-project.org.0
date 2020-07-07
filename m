Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82B2169EF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF54A166E;
	Tue,  7 Jul 2020 12:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF54A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117221;
	bh=1Ifd8O975coMZ3wL2+EXrnNnrNU7zwyBLOi9HB9oScY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3iZ6q4uCpUeEfw5+TIMFbb93FYyWV0FcY1K68aa6/4xAQ6FJVNJjRVBom+5S2EUM
	 UrWExFEjbdA1DXYy/qD6odetPJXW7CHZre+E31GhyEMMeSgZuFVnSx/CtgmKbS42KD
	 3K1wSmO/2/VuT+lkqPe/RkhRy1B05K9vIpBkwNaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A192F802EA;
	Tue,  7 Jul 2020 12:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC6ACF802EB; Tue,  7 Jul 2020 12:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C16F80264
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C16F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZKwj3HHw"
Received: by mail-wm1-x341.google.com with SMTP id g10so1411317wmc.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WA9dG36UknQVCp/Rfsks+W3xsfkt4WlYU9zyAfbsCgQ=;
 b=ZKwj3HHwQOk7yXe4WVIDlXiwgYKi35YtfQOQBLtduNJaim5iOiInCvN13A/ysgBTFA
 gid3Y1lntBVYfmTMVDpyzc5Dpl8m16t8Jmkd33+lgwA+zsTrLp9Z616D7dJuQEiEaqwO
 xhLycdc4APcvWyNwd2DH6fBd6ToPPhQ4SLe5Q8uYSdU8kTWwRVjT0JLT2uqIRYnuU0yZ
 //VZ8EBQVJv7gy0gQdMd9vdEqaX5MCkItW3oM2WVNZXGH7o0W+6cGt3kbz+cAiWIleC6
 zj2SRmISQNV9o+ZRxaou75jIdRInodNYBtvGpqOlkAfZlEF9nqmJCeYzQc7IUAgDIhs6
 NH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WA9dG36UknQVCp/Rfsks+W3xsfkt4WlYU9zyAfbsCgQ=;
 b=IbFLvFcAZ6mJUvExgJeoM6k49CkLYKQkWf4PW1dlUg3VWAWIrgN/MarVUsOH/7YcO3
 XznX36m+uN5KvPzKmd3jDzDRf5Q90OKADiSRnz/JZVQ21ivVfHXlCGcEzdqvGSV2awO4
 SQS9G5XffFecNFdYCA3J5XZWapdXy7c0PfUrkTVv1RFA50VsEwPiuj9gDBSB91HEin3A
 WUHU3mA2x8EJLZkAKCziJ2tv02F6WSIDFPndHnyHnkhLa8crNoOgvAOy0ExQMpb0KnLz
 SvhlQCaej16AW1bCpunKNlu3LpgD4uRuRf775rlouLbGxw9Y7OpldCUFmrOh7JdA8hKB
 IsmQ==
X-Gm-Message-State: AOAM530FPbIWgGzAr8Bh3RT70c0ZrdsAw4og0hgvoeCQLTiGno6ArQxP
 k+gbtboEqwLJlP6SlalwCMhzYA==
X-Google-Smtp-Source: ABdhPJwfe7mJl2Nlvy7MUCw7TJuJtcEgvNqi1W6VVbo7nbbTXXlCa6Y7P3z77mktRj4O6UVPNWCFTA==
X-Received: by 2002:a1c:3245:: with SMTP id y66mr3228476wmy.64.1594117012898; 
 Tue, 07 Jul 2020 03:16:52 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 04/28] ASoC: fsl: fsl_asrc: Demote obvious misuse of kerneldoc
 to standard comment blocks
Date: Tue,  7 Jul 2020 11:16:18 +0100
Message-Id: <20200707101642.1747944-5-lee.jones@linaro.org>
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

 sound/soc/fsl/fsl_asrc.c:44: warning: cannot understand function prototype: 'unsigned char input_clk_map_imx35[ASRC_CLK_MAP_LEN] = '
 sound/soc/fsl/fsl_asrc.c:78: warning: cannot understand function prototype: 'unsigned char clk_map_imx8qm[2][ASRC_CLK_MAP_LEN] = '
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'inrate' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'outrate' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'pre_proc' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:118: warning: Function parameter or member 'post_proc' not described in 'fsl_asrc_sel_proc'
 sound/soc/fsl/fsl_asrc.c:158: warning: Function parameter or member 'channels' not described in 'fsl_asrc_request_pair'
 sound/soc/fsl/fsl_asrc.c:158: warning: Function parameter or member 'pair' not described in 'fsl_asrc_request_pair'
 sound/soc/fsl/fsl_asrc.c:201: warning: Function parameter or member 'pair' not described in 'fsl_asrc_release_pair'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'pair' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'in' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:223: warning: Function parameter or member 'out' not described in 'fsl_asrc_set_watermarks'
 sound/soc/fsl/fsl_asrc.c:242: warning: Function parameter or member 'pair' not described in 'fsl_asrc_cal_asrck_divisor'
 sound/soc/fsl/fsl_asrc.c:242: warning: Function parameter or member 'div' not described in 'fsl_asrc_cal_asrck_divisor'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'pair' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'inrate' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:259: warning: Function parameter or member 'outrate' not described in 'fsl_asrc_set_ideal_ratio'
 sound/soc/fsl/fsl_asrc.c:310: warning: Function parameter or member 'pair' not described in 'fsl_asrc_config_pair'
 sound/soc/fsl/fsl_asrc.c:310: warning: Function parameter or member 'use_ideal_rate' not described in 'fsl_asrc_config_pair'
 sound/soc/fsl/fsl_asrc.c:516: warning: Function parameter or member 'pair' not described in 'fsl_asrc_start_pair'
 sound/soc/fsl/fsl_asrc.c:545: warning: Function parameter or member 'pair' not described in 'fsl_asrc_stop_pair'
 sound/soc/fsl/fsl_asrc.c:559: warning: Function parameter or member 'pair' not described in 'fsl_asrc_get_dma_channel'
 sound/soc/fsl/fsl_asrc.c:559: warning: Function parameter or member 'dir' not described in 'fsl_asrc_get_dma_channel'
 sound/soc/fsl/fsl_asrc.c:902: warning: Function parameter or member 'asrc' not described in 'fsl_asrc_init'
 sound/soc/fsl/fsl_asrc.c:936: warning: Function parameter or member 'irq' not described in 'fsl_asrc_isr'
 sound/soc/fsl/fsl_asrc.c:936: warning: Function parameter or member 'dev_id' not described in 'fsl_asrc_isr'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_asrc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 462ce9f9ab488..209bf80dc3670 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -37,7 +37,7 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
 	.list = supported_asrc_rate,
 };
 
-/**
+/*
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
@@ -68,7 +68,7 @@ static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-/**
+/*
  * i.MX8QM/i.MX8QXP uses the same map for input and output.
  * clk_map_imx8qm[0] is for i.MX8QM asrc0
  * clk_map_imx8qm[1] is for i.MX8QM asrc1
@@ -101,7 +101,7 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
-/**
+/*
  * Select the pre-processing and post-processing options
  * Make sure to exclude following unsupported cases before
  * calling this function:
@@ -147,7 +147,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
 		*post_proc = 1;
 }
 
-/**
+/*
  * Request ASRC pair
  *
  * It assigns pair by the order of A->C->B because allocation of pair B,
@@ -192,7 +192,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	return ret;
 }
 
-/**
+/*
  * Release ASRC pair
  *
  * It clears the resource from asrc and releases the occupied channels.
@@ -216,7 +216,7 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
-/**
+/*
  * Configure input and output thresholds
  */
 static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
@@ -233,7 +233,7 @@ static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 			   ASRMCRi_OUTFIFO_THRESHOLD(out));
 }
 
-/**
+/*
  * Calculate the total divisor between asrck clock rate and sample rate
  *
  * It follows the formula clk_rate = samplerate * (2 ^ prescaler) * divider
@@ -249,7 +249,7 @@ static u32 fsl_asrc_cal_asrck_divisor(struct fsl_asrc_pair *pair, u32 div)
 	return ((div - 1) << ASRCDRi_AxCPi_WIDTH) | ps;
 }
 
-/**
+/*
  * Calculate and set the ratio for Ideal Ratio mode only
  *
  * The ratio is a 32-bit fixed point value with 26 fractional bits.
@@ -292,7 +292,7 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 	return 0;
 }
 
-/**
+/*
  * Configure the assigned ASRC pair
  *
  * It configures those ASRC registers according to a configuration instance
@@ -507,7 +507,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	return fsl_asrc_set_ideal_ratio(pair, inrate, outrate);
 }
 
-/**
+/*
  * Start the assigned ASRC pair
  *
  * It enables the assigned pair and makes it stopped at the stall level.
@@ -538,7 +538,7 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 	regmap_write(asrc->regmap, REG_ASRIER, ASRIER_AOLIE);
 }
 
-/**
+/*
  * Stop the assigned ASRC pair
  */
 static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
@@ -551,7 +551,7 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 			   ASRCTR_ASRCEi_MASK(index), 0);
 }
 
-/**
+/*
  * Get DMA channel according to the pair and direction.
  */
 static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
@@ -895,7 +895,7 @@ static const struct regmap_config fsl_asrc_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-/**
+/*
  * Initialize ASRC registers with a default configurations
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
@@ -929,7 +929,7 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 	return regmap_write(asrc->regmap, REG_ASR56K, ipg_rate / 56000);
 }
 
-/**
+/*
  * Interrupt handler for ASRC
  */
 static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
-- 
2.25.1

