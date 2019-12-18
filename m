Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3C124F38
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:26:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4594B167B;
	Wed, 18 Dec 2019 18:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4594B167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576690018;
	bh=18sOEC2NQDdiMZUaUHk/n8Av0VJ0/w9IFcSRVpp88rw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvIdOjZ8bBLBoZvW7q+FeK4Cl9xg5JcRUeSt2zCiC9AQyCyd1470GUbS1ejDAkJp6
	 GCl+2udQi1U4PRrwO5hyLfx6pfv3p4CmNsgbnFeHYED+38AXF4PqeSkZNY8Mk72k5A
	 oEzVaXwuJ/XvD7fSiRwm1IRoU+1BkdPWlanyoK6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA4AF80247;
	Wed, 18 Dec 2019 18:24:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E37F80259; Wed, 18 Dec 2019 18:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D418F8014C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D418F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ELeYHi5y"
Received: by mail-wm1-x344.google.com with SMTP id b19so2677097wmj.4
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 09:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60aP4DflHtE4hw6pi+F8g20w+nVNv8AfPUSyKiwSy7M=;
 b=ELeYHi5yna5gupIWb5DwW4LmgYH9P/3mMxgpzW1oMcJKQTsAQZFrLJOJ2/zGHsskC1
 WRh6gbsUnkEV5e+xH44nvlHARyprgsib0ltK1UyyObj1gciZqzMqEXSIORHTYqtAYvcW
 myj+cc9/OVD/uMgBdSpvXWP8n9pXnDKidXsUzPHSTbSF737doFzlHv7rcKs5RfpcHnMT
 xzhWf/M22Od/PVPp0zulcq19H82tT4adR7rJ3Y26d7crwmPjV2dmtQpEyPVmTGbhMPRv
 DH1kd5fqNN/wlAKnaXrpkyNSBLwy5KWOg+LIAR2uDDc3e6UIfdGmkm7NA5txfcoDsOB6
 YUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60aP4DflHtE4hw6pi+F8g20w+nVNv8AfPUSyKiwSy7M=;
 b=qfSgSCJirf3HSRn9p1zu3anAGWS/FHtDtTvinfR76JGMHXXcdMpkSOnNZjCsGrFqBP
 Zq97F5lwRBXuWMZ0chmUA7hbli6bdA7XqCxvp+2N+IAg1V1/6Z822ZhyynTCpVwDR3VC
 0n0IrRVjXHKj+4vbROQQUz/bU++Gb3UYQtfJLZcRd2lP8HwdeNnxhMpJnZZKgmDf77Xk
 cmbP4gqZLpetrut+FPX+gnmFIEWnwqx8y1MSwG5hpkw2H7TXAkXnpqbkX7TcOu5fVI/j
 fUjvuAvLJbW+yDCPY8+6b11qy7er9NRgTIFuaVxsvm8pyTvqygb0CtMlhGu5bXzkhxgI
 vU6g==
X-Gm-Message-State: APjAAAV0346Oalnc+neRsJVB2H3zykzibdlil8rzTtI3MFVG8mq142FK
 drizF/4wrddqn2jXtDPozR8IiQ==
X-Google-Smtp-Source: APXvYqxLyHrLorNOHAe8b1ZgYm5HdlUM0fLM+WwDt1/0cfK5vOQIkABEGIaZtDxd0T/evxFe78Eqfw==
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr4435278wmm.61.1576689867113; 
 Wed, 18 Dec 2019 09:24:27 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 18 Dec 2019 18:24:17 +0100
Message-Id: <20191218172420.1199117-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Alden DSouza <aldend@google.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: meson: axg-fifo: fix fifo threshold
	setup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
