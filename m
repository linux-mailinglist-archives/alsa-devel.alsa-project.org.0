Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02939E0A3
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455A216AE;
	Mon,  7 Jun 2021 17:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455A216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623080130;
	bh=WWzXWPU0zKer5qMKjRLxYM/qJz298YM8xpDKJ8sAR8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7iLpM49QMqMhHRsby/4bAoYw3CFDC3rNJedNpdUDLdFm+q/peCADTUiqmxhMBhiQ
	 Y5NMRtD8vzakErSiSTx2eWH+8T60+pjs6tjUaC+K08a5qYRi/1Z8lFyjIhTiOexU4d
	 rSneLZ9B3K2cWZO4waOJRb1myMBLaHkzlYB49TRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD4AF80506;
	Mon,  7 Jun 2021 17:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F9CF804BD; Mon,  7 Jun 2021 17:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A6D5F804C2
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6D5F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R1MyfppJ"
Received: by mail-wm1-x335.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so314041wmq.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZEdZ+N0eteL07jx0I8YEw4d+MAwVooRKuXAZfHn0G4c=;
 b=R1MyfppJLNBxiFMM62PqUf4TN1rKlQCoG+sUtlZ0d8W+HSwZTYPAsyt8GxZbaK4vFc
 JayS9d24XrxjZ2km+sbQDa3l6knyLSO2ubfSYKI3DU/UZMO6mPd3hTnpVCQR4qPuyD9Q
 JESdpkJwuZz1AKhdCdJhwqg2MY+qgb6CwW7gDhQXBW30QMJK3rD9kbC0qYgV2mprM19+
 z+AZt5TqyCzeoxFZMNqQ130gQpA77+W7KUEBKSb5rnZuTWDEPyhs0OLAeRITdVY5SEbc
 HBQ+St/7YYuIbeXOqbh8EUyUX7jXLqJOueiYxuwume37s5bm+HgIl9rvRFht807nYzmr
 h7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZEdZ+N0eteL07jx0I8YEw4d+MAwVooRKuXAZfHn0G4c=;
 b=nDDY2vFlnWkm1l5MrwPRFi130UTUEJoINVWkeZDZ4/7hmza7qlTFnTR/dm+HALVCTG
 0+gTtSQmIC3I1HoF4brYiIzBGx7QKvjzhh+0qxDIoMOdbDWYXVd6XjI114+kb+CDq24d
 6QmLwmT9tRkt3HdjZnHIYpyOGuyc+A+Wx/CUvfTuUH6zEv7B/877eA96/Uj4J2AbUiRf
 tw7FPNsTzcLtHIS7xmoJoPoykHNiS5h2DbLCLkWzBUB0AYEZV6Z5Rod1P3AqBrKGFhzJ
 NwLCXgj7dSBU9HG51RJyRujH1eULorzT3ZSBkngn2uLo9xsQ8J9ENIEnI2SnfIopFN6d
 5rWQ==
X-Gm-Message-State: AOAM5335SuaJQ0ELnlGj4fqV179YuewiEkb8ty6Tc9BwPR6rnMm2TaFV
 1DJOUBY5wchLlBsetcfG9UYtXA==
X-Google-Smtp-Source: ABdhPJyywyXAznW2BbG8ZiKmqeAf2BAyKWptLGynKdw+WVKkZ/OhKSPThpJ+WUvOeuc6t4Ydm+S7PQ==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr11384133wmj.180.1623079757269; 
 Mon, 07 Jun 2021 08:29:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 13/13] ASoC: qcom: sm8250: Add audioreach support
Date: Mon,  7 Jun 2021 16:28:36 +0100
Message-Id: <20210607152836.17154-14-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

This patch adds support for parsing dt for AudioReach based soundcards
which only have backend DAI links in DT.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 144 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index fe8fd7367e21..421f9d1d2bed 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -20,6 +20,141 @@ struct sm8250_snd_data {
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
+static int qcom_audioreach_snd_parse_of(struct snd_soc_card *card)
+{
+	struct device_node *np;
+	struct device_node *codec = NULL;
+	struct device_node *platform = NULL;
+	struct device_node *cpu = NULL;
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link *link;
+	struct of_phandle_args args;
+	struct snd_soc_dai_link_component *dlc;
+	int ret, num_links;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(dev, "Error parsing card name: %d\n", ret);
+		return ret;
+	}
+
+	/* DAPM routes */
+	if (of_property_read_bool(dev->of_node, "audio-routing")) {
+		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+		if (ret)
+			return ret;
+	}
+
+	/* Populate links */
+	num_links = of_get_child_count(dev->of_node);
+
+	/* Allocate the DAI link array */
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	if (!card->dai_link)
+		return -ENOMEM;
+
+	card->num_links = num_links;
+	link = card->dai_link;
+
+	for_each_child_of_node(dev->of_node, np) {
+
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc) {
+			ret = -ENOMEM;
+			goto err_put_np;
+		}
+
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
+
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
+
+
+		ret = of_property_read_string(np, "link-name", &link->name);
+		if (ret) {
+			dev_err(card->dev, "error getting codec dai_link name\n");
+			goto err_put_np;
+		}
+
+		cpu = of_get_child_by_name(np, "cpu");
+		platform = of_get_child_by_name(np, "platform");
+		codec = of_get_child_by_name(np, "codec");
+		if (!cpu) {
+			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		if (!platform) {
+			dev_err(dev, "%s: Can't find platform DT node\n", link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		if (!codec) {
+			dev_err(dev, "%s: Can't find codec DT node\n", link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = of_parse_phandle_with_args(cpu, "sound-dai", "#sound-dai-cells", 0, &args);
+		if (ret) {
+			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
+			goto err;
+		}
+
+		link->cpus->of_node = args.np;
+		link->id = args.args[0];
+
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(card->dev, "%s: error getting cpu dai name: %d\n",
+					link->name, ret);
+			goto err;
+		}
+
+		link->platforms->of_node = of_parse_phandle(platform, "sound-dai", 0);
+		if (!link->platforms->of_node) {
+			dev_err(card->dev, "%s: platform dai not found\n", link->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+		if (ret < 0) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(card->dev, "%s: codec dai not found: %d\n",
+					link->name, ret);
+			goto err;
+		}
+
+		/* DPCM backend */
+		link->no_pcm = 1;
+		link->ignore_pmdown_time = 1;
+		link->ignore_suspend = 1;
+
+		link->stream_name = link->name;
+		snd_soc_dai_link_set_capabilities(link);
+		link++;
+
+		of_node_put(cpu);
+		of_node_put(codec);
+		of_node_put(platform);
+
+	}
+
+	return 0;
+err:
+	of_node_put(cpu);
+	of_node_put(codec);
+	of_node_put(platform);
+err_put_np:
+	of_node_put(np);
+	return ret;
+}
+
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -199,7 +334,12 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
-	ret = qcom_snd_parse_of(card);
+	if (of_device_is_compatible(dev->of_node, "qcom,sm8250-audioreach-sndcard") ||
+		of_device_is_compatible(dev->of_node, "qcom,qrb5165-rb5-audioreach-sndcard"))
+		ret = qcom_audioreach_snd_parse_of(card);
+	else
+		ret = qcom_snd_parse_of(card);
+
 	if (ret)
 		return ret;
 
@@ -211,6 +351,8 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{.compatible = "qcom,sm8250-audioreach-sndcard" },
+	{.compatible = "qcom,qrb5165-rb5-audioreach-sndcard" },
 	{}
 };
 
-- 
2.21.0

