Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC7218D0F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D779F1612;
	Wed,  8 Jul 2020 18:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D779F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594226206;
	bh=IOkBko9bEusiZbj2ms5mQ1HozSObRLi+MxrhF2nGRBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K19h4dBx+zIiRdigSnSz/Z5q95KVaC1vhldi/lqPH2jUgUwjO5rBZiSU0pUAc3RWh
	 orrp9X8guEF0NI53rypQgKcsgDuj7s/vcSRDE0ie1wn0VpB3NJTOY2fGyscSUb8PPT
	 37vpcvP4uNJHl7lge5xy4YEDmA6eIdfuAT6WcIzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F56F8015C;
	Wed,  8 Jul 2020 18:35:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD97CF8015A; Wed,  8 Jul 2020 18:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_32,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40A3F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40A3F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="uFFK/x6k"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594226092; x=1625762092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IOkBko9bEusiZbj2ms5mQ1HozSObRLi+MxrhF2nGRBg=;
 b=uFFK/x6kXC2uoaXBvAsyccTx88oUICVmRodm2tZas8BXkiaRP9kvnZbb
 Fihs6CKIRu67kW1d6GmcoJHVYRa1g0ER5cZvmBj83FNSvZIkqWbdxItJm
 fofNoGSfmMDS3szgPqMiakRpcQgTVnv9ljKoLMGBMxGKBv+aES7AnBnxm
 TCYbsJs2Y/LuUnoz+q2sSHQX3eVOaFBMyi6pCh95M0q0jSwSm1ZyIpVs7
 bjTrXVJ0PBU3O8EC4Akiy4tju+9ffZdCPnsktPQdAUTc43ngQlnp1YFOX
 r6Ps0pbdHDPL+Vu+XwevLo7ZyJHJD09gt4smudsK8nl/4rFLmYNcpdYB4 A==;
IronPort-SDR: UEHAwMl2hrnt6ch3EOpxmElR1T/ekFyjvA6x7veD73swmCtheR1s/VBVi34DvqoMMYAn2OPkZS
 IJ1zrIvjDzlba2l4CcjNdpeHI06ftOGBr0HT8PXJCqf0GSrjU3hbrT55h7YvD6tNSTK7DLNR6y
 Af4kRbI6s1iMD2b8tqUiaj9jUSJtVDptfliRzzD1OaxdOpV+trq4Pn2VYljTexTf5pUxIlE1fV
 wlmcX82FhJld7IkpbC3GGivUevzpGfnfBKgG+vQzsiCdUCJatj77BIUQiZSNbL+eLGJjyHhJVL
 d8g=
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="86683084"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:34:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:34:04 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 8 Jul 2020 09:34:14 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: atmel-pdmic: remove codec component
Date: Wed, 8 Jul 2020 19:33:59 +0300
Message-ID: <20200708163359.2698696-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, tiwai@suse.com, ludovic.desroches@microchip.com,
 broonie@kernel.org, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

The CPU and the codec both are represented now as components, so for
PDMIC we are registering two componenets with the same name. Since
there is no actual codec, we will merge the codec component into the
CPU one and use a dummy codec instead, for the DAI link.
As a bonus, debugfs will no longer report an error when will try to
create entries for both componenets with the same name.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/atmel-pdmic.c | 110 +++++++++++++---------------------
 1 file changed, 41 insertions(+), 69 deletions(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 5245826cd99d..c2b639928c69 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -147,32 +147,26 @@ static int atmel_pdmic_cpu_dai_prepare(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = cpu_dai->component;
 	u32 val;
+	int ret;
 
 	/* Clean the PDMIC Converted Data Register */
-	return regmap_read(dd->regmap, PDMIC_CDR, &val);
-}
-
-static const struct snd_soc_dai_ops atmel_pdmic_cpu_dai_ops = {
-	.startup	= atmel_pdmic_cpu_dai_startup,
-	.shutdown	= atmel_pdmic_cpu_dai_shutdown,
-	.prepare	= atmel_pdmic_cpu_dai_prepare,
-};
+	ret = regmap_read(dd->regmap, PDMIC_CDR, &val);
+	if (ret < 0)
+		return 0;
 
-#define ATMEL_PDMIC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
+	ret = snd_soc_component_update_bits(component, PDMIC_CR,
+					    PDMIC_CR_ENPDM_MASK,
+					    PDMIC_CR_ENPDM_DIS <<
+					    PDMIC_CR_ENPDM_SHIFT);
+	if (ret < 0)
+		return ret;
 
-static struct snd_soc_dai_driver atmel_pdmic_cpu_dai = {
-	.capture = {
-		.channels_min	= 1,
-		.channels_max	= 1,
-		.rates		= SNDRV_PCM_RATE_KNOT,
-		.formats	= ATMEL_PDMIC_FORMATS,},
-	.ops = &atmel_pdmic_cpu_dai_ops,
-};
+	return 0;
+}
 
