Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CD3475A8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 11:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941CA168E;
	Wed, 24 Mar 2021 11:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941CA168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616580947;
	bh=Y9EupM2btN5z4PV9HGonj4uNir+RLMmHwYVlvgKqvzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i850bmc9iqb9BQP3SkUtd5BRwwI5L14NXuZbYY9Q04P2BxekdeV/4mAmoGoFHfJGs
	 504D9NpWBf9trVbeRkVBeRLmaoZFgvK2TCB4yVxfd7sZK9/BCLpuw0XvWXzoGJ6EOs
	 RoBoL135c2rAMRCM5/b5exsyZcaRykH9UG08SdMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F55F80482;
	Wed, 24 Mar 2021 11:13:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2E47F802E3; Wed, 24 Mar 2021 11:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C69CF8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 11:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C69CF8012B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 86608202748;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D23320273F;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 21B2040340;
 Wed, 24 Mar 2021 11:12:35 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: fsl_audmix: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:47 +0800
Message-Id: <1616579928-22428-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
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

When there is power domain bind with ipg clock,

The call flow:
devm_regmap_init_mmio_clk
   - clk_prepare()
       - clk_pm_runtime_get()

cause the power domain of clock always be enabled after
regmap_init(). which impact the power consumption.

So use devm_regmap_init_mmio instead of
devm_regmap_init_mmio_clk,but explicitly enable
clock when it is used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 8dc44dec7956..f931288e256c 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -476,8 +476,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	priv->regmap = devm_regmap_init_mmio_clk(dev, "ipg", regs,
-						 &fsl_audmix_regmap_config);
+	priv->regmap = devm_regmap_init_mmio(dev, regs, &fsl_audmix_regmap_config);
 	if (IS_ERR(priv->regmap)) {
 		dev_err(dev, "failed to init regmap\n");
 		return PTR_ERR(priv->regmap);
-- 
2.27.0

