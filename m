Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD11252D1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC601666;
	Wed, 18 Dec 2019 21:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC601666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576699888;
	bh=+0Fviy5gHPtOtoIoCNm19oeY/WsBcPS0qufN30CdMrY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZdddEkIiBtL+565CzGnQtcG148O715/E6n+tCpzwkYdc56QneUISDN1TFEqupgT+B
	 +89byynJo6xb1x/duaOarxiISawH002DpzZMh4bo3x9juHvJn3VNv3NJt7vR1Bcs2F
	 BjQ1BaS/9CI/aot4VAj+BbAhqNjkz9/ipZX5iVAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E8AF802C3;
	Wed, 18 Dec 2019 21:05:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C595F802A0; Wed, 18 Dec 2019 21:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1131EF8028B
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1131EF8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004B811B3;
 Wed, 18 Dec 2019 12:05:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717933F67D;
 Wed, 18 Dec 2019 12:05:42 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20191218172420.1199117-2-jbrunet@baylibre.com>
Message-Id: <applied-20191218172420.1199117-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Alden DSouza <aldend@google.com>, linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-fifo: fix fifo threshold
	setup" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: meson: axg-fifo: fix fifo threshold setup

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 864cee90d4bd870e5d5e5a0b1a6f055f4f951350 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Dec 2019 18:24:17 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: fix fifo threshold setup

On TODDR sm1, the fifo threshold register field is slightly different
compared to the other SoCs. This leads to the fifo A being flushed to
memory every 8kB. If the period is smaller than that, several periods
are pushed to memory and notified at once. This is not ideal.

Fix the register field update. With this, the fifos are flushed every
128B. We could still do better, like adapt the threshold depending on
the period size, but at least it consistent across the different
SoC/fifos

Fixes: 5ac825c3d85e ("ASoC: meson: axg-toddr: add sm1 support")
Reported-by: Alden DSouza <aldend@google.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191218172420.1199117-2-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c  | 27 +++++++++++++++++++++++++--
 sound/soc/meson/axg-fifo.h  |  6 ++++--
 sound/soc/meson/axg-frddr.c | 24 ++++++++++++------------
 sound/soc/meson/axg-toddr.c | 21 +++++++++------------
 4 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 772eda857019..4365086c9a31 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -113,8 +113,10 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	struct axg_fifo *fifo = axg_fifo_data(ss);
+	unsigned int burst_num, period, threshold;
 	dma_addr_t end_ptr;
-	unsigned int burst_num;
+
+	period = params_period_bytes(params);
 
 	/* Setup dma memory pointers */
 	end_ptr = runtime->dma_addr + runtime->dma_bytes - AXG_FIFO_BURST;
@@ -122,9 +124,25 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	regmap_write(fifo->map, FIFO_FINISH_ADDR, end_ptr);
 
 	/* Setup interrupt periodicity */
-	burst_num = params_period_bytes(params) / AXG_FIFO_BURST;
+	burst_num = period / AXG_FIFO_BURST;
 	regmap_write(fifo->map, FIFO_INT_ADDR, burst_num);
 
+	/*
+	 * Start the fifo request on the smallest of the following:
+	 * - Half the fifo size
+	 * - Half the period size
+	 */
+	threshold = min(period / 2,
+			(unsigned int)AXG_FIFO_MIN_DEPTH / 2);
+
+	/*
+	 * With the threshold in bytes, register value is:
+	 * V = (threshold / burst) - 1
+	 */
+	threshold /= AXG_FIFO_BURST;
+	regmap_field_write(fifo->field_threshold,
+			   threshold ? threshold - 1 : 0);
+
 	/* Enable block count irq */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
 			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
@@ -347,6 +365,11 @@ int axg_fifo_probe(struct platform_device *pdev)
 		return fifo->irq;
 	}
 
+	fifo->field_threshold =
+		devm_regmap_field_alloc(dev, fifo->map, data->field_threshold);
+	if (IS_ERR(fifo->field_threshold))
+		return PTR_ERR(fifo->field_threshold);
+
 	return devm_snd_soc_register_component(dev, data->component_drv,
 					       data->dai_drv, 1);
 }
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index cf928d43b558..c442195ba191 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -9,7 +9,9 @@
 
 struct clk;
 struct platform_device;
+struct reg_field;
 struct regmap;
