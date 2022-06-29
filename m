Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561B560A8C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 21:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DFD166C;
	Wed, 29 Jun 2022 21:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DFD166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656531907;
	bh=N38zUMhA0/Dc3fqjr6CXZtSErJFoyz8+tS9hBRivjeE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7sNxGayCwL8sONH94fyb2KGtxLDbecNIbUhVcDvCPrwNpGFRikMuAxN7njEXlOMi
	 oS4b90OBnRaNNWkhg6/Hoj+cUq1mr8cQiVgxNE5kRs2GBVEg8CdsWp7ViBqVd+2DsY
	 UgCX1B2ex/h1gRNIOf8cDGFh4DvYGzCxmMG2NCZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B25F80549;
	Wed, 29 Jun 2022 21:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BCB2F80245; Wed, 29 Jun 2022 21:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56AF9F80158
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 21:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56AF9F80158
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da7-0007RG-EE; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da2-003SHR-Dm; Wed, 29 Jun 2022 21:42:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da5-001xRY-81; Wed, 29 Jun 2022 21:42:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: tegra: tegra20_das: Remove unused function
 tegra20_das_read
Date: Wed, 29 Jun 2022 21:42:21 +0200
Message-Id: <20220629194224.175607-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; h=from:subject;
 bh=N38zUMhA0/Dc3fqjr6CXZtSErJFoyz8+tS9hBRivjeE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsTyQUNE8UimE1fO9gEEX4unUblCi2mnEQedpck
 6qcxjbWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrEwAKCRDB/BR4rcrsCUaACA
 CGE/LEDhpRx+1nUpVeSj9SIU8feTzn5o1xba4mf+oE7mv1LwE3vZI7U5SSqSnX2BUxsvLNM7o2tFNz
 HSNPXovbBbLTSmbACBnGRMcMZnfi9dNzG+YFGLxUM8oI5d/LGPltEcHgIHzS0d3aJqekdc99HfTGNR
 pHqeWlUYIIO+zuDKWahJHw+mQhCFLExRz/upY+um4la4wiWgoFPI99FWEMZwb576zeliIjTnJIghE5
 qJcJa0f0XxmpeA2KOFTxjucrClMqmqeuV3cYoQkZLxbcQoybFWkroaXaplCcVwHWXf8nuF04jliykZ
 1FyJzewHA4K3SOqOQJbAZvL1Xz0Oo6
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

This function is unused since commit 7203a62562dc ("ASoC: convert
Tegra20 DAS driver to regmap").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index d2801130a986..4e23fd96c745 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -104,14 +104,6 @@ static inline void tegra20_das_write(u32 reg, u32 val)
 	regmap_write(das->regmap, reg, val);
 }
 
-static inline u32 tegra20_das_read(u32 reg)
-{
-	u32 val;
-
-	regmap_read(das->regmap, reg, &val);
-	return val;
-}
-
 static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 {
 	u32 addr;
-- 
2.36.1

