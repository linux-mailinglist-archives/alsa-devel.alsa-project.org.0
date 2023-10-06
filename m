Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B115A7BC013
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 22:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C5683E;
	Fri,  6 Oct 2023 22:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C5683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696623092;
	bh=2U2BCkPOgUTh6aGnzeLvyBJcHFywZosekocMB8Uj2zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n2u7wPGF4Z75SeDetn/x4kqU4jNCjSyaguS2HZhMm0WGPT94MzXzNUT/lANy883gB
	 5EoLUROOYbfSh07ibQXC4yem78O9rHRRZn+EbMYIcDWZESMj9HrwZlDldUYOj70bTr
	 b6YliR0xSHa5wZTsgHsU8nlPrGgMWARBZ5jhZS9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 356DCF8057D; Fri,  6 Oct 2023 22:09:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9052BF8057A;
	Fri,  6 Oct 2023 22:09:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 043F2F8055B; Fri,  6 Oct 2023 22:09:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9BA6F8047D
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 22:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BA6F8047D
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6c620883559so1626957a34.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 13:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696622979; x=1697227779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZOch+WDqofN+3QITjE4l0oM3GunXyt8y2cN5QknfSQ=;
        b=sV5L2HxswQFD/kCnTL9kf1r/ejYtmVnGwqqv9bi1LKJPwYMMhvdKo/9FvM4gqSRMTN
         xinT8e+GzYZ/9FVPIZgXhvDfpOkBtYdLwli8Pe6qVG6AovjZVhK66m0pHee4UXbJXosZ
         9+n4UfsIYlzGYaFlbN71IEVQiqXmdfQIj6fxo9QmLQcNxPQfktz/WazYXbjLZ/vGoZR1
         1BJO24Z+5w7ByEDDJFSIYHSVHBGm1KbvQten+RdOx6RQlWbfgLa5XvxGGIVl5I8oq4DM
         5qZbpni96DSWM92HvnOCPK5XwUOU0zjzWWr9I19NBWe/7+wHs7/aBQIAmz62eKKD81kW
         AqUg==
X-Gm-Message-State: AOJu0YytJlMcLACXD8pOUgTijRwfFLyvlPJtIO/tfZqma3v9KeYirTB9
	0Ph/dTIsegijuIBR9HVjKLh0enBplQ==
X-Google-Smtp-Source: 
 AGHT+IGlhmgo7yquRzHz8M2m6pzvj+CYN/Z9jgOwsiNpGDYXWkYoHfsIGQEmIBaY1D94644RsG3PAA==
X-Received: by 2002:a9d:6210:0:b0:6b9:b0f6:eab8 with SMTP id
 g16-20020a9d6210000000b006b9b0f6eab8mr9353110otj.5.1696622979060;
        Fri, 06 Oct 2023 13:09:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a9d750c000000b006c61c098d38sm680849otk.21.2023.10.06.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:09:38 -0700 (PDT)
Received: (nullmailer pid 229127 invoked by uid 1000);
	Fri, 06 Oct 2023 20:09:30 -0000
From: Rob Herring <robh@kernel.org>
Date: Fri, 06 Oct 2023 15:09:11 -0500
Subject: [PATCH v3 2/5] ASoC: Drop unnecessary of_match_device() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-dt-asoc-header-cleanups-v3-2-13a4f0f7fee6@kernel.org>
References: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
In-Reply-To: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Rosin <peda@axentia.se>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ban Tao <fengzheng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.13-dev
Message-ID-Hash: GAIHHNOXYYVRSL32O75UTTD6DTE7KQ6U
X-Message-ID-Hash: GAIHHNOXYYVRSL32O75UTTD6DTE7KQ6U
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAIHHNOXYYVRSL32O75UTTD6DTE7KQ6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/codecs/ak5386.c  |  7 ++-----
 sound/soc/codecs/cs4271.c  | 22 ++++++----------------
 sound/soc/codecs/tas5086.c |  6 +-----
 3 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 0c5e00679c7d..21a44476f48d 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -168,7 +167,6 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->reset_gpio = -EINVAL;
 	dev_set_drvdata(dev, priv);
 
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
@@ -179,9 +177,8 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_match_device(of_match_ptr(ak5386_dt_ids), dev))
-		priv->reset_gpio = of_get_named_gpio(dev->of_node,
-						      "reset-gpio", 0);
+	priv->reset_gpio = of_get_named_gpio(dev->of_node,
+					     "reset-gpio", 0);
 
 	if (gpio_is_valid(priv->reset_gpio))
 		if (devm_gpio_request_one(dev, priv->reset_gpio,
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 188b8b43c524..9e6f8a048dd5 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -563,19 +562,12 @@ static int cs4271_component_probe(struct snd_soc_component *component)
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 	struct cs4271_platform_data *cs4271plat = component->dev->platform_data;
 	int ret;
-	bool amutec_eq_bmutec = false;
+	bool amutec_eq_bmutec;
 
-#ifdef CONFIG_OF
-	if (of_match_device(cs4271_dt_ids, component->dev)) {
-		if (of_get_property(component->dev->of_node,
-				     "cirrus,amutec-eq-bmutec", NULL))
-			amutec_eq_bmutec = true;
-
-		if (of_get_property(component->dev->of_node,
-				     "cirrus,enable-soft-reset", NULL))
-			cs4271->enable_soft_reset = true;
-	}
-#endif
+	amutec_eq_bmutec = of_property_read_bool(component->dev->of_node,
+						 "cirrus,amutec-eq-bmutec");
+	cs4271->enable_soft_reset = of_property_read_bool(component->dev->of_node,
+							  "cirrus,enable-soft-reset");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs4271->supplies),
 				    cs4271->supplies);
@@ -655,9 +647,7 @@ static int cs4271_common_probe(struct device *dev,
 	if (!cs4271)
 		return -ENOMEM;
 
-	if (of_match_device(cs4271_dt_ids, dev))
-		cs4271->gpio_nreset =
-			of_get_named_gpio(dev->of_node, "reset-gpio", 0);
+	cs4271->gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
 
 	if (cs4271plat)
 		cs4271->gpio_nreset = cs4271plat->gpio_nreset;
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 60e59e993ba6..f52c14b43f28 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -940,11 +940,7 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, priv);
 
-	if (of_match_device(of_match_ptr(tas5086_dt_ids), dev)) {
-		struct device_node *of_node = dev->of_node;
-		gpio_nreset = of_get_named_gpio(of_node, "reset-gpio", 0);
-	}
-
+	gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
 	if (gpio_is_valid(gpio_nreset))
 		if (devm_gpio_request(dev, gpio_nreset, "TAS5086 Reset"))
 			gpio_nreset = -EINVAL;

-- 
2.40.1

