Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B64560A84
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 21:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293A7163E;
	Wed, 29 Jun 2022 21:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293A7163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656531858;
	bh=gHHGNlPctj/0o+iyRRIYzjROycsLc/cYPpW/2IUXE+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=my0uagydWpdm4npBe8G/BT+xdt/zFyLrhttleyzUgXB3cHexPNUVwn/rAk7GQDDxq
	 kQcmtSbLPkqDUsc19Pw3ddcIuy3K1QiZIu+TIKyKxUiT5TdyFnA/TJ0huxVDIVMKKh
	 OzyXS9OTKEILGK07ST0iBqNJJPnfHmgeN4oo4bdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 140F9F80535;
	Wed, 29 Jun 2022 21:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B78F804E6; Wed, 29 Jun 2022 21:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37454F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 21:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37454F800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da7-0007RJ-9q; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da3-003SHY-1Q; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da5-001xRh-Pf; Wed, 29 Jun 2022 21:42:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: tegra: tegra20_das: Drop write-only driver data
 member
Date: Wed, 29 Jun 2022 21:42:24 +0200
Message-Id: <20220629194224.175607-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; h=from:subject;
 bh=gHHGNlPctj/0o+iyRRIYzjROycsLc/cYPpW/2IUXE+U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsd0lM55FQWCkvAlD28+GH123ltTUkfqgyMl7GL
 +YjqqDWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrHQAKCRDB/BR4rcrsCbIEB/
 9w1OQ+eqX+aUFGY+T2KuxljawC7xFOpRq3x02pnG8GS8pX50hUnx5xq9YRlgeeznvWoiksJDGZniVh
 AqijAKcqEXplD3I+W/G/OoLhkJpDDivyDWSE53BgcH+kVShtUYm0n1iWCPdLkaapAol/B5FfmfBIm/
 KUceDJUYAtrpO3VAGzDqCHcp9saWMfhdMvavASdZ4YYl4yoD1J/N4o36jiV+VLpIyGEjQyyu6qGedq
 B/c47qtPjoU/U927WD6QJpz7JCCZSqmrOmKvcBQ7AfAgFWY31EI3b+zvHsslPdKRZZZZqXgp6lDyUx
 G0qxRUT5O9eCAh5PLPhjK2cT90sAca
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

The dev member of struct tegra20_das is only written once in .probe().
There is no loss of functionality if the member and the assignment go away.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 39a6135dd0d0..c620ab0c601f 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -77,7 +77,6 @@
 #define TEGRA20_DAS_DAC_ID_3 2
 
 struct tegra20_das {
-	struct device *dev;
 	struct regmap *regmap;
 };
 
@@ -162,8 +161,6 @@ static int tegra20_das_probe(struct platform_device *pdev)
 	if (!das)
 		return -ENOMEM;
 
-	das->dev = &pdev->dev;
-
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
2.36.1

