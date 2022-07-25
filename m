Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7970757FD2E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 12:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2BB886;
	Mon, 25 Jul 2022 12:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2BB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658743876;
	bh=YaWb7yZxkGG+zBnJL2IFm2f4uUx2GkI4cjt6VNqnQM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZTDxv9NrOzqm9gw0ULdVvuaLBL6RAE++mIV8FF6sGtJ6A2eAl4SY8lm3luR6kFP9
	 q6qbXEoEg8RJIYtZ9pfUS1+7s+XpylltViKoKNwb8zdTQCgeutrfR+v3kPAq7PET0Z
	 Rt4FMq+MtLbx14QxSO4utJFrEjiRjQ8Pps1m+yUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8526DF80551;
	Mon, 25 Jul 2022 12:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 762ECF80552; Mon, 25 Jul 2022 12:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D47F804FC
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 12:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D47F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="DytO7a9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658743760; x=1690279760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YaWb7yZxkGG+zBnJL2IFm2f4uUx2GkI4cjt6VNqnQM4=;
 b=DytO7a9LYduqlzliP2lHjkYzGicV2U1MCrljJU78ynpO0q7mocveeUIA
 OCkfHih8rEHl2lTXf6W6nt8lH+PEmSkUISpQ00sSMUdlj07+Key8KoX2I
 ea1YGbxtR9C6Yhzsp4/LgktDk7Au+iHXVbNEamtepC551bUEnAY5m+xtw
 zzKal/Og5RJu/QaajVkrrzPo0aOxr1xtyfuO/tHhNGBpFjuX41p70dGlI
 MFof08asllxRL0xrLcjg1dMT4nHf8vAQYqNlAW8L2FhSYBTlUdK0v5n7o
 XG3axXc2Y2I8zdEKqSN0LKBWTUT2qOr/b/H9EIn4OCW6YWfNqOQov5mlJ A==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="183602498"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2022 03:09:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Jul 2022 03:09:14 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 25 Jul 2022 03:09:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/5] ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
Date: Mon, 25 Jul 2022 13:11:28 +0300
Message-ID: <20220725101130.1780393-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
References: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
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
 sound/soc/atmel/mchp-spdiftx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 78d5bcf0819a..20e77b374f7e 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -196,7 +196,6 @@ struct mchp_spdiftx_dev {
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
-	const struct mchp_i2s_caps		*caps;
 	int					gclk_enabled:1;
 };
 
@@ -768,7 +767,6 @@ MODULE_DEVICE_TABLE(of, mchp_spdiftx_dt_ids);
 static int mchp_spdiftx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match;
 	struct mchp_spdiftx_dev *dev;
 	struct resource *mem;
 	struct regmap *regmap;
@@ -782,11 +780,6 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
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

