Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9481312A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 14:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8746950;
	Thu, 14 Dec 2023 14:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8746950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702559856;
	bh=uQaQHcLk0c5Xq+IXas86mu93J/vBkrHoErZS7IUNtIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bcB8Ir0oGGycPQfUu1Cx8lL8Cg0FWcEPpbcgeZyiJTS47P5LIUL6vzz29duvLvr07
	 qDIcIucJi8PB3xT3DIeqFtWuGplgcJA7H2y4f0sP7+J5+zAaySFzKNLgeC93qTFEAu
	 9r5tLrO6I1hmudwIMsQK3j5r5N+CAeq/pUeVKKbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 313F9F805F6; Thu, 14 Dec 2023 14:16:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A884F80620;
	Thu, 14 Dec 2023 14:16:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B844F805F3; Thu, 14 Dec 2023 14:16:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DCC5F8016A
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 14:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DCC5F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VGbIYaDn
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso106150981fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559747; x=1703164547;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhFLd4CPtXm/YF25BMgLtgk+3dv0PmLn7A52Lhi5STs=;
        b=VGbIYaDny6sRQJqau/CoV6H3od7o6uMgHmc0Q6gYichBgObqBbcA2L8h/wjkh0m3ma
         euYpEch5PGwAAK053LRzRl9DIZt9TLgm2OhZkvzfnxPPW/jBmc00CNLNpvJ70iygWw99
         XCzS+SiBZOxdn+lmj5Si93ZvCWZWJIyGqd01EGlE5rmbW6P5NLWZcxsCoj/nC2R53RGr
         BXhTKq61qo5KJrEkU3Ad5dfEl9c4wAj+KKjxfN0/MobjvXi8n6GzRJdHYVyY44+bZ7uS
         uLRcTVgHOw9be2e5mSAvvM/OPaFCfxDyZVDbQ/tI7HAF4sTDPeusS2cE+BnHJConwZu6
         KvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559747; x=1703164547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhFLd4CPtXm/YF25BMgLtgk+3dv0PmLn7A52Lhi5STs=;
        b=YvF8v9b2yF7NpBb7uwgcfPP76GkLyqUmA1ZZwVnufe5Q247LBdVsXkNbBgLZIUXyTF
         aVUoeu49lXhkUx5EtZDxRxBiGtxBCrJbx5NJ2JneU0VumD37EfyZuyTLp1zpLlZWHEL5
         DW2Vh+k9UIy0IXUA5Qri4UrVywKWrp0OB31sEDwQk63uZw3qN2OKrqSDgM+gd0mlQp+I
         4qjyJ1M6I0t4/bC6E1UlS69WQJQPvO0tNETx4dY85pdcOYHHgjk0AY2JW42N0N2QCmF7
         TieJBYArTvQoLlzhKNm4UmHmjlho7pEp0pAbV9XPkJmk8E5M7h52ujyKm74hPIrInimc
         jYbw==
X-Gm-Message-State: AOJu0YxR3+rYj3QHIXiAfVYQ3ghSq9iwjN+Oo8nY1DuQ4fz1cJlISQLi
	drH8WTDsmghnFGC5reG3wqwPIA==
X-Google-Smtp-Source: 
 AGHT+IGq3Eh0v9BtGBtOlHuwDYZzfJD+n+q/wtn0mvU9Vj1OSw4Alx/PDq6ZFZ1HgX3LajGeYwBYdA==
X-Received: by 2002:a2e:bcd1:0:b0:2cc:2b21:6fc7 with SMTP id
 z17-20020a2ebcd1000000b002cc2b216fc7mr3288644ljp.88.1702559747394;
        Thu, 14 Dec 2023 05:15:47 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Dec 2023 14:15:45 +0100
Subject: [PATCH 4/4] ASoC: tegra: tegra20_ac97: Convert to use GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231214-gpio-descriptors-sound-misc-v1-4-e3004176bd8b@linaro.org>
References: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
In-Reply-To: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: AEGRDYOMMUNZ55HXGHCEQ2OW554XIWOE
X-Message-ID-Hash: AEGRDYOMMUNZ55HXGHCEQ2OW554XIWOE
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEGRDYOMMUNZ55HXGHCEQ2OW554XIWOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Tegra20 AC97 driver is using the legacy GPIO APIs in
<linux/of_gpio.h> and <linux/gpio.h> to obtain GPIOs for reset
and sync.

