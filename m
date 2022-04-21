Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D150AA21
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:38:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9F7173F;
	Thu, 21 Apr 2022 22:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9F7173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573493;
	bh=FJ8gHzn96PdJz0Od4gfmPc9Om0v0pUIxQZphjpINH8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0Xt7l/ko3fpWTqb87MXDgHB0A+hVneznlRP4SYZwGXVVEMnRV85Qonc69NqcLddW
	 5w3G2jYohV3Hh3mum/oVPsX38OOfJz1T79nU8Lt4ML7j3ZGcRXWnHAHF2Fl7ZHImDG
	 lhGL8wmamnwy6hKe7OlLhIQXVQZAhKimi27gzv18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36CDF8051A;
	Thu, 21 Apr 2022 22:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 241F0F8032D; Thu, 21 Apr 2022 22:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 87AD8F8047D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87AD8F8047D
X-IronPort-AV: E=Sophos;i="5.90,279,1643641200"; d="scan'208";a="118731528"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 22 Apr 2022 05:36:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEDF340197BC;
 Fri, 22 Apr 2022 05:36:27 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: sh: rz-ssi: Propagate error codes returned from
 platform_get_irq_byname()
Date: Thu, 21 Apr 2022 21:35:54 +0100
Message-Id: <20220421203555.29011-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220421203555.29011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
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

Propagate error codes returned from platform_get_irq_byname() instead of
returning -ENODEV. platform_get_irq_byname() may return -EPROBE_DEFER, to
handle such cases propagate the error codes.

While at it drop the dev_err_probe() messages as platform_get_irq_byname()
already does this for us in case of error.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index cec458b8c507..d9a684e71ec3 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -977,8 +977,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0)
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Unable to get SSI int_req IRQ\n");
+		return ssi->irq_int;
 
 	ret = devm_request_irq(&pdev->dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(&pdev->dev), ssi);
@@ -990,8 +989,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		/* Tx and Rx interrupts (pio only) */
 		ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
 		if (ssi->irq_tx < 0)
-			return dev_err_probe(&pdev->dev, -ENODEV,
-					     "Unable to get SSI dma_tx IRQ\n");
+			return ssi->irq_tx;
 
 		ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
 				       &rz_ssi_interrupt, 0,
@@ -1002,8 +1000,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
 		if (ssi->irq_rx < 0)
-			return dev_err_probe(&pdev->dev, -ENODEV,
-					     "Unable to get SSI dma_rx IRQ\n");
+			return ssi->irq_rx;
 
 		ret = devm_request_irq(&pdev->dev, ssi->irq_rx,
 				       &rz_ssi_interrupt, 0,
-- 
2.17.1

