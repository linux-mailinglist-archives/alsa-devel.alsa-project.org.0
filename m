Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280263475AA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 11:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE9F1686;
	Wed, 24 Mar 2021 11:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE9F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616580969;
	bh=P1F0Ve1rTCJ7C//sOPmNVnEfsm+BFOo0eYONrg2JflE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEjQVfaRh2MefMf30b5UfdUMqJ/NXe0QJSAahz+uEj09JEZ2U1vcJz4WRHKaFbOfB
	 w6W4ajKZMeMoednX0ZeCwdppjOnsymyYPXbnFK85oWpzp0nVZ/ORy8P1AXFouj4VB5
	 hRqVc7CBLGhyKrGwDTbz2IZEa1EcHEJF35Guyt/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A05F8049C;
	Wed, 24 Mar 2021 11:13:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA3DF8012B; Wed, 24 Mar 2021 11:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22BB9F801EC
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 11:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22BB9F801EC
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 840281A27E6;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7CBA61A27E1;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id ECDE64033E;
 Wed, 24 Mar 2021 11:12:33 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: fsl_easrc: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:46 +0800
Message-Id: <1616579928-22428-5-git-send-email-shengjiu.wang@nxp.com>
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

When there is power domain bind with mem clock,

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
 sound/soc/fsl/fsl_easrc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 600e0d670ca6..5e33afe87c4a 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1896,8 +1896,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 	easrc->paddr = res->start;
 
-	easrc->regmap = devm_regmap_init_mmio_clk(dev, "mem", regs,
-						  &fsl_easrc_regmap_config);
+	easrc->regmap = devm_regmap_init_mmio(dev, regs, &fsl_easrc_regmap_config);
 	if (IS_ERR(easrc->regmap)) {
 		dev_err(dev, "failed to init regmap");
 		return PTR_ERR(easrc->regmap);
-- 
2.27.0

