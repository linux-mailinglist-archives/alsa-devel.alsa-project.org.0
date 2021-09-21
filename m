Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF1413C3C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E0DC1699;
	Tue, 21 Sep 2021 23:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E0DC1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259080;
	bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+S16T3M8MjjYdlFEJU/0yBnbphjvEvrpFeXGeMglBYt8iPgr3JI2FC3BuGr7PG1i
	 ncsUGv1OcMJN3NDvxpBSu+5qTNXFlvUPBd8tM6BLU+FhXYO3te0GpL1RVyiHd8o1re
	 KoS9SSxeUqceuEmV4zXKq140+Y+yJtX2S2WRc0pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FABF8054A;
	Tue, 21 Sep 2021 23:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B11B9F80519; Tue, 21 Sep 2021 23:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B170F80519
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B170F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jU4XvWbo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A724C60F38;
 Tue, 21 Sep 2021 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258717;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jU4XvWboZSzRPKhb/vn1o8OuJnTe2Ny0E2jx4Tf53rwm256N9xgl+zasRtk8ZroZJ
 11qElLnYgEg297JHkJJSYr/LEMmrCMSWx4Dc1M55boV+oLSKKx+FnP4ty9R9dhTXGV
 TooIeChgV28w/kaYBdSnisNZTQMyYYag+of+sPy2H0Vp3lWg1RmQMY2oxSU3IpjpMy
 41OcvZxyOzjubg5J3BVAjRsMWNhf2fTIeUBCKLBs5TFq2vbLUIQKYvag9ZunLs/YzW
 qo7lRKFGJPFaCAFnmRC930iqc/mACDbUzXKZNFgXbqJ50TbontS94/3iN/caL+aOuS
 3sdpip5mvkVbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 13/16] ASoC: imx-sgtl5000: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:10:37 +0100
Message-Id: <20210921211040.11624-13-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknlajJbtErs5M2JHhrPL9v3ObE8KSKu2qOqnXTt
 /WwinpCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5QAKCRAk1otyXVSH0KjUB/
 4v2feYY34VgPgN0A1XUuH5RRkA+dqcx4F9O7LxEN2O7Ip/BGUMaDASCQpHTMyALpQUA1XNLGcrSono
 Cl8g6ZYK8//R87uzsiBBxgzPJOlDLYabFjDgwB8/o2R/U0Q9P0OowPjZ0BUMVulOeogPZ0G5vuCXIi
 juVLZ/8n/xHzcU/ANZ4IT4wlDYNk8+2RflNIVDMwEpnhYBy7azn0/0lTtGMNItGPMz8nUXis/BB6I1
 5ZdA0CA/EoPtdnyplRNJ+IvRl66nVw7af0KicT/eNoaQLqiBbpSpJQtV5B/6ZM2boFNqhGx5090Zax
 wErUjnSY0/++1GIG1VweYi/sBz29ao
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the imx-sgtl5000 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index f45cb4bbb6c4..2f1acd011042 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -153,7 +153,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_sgtl5000_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBM_CFM;
+			    SND_SOC_DAIFMT_CBP_CFP;
 
 	data->card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
-- 
2.20.1

