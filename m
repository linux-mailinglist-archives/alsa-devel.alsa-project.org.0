Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E8560A86
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 21:44:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43AA91663;
	Wed, 29 Jun 2022 21:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43AA91663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656531870;
	bh=NNwqyKjbaWWkMxiIfqGcg6aIfVxVnVnYfxOrcygWPSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XE+Gq/X1OA4h85dPayafipoqB5C04baQYIFvIjREJDW7Yy6V2U7f76JCRp7MnqW9X
	 P725BqFfHipII4FafZtItbz98nYOzO0tm3ZFBf+7Cqz/yfT/ptqxcM2kIo5lqqos01
	 0p4SgtJSa6ALQo1foaGQ5xHymii//uAkFpxVTrwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C084BF80536;
	Wed, 29 Jun 2022 21:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18E5F80537; Wed, 29 Jun 2022 21:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74173F8020D
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 21:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74173F8020D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da7-0007RK-HG; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da3-003SHb-6R; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da5-001xRb-Dt; Wed, 29 Jun 2022 21:42:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: tegra: tegra20_das: Get rid of global pointer for
 driver data
Date: Wed, 29 Jun 2022 21:42:22 +0200
Message-Id: <20220629194224.175607-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; h=from:subject;
 bh=NNwqyKjbaWWkMxiIfqGcg6aIfVxVnVnYfxOrcygWPSU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsXbco0jkOBROa6nTPsgOVFbpoV/KvbMofKeg2r
 5xph/U6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrFwAKCRDB/BR4rcrsCT0jB/
 0fTacBAnWTe6pSayT6Wf51rlIxuSq9RmDkNJXcte0OBrxAfyfV8M7y26Sc4mVr7laKjvC7C7VEfzYo
 G+ld0Yr4mve5PS1Wvbbo2Ak3D/LBEOQ0vv9EOwhV/ZdCnVm2F49l36wA0fIsxKuHSFhxdCiMT0dWVL
 DQlQbgyxDpwS2DRzj8Hd6GfDpgBK1vWffacVyhShr4CIpgY5QiMq82uWaz9Kr0+mGlWMtODQwOTTIw
 Dt8vDiY3Db2NCgd59hriuCIt4eimNYojPlAvXVLRW8J2GO7q5gKddjh6ddGPZaw7Vo2TBxpfILM+IJ
 I9cMjCZ1RHRCj5N+tgcf7y+HMWIgbE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jonathan Hunter <jonathanh@nvidia.com>
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

This enables the driver (at least theoretically) to bind to more than one
device.

The remove function has nothing to do now, so it is dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 66 +++++++++++------------------------
 1 file changed, 20 insertions(+), 46 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 4e23fd96c745..8637a0cc1f5e 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -97,14 +97,12 @@ struct tegra20_das {
  * configuration is programmed.
  */
 
-static struct tegra20_das *das;
-
-static inline void tegra20_das_write(u32 reg, u32 val)
+static inline void tegra20_das_write(struct tegra20_das *das, u32 reg, u32 val)
 {
 	regmap_write(das->regmap, reg, val);
 }
 
-static int tegra20_das_connect_dap_to_dac(int dap, int dac)
+static int tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
@@ -116,12 +114,12 @@ static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
 	reg = dac << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
 
-	tegra20_das_write(addr, reg);
+	tegra20_das_write(das, addr, reg);
 
 	return 0;
 }
 
-static int tegra20_das_connect_dac_to_dap(int dac, int dap)
+static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
@@ -135,7 +133,7 @@ static int tegra20_das_connect_dac_to_dap(int dac, int dap)
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P |
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
 
-	tegra20_das_write(addr, reg);
+	tegra20_das_write(das, addr, reg);
 
 	return 0;
 }
@@ -168,74 +166,51 @@ static const struct regmap_config tegra20_das_regmap_config = {
 static int tegra20_das_probe(struct platform_device *pdev)
 {
 	void __iomem *regs;
+	struct tegra20_das *das;
 	int ret = 0;
 
-	if (das)
-		return -ENODEV;
-
 	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
-	if (!das) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!das)
+		return -ENOMEM;
+
 	das->dev = &pdev->dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto err;
-	}
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	das->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &tegra20_das_regmap_config);
 	if (IS_ERR(das->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
-		ret = PTR_ERR(das->regmap);
-		goto err;
+		return PTR_ERR(das->regmap);
 	}
 
-	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_1,
+	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
 					     TEGRA20_DAS_DAP_SEL_DAC1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		goto err;
+		return ret;
 	}
-	ret = tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_1,
+	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
 					     TEGRA20_DAS_DAC_SEL_DAP1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		goto err;
+		return ret;
 	}
-
-	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_3,
+	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
 					     TEGRA20_DAS_DAP_SEL_DAC3);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		goto err;
+		return ret;
 	}
-	ret = tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_3,
+	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
 					     TEGRA20_DAS_DAC_SEL_DAP3);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		goto err;
+		return ret;
 	}
 
-	platform_set_drvdata(pdev, das);
-
-	return 0;
-
-err:
-	das = NULL;
-	return ret;
-}
-
-static int tegra20_das_remove(struct platform_device *pdev)
-{
-	if (!das)
-		return -ENODEV;
-
-	das = NULL;
-
 	return 0;
 }
 
@@ -246,7 +221,6 @@ static const struct of_device_id tegra20_das_of_match[] = {
 
 static struct platform_driver tegra20_das_driver = {
 	.probe = tegra20_das_probe,
-	.remove = tegra20_das_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra20_das_of_match,
-- 
2.36.1

