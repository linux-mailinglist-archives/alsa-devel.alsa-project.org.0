Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21350F30D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 09:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C5E18BA;
	Tue, 26 Apr 2022 09:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C5E18BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650959505;
	bh=5boClyJx254j/hlSAy0rwFYE/TtELDo4/Vh4+Zk7+vo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEhA0oWJG/S23p9mbESMdUZs2tgkb9Sv04TeJ+RTuyi4LCQSFcIFC1UveieghGMVE
	 x5VaT/gFlD2tC1j0k6UCPN93nc4qhVbX9h0BYvavyki8P7m982VYeybUVuOap13OAk
	 SHZQiHd2GsKhvJ8hxDbgSgqt9MSGNhFONBmaDalc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8571EF80510;
	Tue, 26 Apr 2022 09:50:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B97F4F804FE; Tue, 26 Apr 2022 09:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 9877EF8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 09:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9877EF8014B
X-IronPort-AV: E=Sophos;i="5.90,290,1643641200"; d="scan'208";a="118016699"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 16:49:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 82EAF4248B19;
 Tue, 26 Apr 2022 16:49:53 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 2/3] ASoC: sh: rz-ssi: Propagate error codes returned from
 platform_get_irq_byname()
Date: Tue, 26 Apr 2022 08:49:21 +0100
Message-Id: <20220426074922.13319-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@denx.de>,
 linux-kernel@vger.kernel.org,
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
v1->v2
* No change
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
2.25.1

