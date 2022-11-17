Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463062DB03
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 13:35:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B9D716BC;
	Thu, 17 Nov 2022 13:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B9D716BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668688520;
	bh=dC+Z+2dJnvsXSsxV5IVXyOSHXTLenZC0GCwpi+PbA7c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEVNWrL1PB0YToi5lhzdNsqhurO46YY1/XC8jBI6BwrBypojoeJTfDXS6XRI6vX0r
	 BqtwoSWc8cbup0XgenIHjdJ5wg2vGekFLXrSJWDR7jaRboyTTWPuP3Q89/yCGIQNUF
	 PPXQ3mAkojZBy9cEvrYxn64pwq2Mk/geL+zp6SFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B802F80564;
	Thu, 17 Nov 2022 13:33:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9280CF8055B; Thu, 17 Nov 2022 13:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C1E4F8025A
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 13:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C1E4F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="iLHgKWVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1668688406; x=1700224406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dC+Z+2dJnvsXSsxV5IVXyOSHXTLenZC0GCwpi+PbA7c=;
 b=iLHgKWVqtu4AsfTgx3DZkWHjW3SFYtrgIqfcSdgj8eLv6WV9JRv4Qxab
 o4zAP1F2AasDKBYSsIpYjmkJCC/Um99n9vzGhwl9cPQG/z8bgxJohFKq5
 ZwuOmLwmtoW8nx1ltoyMSk80hva5ANJBeKAoQzYqfkQkw/18cTJcw8dIG
 5Yl+vyWhMFX6B8otrxXY3q5Iwykgl5zlUhC73LuoOen3KD9qQkmYq7pZ7
 xnx6o4mFSsN3Ij/iEJWziM/OHQwW43eG5QPYlOtXpJMnvQcpu+PH5kpfA
 ejUWj+k/ZKHn/m1OOcQALEOWeld9L/yMilskghmPslaDpkOvhY/G6gkYz w==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="189407195"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2022 05:33:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 05:33:16 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 05:33:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/3] ASoC: mchp-spdiftx: add support for system suspend/resume
Date: Thu, 17 Nov 2022 14:37:50 +0200
Message-ID: <20221117123750.291911-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221117123750.291911-1-claudiu.beznea@microchip.com>
References: <20221117123750.291911-1-claudiu.beznea@microchip.com>
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

Add support for system suspend/resume by moving the enable/disable
of interrupts in mchp_spdiftx_trigger() on SNDRV_PCM_TRIGGER_SUSPEND/
SNDRV_PCM_TRIGGER_RESUME commands.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index ec454e64d85c..dc96a6fbf514 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -198,6 +198,7 @@ struct mchp_spdiftx_dev {
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
+	unsigned int				suspend_irq;
 };
 
 static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)
@@ -318,16 +319,25 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 	running = !!(mr & SPDIFTX_MR_TXEN_ENABLE);
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_START:
+		regmap_write(dev->regmap, SPDIFTX_IER, dev->suspend_irq |
+			     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
+		dev->suspend_irq = 0;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (!running) {
 			mr &= ~SPDIFTX_MR_TXEN_MASK;
 			mr |= SPDIFTX_MR_TXEN_ENABLE;
 		}
 		break;
-	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+		regmap_read(dev->regmap, SPDIFTX_IMR, &dev->suspend_irq);
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_STOP:
+		regmap_write(dev->regmap, SPDIFTX_IDR, dev->suspend_irq |
+			     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (running) {
 			mr &= ~SPDIFTX_MR_TXEN_MASK;
@@ -507,10 +517,6 @@ static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dev->dev, "%s(): GCLK set to %d\n", __func__,
 		params_rate(params) * SPDIFTX_GCLK_RATIO);
 
-	/* Enable interrupts */
-	regmap_write(dev->regmap, SPDIFTX_IER,
-		     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
-
 	regmap_write(dev->regmap, SPDIFTX_MR, mr);
 
 	return 0;
@@ -521,9 +527,6 @@ static int mchp_spdiftx_hw_free(struct snd_pcm_substream *substream,
 {
 	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
 
-	regmap_write(dev->regmap, SPDIFTX_IDR,
-		     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
-
 	return regmap_write(dev->regmap, SPDIFTX_CR,
 			    SPDIFTX_CR_SWRST | SPDIFTX_CR_FCLR);
 }
@@ -785,6 +788,7 @@ static int mchp_spdiftx_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops mchp_spdiftx_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(mchp_spdiftx_runtime_suspend, mchp_spdiftx_runtime_resume,
 		       NULL)
 };
-- 
2.34.1

