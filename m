Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C74D7B32
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:04:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E0A17BC;
	Mon, 14 Mar 2022 08:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E0A17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241472;
	bh=yuDYsigMfxICt10t57pHMm+yZj5r1ZXXMzr8CGtNf3g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f58CxtdC92ou9QnfwgfVxgUpI7dIS9WhPYGtPWn0YxZqan3J2Oj4JLqkXfNfHKwOZ
	 FyovuqqM9JQ9YnSJJJBm7yoE2/k4SyV2kx4UZMmbS/GPoUAktWOGLgBI1BxZ3VGXWa
	 IQaEg0+C2bq4VAsBsI7nFfuYWtmYCt+wVEQJmE6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E443FF80571;
	Mon, 14 Mar 2022 07:59:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BCDCF80227; Fri, 11 Mar 2022 12:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2523FF8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 12:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2523FF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="ljDWY9qX"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646998041; x=1678534041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yuDYsigMfxICt10t57pHMm+yZj5r1ZXXMzr8CGtNf3g=;
 b=ljDWY9qXBU9jqrqPyzg5jwg9BvsVKhx/fKVJQnaOOftveEASp58/wSID
 TIm4eIGAnnYMjB9bLLIM+u8VHCwWLkM0kjCiC/JQb+rRz9onutFjfDfM0
 M5a2a5rtcVyfSSj7mHE0OBzLoEhY6WxX28fk+Dfb2DTW90VQxNOFZbE67
 FlCQ5uP7XYzO+Heos8UlfbT86cfL5cRUQrMebK3Kub+HRkRbqeIowAPBR
 Eoc82u3REJwZ/bhGFur3Ff0AYE3igfR97khzzYyrpLIZpA1aqAPSP5nz3
 zywKTdVhZldXTN6LA0f9U6wX6NNJa7lBJWMHsicCxkmzY30efGF6TEk6b A==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="156565303"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 04:27:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 04:27:15 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 04:27:13 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <codrin.ciubotariu@microchip.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>
Subject: [PATCH] ASoC: mchp-spdifrx: fix typo
Date: Fri, 11 Mar 2022 13:28:18 +0200
Message-ID: <20220311112818.1482372-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
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

Fix typo in log describing failure of devm_snd_dmaengine_pcm_register().

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index bcd4f3e4fb0f..5fc968483f2c 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -920,7 +920,7 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
+		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
 		return err;
 	}
 
-- 
2.32.0

