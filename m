Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546824D2BF3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E191768;
	Wed,  9 Mar 2022 10:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E191768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646818142;
	bh=n2d4sj86TOGvwk15A2VP4zHszqFxrGBTNr7jrFpfczA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XfkjUW5TZ157fxiqYxzH0dqnCeGg1lydpDmvo/LilbEb/aJ9LtDi9pttILmGnc2FM
	 xMUxQBXlH8PMLa24Iy7bRtVReP9ByJ54xv99sitxp3XKsU/s/x1yzUl7sJFk590ihQ
	 7c+TK04FIaZecOhXlZh5M/iIJMHGdJ9ajzr11Huk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4270FF8012F;
	Wed,  9 Mar 2022 10:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9408AF8012F; Wed,  9 Mar 2022 10:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD5AF8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD5AF8012F
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A9FEA2028D7;
 Wed,  9 Mar 2022 10:27:47 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 468B92027BD;
 Wed,  9 Mar 2022 10:27:47 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C23CD183AC94;
 Wed,  9 Mar 2022 17:27:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: keep all TxClk sources by txclk array
Date: Wed,  9 Mar 2022 17:18:43 +0800
Message-Id: <1646817523-26800-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

From: Viorel Suman <viorel.suman@nxp.com>

Use txclk array to keep all TxClk sources instead of keeping
clocks per rate - need to do this in order to avoid multiple
prepare_enable/disable_unprepare of the same clock during
suspend/resume.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 41 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 57c41b2f7d17..e0acce6b2213 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -125,7 +125,7 @@ struct fsl_spdif_priv {
 	u16 sysclk_df[SPDIF_TXRATE_MAX];
 	u8 txclk_src[SPDIF_TXRATE_MAX];
 	u8 rxclk_src;
-	struct clk *txclk[SPDIF_TXRATE_MAX];
+	struct clk *txclk[STC_TXCLK_SRC_MAX];
 	struct clk *rxclk;
 	struct clk *coreclk;
 	struct clk *sysclk;
@@ -526,7 +526,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		goto clk_set_bypass;
 
 	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
-	ret = clk_set_rate(spdif_priv->txclk[rate],
+	ret = clk_set_rate(spdif_priv->txclk[clk],
 			   64 * sample_rate * txclk_df);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to set tx clock rate\n");
@@ -537,7 +537,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 	dev_dbg(&pdev->dev, "expected clock rate = %d\n",
 			(64 * sample_rate * txclk_df * sysclk_df));
 	dev_dbg(&pdev->dev, "actual clock rate = %ld\n",
-			clk_get_rate(spdif_priv->txclk[rate]));
+			clk_get_rate(spdif_priv->txclk[clk]));
 
 	/* set fs field in consumer channel status */
 	spdif_set_cstatus(ctrl, IEC958_AES3_CON_FS, csfs);
@@ -1376,12 +1376,10 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 	struct device *dev = &pdev->dev;
 	u64 savesub = 100000, ret;
 	struct clk *clk;
-	char tmp[16];
 	int i;
 
 	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
-		sprintf(tmp, "rxtx%d", i);
-		clk = devm_clk_get(dev, tmp);
+		clk = spdif_priv->txclk[i];
 		if (IS_ERR(clk)) {
 			dev_err(dev, "no rxtx%d clock in devicetree\n", i);
 			return PTR_ERR(clk);
@@ -1395,7 +1393,6 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			continue;
 
 		savesub = ret;
-		spdif_priv->txclk[index] = clk;
 		spdif_priv->txclk_src[index] = i;
 
 		/* To quick catch a divisor, we allow a 0.1% deviation */
@@ -1407,7 +1404,7 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			spdif_priv->txclk_src[index], rate[index]);
 	dev_dbg(dev, "use txclk df %d for %dHz sample rate\n",
 			spdif_priv->txclk_df[index], rate[index]);
-	if (clk_is_match(spdif_priv->txclk[index], spdif_priv->sysclk))
+	if (clk_is_match(spdif_priv->txclk[spdif_priv->txclk_src[index]], spdif_priv->sysclk))
 		dev_dbg(dev, "use sysclk df %d for %dHz sample rate\n",
 				spdif_priv->sysclk_df[index], rate[index]);
 	dev_dbg(dev, "the best rate for %dHz sample rate is %dHz\n",
@@ -1423,6 +1420,7 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	char tmp[16];
 
 	spdif_priv = devm_kzalloc(&pdev->dev, sizeof(*spdif_priv), GFP_KERNEL);
 	if (!spdif_priv)
@@ -1462,8 +1460,17 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 		}
 	}
 
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
+		sprintf(tmp, "rxtx%d", i);
+		spdif_priv->txclk[i] = devm_clk_get(&pdev->dev, tmp);
+		if (IS_ERR(spdif_priv->txclk[i])) {
+			dev_err(&pdev->dev, "no rxtx%d clock in devicetree\n", i);
+			return PTR_ERR(spdif_priv->txclk[i]);
+		}
+	}
+
 	/* Get system clock for rx clock rate calculation */
-	spdif_priv->sysclk = devm_clk_get(&pdev->dev, "rxtx5");
+	spdif_priv->sysclk = spdif_priv->txclk[5];
 	if (IS_ERR(spdif_priv->sysclk)) {
 		dev_err(&pdev->dev, "no sys clock (rxtx5) in devicetree\n");
 		return PTR_ERR(spdif_priv->sysclk);
@@ -1481,7 +1488,7 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "no spba clock in devicetree\n");
 
 	/* Select clock source for rx/tx clock */
-	spdif_priv->rxclk = devm_clk_get(&pdev->dev, "rxtx1");
+	spdif_priv->rxclk = spdif_priv->txclk[1];
 	if (IS_ERR(spdif_priv->rxclk)) {
 		dev_err(&pdev->dev, "no rxtx1 clock in devicetree\n");
 		return PTR_ERR(spdif_priv->rxclk);
@@ -1562,9 +1569,7 @@ static int fsl_spdif_runtime_suspend(struct device *dev)
 			&spdif_priv->regcache_srpc);
 	regcache_cache_only(spdif_priv->regmap, true);
 
-	clk_disable_unprepare(spdif_priv->rxclk);
-
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++)
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++)
 		clk_disable_unprepare(spdif_priv->txclk[i]);
 
 	if (!IS_ERR(spdif_priv->spbaclk))
@@ -1594,16 +1599,12 @@ static int fsl_spdif_runtime_resume(struct device *dev)
 		}
 	}
 
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
 		ret = clk_prepare_enable(spdif_priv->txclk[i]);
 		if (ret)
 			goto disable_tx_clk;
 	}
 
-	ret = clk_prepare_enable(spdif_priv->rxclk);
-	if (ret)
-		goto disable_tx_clk;
-
 	regcache_cache_only(spdif_priv->regmap, false);
 	regcache_mark_dirty(spdif_priv->regmap);
 
@@ -1613,12 +1614,10 @@ static int fsl_spdif_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(spdif_priv->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto disable_tx_clk;
 
 	return 0;
 
-disable_rx_clk:
-	clk_disable_unprepare(spdif_priv->rxclk);
 disable_tx_clk:
 	for (i--; i >= 0; i--)
 		clk_disable_unprepare(spdif_priv->txclk[i]);
-- 
2.17.1

