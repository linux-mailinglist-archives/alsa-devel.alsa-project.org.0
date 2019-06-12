Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6942B9F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC482177F;
	Wed, 12 Jun 2019 18:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC482177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560355279;
	bh=blBpEErjhJ0PMhZctqgXpzGfUGAzitjqQi6jQuzoAUc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OznnDiE7lcnn0rEvfNKDGnHbVl1Blh40TzCAbK0c9p63aaO+K0OPYq1F2fTbVh8Fp
	 p/0mNr111uGnyDbc7WCnkirlKFAa+KVt1YhdOR3O80HL/gqXbgj58eYIJ2MrM7cyeO
	 wr2VCL9PajcsRqfuGF7FAf1s3B4r9UhwFA99z2VE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8E1F806F5;
	Wed, 12 Jun 2019 17:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7756AF896E3; Wed, 12 Jun 2019 17:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C17D2F806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 17:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17D2F806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lz9BXByn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YA2MYBNBMatcq9Mz5KnNb8V+dC8ifZ7eYiCOOwL6tbo=; b=lz9BXByn6KgX
 Eutanqm/JEhXdOmdzvZvsoooBh6ZUcu94QNmg8Ibi05s02nTg3zGQvw4lUNqzgfV5wnBoIaJMkYkY
 /DbaHmcGaONCxNJH4e21H6w6/bV0hroU40xOE6biJPyPjx6FqY4lwQqkBk1hTvG6F4uXkrGyWFvfm
 zsi70=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hb5ep-000366-NJ; Wed, 12 Jun 2019 15:59:27 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 04CC7440046; Wed, 12 Jun 2019 16:59:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190611122941.10708-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190612155927.04CC7440046@finisterre.sirena.org.uk>
Date: Wed, 12 Jun 2019 16:59:26 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jsarha@ti.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Mark Brown <broonie@kernel.org>, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Support for
	auxclk-fs-ratio" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 764958f2b5239cbf174e70cad4c3f19a8c1081ba Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 11 Jun 2019 15:29:41 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio

When McASP is bus master and it's AUXCLK clock is not static, but it is
a multiple of the frame sync the constraint rules should take it account
when validating possible stream formats.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 52 ++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 9fbc759fdefe..a8378d223a9e 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -100,6 +100,7 @@ struct davinci_mcasp {
 
 	int	sysclk_freq;
 	bool	bclk_master;
+	u32	auxclk_fs_ratio;
 
 	unsigned long pdir; /* Pin direction bitfield */
 
@@ -1064,13 +1065,13 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 }
 
 static int davinci_mcasp_calc_clk_div(struct davinci_mcasp *mcasp,
+				      unsigned int sysclk_freq,
 				      unsigned int bclk_freq, bool set)
 {
-	int error_ppm;
-	unsigned int sysclk_freq = mcasp->sysclk_freq;
 	u32 reg = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG);
 	int div = sysclk_freq / bclk_freq;
 	int rem = sysclk_freq % bclk_freq;
+	int error_ppm;
 	int aux_div = 1;
 
 	if (div > (ACLKXDIV_MASK + 1)) {
@@ -1175,7 +1176,8 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 		if (mcasp->slot_width)
 			sbits = mcasp->slot_width;
 
-		davinci_mcasp_calc_clk_div(mcasp, rate * sbits * slots, true);
+		davinci_mcasp_calc_clk_div(mcasp, mcasp->sysclk_freq,
+					   rate * sbits * slots, true);
 	}
 
 	ret = mcasp_common_hw_param(mcasp, substream->stream,
@@ -1282,12 +1284,19 @@ static int davinci_mcasp_hw_rule_rate(struct snd_pcm_hw_params *params,
 
 	for (i = 0; i < ARRAY_SIZE(davinci_mcasp_dai_rates); i++) {
 		if (snd_interval_test(ri, davinci_mcasp_dai_rates[i])) {
-			uint bclk_freq = sbits*slots*
-				davinci_mcasp_dai_rates[i];
+			uint bclk_freq = sbits * slots *
+					 davinci_mcasp_dai_rates[i];
+			unsigned int sysclk_freq;
 			int ppm;
 
-			ppm = davinci_mcasp_calc_clk_div(rd->mcasp, bclk_freq,
-							 false);
+			if (rd->mcasp->auxclk_fs_ratio)
+				sysclk_freq =  davinci_mcasp_dai_rates[i] *
+					       rd->mcasp->auxclk_fs_ratio;
+			else
+				sysclk_freq = rd->mcasp->sysclk_freq;
+
+			ppm = davinci_mcasp_calc_clk_div(rd->mcasp, sysclk_freq,
+							 bclk_freq, false);
 			if (abs(ppm) < DAVINCI_MAX_RATE_ERROR_PPM) {
 				if (range.empty) {
 					range.min = davinci_mcasp_dai_rates[i];
@@ -1321,12 +1330,19 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
 	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
 		if (snd_mask_test(fmt, i)) {
 			uint sbits = snd_pcm_format_width(i);
+			unsigned int sysclk_freq;
 			int ppm;
 
+			if (rd->mcasp->auxclk_fs_ratio)
+				sysclk_freq =  rate *
+					       rd->mcasp->auxclk_fs_ratio;
+			else
+				sysclk_freq = rd->mcasp->sysclk_freq;
+
 			if (rd->mcasp->slot_width)
 				sbits = rd->mcasp->slot_width;
 
-			ppm = davinci_mcasp_calc_clk_div(rd->mcasp,
+			ppm = davinci_mcasp_calc_clk_div(rd->mcasp, sysclk_freq,
 							 sbits * slots * rate,
 							 false);
 			if (abs(ppm) < DAVINCI_MAX_RATE_ERROR_PPM) {
@@ -1991,6 +2007,22 @@ static inline int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
 }
 #endif /* CONFIG_GPIOLIB */
 
+static int davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
+{
+	struct device_node *np = mcasp->dev->of_node;
+	int ret;
+	u32 val;
+
+	if (!np)
+		return 0;
+
+	ret = of_property_read_u32(np, "auxclk-fs-ratio", &val);
+	if (ret >= 0)
+		mcasp->auxclk_fs_ratio = val;
+
+	return 0;
+}
+
 static int davinci_mcasp_probe(struct platform_device *pdev)
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
@@ -2224,6 +2256,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	ret = davinci_mcasp_get_dt_params(mcasp);
+	if (ret)
+		return -EINVAL;
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					&davinci_mcasp_component,
 					&davinci_mcasp_dai[pdata->op_mode], 1);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
