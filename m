Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8396F5FF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F165105F;
	Fri,  6 Sep 2024 15:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F165105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725630933;
	bh=8qoKR4OXZ7Wgy4H3AAmtUwklGSIL4J9Jd0IV6fK4sOc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KM33Fa8c83zi3CQ9PL/GSZ+XjCsiei77nfgR0iBjV0uydMyUI8IDmln1iFpLATTWQ
	 6nIr8f1Jtw7lqcX1B7aIR46bEC5DS4CM2qxiC/mc75Qdn0cZw4QsHI2yTe3okjlUu5
	 zm+06UxwU0c34NXpa+f5caju4RNmsP2LZ1DTk4dI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87FB8F805E4; Fri,  6 Sep 2024 15:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88CA5F805D4;
	Fri,  6 Sep 2024 15:54:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A9EF8016C; Thu,  5 Sep 2024 11:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1836DF80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 11:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1836DF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ndjBTXeq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725530228; x=1757066228;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8qoKR4OXZ7Wgy4H3AAmtUwklGSIL4J9Jd0IV6fK4sOc=;
  b=ndjBTXeqBiNoR8Zy9y1eX5iKVQbRpEWtyGkojQUCT7pwzYqBr4jZ1P/x
   p8Lhhe4+ludKI9tbDURcctoOraSoRJ0N05m42u82Bt8pQsMoH68QhvvVW
   NS3BKZGMqtdrImuy4f18qeyXkJw9uTTIOBwHcMc1655NkyknE6r7GisZL
   xLCQ99LkXzyCRIAthsNYNWJSdJ1DlWEMVI/Ok92kRFXvu1F9UPt8VGwYJ
   iyvN2/VvTGdDBpq8UKR1F8S5pjWv9Ojwtima/cXY4vGglp59DxhDIyEsg
   7NVcWA/rse8Zn7bNoDN1bTOXnYt9FWmW7XuZfguagGgXIyMWKGvzNjVu4
   g==;
X-CSE-ConnectionGUID: 8AyyTrCqQSGMj104kSMPQw==
X-CSE-MsgGUID: jpWvbnd4T1yvQ3SdJQSknQ==
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600";
   d="scan'208";a="34458244"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Sep 2024 02:57:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Sep 2024 02:56:40 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Sep 2024 02:56:37 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH] ASoC: atmel: mchp-i2s-mcc: Improve maxburst calculation for
 better performance
Date: Thu, 5 Sep 2024 12:56:33 +0300
Message-ID: <20240905095633.113784-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=971bf69f1=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AG37MTXPZ325SZFUVDIGETOY6NR72MP4
X-Message-ID-Hash: AG37MTXPZ325SZFUVDIGETOY6NR72MP4
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:54:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG37MTXPZ325SZFUVDIGETOY6NR72MP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

The period size represents the size of the DMA descriptor. To ensure all
DMA descriptors start from a well-aligned address, the period size must
be divided by (sample size * maxburst), not just by maxburst.
This adjustment allows for computing a higher maxburst value, thereby
increasing the performance of the DMA transfer.
Previously, snd_pcm_lib_period_bytes() returned 0 because the runtime HW
parameters are computed after the hw_params() callbacks are used.
To address this, we now use params_*() functions to compute the period
size accurately. This change optimizes the DMA transfer performance by
ensuring proper alignment and efficient use of maxburst values.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
[andrei.simion@microchip.com: Reword commit message and commit title.
Add macros with values for maximum DMA chunk size allowed.
Add DMA_BURST_ALIGNED preprocessor function to check the alignment of the
DMA burst]
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 38 +++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 193dd7acceb0..35a56b266b8d 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -221,6 +221,15 @@
 #define MCHP_I2SMCC_MAX_CHANNELS		8
 #define MCHP_I2MCC_TDM_SLOT_WIDTH		32
 
+/*
+ * ---- DMA chunk size allowed ----
+ */
+#define MCHP_I2SMCC_DMA_8_WORD_CHUNK			8
+#define MCHP_I2SMCC_DMA_4_WORD_CHUNK			4
+#define MCHP_I2SMCC_DMA_2_WORD_CHUNK			2
+#define MCHP_I2SMCC_DMA_1_WORD_CHUNK			1
+#define DMA_BURST_ALIGNED(_p, _s, _w)		!(_p % (_s * _w))
+
 static const struct regmap_config mchp_i2s_mcc_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -504,12 +513,30 @@ static int mchp_i2s_mcc_is_running(struct mchp_i2s_mcc_dev *dev)
 	return !!(sr & (MCHP_I2SMCC_SR_TXEN | MCHP_I2SMCC_SR_RXEN));
 }
 
+static inline int mchp_i2s_mcc_period_to_maxburst(int period_size, int sample_size)
+{
+	int p_size = period_size;
+	int s_size = sample_size;
+
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_I2SMCC_DMA_8_WORD_CHUNK))
+		return MCHP_I2SMCC_DMA_8_WORD_CHUNK;
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_I2SMCC_DMA_4_WORD_CHUNK))
+		return MCHP_I2SMCC_DMA_4_WORD_CHUNK;
+	if (DMA_BURST_ALIGNED(p_size, s_size, MCHP_I2SMCC_DMA_2_WORD_CHUNK))
+		return MCHP_I2SMCC_DMA_2_WORD_CHUNK;
+	return MCHP_I2SMCC_DMA_1_WORD_CHUNK;
+}
+
 static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
 	unsigned long rate = 0;
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int sample_bytes = params_physical_width(params) / 8;
+	int period_bytes = params_period_size(params) *
+		params_channels(params) * sample_bytes;
+	int maxburst;
 	u32 mra = 0;
 	u32 mrb = 0;
 	unsigned int channels = params_channels(params);
@@ -519,9 +546,9 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 
-	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
+	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u period_bytes=%d\n",
 		__func__, params_rate(params), params_format(params),
-		params_width(params), params_channels(params));
+		params_width(params), params_channels(params), period_bytes);
 
 	switch (dev->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -630,11 +657,12 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	 * We must have the same burst size configured
 	 * in the DMA transfer and in out IP
 	 */
-	mrb |= MCHP_I2SMCC_MRB_DMACHUNK(channels);
+	maxburst = mchp_i2s_mcc_period_to_maxburst(period_bytes, sample_bytes);
+	mrb |= MCHP_I2SMCC_MRB_DMACHUNK(maxburst);
 	if (is_playback)
-		dev->playback.maxburst = 1 << (fls(channels) - 1);
+		dev->playback.maxburst = maxburst;
 	else
-		dev->capture.maxburst = 1 << (fls(channels) - 1);
+		dev->capture.maxburst = maxburst;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S8:

base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
-- 
2.34.1

