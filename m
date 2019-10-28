Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF3E74CE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:17:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301312054;
	Mon, 28 Oct 2019 16:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301312054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275830;
	bh=kjD/ncy705FDgdn0J9YproNvFMWALHkYlfLMC+iFHK8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Cc0sltKIwEd91A5NeHeXC0+uFfSYHDW7CUG5Vqs10kWyjoBhiHdVMfXeHp6ZH7hP6
	 evkzCWoke1Zbo+ydcYuE3wofgfr/MpWHIk34oQjoJdDXqgehzT41E7EfA/ZXJwo6qW
	 HqDHL3OeQGp/jICYvDSpgRLy3ZldW5H72k3PmPUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C67F80C1B;
	Mon, 28 Oct 2019 15:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2490F80714; Mon, 28 Oct 2019 15:57:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D423F8063C
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D423F8063C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CWm/IXmI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=x2dhPKkjICNRAo5195SCmNYSzw31Hm7SfRI2gVEfL0k=; b=CWm/IXmIypJq
 fBbcSGmPD5XKf6Kh6WUekoRpA/xXAEeBOPaioTlB8ao117Na+W9RTiVzYaWxBtdvMVkwMWtQ4wZ0P
 n+we0zXK2kbl7mV0dXOXy3q/TfSlll7JhQ2JxUfD/YkRYsSb4H5nTtyKmZJaWF3FCDEmJjho6Ks8/
 SYSss=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Ri-0008Ra-Hy; Mon, 28 Oct 2019 14:56:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D3FAA27403FD; Mon, 28 Oct 2019 14:56:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <23c634e4bf58afce5b3ae67f5f42e8d1cae2639a.1572252307.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145636.D3FAA27403FD@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:36 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: [alsa-devel] Applied "ASoC: fsl_asrc: refine the setting of
	internal clock divider" to the asoc tree
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

   ASoC: fsl_asrc: refine the setting of internal clock divider

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From b39eb1e250c32c695a780f1814086f2bfa0fb593 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Mon, 28 Oct 2019 17:10:29 +0800
Subject: [PATCH] ASoC: fsl_asrc: refine the setting of internal clock divider

The output divider should align with the output sample
rate, if use ideal sample rate, there will be a lot of overload,
which would cause underrun.

The maximum divider of asrc clock is 1024, but there is no
judgement for this limitation in driver, which may cause the divider
setting not correct.

For non-ideal ratio mode, the clock rate should divide the sample
rate with no remainder, and the quotient should be less than 1024.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/23c634e4bf58afce5b3ae67f5f42e8d1cae2639a.1572252307.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc.c | 45 ++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0bf91a6f54b9..a3cfceea7d2f 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -259,8 +259,15 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
  * It configures those ASRC registers according to a configuration instance
  * of struct asrc_config which includes in/output sample rate, width, channel
  * and clock settings.
+ *
+ * Note:
+ * The ideal ratio configuration can work with a flexible clock rate setting.
+ * Using IDEAL_RATIO_RATE gives a faster converting speed but overloads ASRC.
+ * For a regular audio playback, the clock rate should not be slower than an
+ * clock rate aligning with the output sample rate; For a use case requiring
+ * faster conversion, set use_ideal_rate to have the faster speed.
  */
-static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
+static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 {
 	struct asrc_config *config = pair->config;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
@@ -268,7 +275,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	enum asrc_word_width input_word_width;
 	enum asrc_word_width output_word_width;
 	u32 inrate, outrate, indiv, outdiv;
-	u32 clk_index[2], div[2];
+	u32 clk_index[2], div[2], rem[2];
+	u64 clk_rate;
 	int in, out, channels;
 	int pre_proc, post_proc;
 	struct clk *clk;
@@ -351,27 +359,42 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	/* We only have output clock for ideal ratio mode */
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
 
-	div[IN] = clk_get_rate(clk) / inrate;
-	if (div[IN] == 0) {
+	clk_rate = clk_get_rate(clk);
+	rem[IN] = do_div(clk_rate, inrate);
+	div[IN] = (u32)clk_rate;
+
+	/*
+	 * The divider range is [1, 1024], defined by the hardware. For non-
+	 * ideal ratio configuration, clock rate has to be strictly aligned
+	 * with the sample rate. For ideal ratio configuration, clock rates
+	 * only result in different converting speeds. So remainder does not
+	 * matter, as long as we keep the divider within its valid range.
+	 */
+	if (div[IN] == 0 || (!ideal && (div[IN] > 1024 || rem[IN] != 0))) {
 		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
 				inrate, clk_index[ideal ? OUT : IN]);
 		return -EINVAL;
 	}
 
-	clk = asrc_priv->asrck_clk[clk_index[OUT]];
+	div[IN] = min_t(u32, 1024, div[IN]);
 
-	/* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
-	if (ideal)
-		div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
+	clk = asrc_priv->asrck_clk[clk_index[OUT]];
+	clk_rate = clk_get_rate(clk);
+	if (ideal && use_ideal_rate)
+		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
 	else
-		div[OUT] = clk_get_rate(clk) / outrate;
+		rem[OUT] = do_div(clk_rate, outrate);
+	div[OUT] = clk_rate;
 
-	if (div[OUT] == 0) {
+	/* Output divider has the same limitation as the input one */
+	if (div[OUT] == 0 || (!ideal && (div[OUT] > 1024 || rem[OUT] != 0))) {
 		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
 				outrate, clk_index[OUT]);
 		return -EINVAL;
 	}
 
+	div[OUT] = min_t(u32, 1024, div[OUT]);
+
 	/* Set the channel number */
 	channels = config->channel_num;
 
@@ -560,7 +583,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		config.output_sample_rate = rate;
 	}
 
-	ret = fsl_asrc_config_pair(pair);
+	ret = fsl_asrc_config_pair(pair, false);
 	if (ret) {
 		dev_err(dai->dev, "fail to config asrc pair\n");
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
