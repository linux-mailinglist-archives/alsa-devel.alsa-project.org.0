Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552826335FC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 08:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2171678;
	Tue, 22 Nov 2022 08:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2171678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669102838;
	bh=X09SC8k+2WgD+AGmXz80AAOUv4obC9xudYWfW471Hhw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tK5TRVPJwTkEVnX3qsGsHIQ3DaWsBZIJHk+uGhCjUI0ZvDKyGlkhh2vf/i2qMZw5w
	 /1btmHv0sMGX81coIwfx4L8UJdfre7r5yOJzCS7x0BSWVQtrLPqvXL96LejFaQeoDs
	 3iuvA797Kw7gUyk2Fr+3ynmLRQIYN3/HGQMJ9wTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2212F804E2;
	Tue, 22 Nov 2022 08:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3978F804E2; Tue, 22 Nov 2022 08:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 18C55F8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 08:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C55F8026A
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id EB36E1C80FD3;
 Tue, 22 Nov 2022 15:39:04 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Nov 2022 15:39:04 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 22 Nov 2022 15:39:04 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: nau8825: Adjust internal clock during jack detection
Date: Tue, 22 Nov 2022 15:38:55 +0800
Message-ID: <20221122073855.43024-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

This patch is to rasie up internal clock during jack detection.
The fast clock will accelerate charge and discharge effect.
So this mechanism will make jack detection more robust.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 3eac7c92df88..ba7f5ec28609 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1686,6 +1686,9 @@ static void nau8825_setup_auto_irq(struct nau8825 *nau8825)
 
 	/* Enable internal VCO needed for interruptions */
 	nau8825_configure_sysclk(nau8825, NAU8825_CLK_INTERNAL, 0);
+	/* Raise up the internal clock for jack detection */
+	regmap_update_bits(regmap, NAU8825_REG_CLK_DIVIDER,
+			   NAU8825_CLK_MCLK_SRC_MASK, 0);
 
 	/* Enable ADC needed for interruptions */
 	regmap_update_bits(regmap, NAU8825_REG_ENA_CTRL,
@@ -1800,6 +1803,10 @@ static int nau8825_jack_insert(struct nau8825 *nau8825)
 		break;
 	}
 
+	/* Update to the default divider of internal clock for power saving */
+	regmap_update_bits(regmap, NAU8825_REG_CLK_DIVIDER,
+			   NAU8825_CLK_MCLK_SRC_MASK, 0xf);
+
 	/* Leaving HPOL/R grounded after jack insert by default. They will be
 	 * ungrounded as part of the widget power up sequence at the beginning
 	 * of playback to reduce pop.
-- 
2.25.1

