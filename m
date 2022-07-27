Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD95822C2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 11:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8071614;
	Wed, 27 Jul 2022 11:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8071614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658912868;
	bh=CIUopwxdZIlwqjXMsHY6dSEUUehkgUCOaiTv2Ru/m5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZBQhbWxOpPvT4FCf+1A5U5HUMiW9SP7qbbuyoQwVA2omAnsQUN+rFIAa62ecGCemX
	 GFPl9xuQSvVK5300B0R2Y1qIcOuMszJP58vQ2EFPdqnniFlDbS0r3yAuMLCtOOvuLh
	 xBeiEtMuo/uWuYi8tlC27R9Z0J/EXxK1+qAHT/Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44333F80544;
	Wed, 27 Jul 2022 11:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C033F800C9; Wed, 27 Jul 2022 11:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B3BF8015B
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B3BF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="ZRu+cFjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658912762; x=1690448762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIUopwxdZIlwqjXMsHY6dSEUUehkgUCOaiTv2Ru/m5M=;
 b=ZRu+cFjZQFzaidO54JPWuhpnTDx2EFeG4qih//jmfwT8P3YjR3kkiUOc
 xx8jRHTRtc3vE0WB5Vv7BYneKb9S6g0Stidby5fp2mgqoaZfeIX4gTRKi
 UgvOu+INuOBhJQYWy2Qr1kTVS887b44Ig84Ix0ZBavA9UxWyaxlV4e97H
 Oxh5ln1QAmmyeWwixVnYWc3nQsDu4cIPjM1eNZCEEU2GbPqpyaZKNxj1e
 g1zOzoYhITlgEaBJb83RI3RQZzIBeaLRHFzn6CFTNr0ROoC1pGnuZ+XzR
 diM2mc3uPoTKTwBWPqk+FD0l2nIdhARA0F7DLLSbce8COfL2HdhSO+TWg Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="169710970"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2022 02:05:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 02:05:56 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 02:05:54 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 2/2] ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
Date: Wed, 27 Jul 2022 12:08:14 +0300
Message-ID: <20220727090814.2446111-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220727090814.2446111-1-claudiu.beznea@microchip.com>
References: <20220727090814.2446111-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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

Remove references to struct mchp_i2s_caps as they are not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index cb4d0140dfe0..4850a177803d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -196,7 +196,6 @@ struct mchp_spdiftx_dev {
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
-	const struct mchp_i2s_caps		*caps;
 	int					gclk_enabled:1;
 };
 
@@ -765,8 +764,6 @@ MODULE_DEVICE_TABLE(of, mchp_spdiftx_dt_ids);
 
 static int mchp_spdiftx_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match;
 	struct mchp_spdiftx_dev *dev;
 	struct resource *mem;
 	struct regmap *regmap;
@@ -780,11 +777,6 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
-	/* Get hardware capabilities. */
-	match = of_match_node(mchp_spdiftx_dt_ids, np);
-	if (match)
-		dev->caps = match->data;
-
 	/* Map I/O registers. */
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(base))
-- 
2.34.1

