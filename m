Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621571FC6C7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 09:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB251676;
	Wed, 17 Jun 2020 09:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB251676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592377917;
	bh=cUsFUlKuZN/wvqpBrwaAp44Wx7eiil6RKNHi4H2Xiy8=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=MV7q6+YVUo5gm0bFgN+MQv8INfTCg5ldt6YM4OXnZdiqli38FQmAxM8ad1RstGS6g
	 b9rO386Mcl/irQkicGgLcKWl+R0ldDu+GGdIiu5kC3Ln9nGt7I05gAOBLY9OmcvEa7
	 SfK/SAtjcQIoqfrwgbc5YLiP9QjtoX4MTwtUkaXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12BBF801EB;
	Wed, 17 Jun 2020 09:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8091BF80101; Wed, 17 Jun 2020 09:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE2AFF80162
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 09:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2AFF80162
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9812C2008E7;
 Wed, 17 Jun 2020 09:09:17 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D74B2008F7;
 Wed, 17 Jun 2020 09:09:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 67105402B1;
 Wed, 17 Jun 2020 15:09:05 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
Date: Wed, 17 Jun 2020 14:58:01 +0800
Message-Id: <7a343edd5f8487abad248a0b862f45fd95067751.1592376770.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
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

The one difference on imx6sx platform is that the root clock
is shared with ASRC module, so we add a new flags
"shared_root_clock" which means the root clock is not independent,
then we will not do the clk_set_rate and clk_round_rate to avoid
impact ASRC module usage.

As add a new flags, we include the soc specific data struct.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
changes in v3
- refine some comments
- add Reviewed-by: Nicolin Chen

changes in v2
- use shared_root_clk instead ind_root_clk.
- add fsl_spdif_can_set_clk_rate function.

 sound/soc/fsl/fsl_spdif.c | 50 +++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b2e516f9162..5bc0e4729341 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -42,6 +42,18 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
 
 #define DEFAULT_RXCLK_SRC	1
 
+/**
+ * struct fsl_spdif_soc_data: soc specific data
+ *
+ * @imx: for imx platform
+ * @shared_root_clock: flag of sharing a clock source with others;
+ *                     so the driver shouldn't set root clock rate
+ */
+struct fsl_spdif_soc_data {
+	bool imx;
+	bool shared_root_clock;
+};
+
 /*
  * SPDIF control structure
  * Defines channel status, subcode and Q sub
@@ -89,6 +101,7 @@ struct spdif_mixer_control {
  * @dma_params_rx: DMA parameters for receive channel
  */
 struct fsl_spdif_priv {
+	const struct fsl_spdif_soc_data *soc;
 	struct spdif_mixer_control fsl_spdif_control;
 	struct snd_soc_dai_driver cpu_dai_drv;
 	struct platform_device *pdev;
@@ -110,6 +123,27 @@ struct fsl_spdif_priv {
 	u32 regcache_srpc;
 };
 
+static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
+	.imx = false,
+	.shared_root_clock = false,
+};
+
+static struct fsl_spdif_soc_data fsl_spdif_imx35 = {
+	.imx = true,
+	.shared_root_clock = false,
+};
+
+static struct fsl_spdif_soc_data fsl_spdif_imx6sx = {
+	.imx = true,
+	.shared_root_clock = true,
+};
+
+/* Check if clk is a root clock that does not share clock source with others */
+static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
+{
+	return (clk == STC_TXCLK_SPDIF_ROOT) && !spdif->soc->shared_root_clock;
+}
+
 /* DPLL locked and lock loss interrupt handler */
 static void spdif_irq_dpll_lock(struct fsl_spdif_priv *spdif_priv)
 {
@@ -420,8 +454,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 
 	sysclk_df = spdif_priv->sysclk_df[rate];
 
-	/* Don't mess up the clocks from other modules */
-	if (clk != STC_TXCLK_SPDIF_ROOT)
+	if (!fsl_spdif_can_set_clk_rate(spdif_priv, clk))
 		goto clk_set_bypass;
 
 	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
@@ -1186,7 +1219,7 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			continue;
 
 		ret = fsl_spdif_txclk_caldiv(spdif_priv, clk, savesub, index,
-					     i == STC_TXCLK_SPDIF_ROOT);
+					     fsl_spdif_can_set_clk_rate(spdif_priv, i));
 		if (savesub == ret)
 			continue;
 
@@ -1230,6 +1263,12 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 
 	spdif_priv->pdev = pdev;
 
+	spdif_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!spdif_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
+
 	/* Initialize this copy of the CPU DAI driver structure */
 	memcpy(&spdif_priv->cpu_dai_drv, &fsl_spdif_dai, sizeof(fsl_spdif_dai));
 	spdif_priv->cpu_dai_drv.name = dev_name(&pdev->dev);
@@ -1359,8 +1398,9 @@ static const struct dev_pm_ops fsl_spdif_pm = {
 };
 
 static const struct of_device_id fsl_spdif_dt_ids[] = {
-	{ .compatible = "fsl,imx35-spdif", },
-	{ .compatible = "fsl,vf610-spdif", },
+	{ .compatible = "fsl,imx35-spdif", .data = &fsl_spdif_imx35, },
+	{ .compatible = "fsl,vf610-spdif", .data = &fsl_spdif_vf610, },
+	{ .compatible = "fsl,imx6sx-spdif", .data = &fsl_spdif_imx6sx, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_spdif_dt_ids);
-- 
2.21.0

