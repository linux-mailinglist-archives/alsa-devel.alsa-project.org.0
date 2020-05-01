Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40CC1C0F6B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 10:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D9C16AD;
	Fri,  1 May 2020 10:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D9C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588321418;
	bh=Vbn1baItsbx6/TPWX/lnkSd1c0L0erX2KuJxfqDtz/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=Kfl51jjL5t7fMoqG2Vni1AtVBfHSpyhG/qsd1/1E8StecAi+MyMFeuNUbCHDgB7/u
	 frgx1DGys3uaDLqle7cSEEzbJ0NqcDwItcPRfoDnqPuP7OJ4/dkj6RAR2gyuXHXC9B
	 NsAmt1UBIq92E31I42J3gf6RUV0C8MmZKOP9Xrdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1533F800B9;
	Fri,  1 May 2020 10:21:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DCAF8028D; Fri,  1 May 2020 10:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E705F800B9
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 10:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E705F800B9
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 524791A0B36;
 Fri,  1 May 2020 10:21:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D409C1A0B65;
 Fri,  1 May 2020 10:20:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7DC67402BE;
 Fri,  1 May 2020 16:20:53 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/3] ASoC: fsl_esai: introduce SoC specific data
Date: Fri,  1 May 2020 16:12:04 +0800
Message-Id: <27af074e47bf2b81e2dce67ea66a9f7301dfcb07.1588320656.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
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

Introduce a SoC specific data structure which contains the
differences between the different SoCs.
This makes it easier to support more differences without having
to introduce a new if/else each time.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 46 ++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 84290be778f0..bac65ba7fbad 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -21,6 +21,17 @@
 				SNDRV_PCM_FMTBIT_S20_3LE | \
 				SNDRV_PCM_FMTBIT_S24_LE)
 
+/**
+ * fsl_esai_soc_data: soc specific data
+ *
+ * @imx: for imx platform
+ * @reset_at_xrun: flags for enable reset operaton
+ */
+struct fsl_esai_soc_data {
+	bool imx;
+	bool reset_at_xrun;
+};
+
 /**
  * fsl_esai: ESAI private data
  *
@@ -33,6 +44,7 @@
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @task: tasklet to handle the reset operation
+ * @soc: soc specific data
  * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
@@ -44,7 +56,6 @@
  * @sck_div: if using PSR/PM dividers for SCKx clock
  * @slave_mode: if fully using DAI slave mode
  * @synchronous: if using tx/rx synchronous mode
- * @reset_at_xrun: flags for enable reset operaton
  * @name: driver name
  */
 struct fsl_esai {
@@ -57,6 +68,7 @@ struct fsl_esai {
 	struct clk *fsysclk;
 	struct clk *spbaclk;
 	struct tasklet_struct task;
+	const struct fsl_esai_soc_data *soc;
 	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
 	u32 slot_width;
@@ -70,10 +82,24 @@ struct fsl_esai {
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
-	bool reset_at_xrun;
 	char name[32];
 };
 
+static struct fsl_esai_soc_data fsl_esai_vf610 = {
+	.imx = false,
+	.reset_at_xrun = true,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx35 = {
+	.imx = true,
+	.reset_at_xrun = true,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx6ull = {
+	.imx = true,
+	.reset_at_xrun = false,
+};
+
 static irqreturn_t esai_isr(int irq, void *devid)
 {
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
@@ -85,7 +111,7 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
 
 	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
-	    esai_priv->reset_at_xrun) {
+	    esai_priv->soc->reset_at_xrun) {
 		dev_dbg(&pdev->dev, "reset module for xrun\n");
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
 				   ESAI_xCR_xEIE_MASK, 0);
@@ -936,9 +962,11 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	esai_priv->pdev = pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
 
-	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
-	    of_device_is_compatible(np, "fsl,imx35-esai"))
-		esai_priv->reset_at_xrun = true;
+	esai_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!esai_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
 
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1063,9 +1091,9 @@ static int fsl_esai_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id fsl_esai_dt_ids[] = {
-	{ .compatible = "fsl,imx35-esai", },
-	{ .compatible = "fsl,vf610-esai", },
-	{ .compatible = "fsl,imx6ull-esai", },
+	{ .compatible = "fsl,imx35-esai", .data = &fsl_esai_imx35 },
+	{ .compatible = "fsl,vf610-esai", .data = &fsl_esai_vf610 },
+	{ .compatible = "fsl,imx6ull-esai", .data = &fsl_esai_imx6ull },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
-- 
2.21.0