+struct regmap_field;
 struct reset_control;
 
 struct snd_soc_component_driver;
@@ -50,8 +52,6 @@ struct snd_soc_pcm_runtime;
 #define  CTRL1_STATUS2_SEL_MASK		GENMASK(11, 8)
 #define  CTRL1_STATUS2_SEL(x)		((x) << 8)
 #define   STATUS2_SEL_DDR_READ		0
-#define  CTRL1_THRESHOLD_MASK		GENMASK(23, 16)
-#define  CTRL1_THRESHOLD(x)		((x) << 16)
 #define  CTRL1_FRDDR_DEPTH_MASK		GENMASK(31, 24)
 #define  CTRL1_FRDDR_DEPTH(x)		((x) << 24)
 #define FIFO_START_ADDR			0x08
@@ -67,12 +67,14 @@ struct axg_fifo {
 	struct regmap *map;
 	struct clk *pclk;
 	struct reset_control *arb;
+	struct regmap_field *field_threshold;
 	int irq;
 };
 
 struct axg_fifo_match_data {
 	const struct snd_soc_component_driver *component_drv;
 	struct snd_soc_dai_driver *dai_drv;
+	struct reg_field field_threshold;
 };
 
 int axg_fifo_pcm_open(struct snd_soc_component *component,
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 0a7d41257a38..df104303351f 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -50,7 +50,7 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_depth, fifo_threshold;
+	unsigned int fifo_depth;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -68,11 +68,8 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	 * Depth and threshold are zero based.
 	 */
 	fifo_depth = AXG_FIFO_MIN_CNT - 1;
-	fifo_threshold = (AXG_FIFO_MIN_CNT / 2) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_FRDDR_DEPTH_MASK | CTRL1_THRESHOLD_MASK,
-			   CTRL1_FRDDR_DEPTH(fifo_depth) |
-			   CTRL1_THRESHOLD(fifo_threshold));
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
+			   CTRL1_FRDDR_DEPTH(fifo_depth));
 
 	return 0;
 }
@@ -158,8 +155,9 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
-	.component_drv	= &axg_frddr_component_drv,
-	.dai_drv	= &axg_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &axg_frddr_component_drv,
+	.dai_drv		= &axg_frddr_dai_drv
 };
 
 static const struct snd_soc_dai_ops g12a_frddr_ops = {
@@ -281,8 +279,9 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
-	.component_drv	= &g12a_frddr_component_drv,
-	.dai_drv	= &g12a_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &g12a_frddr_component_drv,
+	.dai_drv		= &g12a_frddr_dai_drv
 };
 
 /* On SM1, the output selection in on CTRL2 */
@@ -350,8 +349,9 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
-	.component_drv	= &sm1_frddr_component_drv,
-	.dai_drv	= &g12a_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &sm1_frddr_component_drv,
+	.dai_drv		= &g12a_frddr_dai_drv
 };
 
 static const struct of_device_id axg_frddr_of_match[] = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index f6023397c8fe..e711abcf8c12 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -89,7 +89,6 @@ static int axg_toddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_threshold;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -107,11 +106,6 @@ static int axg_toddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_TODDR_PP_MODE, 0);
 
-	/* TODDR does not have a configurable fifo depth */
-	fifo_threshold = AXG_FIFO_MIN_CNT - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_THRESHOLD_MASK,
-			   CTRL1_THRESHOLD(fifo_threshold));
-
 	return 0;
 }
 
@@ -190,8 +184,9 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
-	.component_drv	= &axg_toddr_component_drv,
-	.dai_drv	= &axg_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &axg_toddr_component_drv,
+	.dai_drv		= &axg_toddr_dai_drv
 };
 
 static const struct snd_soc_dai_ops g12a_toddr_ops = {
@@ -228,8 +223,9 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
-	.component_drv	= &g12a_toddr_component_drv,
-	.dai_drv	= &g12a_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &g12a_toddr_component_drv,
+	.dai_drv		= &g12a_toddr_dai_drv
 };
 
 static const char * const sm1_toddr_sel_texts[] = {
@@ -297,8 +293,9 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-	.component_drv	= &sm1_toddr_component_drv,
-	.dai_drv	= &g12a_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 12, 23),
+	.component_drv		= &sm1_toddr_component_drv,
+	.dai_drv		= &g12a_toddr_dai_drv
 };
 
 static const struct of_device_id axg_toddr_of_match[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
