Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61853A03F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 11:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C987216E4;
	Wed,  1 Jun 2022 11:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C987216E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654075501;
	bh=Hcy/zGo2wT39tF0fpEo87iK+72SVD+s1xoK6ApR5nz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D123sRpUvU3t3KhpDHQHMu0ofUvyQPUXhjr5vN3dyRoNoMRMkS48KzYIaP7aLQPdg
	 xJVcokrRzInsO64QEDad9XMVz885kPt+UlFF4VVNEU0csV+8J19s4JmuHEnd/CNMVi
	 jbq9wclQz3W9WxZuR7n7QjJT3rBLF9OnACNdEaMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4DAF80271;
	Wed,  1 Jun 2022 11:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36389F80238; Wed,  1 Jun 2022 11:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05150F8019B
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 11:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05150F8019B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZy-0006FF-OT; Wed, 01 Jun 2022 11:23:51 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZx-005oH7-DW; Wed, 01 Jun 2022 11:23:48 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZu-00Dxwk-Va; Wed, 01 Jun 2022 11:23:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH 2/3] ASoC: fsl_sai: convert to dev_err_probe
Date: Wed,  1 Jun 2022 11:23:41 +0200
Message-Id: <20220601092342.3328644-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
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

Make use of the new macro to get device defered information for free
and to cleanup the code a bit. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a7637d602f3c..3e54f1f71c1e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1034,21 +1034,15 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	sai->regmap = devm_regmap_init_mmio(dev, base, &fsl_sai_regmap_config);
-	if (IS_ERR(sai->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(sai->regmap);
-	}
+	if (IS_ERR(sai->regmap))
+		return dev_err_probe(dev, PTR_ERR(sai->regmap), "regmap init failed\n");
 
 	sai->bus_clk = devm_clk_get(dev, "bus");
 	/* Compatible with old DTB cases */
 	if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
 		sai->bus_clk = devm_clk_get(dev, "sai");
-	if (IS_ERR(sai->bus_clk)) {
-		dev_err(dev, "failed to get bus clock: %ld\n",
-				PTR_ERR(sai->bus_clk));
-		/* -EPROBE_DEFER */
-		return PTR_ERR(sai->bus_clk);
-	}
+	if (IS_ERR(sai->bus_clk))
+		return dev_err_probe(dev, PTR_ERR(sai->bus_clk), "failed to get bus clock\n");
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
@@ -1067,14 +1061,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(dev, irq, "failed to get the irq\n");
 
 	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
-	if (ret) {
-		dev_err(dev, "failed to claim irq %u\n", irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to claim irq %u\n", irq);
 
 	memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
 	       sizeof(fsl_sai_dai_template));
@@ -1089,8 +1081,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
 	    of_find_property(np, "fsl,sai-asynchronous", NULL)) {
 		/* error out if both synchronous and asynchronous are present */
-		dev_err(dev, "invalid binding for synchronous mode\n");
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "invalid binding for synchronous mode\n");
 	}
 
 	if (of_find_property(np, "fsl,sai-synchronous-rx", NULL)) {
@@ -1109,14 +1100,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
 	    of_device_is_compatible(np, "fsl,imx6ul-sai")) {
 		gpr = syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
-		if (IS_ERR(gpr)) {
-			dev_err(dev, "cannot find iomuxc registers\n");
-			return PTR_ERR(gpr);
-		}
+		if (IS_ERR(gpr))
+			return dev_err_probe(dev, PTR_ERR(gpr), "cannot find iomuxc registers\n");
 
 		index = of_alias_get_id(np, "sai");
 		if (index < 0)
-			return index;
+			return dev_err_probe(dev, index, "cannot find sai aliases\n");
 
 		regmap_update_bits(gpr, IOMUXC_GPR1, MCLK_DIR(index),
 				   MCLK_DIR(index));
-- 
2.30.2

