Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BF57FD2D
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 12:11:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA98A85D;
	Mon, 25 Jul 2022 12:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA98A85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658743859;
	bh=pfFlYQJ46XkjUNiMAdcxTdm9mH/GEjmoBFYjs3nO3f0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YpVzwdmVF+mgcQAhInMWdSHoFvPXqKd0UmFLdq82fOGJA7hZQjID/N2IWW8JoiGT4
	 i/X0iDykfNyAmrbNUX2JURqObtMh3zLh8qpxGDeFf1/mgS0m6VjdPFqaAyVXxsmBQK
	 uY0FeGKLkbNyKsn5pFD/idANQEXKNRURdrhqTR/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5F9F80549;
	Mon, 25 Jul 2022 12:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E11F80128; Mon, 25 Jul 2022 12:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9866F80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 12:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9866F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Pa2UeQ6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658743755; x=1690279755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pfFlYQJ46XkjUNiMAdcxTdm9mH/GEjmoBFYjs3nO3f0=;
 b=Pa2UeQ6FmqtkIOI6pgP2ouG9J2jQdppoCNESs4zmgEaIpQURJQlYp5e7
 PJ30wqqphRpmw6MPDIwJsb2rOwn7D1pYNgqQB77A/SXUjOpvcvgkjLtA6
 EKJkbnywdJGAmhYsiCPHVjUJVsU1RMiixadtTpOm7auHy8kxmv++0+b9v
 nYVPDqmccGSRo9de4/1gU1LgVPA0T36mu49Z0SZcsapaS88pRtK1Yvw9v
 +AJfycDI5//l4jWMaFR7bKpnLuZPdH6kckqZzsluQaTAWlCfV9RJ/Mq0l
 0NCuKujj65WtdOtzXyTxXMR+zIIq0c+mGi3bQ+wMmAoYH4gSJG6KCusiP g==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="173666576"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2022 03:09:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 03:09:09 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 25 Jul 2022 03:09:06 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/5] ASoC: mchp-spdifrx: disable end of block interrupt on
 failures
Date: Mon, 25 Jul 2022 13:11:26 +0300
Message-ID: <20220725101130.1780393-2-claudiu.beznea@microchip.com>
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

Disable end of block interrupt in case of wait for completion timeout
or errors to undo previously enable operation (done in
mchp_spdifrx_isr_blockend_en()). Otherwise we can end up with an
unbalanced reference counter for this interrupt.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 0d37b78b94a0..b6a753893d90 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -288,15 +288,17 @@ static void mchp_spdifrx_isr_blockend_en(struct mchp_spdifrx_dev *dev)
 	spin_unlock_irqrestore(&dev->blockend_lock, flags);
 }
 
-/* called from atomic context only */
+/* called from atomic/non-atomic context */
 static void mchp_spdifrx_isr_blockend_dis(struct mchp_spdifrx_dev *dev)
 {
-	spin_lock(&dev->blockend_lock);
+	unsigned int flags;
+
+	spin_lock_irqsave(&dev->blockend_lock);
 	dev->blockend_refcount--;
 	/* don't enable BLOCKEND interrupt if it's already enabled */
 	if (dev->blockend_refcount == 0)
 		regmap_write(dev->regmap, SPDIFRX_IDR, SPDIFRX_IR_BLOCKEND);
-	spin_unlock(&dev->blockend_lock);
+	spin_unlock_irqrestore(&dev->blockend_lock);
 }
 
 static irqreturn_t mchp_spdif_interrupt(int irq, void *dev_id)
@@ -575,6 +577,7 @@ static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
 	if (ret <= 0) {
 		dev_dbg(dev->dev, "user data for channel %d timeout\n",
 			channel);
+		mchp_spdifrx_isr_blockend_dis(dev);
 		return ret;
 	}
 
-- 
2.34.1

