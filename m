Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EC284ED2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651DC1730;
	Tue,  6 Oct 2020 17:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651DC1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601997741;
	bh=vhhQpTCUD8sRzA7bwp86cG53vWPfZ25ScmtAB7aJbmo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UB4jToUHcgXmgkAMsTMyCXe6Sim47lpct3kDtnog2GOekBgCEZBeOzJGULw+lreYQ
	 xKLKTiw1U7qiEHqngUPFGlclps/FDf4PnkShdl2NTsF4GPqzOsdDxX1jcX+bjYvPyr
	 pb7KPUrKmV88CAcf/t+0OPctBPxEQnSJb3YCiy+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21197F80053;
	Tue,  6 Oct 2020 17:20:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C30A5F8012A; Tue,  6 Oct 2020 17:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7912F80053
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7912F80053
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kPolM-0003j9-On; Tue, 06 Oct 2020 15:20:24 +0000
From: Colin King <colin.king@canonical.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" ->
 "overrun"
Date: Tue,  6 Oct 2020 16:20:24 +0100
Message-Id: <20201006152024.542418-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 726e4951d9a5..e6ded6f8453f 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -338,7 +338,7 @@ static irqreturn_t mchp_spdif_interrupt(int irq, void *dev_id)
 	}
 
 	if (pending & SPDIFRX_IR_OVERRUN) {
-		dev_warn(dev->dev, "Overrrun detected\n");
+		dev_warn(dev->dev, "Overrun detected\n");
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.27.0

