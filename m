Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC664A501
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 17:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F249921B0;
	Mon, 12 Dec 2022 17:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F249921B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670863133;
	bh=skGTs2WvA6zYDm87dHeVl8kymrVloAz2yV13MCgFbvY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pibzk2BMSI+AVuPsCg6aOsbmTT2l6QciVoO6BZ7RtrI3M6i7sr9q4PfgYRdtSVuLg
	 bk2NthoUn814eJyMtt/GpOIXO0bu8ckkUqECJ67GtapzWf5ld5IeYYxY80Q2JTwuDh
	 v+O1Tppdd0VZBjTdtoZ2PWGk2YsJh8H9q0liFCNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D94F800F8;
	Mon, 12 Dec 2022 17:36:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E38F8F8053D; Mon, 12 Dec 2022 17:36:55 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 94EDBF8051A
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 17:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EDBF8051A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=KR9mrwgv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670863014; x=1702399014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=skGTs2WvA6zYDm87dHeVl8kymrVloAz2yV13MCgFbvY=;
 b=KR9mrwgvLU3Skc40si8gEK02lAt+g4wfC2m2WlKd4t32H8ycTUn38mIy
 HPYDlteo2EdblWW39oJyVt6V00UzT9Y36kgQXPH39ZV2/H5URqwVacxzI
 ak14cT0vgUWhO88LyUbetrQXOhlcZK4N2JzJi2qxFAMNs4URwxIhUE8Or
 k0I8/jUff9IWmcdusU5WhjJQpJu4inZWlZYxtd3JKdBBwllo7Nb0EPuSF
 h6WX4uvrSEaPZcQ/x15jsO8EIUXcdAWrdlfQmwx7fdFb0CoY414o2T415
 U3zoeySjAvsoJ1VFTp9t6Ma9T0GXFmbHtjwtik3RBuOaPtCY40fUjApLl g==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="191263893"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 09:36:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 09:36:43 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 09:36:40 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 3/4] ASoC: mchp-pdmc: add support for suspend to RAM
Date: Mon, 12 Dec 2022 18:41:52 +0200
Message-ID: <20221212164153.78677-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221212164153.78677-1-claudiu.beznea@microchip.com>
References: <20221212164153.78677-1-claudiu.beznea@microchip.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for suspend to RAM by re-aranging the lines in switch..case
from mchp_pdmc_trigger() and saving/restoring the enabled interrupts. These
are necessary as AT91 devices has a special power saving mode (called
backup and self-refresh) where most of the SoC parts are powered off
and thus we need to reconfigure the PDMC on resume.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index f184404e74e5..cf4084dcbd5e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -113,6 +113,7 @@ struct mchp_pdmc {
 	struct clk *pclk;
 	struct clk *gclk;
 	u32 pdmcen;
+	u32 suspend_irq;
 	int mic_no;
 	int sinc_order;
 	bool audio_filter_en;
@@ -641,22 +642,27 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 #endif
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_START:
 		/* Enable overrun and underrun error interrupts */
-		regmap_write(dd->regmap, MCHP_PDMC_IER,
+		regmap_write(dd->regmap, MCHP_PDMC_IER, dd->suspend_irq |
 			     MCHP_PDMC_IR_RXOVR | MCHP_PDMC_IR_RXUDR);
+		dd->suspend_irq = 0;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_soc_component_update_bits(cpu, MCHP_PDMC_MR,
 					      MCHP_PDMC_MR_PDMCEN_MASK,
 					      dd->pdmcen);
 		break;
-	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		regmap_read(dd->regmap, MCHP_PDMC_IMR, &dd->suspend_irq);
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_STOP:
 		/* Disable overrun and underrun error interrupts */
-		regmap_write(dd->regmap, MCHP_PDMC_IDR,
+		regmap_write(dd->regmap, MCHP_PDMC_IDR, dd->suspend_irq |
 			     MCHP_PDMC_IR_RXOVR | MCHP_PDMC_IR_RXUDR);
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_soc_component_update_bits(cpu, MCHP_PDMC_MR,
 					      MCHP_PDMC_MR_PDMCEN_MASK, 0);
 		break;
@@ -1107,6 +1113,7 @@ static const struct of_device_id mchp_pdmc_of_match[] = {
 MODULE_DEVICE_TABLE(of, mchp_pdmc_of_match);
 
 static const struct dev_pm_ops mchp_pdmc_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(mchp_pdmc_runtime_suspend, mchp_pdmc_runtime_resume,
 		       NULL)
 };
-- 
2.34.1

