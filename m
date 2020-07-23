Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B522B5F0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E9B1680;
	Thu, 23 Jul 2020 20:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E9B1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529741;
	bh=li8IcUZQm6NSRCsQYh2B+IwGEgxa1iPcDqmpzDabtY0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=siWvc1Ywafii4W/Laomjua60Wa5ZH3Xu1jwzeM508vzvQaclfhvbTlB87wqCsH+td
	 98R+i/0IP0E27k3agbaF8eu+D1yqj27gmL1zltxVwP4BkMj1LaZzv01yV7yyyqwMpE
	 pq/MxdeM/z5lmwoAf8tIlX50gS+igfTbxikkUxt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00BAF80274;
	Thu, 23 Jul 2020 20:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2545EF802C3; Thu, 23 Jul 2020 20:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F5D3F80212
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F5D3F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="X57ROpiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529564;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=q7axBlWcSEC71uosD2c10Od4552+d1LliqRAmn35I6k=;
 b=X57ROpiXIBZLav76K/qEu297DmaPdq6xiMOIHWNP52QySVVf57h6sasZ2ppO2+GsPJ
 KsjFYe1ZF45fc6uhDNHGzpC3ukWVn36vNc2Tbr+YVVIq/9xG5NHsXq+eoP71W9zxW1aA
 wjM4wKYSk03IKqGxzC1UNW2PTkm0l0utw2DgEzmBpdg3fUO1P6zI1cQBD5/vnGqb7+pc
 AR8PBQH8cJKM+ixiwr6qDAj2VvpOnLRfl4imS1TTyJ+HrlY5vzVJU8qH0twJUpMZ2H7e
 Y2UXWowkeXUmU4HDAbrQe4VhwmTXFfF3+Q84It3vkfNVJACZ8mPfuaKuSFMd5VHkhSMJ
 1AJw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdL5IM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:21 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/7] ASoC: qcom: apq8016_sbc: Use qcom_snd_parse_of()
Date: Thu, 23 Jul 2020 20:39:03 +0200
Message-Id: <20200723183904.321040-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723183904.321040-1-stephan@gerhold.net>
References: <20200723183904.321040-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

Now that we have updated qcom_snd_parse_of() to handle the device
tree bindings used for apq8016_sbc, update the apq8016_sbc driver
to use the common function and remove the duplicated code.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/Kconfig       |   1 +
 sound/soc/qcom/apq8016_sbc.c | 120 ++++-------------------------------
 2 files changed, 15 insertions(+), 106 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cfca0f730c61..5d6b2466a2f2 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -37,6 +37,7 @@ config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
 	depends on SND_SOC_QCOM
 	select SND_SOC_LPASS_APQ8016
+	select SND_SOC_QCOM_COMMON
 	help
 	  Support for Qualcomm Technologies LPASS audio block in
 	  APQ8016 SOC-based systems.
diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 2ef090f4af9e..083413abc2f6 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -16,13 +16,14 @@
 #include <sound/soc.h>
 #include <uapi/linux/input-event-codes.h>
 #include <dt-bindings/sound/apq8016-lpass.h>
+#include "common.h"
 
 struct apq8016_sbc_data {
+	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
-	struct snd_soc_dai_link dai_link[];	/* dynamically allocated */
 };
 
 #define MIC_CTRL_TER_WS_SLAVE_SEL	BIT(21)
@@ -110,107 +111,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
+static void apq8016_sbc_add_ops(struct snd_soc_card *card)
 {
-	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
-	struct device_node *np, *codec, *cpu, *node  = dev->of_node;
-	struct apq8016_sbc_data *data;
-	struct snd_soc_dai_link_component *dlc;
-	int ret, num_links;
-
-	ret = snd_soc_of_parse_card_name(card, "qcom,model");
-	if (ret) {
-		dev_err(dev, "Error parsing card name: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	/* DAPM routes */
-	if (of_property_read_bool(node, "qcom,audio-routing")) {
-		ret = snd_soc_of_parse_audio_routing(card,
-					"qcom,audio-routing");
-		if (ret)
-			return ERR_PTR(ret);
-	}
-
-
-	/* Populate links */
-	num_links = of_get_child_count(node);
-
-	/* Allocate the private data and the DAI link array */
-	data = devm_kzalloc(dev,
-			    struct_size(data, dai_link, num_links),
-			    GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	card->dai_link	= &data->dai_link[0];
-	card->num_links	= num_links;
-
-	link = data->dai_link;
-
-	for_each_child_of_node(node, np) {
-		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
-		if (!dlc)
-			return ERR_PTR(-ENOMEM);
-
-		link->cpus	= &dlc[0];
-		link->platforms	= &dlc[1];
-
-		link->num_cpus		= 1;
-		link->num_platforms	= 1;
-
-		cpu = of_get_child_by_name(np, "cpu");
-		codec = of_get_child_by_name(np, "codec");
-
-		if (!cpu || !codec) {
-			dev_err(dev, "Can't find cpu/codec DT node\n");
-			ret = -EINVAL;
-			goto error;
-		}
+	int i;
 
-		link->cpus->of_node = of_parse_phandle(cpu, "sound-dai", 0);
-		if (!link->cpus->of_node) {
-			dev_err(card->dev, "error getting cpu phandle\n");
-			ret = -EINVAL;
-			goto error;
-		}
-
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
-		if (ret) {
-			dev_err(card->dev, "error getting cpu dai name\n");
-			goto error;
-		}
-
-		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
-
-		if (ret < 0) {
-			dev_err(card->dev, "error getting codec dai name\n");
-			goto error;
-		}
-
-		link->platforms->of_node = link->cpus->of_node;
-		ret = of_property_read_string(np, "link-name", &link->name);
-		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto error;
-		}
-
-		link->stream_name = link->name;
+	for_each_card_prelinks(card, i, link)
 		link->init = apq8016_sbc_dai_init;
-		link++;
-
-		of_node_put(cpu);
-		of_node_put(codec);
-	}
-
-	return data;
-
- error:
-	of_node_put(np);
-	of_node_put(cpu);
-	of_node_put(codec);
-	return ERR_PTR(ret);
 }
 
 static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
@@ -228,20 +135,20 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
 	struct resource *res;
+	int ret;
 
-	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
-	if (!card)
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	card = &data->card;
 	card->dev = dev;
 	card->dapm_widgets = apq8016_sbc_dapm_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(apq8016_sbc_dapm_widgets);
-	data = apq8016_sbc_parse_of(card);
-	if (IS_ERR(data)) {
-		dev_err(&pdev->dev, "Error resolving dai links: %ld\n",
-			PTR_ERR(data));
-		return PTR_ERR(data);
-	}
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mic-iomux");
 	data->mic_iomux = devm_ioremap_resource(dev, res);
@@ -255,6 +162,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, data);
 
+	apq8016_sbc_add_ops(card);
 	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
-- 
2.27.0

