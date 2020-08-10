Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46924034F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 10:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4111663;
	Mon, 10 Aug 2020 10:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4111663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597047514;
	bh=Y8iel5pRL+wjeQIBtPHrzmoh2hxijDM4YSAnM26bTqw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cq5jXriK3UN+hq4vDJR9eAuJT4DrtBdmIKN2idtvv3ci6blViWNaxEco6rdxe83iV
	 /s/5zENB8webg43tyXf6HscBnGgbEL1iEvalWLTZGzNiLgZf3IlC5GCY4oaLnVQa1g
	 VghQswtdeIaJCBxDZ2o/h7PNCvJ78AheeiXK/CLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E07F800BC;
	Mon, 10 Aug 2020 10:16:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26AC7F8022B; Mon, 10 Aug 2020 10:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C109F800CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C109F800CE
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CAFC3201779;
 Mon, 10 Aug 2020 10:16:39 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E6912011A9;
 Mon, 10 Aug 2020 10:16:35 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7A8A0402D2;
 Mon, 10 Aug 2020 10:16:29 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl-asoc-card: Get "extal" clock rate by clk_get_rate
Date: Mon, 10 Aug 2020 16:11:43 +0800
Message-Id: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

On some platform(.e.g. i.MX8QM MEK), the "extal" clock is different
with the mclk of codec, then the clock rate is also different.
So it is better to get clock rate of "extal" rate by clk_get_rate,
don't reuse the clock rate of mclk.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- add defer probe handler

 sound/soc/fsl/fsl-asoc-card.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 52adedc03245..32f8f756e6bb 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -696,6 +696,17 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 			goto asrc_fail;
 		}
 	} else if (of_node_name_eq(cpu_np, "esai")) {
+		struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
+
+		if (!IS_ERR(esai_clk)) {
+			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
+			priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
+			clk_put(esai_clk);
+		} else if (PTR_ERR(esai_clk) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto asrc_fail;
+		}
+
 		priv->cpu_priv.sysclk_id[1] = ESAI_HCKT_EXTAL;
 		priv->cpu_priv.sysclk_id[0] = ESAI_HCKR_EXTAL;
 	} else if (of_node_name_eq(cpu_np, "sai")) {
-- 
2.27.0