Convert it over and fix the polarity error on the RESET line
in the process: this reset line is clearly active low. Just
fix the one in-tree device tree site using it at the same
time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
If people demand that the DTS oneliner be submitted and merged
separately then I can do so. (I personally think that is too
much focus on process over content.)
---
 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  2 +-
 sound/soc/tegra/tegra20_ac97.c                | 55 +++++++++++++--------------
 sound/soc/tegra/tegra20_ac97.h                |  4 +-
 3 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
index 16b374e6482f..8c1d5c9fa483 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
@@ -446,7 +446,7 @@ lvp0 {
 	tegra_ac97: ac97@70002000 {
 		status = "okay";
 		nvidia,codec-reset-gpio =
-			<&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
+			<&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
 		nvidia,codec-sync-gpio =
 			<&gpio TEGRA_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
 	};
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index e713feca25fa..8011afe93c96 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -12,12 +12,11 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -39,11 +38,15 @@ static void tegra20_ac97_codec_reset(struct snd_ac97 *ac97)
 	u32 readback;
 	unsigned long timeout;
 
-	/* reset line is not driven by DAC pad group, have to toggle GPIO */
-	gpio_set_value(workdata->reset_gpio, 0);
+	/*
+	 * The reset line is not driven by DAC pad group, have to toggle GPIO.
+	 * The RESET line is active low but this is abstracted by the GPIO
+	 * library.
+	 */
+	gpiod_set_value(workdata->reset_gpio, 1);
 	udelay(2);
 
-	gpio_set_value(workdata->reset_gpio, 1);
+	gpiod_set_value(workdata->reset_gpio, 0);
 	udelay(2);
 
 	timeout = jiffies + msecs_to_jiffies(100);
@@ -66,14 +69,10 @@ static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
 	 * the controller cmd is not working, have to toggle sync line
 	 * manually.
 	 */
-	gpio_request(workdata->sync_gpio, "codec-sync");
-
-	gpio_direction_output(workdata->sync_gpio, 1);
-
+	gpiod_direction_output(workdata->sync_gpio, 1);
 	udelay(2);
-	gpio_set_value(workdata->sync_gpio, 0);
+	gpiod_set_value(workdata->sync_gpio, 0);
 	udelay(2);
-	gpio_free(workdata->sync_gpio);
 
 	timeout = jiffies + msecs_to_jiffies(100);
 
@@ -342,28 +341,26 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
-	ac97->reset_gpio = of_get_named_gpio(pdev->dev.of_node,
-					     "nvidia,codec-reset-gpio", 0);
-	if (gpio_is_valid(ac97->reset_gpio)) {
-		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
-					    GPIOF_OUT_INIT_HIGH, "codec-reset");
-		if (ret) {
-			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
-			goto err_clk_put;
-		}
-	} else {
-		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
-		ret = -EINVAL;
+	/* Obtain RESET de-asserted */
+	ac97->reset_gpio = devm_gpiod_get(&pdev->dev,
+					  "nvidia,codec-reset",
+					  GPIOD_OUT_LOW);
+	if (IS_ERR(ac97->reset_gpio)) {
+		ret = PTR_ERR(ac97->reset_gpio);
+		dev_err(&pdev->dev, "no RESET GPIO supplied: %d\n", ret);
 		goto err_clk_put;
 	}
-
-	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
-					    "nvidia,codec-sync-gpio", 0);
-	if (!gpio_is_valid(ac97->sync_gpio)) {
-		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
-		ret = -EINVAL;
+	gpiod_set_consumer_name(ac97->reset_gpio, "codec-reset");
+
+	ac97->sync_gpio = devm_gpiod_get(&pdev->dev,
+					 "nvidia,codec-sync",
+					 GPIOD_OUT_LOW);
+	if (IS_ERR(ac97->sync_gpio)) {
+		ret = PTR_ERR(ac97->sync_gpio);
+		dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n", ret);
 		goto err_clk_put;
 	}
+	gpiod_set_consumer_name(ac97->sync_gpio, "codec-sync");
 
 	ac97->capture_dma_data.addr = mem->start + TEGRA20_AC97_FIFO_RX1;
 	ac97->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_ac97.h
index 870ea09ff301..116d7b2db27e 100644
--- a/sound/soc/tegra/tegra20_ac97.h
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -80,7 +80,7 @@ struct tegra20_ac97 {
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct reset_control *reset;
 	struct regmap *regmap;
-	int reset_gpio;
-	int sync_gpio;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *sync_gpio;
 };
 #endif /* __TEGRA20_AC97_H__ */

-- 
2.34.1

