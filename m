Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6921843B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 11:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC97167F;
	Wed,  8 Jul 2020 11:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC97167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594201916;
	bh=MTnvbqcZlnu+azn/LRyoWX3UCd+R2A0BVyNb56D6uN8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YKmYagE/Zv++GVrO5hTJ6SGZSb2kOIVAjQs7eDB3RiUKzfnzOCz6UyVzC5NfMo9IA
	 Cai/no13tShDHhHyU/8TV1XHLQ1D3R7/X93HJKVz/PffHnowUSA12vux29HolcySmo
	 t6ZHuTnPu374sHC/OlAK+jzYLXA60KwRkyvJuuAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1C3F80115;
	Wed,  8 Jul 2020 11:50:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68C6EF8015A; Wed,  8 Jul 2020 11:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_32,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89D86F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 11:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89D86F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="VHw63Hf0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594201807; x=1625737807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MTnvbqcZlnu+azn/LRyoWX3UCd+R2A0BVyNb56D6uN8=;
 b=VHw63Hf07W+7PE37bnoeNNREYESfHC8aefrcGr6PHY0lYg0JAo7gcLLp
 FB8mMrz7wCQjQUV2g28hMe0veabVIMq+dtBa+MhU7vbscRnq5h3/+pqgB
 YlQyu0V3+76VCN9UaPL7p5TD6MQSAiT1MwTdMUHstmi4xWVYxcodMj+3T
 89F4wucTnDeV1CNkJ5hoij2n/PxMYW7vL1AgI4JmvvNhVYRgl77g4cXeD
 bKzAhdURoLfmsbXWsIClPTHQprSw02nvhrXqO0k11J8KqiYmVxdta3uY8
 d3CsaAeVpl/zCFABMnQ6vwVVs0nPl/CJOXLXXzayNRK4QUdcB5clVMOJt g==;
IronPort-SDR: IbbmxUMeYbQAK6G9awOEMmxkfIoAVbYhMy5Sm8bBn3SY+SDC2UqWP2vu5iklzdGA1iBWi8se9M
 nU2rq+BgsX7tG3f1BqPjq2AMFzs/sGweYWiZPnKldm8E2P5P2z26+lgw2hgeE7mmqmtXMH/dWe
 uuoiIkT3xcCjs5sEybI7bFlNPqdFa+pH4rN5k/+yyK96cAsz041/5C8ZGD4y6IRzjO026chz6z
 nCEL/5MG0hEApgmjnw5gq37iyq07Uhh71K+yY8Uh31Juc33oMybrAC54zzzCn+0CDSwtI2kvQp
 PY0=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="86638125"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 02:50:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 02:50:01 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 8 Jul 2020 02:49:51 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: atmel-classd: remove codec component
Date: Wed, 8 Jul 2020 12:49:21 +0300
Message-ID: <20200708094921.2595529-1-codrin.ciubotariu@microchip.com>
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
CLASS-D we are registering two componenets with the same name. Since
there is no actual codec, we will merge the codec component into the
CPU one and use a dummy codec instead, for the DAI link.
As a bonus, debugfs will no longer report an error when will try to
create entries for both componenets with the same name.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/atmel-classd.c | 133 ++++++++++++---------------------
 1 file changed, 48 insertions(+), 85 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index e98601eccfa3..d1ce67d30cd7 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -5,7 +5,6 @@
  *
  * Author: Songjun Wu <songjun.wu@atmel.com>
  */
-
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -120,39 +119,21 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
+	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	return clk_prepare_enable(dd->pclk);
-}
-
-static void atmel_classd_cpu_dai_shutdown(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *cpu_dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-
-	clk_disable_unprepare(dd->pclk);
+	err = clk_prepare_enable(dd->pclk);
+	if (err)
+		return err;
+	err = clk_prepare_enable(dd->gclk);
+	if (err) {
+		clk_disable_unprepare(dd->pclk);
+		return err;
+	}
+	return 0;
 }
 
-static const struct snd_soc_dai_ops atmel_classd_cpu_dai_ops = {
-	.startup	= atmel_classd_cpu_dai_startup,
-	.shutdown	= atmel_classd_cpu_dai_shutdown,
-};
-
-static struct snd_soc_dai_driver atmel_classd_cpu_dai = {
-	.playback = {
-		.channels_min	= 1,
-		.channels_max	= 2,
-		.rates		= ATMEL_CLASSD_RATES,
-		.formats	= SNDRV_PCM_FMTBIT_S16_LE,},
-	.ops = &atmel_classd_cpu_dai_ops,
-};
-
-static const struct snd_soc_component_driver atmel_classd_cpu_dai_component = {
-	.name = "atmel-classd",
-};
-
 /* platform */
 static int
 atmel_classd_platform_configure_dma(struct snd_pcm_substream *substream,
@@ -306,31 +287,10 @@ static int atmel_classd_component_resume(struct snd_soc_component *component)
 	return regcache_sync(dd->regmap);
 }
 
