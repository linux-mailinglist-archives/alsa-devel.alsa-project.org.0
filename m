Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8A6A5771
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 12:04:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E19E850;
	Tue, 28 Feb 2023 12:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E19E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677582258;
	bh=WWmp1hv/uFDxkm4wlpa8Jan2QxDmWX4YCWLpQI+K9BI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HXiTcsQoqUUpVcEAfDLwgXGr4bpdztPU2Cy8f+uZLqx9XwOhuo58hekkdly3EsbS8
	 LK2QT2dwLZE7brBrRqae1mi+IpeperkKd8wTY7gmr+w72WgNznr8ehWOzmGhXQ1FsP
	 4+BIW65LtvTGZ9qP3doCgaco6C0rW8aNscMBqtSo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E70FCF8053B;
	Tue, 28 Feb 2023 12:02:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 089C9F8053D; Tue, 28 Feb 2023 12:02:23 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D7D1F8049C
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 12:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7D1F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=YsnX0prq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582132; x=1709118132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWmp1hv/uFDxkm4wlpa8Jan2QxDmWX4YCWLpQI+K9BI=;
  b=YsnX0prq16heC7BAJgzviIEtszQN/x7WksX7rKGpVWifDz7tY/QyyAjW
   6BkJasK/joh/FPZdQZCy+4QBQw+AnWig1hEGpUu5nnmrTC5ZC1bKRVykE
   VlHPSeG/YKDCdJQ2igY5tVIij1Zq7pEPkgiOlzhxxxnPzka18I4nBgXXT
   bfvF3UGfNx4eAWY0wL3gbTk0b9OH2pg45MF+rZcGULJXiHWXu7j9MTqCG
   QZc3bU3S/rloZk3qqo1AXWFnKLNWGYo0x6/KFphqsUhyT+KLOSbWenDQ6
   qWJhcExMUM7ACKtlLRtGrZs+TJKFubVrUaUF/a536WeB/Tg5cW+nUszzk
   w==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800";
   d="scan'208";a="202762758"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2023 04:02:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:02:06 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 04:02:03 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 3/3] ASoC: mchp-pdmc: fix poc noise at capture startup
Date: Tue, 28 Feb 2023 13:01:45 +0200
Message-ID: <20230228110145.3770525-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
References: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: D24IHNKI5VARQLMLBMOYR7JNPBMHUX4Z
X-Message-ID-Hash: D24IHNKI5VARQLMLBMOYR7JNPBMHUX4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D24IHNKI5VARQLMLBMOYR7JNPBMHUX4Z/>
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
 sound/soc/atmel/mchp-pdmc.c | 53 +++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index cf4084dcbd5e..1aed3baa9369 100644
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
@@ -425,6 +426,7 @@ static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.open = &mchp_pdmc_open,
 	.close = &mchp_pdmc_close,
 	.legacy_dai_naming = 1,
+	.start_dma_last = 1,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
@@ -632,6 +634,29 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
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
@@ -644,15 +669,17 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
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
@@ -796,6 +823,7 @@ static bool mchp_pdmc_readable_reg(struct device *dev, unsigned int reg)
 	case MCHP_PDMC_CFGR:
 	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_RHR:
 	case MCHP_PDMC_VER:
 		return true;
 	default:
@@ -817,6 +845,17 @@ static bool mchp_pdmc_writeable_reg(struct device *dev, unsigned int reg)
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
@@ -836,6 +875,7 @@ static const struct regmap_config mchp_pdmc_regmap_config = {
 	.readable_reg	= mchp_pdmc_readable_reg,
 	.writeable_reg	= mchp_pdmc_writeable_reg,
 	.precious_reg	= mchp_pdmc_precious_reg,
+	.volatile_reg	= mchp_pdmc_volatile_reg,
 	.cache_type	= REGCACHE_FLAT,
 };
 
@@ -918,6 +958,9 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 		dd->channel_mic_map[i].clk_edge = edge;
 	}
 
+	dd->startup_delay_us = 150000;
+	of_property_read_u32(np, "microchip,startup-delay-us", &dd->startup_delay_us);
+
 	return 0;
 }
 
-- 
2.34.1

