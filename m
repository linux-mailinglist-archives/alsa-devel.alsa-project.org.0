Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914DB54F273
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 10:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC201B5F;
	Fri, 17 Jun 2022 10:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC201B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655452933;
	bh=lFskeMsslsiN2afO68sWLOwVPwmtfjMjyFwnjcKJ9V0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSHd2fysAylBE6T4tpv2Ju6tT97EdW9Y5SH3SFaj5RiFydEd4EE7GP8aDbxVwKsVm
	 3vgMdTX/yWJp4I7eWR03UBdturUBvE3b4Pl6yPiWWjHiRgUYOPuLWEL/SpvP8lmC8B
	 3OdBUu8PSYSyBKxMPxLV5Te7V6Yf3tfke/g4G2IQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 673B4F80302;
	Fri, 17 Jun 2022 10:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BBA7F8028B; Fri, 17 Jun 2022 10:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02C59F800D3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 09:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C59F800D3
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B133E201FB3;
 Fri, 17 Jun 2022 09:59:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 67C92201F99;
 Fri, 17 Jun 2022 09:59:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 842991820F45;
 Fri, 17 Jun 2022 15:59:19 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: fsl_sai: Make res a member of struct fsl_sai
Date: Fri, 17 Jun 2022 15:44:35 +0800
Message-Id: <1655451877-16382-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
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

The resource info need to be accessed by hw_params()
function for multi fifo case, the start address may
be not the FIFO0. So move it to be a member of
struct fsl_sai.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +++----
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ddfe28cb7df0..86aa0baba848 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1077,7 +1077,6 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct fsl_sai *sai;
 	struct regmap *gpr;
-	struct resource *res;
 	void __iomem *base;
 	char tmp[8];
 	int irq, ret, i;
@@ -1092,7 +1091,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &sai->res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -1192,8 +1191,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   MCLK_DIR(index));
 	}
 
-	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR0;
-	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR0;
+	sai->dma_params_rx.addr = sai->res->start + FSL_SAI_RDR0;
+	sai->dma_params_tx.addr = sai->res->start + FSL_SAI_TDR0;
 	sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index c0b6bc42fc3c..4d657edc9c9f 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -258,6 +258,7 @@ struct fsl_sai {
 	struct regmap *regmap;
 	struct clk *bus_clk;
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
+	struct resource *res;
 
 	bool is_consumer_mode;
 	bool is_lsb_first;
-- 
2.17.1