-static struct snd_soc_component_driver soc_component_dev_classd = {
-	.probe			= atmel_classd_component_probe,
-	.resume			= atmel_classd_component_resume,
-	.controls		= atmel_classd_snd_controls,
-	.num_controls		= ARRAY_SIZE(atmel_classd_snd_controls),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
-/* codec dai component */
-static int atmel_classd_codec_dai_startup(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *codec_dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-
-	return clk_prepare_enable(dd->gclk);
-}
-
-static int atmel_classd_codec_dai_digital_mute(struct snd_soc_dai *codec_dai,
-	int mute)
+static int atmel_classd_cpu_dai_digital_mute(struct snd_soc_dai *cpu_dai,
+					     int mute)
 {
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 	u32 mask, val;
 
 	mask = CLASSD_MR_LMUTE_MASK | CLASSD_MR_RMUTE_MASK;
@@ -373,13 +333,13 @@ static struct {
 };
 
 static int
-atmel_classd_codec_dai_hw_params(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *codec_dai)
+atmel_classd_cpu_dai_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 	int fs;
 	int i, best, best_val, cur_val, ret;
 	u32 mask, val;
@@ -417,8 +377,8 @@ atmel_classd_codec_dai_hw_params(struct snd_pcm_substream *substream,
 }
 
 static void
-atmel_classd_codec_dai_shutdown(struct snd_pcm_substream *substream,
-			    struct snd_soc_dai *codec_dai)
+atmel_classd_cpu_dai_shutdown(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
@@ -426,10 +386,10 @@ atmel_classd_codec_dai_shutdown(struct snd_pcm_substream *substream,
 	clk_disable_unprepare(dd->gclk);
 }
 
-static int atmel_classd_codec_dai_prepare(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *codec_dai)
+static int atmel_classd_cpu_dai_prepare(struct snd_pcm_substream *substream,
+					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 
 	snd_soc_component_update_bits(component, CLASSD_MR,
 				CLASSD_MR_LEN_MASK | CLASSD_MR_REN_MASK,
@@ -439,10 +399,10 @@ static int atmel_classd_codec_dai_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int atmel_classd_codec_dai_trigger(struct snd_pcm_substream *substream,
-					int cmd, struct snd_soc_dai *codec_dai)
+static int atmel_classd_cpu_dai_trigger(struct snd_pcm_substream *substream,
+					int cmd, struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_component *component = cpu_dai->component;
 	u32 mask, val;
 
 	mask = CLASSD_MR_LEN_MASK | CLASSD_MR_REN_MASK;
@@ -468,19 +428,17 @@ static int atmel_classd_codec_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops atmel_classd_codec_dai_ops = {
-	.digital_mute	= atmel_classd_codec_dai_digital_mute,
-	.startup	= atmel_classd_codec_dai_startup,
-	.shutdown	= atmel_classd_codec_dai_shutdown,
-	.hw_params	= atmel_classd_codec_dai_hw_params,
-	.prepare	= atmel_classd_codec_dai_prepare,
-	.trigger	= atmel_classd_codec_dai_trigger,
+static const struct snd_soc_dai_ops atmel_classd_cpu_dai_ops = {
+	.startup        = atmel_classd_cpu_dai_startup,
+	.shutdown       = atmel_classd_cpu_dai_shutdown,
+	.digital_mute	= atmel_classd_cpu_dai_digital_mute,
+	.hw_params	= atmel_classd_cpu_dai_hw_params,
+	.prepare	= atmel_classd_cpu_dai_prepare,
+	.trigger	= atmel_classd_cpu_dai_trigger,
 };
 
 #define ATMEL_CLASSD_CODEC_DAI_NAME  "atmel-classd-hifi"
-
-static struct snd_soc_dai_driver atmel_classd_codec_dai = {
-	.name = ATMEL_CLASSD_CODEC_DAI_NAME,
+static struct snd_soc_dai_driver atmel_classd_cpu_dai = {
 	.playback = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
@@ -488,7 +446,18 @@ static struct snd_soc_dai_driver atmel_classd_codec_dai = {
 		.rates		= ATMEL_CLASSD_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
 	},
-	.ops = &atmel_classd_codec_dai_ops,
+	.ops = &atmel_classd_cpu_dai_ops,
+};
+
+static const struct snd_soc_component_driver atmel_classd_cpu_dai_component = {
+	.name			= "atmel-classd",
+	.probe			= atmel_classd_component_probe,
+	.resume			= atmel_classd_component_resume,
+	.controls		= atmel_classd_snd_controls,
+	.num_controls		= ARRAY_SIZE(atmel_classd_snd_controls),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
 };
 
 /* ASoC sound card */
@@ -517,9 +486,10 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
-	dai_link->codecs->dai_name	= ATMEL_CLASSD_CODEC_DAI_NAME;
+	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
+
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= dev_name(dev);
+	dai_link->codecs->name		= "snd-soc-dummy";
 	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
@@ -620,13 +590,6 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(dev, &soc_component_dev_classd,
-					&atmel_classd_codec_dai, 1);
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