-static const struct snd_soc_component_driver atmel_pdmic_cpu_dai_component = {
-	.name = "atmel-pdmic",
-};
+#define ATMEL_PDMIC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 /* platform */
 #define ATMEL_PDMIC_MAX_BUF_SIZE  (64 * 1024)
@@ -355,27 +349,16 @@ static int atmel_pdmic_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_component_dev_pdmic = {
-	.probe			= atmel_pdmic_component_probe,
-	.controls		= atmel_pdmic_snd_controls,
-	.num_controls		= ARRAY_SIZE(atmel_pdmic_snd_controls),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
-/* codec dai component */
 #define PDMIC_MR_PRESCAL_MAX_VAL 127
 
 static int
-atmel_pdmic_codec_dai_hw_params(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *codec_dai)
+atmel_pdmic_cpu_dai_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 	unsigned int rate_min = substream->runtime->hw.rate_min;
 	unsigned int rate_max = substream->runtime->hw.rate_max;
 	int fs = params_rate(params);
@@ -445,21 +428,10 @@ atmel_pdmic_codec_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int atmel_pdmic_codec_dai_prepare(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *codec_dai)
-{
-	struct snd_soc_component *component = codec_dai->component;
-
-	snd_soc_component_update_bits(component, PDMIC_CR, PDMIC_CR_ENPDM_MASK,
-			    PDMIC_CR_ENPDM_DIS << PDMIC_CR_ENPDM_SHIFT);
-
-	return 0;
-}
-
-static int atmel_pdmic_codec_dai_trigger(struct snd_pcm_substream *substream,
-					int cmd, struct snd_soc_dai *codec_dai)
+static int atmel_pdmic_cpu_dai_trigger(struct snd_pcm_substream *substream,
+				       int cmd, struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 	u32 val;
 
 	switch (cmd) {
@@ -482,16 +454,16 @@ static int atmel_pdmic_codec_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops atmel_pdmic_codec_dai_ops = {
-	.hw_params	= atmel_pdmic_codec_dai_hw_params,
-	.prepare	= atmel_pdmic_codec_dai_prepare,
-	.trigger	= atmel_pdmic_codec_dai_trigger,
+static const struct snd_soc_dai_ops atmel_pdmic_cpu_dai_ops = {
+	.startup	= atmel_pdmic_cpu_dai_startup,
+	.shutdown	= atmel_pdmic_cpu_dai_shutdown,
+	.prepare	= atmel_pdmic_cpu_dai_prepare,
+	.hw_params	= atmel_pdmic_cpu_dai_hw_params,
+	.trigger	= atmel_pdmic_cpu_dai_trigger,
 };
 
-#define ATMEL_PDMIC_CODEC_DAI_NAME  "atmel-pdmic-hifi"
 
-static struct snd_soc_dai_driver atmel_pdmic_codec_dai = {
-	.name = ATMEL_PDMIC_CODEC_DAI_NAME,
+static struct snd_soc_dai_driver atmel_pdmic_cpu_dai = {
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
@@ -499,7 +471,17 @@ static struct snd_soc_dai_driver atmel_pdmic_codec_dai = {
 		.rates		= SNDRV_PCM_RATE_KNOT,
 		.formats	= ATMEL_PDMIC_FORMATS,
 	},
-	.ops = &atmel_pdmic_codec_dai_ops,
+	.ops = &atmel_pdmic_cpu_dai_ops,
+};
+
+static const struct snd_soc_component_driver atmel_pdmic_cpu_dai_component = {
+	.name			= "atmel-pdmic",
+	.probe			= atmel_pdmic_component_probe,
+	.controls		= atmel_pdmic_snd_controls,
+	.num_controls		= ARRAY_SIZE(atmel_pdmic_snd_controls),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
 };
 
 /* ASoC sound card */
@@ -528,9 +510,9 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
-	dai_link->codecs->dai_name	= ATMEL_PDMIC_CODEC_DAI_NAME;
+	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= dev_name(dev);
+	dai_link->codecs->name		= "snd-soc-dummy";
 	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
@@ -684,16 +666,6 @@ static int atmel_pdmic_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* register codec and codec dai */
-	atmel_pdmic_codec_dai.capture.rate_min = rate_min;
-	atmel_pdmic_codec_dai.capture.rate_max = rate_max;
-	ret = devm_snd_soc_register_component(dev, &soc_component_dev_pdmic,
-				     &atmel_pdmic_codec_dai, 1);
-	if (ret) {
-		dev_err(dev, "could not register component: %d\n", ret);
-		return ret;
-	}
-
 	/* register sound card */
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card) {
-- 
2.25.1

