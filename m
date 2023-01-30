Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A657680D0E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 13:09:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C641EB9;
	Mon, 30 Jan 2023 13:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C641EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675080556;
	bh=9NjD6iisgsn/UZGyyRXU8RZMqU7SjVu8tXkA5Lp5KWk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g6ErcOVepQk0jsglXdrbu9V02wMEcUX+PJktr6MLDYa4S9NqWja8FH++OLQq+PO8F
	 IJM1sLr03HFsipPe5sTlqge/JVjToZQQ09g7PgnjYOKDF3AW4PPmIrw6SFXg7UhStG
	 DI8fD4FaeLqTglg2v7JY1+PxLyPr1sTgHAfIq7Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C66CF80544;
	Mon, 30 Jan 2023 13:07:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3859F804B2; Mon, 30 Jan 2023 13:07:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCE08F804B2
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 13:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE08F804B2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=hQwmdPd/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675080459; x=1706616459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NjD6iisgsn/UZGyyRXU8RZMqU7SjVu8tXkA5Lp5KWk=;
 b=hQwmdPd/PMVNJv5t/vTD8r7FUpS4fVUDg1yHFt/9+m2vZ+o/iN+xS9CW
 xRAIAhw4nbZMxhfeMnjvW5P2vlTF4W2LJeTnhErgfy/PD2skxz2PSH7Ed
 VyTJil6gxJ44HuNEph2rQ83c96a+XY6x6DehTx6VwmuoXXFQcU2pecBOs
 Ft1P4z76guxHyVx0EqQpHC2ldTGgLPuxO9Mt4lf6+aRblSdEvfB8uZdSm
 5h1ib60iWzJHtHtmUaP3BhWAkiumCWdlTAPUG8eK2CUN8o2VETfS8X7Jx
 FKJ+KI2NMK9FvD5a9PnxYoRNgxnsnMmXK82NKU+jTUg1kYBvMBfpa4gZv g==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; d="scan'208";a="194432967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2023 05:07:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:07:36 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 05:07:33 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/8] ASoC: mchp-spdifrx: disable all interrupts in
 mchp_spdifrx_dai_remove()
Date: Mon, 30 Jan 2023 14:06:43 +0200
Message-ID: <20230130120647.638049-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CSC interrupts which might be used in controls are on bits 8 and 9 of
SPDIFRX_IDR register. Thus disable all the interrupts that are exported
by driver.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 31ffaaf46dec..b81fc77728df 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -921,7 +921,7 @@ static int mchp_spdifrx_dai_remove(struct snd_soc_dai *dai)
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
 
 	/* Disable interrupts */
-	regmap_write(dev->regmap, SPDIFRX_IDR, 0xFF);
+	regmap_write(dev->regmap, SPDIFRX_IDR, GENMASK(14, 0));
 
 	clk_disable_unprepare(dev->pclk);
 
-- 
2.34.1

