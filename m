Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2C560A83
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 21:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB291640;
	Wed, 29 Jun 2022 21:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB291640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656531826;
	bh=6qOB9QLcux3RkEXYTjgZytt2bAmgWTouMGDcxT7pWfg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9CHS0K+6ZXTisvXoxhzdMnkXDub1bD7aX2oTcXgiqgX0fklzTfYo4lXDDsnL71Di
	 1fWUCbsOYm8K0npVf+FudO6QZBc2Z417qi0VW1AG5oNQe5yzn+C+lQeiAGKZZ+EDPB
	 3RuqLt6zmzaSGatxU5ByeNIJkXWt9MTWOrdTqXsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC2EF80107;
	Wed, 29 Jun 2022 21:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CCEF80107; Wed, 29 Jun 2022 21:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA22BF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 21:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA22BF80107
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da7-0007RH-8I; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da2-003SHV-NC; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da5-001xRe-Jh; Wed, 29 Jun 2022 21:42:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: tegra: tegra20_das: Make helper functions return
 void
Date: Wed, 29 Jun 2022 21:42:23 +0200
Message-Id: <20220629194224.175607-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489; h=from:subject;
 bh=6qOB9QLcux3RkEXYTjgZytt2bAmgWTouMGDcxT7pWfg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsa9uH8D4sZnolQK8RuyXpF/t92AZxapWZBD15h
 37kMhkGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrGgAKCRDB/BR4rcrsCcQcB/
 wNui0qAQ3RMOCtL22n7pZOai1TtukuVD6kV2fI+np7nRzNDLpZHnrmw+iDDra+jCC2c7PP/jccAEP0
 pbbnGgDXvBZh543m3lm7aiTodzltoZ9CaIWJWSDJgU7REq41mmUUXjExOUKWgM/xquCTJvrhmeLbx0
 Z+hBFf4lYzBp6oRSaAO6aCEf6/GJwxiMiRywxbmakhcTTsLJZi5TChlHO4BsnSobPNYU1KrBArKMdk
 9YOk42ygNF5UVbOYsM5I1fZk0+qdh7yihDP1nt16YKC0xNZFjyoTddfZgi3GQUHa5biHbutIwA/vOA
 mF5N6R3eHtaAeeXss+Cbp8oIhn1dX7
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

These only ever return a value != 0 if the parameter das is NULL. In the
only caller however it's already asserted this isn't the case.

So convert the functions to return void and simplify the caller
accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 47 ++++++++---------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 8637a0cc1f5e..39a6135dd0d0 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -102,31 +102,23 @@ static inline void tegra20_das_write(struct tegra20_das *das, u32 reg, u32 val)
 	regmap_write(das->regmap, reg, val);
 }
 
-static int tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
+static void tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
 
-	if (!das)
-		return -ENODEV;
-
 	addr = TEGRA20_DAS_DAP_CTRL_SEL +
 		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
 	reg = dac << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
 
 	tegra20_das_write(das, addr, reg);
-
-	return 0;
 }
 
-static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
+static void tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
 
-	if (!das)
-		return -ENODEV;
-
 	addr = TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL +
 		(dac * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
 	reg = dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P |
@@ -134,8 +126,6 @@ static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
 
 	tegra20_das_write(das, addr, reg);
-
-	return 0;
 }
 
 #define LAST_REG(name) \
@@ -167,7 +157,6 @@ static int tegra20_das_probe(struct platform_device *pdev)
 {
 	void __iomem *regs;
 	struct tegra20_das *das;
-	int ret = 0;
 
 	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
 	if (!das)
@@ -186,30 +175,14 @@ static int tegra20_das_probe(struct platform_device *pdev)
 		return PTR_ERR(das->regmap);
 	}
 
-	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
-					     TEGRA20_DAS_DAP_SEL_DAC1);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
-					     TEGRA20_DAS_DAC_SEL_DAP1);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
-					     TEGRA20_DAS_DAP_SEL_DAC3);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
-					     TEGRA20_DAS_DAC_SEL_DAP3);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
+	tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
+				       TEGRA20_DAS_DAP_SEL_DAC1);
+	tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
+				       TEGRA20_DAS_DAC_SEL_DAP1);
+	tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
+				       TEGRA20_DAS_DAP_SEL_DAC3);
+	tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
+				       TEGRA20_DAS_DAC_SEL_DAP3);
 
 	return 0;
 }
-- 
2.36.1

