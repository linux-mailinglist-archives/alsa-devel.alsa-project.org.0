Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780E583ADC
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 11:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B307683B;
	Thu, 28 Jul 2022 11:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B307683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658998914;
	bh=ByZ47HH8KxFq7iva7UYPcjVSF0iDEoEuBwWCpykGtRQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JAMY4oMz8BGskMHJHz/OlnTMEnbAlnRER9lxWCqrB3OQ8l6VI9U1whPxif9AX8sMk
	 i76Rw6UUcriRj38R91OfLKJ/V/lFCqmpHBDpFAueWKkLu39yDAw1sIzX7aXD9uHJiQ
	 BnUs8U/09gN0JIEEn8gTXt/hT0XxkStKlVgOId40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF52BF80508;
	Thu, 28 Jul 2022 11:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57695F804EC; Thu, 28 Jul 2022 11:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=AC_FROM_MANY_DOTS,
 KHOP_HELO_FCRDNS,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id B813FF800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 11:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B813FF800FA
X-IronPort-AV: E=Sophos;i="5.93,196,1654527600"; d="scan'208";a="127655264"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 18:00:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4DCC340116A5;
 Thu, 28 Jul 2022 18:00:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe()
 error path
Date: Thu, 28 Jul 2022 10:00:33 +0100
Message-Id: <20220728090033.2414-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@denx.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Biju Das <biju.das@bp.renesas.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

We usually do cleanup in reverse order of init. Currently in case of
error rz_ssi_release_dma_channels() done in the reverse order. This
patch improves error handling in rz_ssi_probe() error path.

While at it, use "goto cleanup" style to reduce code duplication.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 0d0594a0e4f6..c08ef317e3e3 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -1017,32 +1017,36 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
-		rz_ssi_release_dma_channels(ssi);
-		return PTR_ERR(ssi->rstc);
+		ret = PTR_ERR(ssi->rstc);
+		goto err_dma;
 	}
 
 	reset_control_deassert(ssi->rstc);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		pm_runtime_disable(ssi->dev);
-		reset_control_assert(ssi->rstc);
-		return dev_err_probe(ssi->dev, ret, "pm_runtime_resume_and_get failed\n");
+		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed\n");
+		goto err_pm;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &rz_ssi_soc_component,
 					      rz_ssi_soc_dai,
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-
-		pm_runtime_put(ssi->dev);
-		pm_runtime_disable(ssi->dev);
-		reset_control_assert(ssi->rstc);
 		dev_err(&pdev->dev, "failed to register snd component\n");
+		goto err_snd_soc;
 	}
 
+	return 0;
+
+err_snd_soc:
+	pm_runtime_put(ssi->dev);
+err_pm:
+	pm_runtime_disable(ssi->dev);
+	reset_control_assert(ssi->rstc);
+err_dma:
+	rz_ssi_release_dma_channels(ssi);
+
 	return ret;
 }
 
-- 
2.25.1

