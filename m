Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39462977E52
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8B8950;
	Fri, 13 Sep 2024 13:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8B8950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226121;
	bh=otB2gyp0DjafuKuP6eN9+hCMx0oFkm3tLV8V7z0L5wk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YmTdouN/r98yOfkcPz25d6sUeMsUMssw+z4wl/OlrWYZ1NQwU5lE59JkUnoN41cpi
	 ubyE9pGuxuTV7QAv4hbaw/EPOdZUixij/l1mSGjGMhOTYv1URhyvXWk/LTvB6ELj1a
	 KqdAsT5AyyVcsG3tfS5JgRH2xG8fjvjhxwXCDG8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 735ABF805CA; Fri, 13 Sep 2024 13:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C67F805CA;
	Fri, 13 Sep 2024 13:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C0FAF801F5; Wed, 11 Sep 2024 14:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1372CF80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1372CF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=d5ZEpH++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726057801; x=1757593801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=otB2gyp0DjafuKuP6eN9+hCMx0oFkm3tLV8V7z0L5wk=;
  b=d5ZEpH++ow0iDv7lwMnwMPL2J7BAaxVPymUkdSRZ/uOvBKmOJ1pg6zS3
   kBH0JBBFW27zE3iWokqM3vQQ9qbeC2qDfTWVsye39LTDy4TgTfxENWfaB
   KWAB3fQHxOntfFt7iTmdQJjM5M4e+mmvSlFjtYwRpMkn3lfkyad2ycbNi
   gLjHTJt4yyen+OzyrbFnEDRGSU6KxBlIH5/W5Oy1BMWnpPSv9YKt9A1BD
   HoDHzCNKRRitZQXrecoecnwgCfEBg9mRYTv7Xt7TwsfXtHrQXHNfwWyx5
   VfWLInq9o8V92EQbN19ugwfYm9rkFzdeScM8YvX3wAdyyW9pWXLEC9Pu2
   w==;
X-CSE-ConnectionGUID: 9vUpuscIQ26YBlU3BRadaQ==
X-CSE-MsgGUID: icmd1AtdT1CZxL1xIvnPOg==
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="32269431"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2024 05:29:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Sep 2024 05:29:17 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Sep 2024 05:29:14 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 1/3] ASoC: atmel: mchp-pdmc: Improve maxburst calculation for
 better performance
Date: Wed, 11 Sep 2024 15:29:07 +0300
Message-ID: <20240911122909.133399-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911122909.133399-1-andrei.simion@microchip.com>
References: <20240911122909.133399-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=977ab1c01=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3PESLRGWWRM6W7MXJPYQN5UMZENCR6WK
X-Message-ID-Hash: 3PESLRGWWRM6W7MXJPYQN5UMZENCR6WK
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PESLRGWWRM6W7MXJPYQN5UMZENCR6WK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Improve the DMA descriptor calculation by dividing the period size by the
product of sample size and DMA chunk size, rather than just DMA chunk size.
Ensure that all DMA descriptors start from a well-aligned address to
improve the reliability and efficiency of DMA operations and avoid
potential issues related to misaligned descriptors.

[andrei.simion@microchip.com: Adjust the commit title. Reword the commit
message. Add MACROS for each DMA size chunk supported by mchp-pdmc.
Add DMA_BURST_ALIGNED preprocesor function to check the alignment of the
DMA burst.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 39 ++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 260074018da9..7a5585839c1d 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -90,6 +90,15 @@
 #define MCHP_PDMC_DS_NO			2
 #define MCHP_PDMC_EDGE_NO		2
 
+/*
+ * ---- DMA chunk size allowed ----
+ */
+#define MCHP_PDMC_DMA_8_WORD_CHUNK			8
+#define MCHP_PDMC_DMA_4_WORD_CHUNK			4
+#define MCHP_PDMC_DMA_2_WORD_CHUNK			2
+#define MCHP_PDMC_DMA_1_WORD_CHUNK			1
+#define DMA_BURST_ALIGNED(_p, _s, _w)		!(_p % (_s * _w))
+
 struct mic_map {
 	int ds_pos;
 	int clk_edge;
@@ -511,15 +520,18 @@ static u32 mchp_pdmc_mr_set_osr(int audio_filter_en, unsigned int osr)
 	return 0;
 }
 
-static inline int mchp_pdmc_period_to_maxburst(int period_size)
+static inline int mchp_pdmc_period_to_maxburst(int period_size, int sample_size)
 {
-	if (!(period_size % 8))
-		return 8;
-	if (!(period_size % 4))
-		return 4;
-	if (!(period_size % 2))
-		return 2;
-	return 1;
+	int p_size = period_size;
+	int s_size = sample_size;
+
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_PDMC_DMA_8_WORD_CHUNK))
+		return MCHP_PDMC_DMA_8_WORD_CHUNK;
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_PDMC_DMA_4_WORD_CHUNK))
+		return MCHP_PDMC_DMA_4_WORD_CHUNK;
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_PDMC_DMA_2_WORD_CHUNK))
+		return MCHP_PDMC_DMA_2_WORD_CHUNK;
+	return MCHP_PDMC_DMA_1_WORD_CHUNK;
 }
 
 static struct snd_pcm_chmap_elem mchp_pdmc_std_chmaps[] = {
@@ -547,14 +559,18 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	unsigned int channels = params_channels(params);
 	unsigned int osr = 0, osr_start;
 	unsigned int fs = params_rate(params);
+	int sample_bytes = params_physical_width(params) / 8;
+	int period_bytes = params_period_size(params) *
+		params_channels(params) * sample_bytes;
+	int maxburst;
 	u32 mr_val = 0;
 	u32 cfgr_val = 0;
 	int i;
 	int ret;
 
-	dev_dbg(comp->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
+	dev_dbg(comp->dev, "%s() rate=%u format=%#x width=%u channels=%u period_bytes=%d\n",
 		__func__, params_rate(params), params_format(params),
-		params_width(params), params_channels(params));
+		params_width(params), params_channels(params), period_bytes);
 
 	if (channels > dd->mic_no) {
 		dev_err(comp->dev, "more channels %u than microphones %d\n",
@@ -608,7 +624,8 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 
 	mr_val |= FIELD_PREP(MCHP_PDMC_MR_SINCORDER_MASK, dd->sinc_order);
 
-	dd->addr.maxburst = mchp_pdmc_period_to_maxburst(snd_pcm_lib_period_bytes(substream));
+	maxburst = mchp_pdmc_period_to_maxburst(period_bytes, sample_bytes);
+	dd->addr.maxburst = maxburst;
 	mr_val |= FIELD_PREP(MCHP_PDMC_MR_CHUNK_MASK, dd->addr.maxburst);
 	dev_dbg(comp->dev, "maxburst set to %d\n", dd->addr.maxburst);
 
-- 
2.34.1

