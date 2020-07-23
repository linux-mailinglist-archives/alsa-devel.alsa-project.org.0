Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962822B5F8
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07EC11672;
	Thu, 23 Jul 2020 20:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07EC11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529842;
	bh=V1fZKq3cMhf7z02hPHanh3UaH0Sg2fgQ+UvpkngDURI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OhJuIgLLihDHS32FKjYyQ5c+i9NgTnVOyqQUI/CbGVtVSwoZJ0i0mXaKcAz4FIn6A
	 6PZDxHsLvm5ILLaWlilpwcvu0duK0Dot8pUB7loriJIJ1DA4OFSvz9Q2RsXnitKbce
	 KVdvCx62EW1X62RLf9DaHpx6z8gzFVHbpQeZiDzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75106F802DF;
	Thu, 23 Jul 2020 20:39:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33DFFF8024A; Thu, 23 Jul 2020 20:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED6A3F80268
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6A3F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="TGWYhzQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529562;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cPoSiHtgbmarw/+BaFcos5QPxK1SZPDZtzA9G8JDsUk=;
 b=TGWYhzQlLSaOAXk62bmSboEc/vP4xION/PiWTkXs0dkXZfXCvJf54XJ3kcThNDftyQ
 GmsKjov7Q+iZxvyHEj2NaxPN8XifDwjUjk0g+gQZIEcFAl28bu01upcB1jY5sI6qKA+D
 CDwWqh0Z8XP+d//ztNR6VCPB24EtE+Y6XqO/MAYU9Mj/O1aNhSmzsMBGOjmO2OAx2pdm
 8SacLVtQ2UDYOXTh0joQgNHfTMWjBub8ZEXm7VNCW4Z/lPoiIBesNOSDer547bhJfrKz
 H4DiO1vCxL/2YDGZZDqmNeKJOZKe8SIz5mIkDEPd5pTOkXiBMFrPG8ugiZ499P9O1MBA
 rnQg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdI5IG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:18 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/7] ASoC: qcom: Use devm for resource management
Date: Thu, 23 Jul 2020 20:38:58 +0200
Message-Id: <20200723183904.321040-2-stephan@gerhold.net>
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

Simplify the machine drivers for newer SoCs a bit by using the
devm_* function calls that automatically release the resources
when the driver is removed or when probing fails.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/apq8096.c | 28 +++-------------------------
 sound/soc/qcom/common.c  |  3 +--
 sound/soc/qcom/sdm845.c  | 40 ++++++----------------------------------
 3 files changed, 10 insertions(+), 61 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 287ad2aa27f3..134f5a81df7f 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -109,7 +109,7 @@ static int apq8096_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	card = kzalloc(sizeof(*card), GFP_KERNEL);
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
@@ -117,31 +117,10 @@ static int apq8096_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
 	if (ret)
-		goto err;
+		return ret;
 
 	apq8096_add_be_ops(card);
-	ret = snd_soc_register_card(card);
-	if (ret)
-		goto err_card_register;
-
-	return 0;
-
-err_card_register:
-	kfree(card->dai_link);
-err:
-	kfree(card);
-	return ret;
-}
-
-static int apq8096_platform_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
-
-	snd_soc_unregister_card(card);
-	kfree(card->dai_link);
-	kfree(card);
-
-	return 0;
+	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id msm_snd_apq8096_dt_match[] = {
@@ -153,7 +132,6 @@ MODULE_DEVICE_TABLE(of, msm_snd_apq8096_dt_match);
 
 static struct platform_driver msm_snd_apq8096_driver = {
 	.probe  = apq8096_platform_probe,
-	.remove = apq8096_platform_remove,
 	.driver = {
 		.name = "msm-snd-apq8096",
 		.of_match_table = msm_snd_apq8096_dt_match,
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 8ada4ecba847..d677e83828af 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -36,7 +36,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	num_links = of_get_child_count(dev->of_node);
 
 	/* Allocate the DAI link array */
-	card->dai_link = kcalloc(num_links, sizeof(*link), GFP_KERNEL);
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
 	if (!card->dai_link)
 		return -ENOMEM;
 
@@ -143,7 +143,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
-	kfree(card->dai_link);
 	return ret;
 }
 EXPORT_SYMBOL(qcom_snd_parse_of);
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 68e9388ff46f..580acfaf38e7 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -543,16 +543,14 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	card = kzalloc(sizeof(*card), GFP_KERNEL);
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
 	/* Allocate the private data */
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto data_alloc_fail;
-	}
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
 
 	card->dapm_widgets = sdm845_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sdm845_snd_widgets);
@@ -560,38 +558,13 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
 	if (ret)
-		goto parse_dt_fail;
+		return ret;
 
 	data->card = card;
 	snd_soc_card_set_drvdata(card, data);
 
 	sdm845_add_ops(card);
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err(dev, "Sound card registration failed\n");
-		goto register_card_fail;
-	}
-	return ret;
-
-register_card_fail:
-	kfree(card->dai_link);
-parse_dt_fail:
-	kfree(data);
-data_alloc_fail:
-	kfree(card);
-	return ret;
-}
-
-static int sdm845_snd_platform_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
-	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
-
-	snd_soc_unregister_card(card);
-	kfree(card->dai_link);
-	kfree(data);
-	kfree(card);
-	return 0;
+	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id sdm845_snd_device_id[]  = {
@@ -604,7 +577,6 @@ MODULE_DEVICE_TABLE(of, sdm845_snd_device_id);
 
 static struct platform_driver sdm845_snd_driver = {
 	.probe = sdm845_snd_platform_probe,
-	.remove = sdm845_snd_platform_remove,
 	.driver = {
 		.name = "msm-snd-sdm845",
 		.of_match_table = sdm845_snd_device_id,
-- 
2.27.0

