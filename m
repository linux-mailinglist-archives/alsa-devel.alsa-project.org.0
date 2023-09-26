Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E37AEDF7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6533AE9;
	Tue, 26 Sep 2023 15:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6533AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695735037;
	bh=w/CsU9lyYJKe32wxsOQKZCu0ymiLowLT2hK32JfSKqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lyb67TZNc1l33qGj11m5YGUgtdlG6wm3EguUAttNQw+0RKVPXUsEXym9vLQGUOdI5
	 6I+HmHqdMjpWuxBulJ5SrWVrqd6N4q5b/R8x0Be8iz39Z5vXNhOJgC1sLZA/gxaHkV
	 n9ZP0ihsP9VQk4hdmyXhIfrVs/Jg3YlfWcmD5tCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F32C9F805A8; Tue, 26 Sep 2023 15:28:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF81CF8056F;
	Tue, 26 Sep 2023 15:28:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4994CF8001D; Tue, 26 Sep 2023 15:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 072C0F8016A
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 072C0F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HQP5vz88
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-503012f4e71so12013965e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734737; x=1696339537;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PP4dsIT0hsQMnKCfQfmUy8AzAauOm+H9b2ueCh3mGC0=;
        b=HQP5vz88+8jQe5nyQkCesOXcZeiFcxng15ZU897GaUYGQzUk4Ci+yGjBX4yjCL1EEl
         HrbAJWdnbxie6qRrQxFONJctUAFoSJNw5MjBsrN4wMQjLAC7ov7ZRlxxZb3SdxRfhnCN
         d6PrB8nYbVF0b0W4gkcBA4bT1D/qdNrltrdv35JGz1R50rKwivaLnvktC/yD7tBMVfx2
         BhL6vYMjPtmHCt/bmnseZ1kK0hZlgxD4ptTpEc4/Z9Tr5iMqKXoAGb9tOgTVSwbx/5bO
         1EgF7hOmhiFQvz/BvBS0p+suKZ9lPgo6fFpsEjHvA4ISnwnr4j6Iqdc1edVl1cKToSnx
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734737; x=1696339537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP4dsIT0hsQMnKCfQfmUy8AzAauOm+H9b2ueCh3mGC0=;
        b=Jpdeg63gPaLjWMP7hEl6G7PIIBMzMdvWO4oITmOfJ9gkVp05lnKpAydKtY1sWOD/rL
         JeVw3VSrDTuERhg6vnUE8MKLpj1IOFz/gDy19IdIMvKdEB3Iv+m9kYnHF5rDdKgbpwLk
         fdz8gcH/g+cz1gVzqwx0m8RVNVcT3KsHaT7R+KizlfVSOdhRyp2PPABxSgkX34xBjTrR
         nSep7Th0zlZY7ps13j14CYV9rMGJ6qcE47nEtnEAZ74644fF+MmoozMsb3Jusw+Ioage
         Y4ioBGWN2pkLJqyEawrsEQ1JBVzYQoqZgM7+KdlTrLc3vjd5kri1b+M8iOSXoNKYSoYr
         gM4Q==
X-Gm-Message-State: AOJu0YytupvHLzG4CLl+qrbd/yI1t0L5xBY/yWsKdi3q7a1GAp0i/AC1
	Bi+vafnkv06iES+1UPTdrTckm6JLeOboDY3PQNQ=
X-Google-Smtp-Source: 
 AGHT+IHjNjM07GGKUJBQohAZCxjfCTTm3uisP+onS6McTyzKEkNGgzi9C5o8RDP6x4JphD2R52UnRg==
X-Received: by 2002:a05:6512:304b:b0:503:2567:c42f with SMTP id
 b11-20020a056512304b00b005032567c42fmr1048278lfb.0.1695734737749;
        Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 15:25:31 +0200
Subject: [PATCH 3/5] ASoC: ti: Convert TWL4030 to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-3-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: AY7WFHTRVESF3OSX2BCX5I6URNAOY542
X-Message-ID-Hash: AY7WFHTRVESF3OSX2BCX5I6URNAOY542
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AY7WFHTRVESF3OSX2BCX5I6URNAOY542/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TWL4030 is actually only ever populated from the device tree,
so we can just pass the right device and headphone jack GPIO name
to snd_soc_jack_add_gpios() and it will pick the right GPIO right
from the device tree.

The platform data patch is unused (no in-tree users of the pdata
method) but these can use GPIO descriptor tables rather than global
GPIO numbers if they need this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/platform_data/omap-twl4030.h |  3 ---
 sound/soc/ti/omap-twl4030.c                | 20 ++++++++------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/linux/platform_data/omap-twl4030.h b/include/linux/platform_data/omap-twl4030.h
index 0dd851ea1c72..7fcb55fe21c9 100644
--- a/include/linux/platform_data/omap-twl4030.h
+++ b/include/linux/platform_data/omap-twl4030.h
@@ -37,9 +37,6 @@ struct omap_tw4030_pdata {
 	bool	has_digimic0;
 	bool	has_digimic1;
 	u8	has_linein;
-
-	/* Jack detect GPIO or  <= 0 if it is not implemented */
-	int jack_detect;
 };
 
 #endif /* _OMAP_TWL4030_H_ */
diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 950eec44503b..c7055bb424e6 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -20,8 +20,6 @@
 #include <linux/platform_data/omap-twl4030.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -31,7 +29,6 @@
 #include "omap-mcbsp.h"
 
 struct omap_twl4030 {
-	int jack_detect;	/* board can detect jack events */
 	struct snd_soc_jack hs_jack;
 };
 
@@ -130,7 +127,7 @@ static struct snd_soc_jack_pin hs_jack_pins[] = {
 /* Headset jack detection gpios */
 static struct snd_soc_jack_gpio hs_jack_gpios[] = {
 	{
-		.name = "hsdet-gpio",
+		.name = "ti,jack-det",
 		.report = SND_JACK_HEADSET,
 		.debounce_time = 200,
 	},
@@ -151,9 +148,13 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 	struct omap_twl4030 *priv = snd_soc_card_get_drvdata(card);
 	int ret = 0;
 
-	/* Headset jack detection only if it is supported */
-	if (priv->jack_detect > 0) {
-		hs_jack_gpios[0].gpio = priv->jack_detect;
+	/*
+	 * This is a bit of a hack, but the GPIO is optional so we
+	 * only want to add the jack detection if the GPIO is there.
+	 */
+	if (of_property_present(card->dev->of_node, "ti,jack-det-gpio")) {
+		hs_jack_gpios[0].gpiod_dev = card->dev;
+		hs_jack_gpios[0].idx = 0;
 
 		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 						 SND_JACK_HEADSET,
@@ -279,9 +280,6 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 			omap_twl4030_dai_links[1].platforms->of_node = dai_node;
 		}
 
-		priv->jack_detect = of_get_named_gpio(node,
-						      "ti,jack-det-gpio", 0);
-
 		/* Optional: audio routing can be provided */
 		prop = of_find_property(node, "ti,audio-routing", NULL);
 		if (prop) {
@@ -302,8 +300,6 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 
 		if (!pdata->voice_connected)
 			card->num_links = 1;
-
-		priv->jack_detect = pdata->jack_detect;
 	} else {
 		dev_err(&pdev->dev, "Missing pdata\n");
 		return -ENODEV;

-- 
2.34.1

