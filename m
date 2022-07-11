Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D157001E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 13:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE484823;
	Mon, 11 Jul 2022 13:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE484823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657538463;
	bh=DQaW0cxKqEYfNCVtbNUDwr6+l53vLSw0LukJycah+fY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yyoke7Yl1aeOyXv2Z4WFGGg5fHkqEt+6nbbzc0NuKWAK3a8l6R88wkLc1rzcnIeVy
	 syxLjb+nW9xeLoxx0qthACV/1uvr2S3CsJUdtdJmP4h2OMEPkH7RmZvwV6LagbsAIC
	 KYP//UbrXFi6tiSzcl82d5a86v2HZTEArLOorQvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D0CF80256;
	Mon, 11 Jul 2022 13:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72083F80163; Mon, 11 Jul 2022 13:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C4A0F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 13:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4A0F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="WFTAw9gw"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657538396; x=1689074396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQaW0cxKqEYfNCVtbNUDwr6+l53vLSw0LukJycah+fY=;
 b=WFTAw9gwrhQlkeDH6UEqT1kaJGVWvUMgy/PLdDLj1ZGPp4FrNWlH7zqR
 kfrvaex1HhOc+eKmDo5xXVU7v2tfWNxFMtCeF/rgtBtWHDhiUf+RaFjEh
 1XHwOJdR6Uesnd+S601XVwdVCFODhcOQqZL2kLpkZbtTBSTa9FXzdJ2Id
 pjXY7dGdEynmENpfDVBfM67cF+rUk5NJ/2I/eVpMAskh5zgMS8OdPBqI9
 pw9a2v+OVCrvZPTxwlvmoaJjDYWVEMSY2nv5VAoRzoNoLeO7xx/zv/PQj
 ESId+d7P5Rrfl9jkebtQPKtt2rFly80eZ4WCj7ZiNR18/+OXprlYPxWT4 Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="164172576"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2022 04:19:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 04:19:49 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 04:19:47 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: atmel: mchp-pdmc: remove space in front of
 mchp_pdmc_dt_init()
Date: Mon, 11 Jul 2022 14:22:12 +0300
Message-ID: <20220711112212.888895-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

Remove extra space in front of mchp_pdmc_dt_init().

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index aba7c5cde62c..44aefbd5b62c 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -985,7 +985,7 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dd->dev = &pdev->dev;
-	ret =  mchp_pdmc_dt_init(dd);
+	ret = mchp_pdmc_dt_init(dd);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

