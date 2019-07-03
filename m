Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE835DE44
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 08:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779B01680;
	Wed,  3 Jul 2019 08:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779B01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562136874;
	bh=4ZxWBc1VY9cm7qn0QQoNVzSG7eiG0CkVZhonplMWRdg=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:Cc:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=Cxm/mT+haNDQpSvJtHB7Ev5aIT6JSgmIQLAu0bEIoUCQa+7c9s78S/+xh45Fh8TpP
	 9CabPmLARiol7snStmSA9DZA13gMt0fsbF7YvwyBAd/y+Wmu1MeyKc+QlIThonzx2I
	 QHXbrpmEd6Edy5MBEaFOIz1gxfSpFD8I9k9esoGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 910E4F80114;
	Wed,  3 Jul 2019 08:51:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CBE0F800F2; Wed,  3 Jul 2019 08:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5274AF800E9
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 08:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5274AF800E9
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ACEC2200351;
 Wed,  3 Jul 2019 08:51:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 19643200349;
 Wed,  3 Jul 2019 08:51:14 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DED2D402EB;
 Wed,  3 Jul 2019 14:51:08 +0800 (SGT)
From: shengjiu.wang@nxp.com
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org
Date: Wed,  3 Jul 2019 14:42:05 +0800
Message-Id: <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1562136119.git.shengjiu.wang@nxp.com>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1562136119.git.shengjiu.wang@nxp.com>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH V2 2/2] ASoC: fsl_esai: recover the channel
	swap after xrun
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

There is chip errata ERR008000, the reference doc is
(https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),

The issue is "While using ESAI transmit or receive and
an underrun/overrun happens, channel swap may occur.
The only recovery mechanism is to reset the ESAI."

This issue exist in imx3/imx5/imx6(partial) series.

In this commit add a tasklet to handle reset of ESAI
after xrun happens to recover the channel swap.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 76 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 20039ae9893b..8c92e49ad6d8 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -32,6 +32,7 @@
  * @extalclk: esai clock source to derive HCK, SCK and FS
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
+ * @task: tasklet to handle the reset operation
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
@@ -42,6 +43,7 @@
  * @sck_div: if using PSR/PM dividers for SCKx clock
  * @slave_mode: if fully using DAI slave mode
  * @synchronous: if using tx/rx synchronous mode
+ * @reset_at_xrun: flags for enable reset operaton
  * @name: driver name
  */
 struct fsl_esai {
@@ -53,6 +55,7 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
+	struct tasklet_struct task;
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
@@ -65,6 +68,7 @@ struct fsl_esai {
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
+	bool reset_at_xrun;
 	char name[32];
 };
 
@@ -73,8 +77,16 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
 	struct platform_device *pdev = esai_priv->pdev;
 	u32 esr;
+	u32 saisr;
 
 	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
+	    esai_priv->reset_at_xrun) {
+		dev_dbg(&pdev->dev, "reset module for xrun\n");
+		tasklet_schedule(&esai_priv->task);
+	}
 
 	if (esr & ESAI_ESR_TINIT_MASK)
 		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
@@ -634,10 +646,17 @@ static void fsl_esai_trigger_start(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
 			   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
+
+	/* Enable Exception interrupt */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
 }
 
 static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 {
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   ESAI_xCR_xEIE_MASK, 0);
+
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
 			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
@@ -652,6 +671,53 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
+static void fsl_esai_reset(unsigned long arg)
+{
+	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
+	u32 saisr, tfcr, rfcr;
+
+	/* save the registers */
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+
+	/* stop the tx & rx */
+	fsl_esai_trigger_stop(esai_priv, 1);
+	fsl_esai_trigger_stop(esai_priv, 0);
+
+	/* reset the esai, and restore the registers */
+	fsl_esai_init(esai_priv);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xPR_MASK,
+			   ESAI_xCR_xPR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xPR_MASK,
+			   ESAI_xCR_xPR);
+
+	/* restore registers by regcache_sync */
+	fsl_esai_register_restore(esai_priv);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xPR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xPR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+			   ESAI_PRRC_PDC_MASK,
+			   ESAI_PRRC_PDC(ESAI_GPIO));
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+			   ESAI_PCRC_PC_MASK,
+			   ESAI_PCRC_PC(ESAI_GPIO));
+
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	/* restart tx / rx, if they already enabled */
+	if (tfcr & ESAI_xFCR_xFEN)
+		fsl_esai_trigger_start(esai_priv, 1);
+	if (rfcr & ESAI_xFCR_xFEN)
+		fsl_esai_trigger_start(esai_priv, 0);
+}
+
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
@@ -856,6 +922,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	esai_priv->pdev = pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
 
+	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
+	    of_device_is_compatible(np, "fsl,imx35-esai"))
+		esai_priv->reset_at_xrun = true;
+
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
@@ -955,6 +1025,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	tasklet_init(&esai_priv->task, fsl_esai_reset,
+		     (unsigned long)esai_priv);
+
 	pm_runtime_enable(&pdev->dev);
 
 	regcache_cache_only(esai_priv->regmap, true);
@@ -968,7 +1041,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 static int fsl_esai_remove(struct platform_device *pdev)
 {
+	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
+
 	pm_runtime_disable(&pdev->dev);
+	tasklet_kill(&esai_priv->task);
 
 	return 0;
 }
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
