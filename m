Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3F696927
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 17:19:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D551D6;
	Tue, 14 Feb 2023 17:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D551D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676391560;
	bh=uALPcs3Vx7BPrxo0UgAKw4uy0dcv8BW3De7tw3ZgiME=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PtJN5N0OFmKM/oXku0nI57fKds0xmAPxWrtXhedpEstm9fHb54Us1im7hRsyeKnRs
	 4vjoTVisTdQlCOgS2AmREdH3AoawzbYg+KFCZcjPvCmIjFx2BcaDf2afzSjbzX3ql2
	 pVJgt6Gmwpb/1zWtD/63nOfsRBJnfcPN4Q8YLlI8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CACAF80548;
	Tue, 14 Feb 2023 17:17:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B109EF80549; Tue, 14 Feb 2023 17:17:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C10AF804B0
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 17:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C10AF804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=x8jJHrX+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676391443; x=1707927443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uALPcs3Vx7BPrxo0UgAKw4uy0dcv8BW3De7tw3ZgiME=;
  b=x8jJHrX+V8o1jIborvrTBaJ/K9lySotwz7cOb2vpl9rIqpcfiBkilSS7
   zm+B6aaQdN2Bz3ZanysV0egB2Hq3gE0KiMg5BOqX9w5ffQIEepn4rFcDH
   Yw3LvGXNEwCkQO0MokpEDAuxPNuzk2rd2EEgWy/+6E9DEKiF8j8JCygGy
   XRZzcMYe3mrl9TF4euRaEW+6X83mpiXxhxKok23sQ200sWPZnTSvHoMXi
   /5vs3En1PFPTFtQ6fElh7/VOuuRJpheRi/TQVvxT+W2DMo7wwcfunZ9IN
   PPa6QU0LQVykdQ42XO+xfhC7ZKq9ncB0eko4gWzKU7bUpiFvYh50IL/Xa
   w==;
X-IronPort-AV: E=Sophos;i="5.97,297,1669100400";
   d="scan'208";a="196891478"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2023 09:17:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 09:17:07 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 09:17:03 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <lars@metafoo.de>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 3/3] ASoC: mchp-pdmc: fix poc noise at capture startup
Date: Tue, 14 Feb 2023 18:14:35 +0200
Message-ID: <20230214161435.1088246-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 3KZVPP6PFAWCKGLH4CYLLU4ETKALN2UD
X-Message-ID-Hash: 3KZVPP6PFAWCKGLH4CYLLU4ETKALN2UD
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KZVPP6PFAWCKGLH4CYLLU4ETKALN2UD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Microchip PDMC IP doesn't filter microphone noises on startup. By default,
it captures data received from digital microphones after
the MCHP_PDMC_MR.EN bits are set. Thus when enable is set on PDMC side the
digital microphones might not be ready yet and PDMC captures data from then
in this time. This data captured is poc noise. To avoid this the software
workaround is to the following:
1/ enable PDMC channel
2/ wait 150ms (on SAMA7G5-EK setup)
3/ execute 16 dummy reads from RHR
4/ clear interrupts
5/ enable interrupts
6/ enable DMA channel

Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 55 +++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index cf4084dcbd5e..c5f597ebfa47 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -114,6 +114,7 @@ struct mchp_pdmc {
 	struct clk *gclk;
 	u32 pdmcen;
 	u32 suspend_irq;
+	u32 startup_delay_us;
 	int mic_no;
 	int sinc_order;
 	bool audio_filter_en;
@@ -632,6 +633,29 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static void mchp_pdmc_noise_filter_workaround(struct mchp_pdmc *dd)
+{
+	u32 tmp, steps = 16;
+
+	/*
+	 * PDMC doesn't wait for microphones' startup time thus the acquisition
+	 * may start before the microphones are ready leading to poc noises at
+	 * the beginning of capture. To avoid this, we need to wait 50ms (in
+	 * normal startup procedure) or 150 ms (worst case after resume from sleep
+	 * states) after microphones are enabled and then clear the FIFOs (by
+	 * reading the RHR 16 times) and possible interrupts before continuing.
+	 * Also, for this to work the DMA needs to be started after interrupts
+	 * are enabled.
+	 */
+	usleep_range(dd->startup_delay_us, dd->startup_delay_us + 5);
+
+	while (steps--)
+		regmap_read(dd->regmap, MCHP_PDMC_RHR, &tmp);
+
+	/* Clear interrupts. */
+	regmap_read(dd->regmap, MCHP_PDMC_ISR, &tmp);
+}
+
 static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 			     int cmd, struct snd_soc_dai *dai)
 {
@@ -644,15 +668,17 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
-		/* Enable overrun and underrun error interrupts */
-		regmap_write(dd->regmap, MCHP_PDMC_IER, dd->suspend_irq |
-			     MCHP_PDMC_IR_RXOVR | MCHP_PDMC_IR_RXUDR);
-		dd->suspend_irq = 0;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_soc_component_update_bits(cpu, MCHP_PDMC_MR,
 					      MCHP_PDMC_MR_PDMCEN_MASK,
 					      dd->pdmcen);
+
+		mchp_pdmc_noise_filter_workaround(dd);
+
+		/* Enable interrupts. */
+		regmap_write(dd->regmap, MCHP_PDMC_IER, dd->suspend_irq |
+			     MCHP_PDMC_IR_RXOVR | MCHP_PDMC_IR_RXUDR);
+		dd->suspend_irq = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		regmap_read(dd->regmap, MCHP_PDMC_IMR, &dd->suspend_irq);
@@ -796,6 +822,7 @@ static bool mchp_pdmc_readable_reg(struct device *dev, unsigned int reg)
 	case MCHP_PDMC_CFGR:
 	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_RHR:
 	case MCHP_PDMC_VER:
 		return true;
 	default:
@@ -817,6 +844,17 @@ static bool mchp_pdmc_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_RHR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool mchp_pdmc_precious_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -836,6 +874,7 @@ static const struct regmap_config mchp_pdmc_regmap_config = {
 	.readable_reg	= mchp_pdmc_readable_reg,
 	.writeable_reg	= mchp_pdmc_writeable_reg,
 	.precious_reg	= mchp_pdmc_precious_reg,
+	.volatile_reg	= mchp_pdmc_volatile_reg,
 	.cache_type	= REGCACHE_FLAT,
 };
 
@@ -918,6 +957,11 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 		dd->channel_mic_map[i].clk_edge = edge;
 	}
 
+	ret = of_property_read_u32(np, "microchip,startup-delay-us",
+				   &dd->startup_delay_us);
+	if (ret)
+		dd->startup_delay_us = 150000;
+
 	return 0;
 }
 
@@ -941,6 +985,7 @@ static int mchp_pdmc_process(struct snd_pcm_substream *substream,
 static struct snd_dmaengine_pcm_config mchp_pdmc_config = {
 	.process = mchp_pdmc_process,
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.start_dma_last = 1,
 };
 
 static int mchp_pdmc_runtime_suspend(struct device *dev)
-- 
2.34.1

