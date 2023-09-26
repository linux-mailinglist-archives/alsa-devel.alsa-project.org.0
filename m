Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C657AEDF6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7775A1DF;
	Tue, 26 Sep 2023 15:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7775A1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695735026;
	bh=hQygGpH9vdBbIjX6Pc0b4k68vo2vvccyaO42y3zqld4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sVHTvPzkxq9XmSF2fEiPLBqGh10sqwUJMxLiaB2R2lsFAjX1vvv+Ph+GCvJ2Z1i6M
	 FShkdVp5MvCfn2muACw3uusyNdyi6PzBdbg07gkN3OfaCpvl8FQ/8u2f89QsRE3dSx
	 usuS4wxGxsYKluHjwWvEzH+dMgfnUHY10Zkih1n0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5810F80579; Tue, 26 Sep 2023 15:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46063F80578;
	Tue, 26 Sep 2023 15:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 505BDF80290; Tue, 26 Sep 2023 15:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BAEFF800AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAEFF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nKUW8U2G
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c01d22f332so118382281fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734735; x=1696339535;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XQ+0fmcxQn7hNEx2giW0ptNoy4+ucZSflc29tgLhQk=;
        b=nKUW8U2GldH3WQ4LhtRRZlOBJO3RgnN5J9EKYlXcGC68GkzMp4G5De4eCGkxRcBWkK
         1XsEpnY9dwG3+eELr4dJmV3JMxq/bdYWL0430YHOeqbxah3KvPCK9SbpGwRpRF9IylZ0
         dbkBRV9b2DfYIuLbGy1NneCwlMq6N/5FHNVWhRBJx971bFlzNxFPHz1Mof0N0yxC9G4I
         Ult8VpYXrqrpjLjEL9SVh8c+FzYqEirqRgZagICiDqYD26QyvNc1MzFVSjXjjcjI+zWn
         62RdsbFS3dkKLB9s0nHIMjOOOwm9Ik+Om/k1+1JTiy7ys/dfhIDUmBpCMaIlZWF5wBgO
         UqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734735; x=1696339535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XQ+0fmcxQn7hNEx2giW0ptNoy4+ucZSflc29tgLhQk=;
        b=JRwUwCrYYnESb+HaAm18KIm0PbnOaq/yqpesB3ZPySc9wHRZts2LvpbRYUWaV6L/5X
         49rbfnDX9+eS+rhwli/x6A+Pe0OkwGHCy2ZaudDKVRTmCSrNYwKLCmQUQ4X4qL2am3oB
         OcM4exP0XmtTp/jtmKHTuFgS/t6kDdZf5w2nDdmybbcnUdqmPoei5q6Oj6bkzDUwfoRd
         +3eEFdoYIvrnyCK8TMer92vrU44/QxMQTag5iwN99i743J+91XS7w66YJk+ogWAi5l8r
         Xsn933dMSRW1TeDoVXN8znxEj1+EwCsGG4ScmbtvBfPEnATu0UAqmnZAkSMyCYAuQ+dh
         xHJw==
X-Gm-Message-State: AOJu0YwwiXCOuMnq6KceZhwKRDS+bQpxILHqYSGKovSdomPMS2orhWdT
	S4qXYqd+acbL0Zqb8dCOfrd28w==
X-Google-Smtp-Source: 
 AGHT+IFPY5U0WllM4x+pCqepZzgVMk893pXwxBLYC4R7FotIFz3M4lxB3pAWd8pzSINV2/2J4ivVlA==
X-Received: by 2002:ac2:4c45:0:b0:501:c6d8:6029 with SMTP id
 o5-20020ac24c45000000b00501c6d86029mr998788lfk.33.1695734735650;
        Tue, 26 Sep 2023 06:25:35 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 15:25:29 +0200
Subject: [PATCH 1/5] ASoC: ti: Convert N810 ASoC to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-1-60cf4f8adbc5@linaro.org>
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
Message-ID-Hash: D2YLENNRRPTHNAEEZVAKFMAPEPPCQF6U
X-Message-ID-Hash: D2YLENNRRPTHNAEEZVAKFMAPEPPCQF6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2YLENNRRPTHNAEEZVAKFMAPEPPCQF6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The N810 uses GPIO descriptors pretty much exclusively, but not
for ASoC, so let's fix it. Register the pins in a descriptor table
in the machine since the ASoC device is not using device tree.

Use static locals for the GPIO descriptors because I'm not able
to experient with better state storage on any real hardware. Others
using the N810 can come afterwards and improve this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap2/board-n8x0.c | 10 ++++++++++
 sound/soc/ti/n810.c              | 31 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 8e3b5068d4ab..31755a378c73 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -498,6 +498,15 @@ struct menelaus_platform_data n8x0_menelaus_platform_data = {
 	.late_init = n8x0_menelaus_late_init,
 };
 
+static struct gpiod_lookup_table nokia810_asoc_gpio_table = {
+	.dev_id = "soc-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", 10, "headset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-80-111", 21, "speaker", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static int __init n8x0_late_initcall(void)
 {
 	if (!board_caps)
@@ -505,6 +514,7 @@ static int __init n8x0_late_initcall(void)
 
 	n8x0_mmc_init();
 	n8x0_usb_init();
+	gpiod_add_lookup_table(&nokia810_asoc_gpio_table);
 
 	return 0;
 }
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index ed217b34f846..71a2a90bad2b 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -15,14 +15,14 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
 #include "omap-mcbsp.h"
 
-#define N810_HEADSET_AMP_GPIO	10
-#define N810_SPEAKER_AMP_GPIO	101
+static struct gpio_desc *n810_headset_amp;
+static struct gpio_desc *n810_speaker_amp;
 
 enum {
 	N810_JACK_DISABLED,
@@ -187,9 +187,9 @@ static int n810_spk_event(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(N810_SPEAKER_AMP_GPIO, 1);
+		gpiod_set_value(n810_speaker_amp, 1);
 	else
-		gpio_set_value(N810_SPEAKER_AMP_GPIO, 0);
+		gpiod_set_value(n810_speaker_amp, 0);
 
 	return 0;
 }
@@ -198,9 +198,9 @@ static int n810_jack_event(struct snd_soc_dapm_widget *w,
 			   struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(N810_HEADSET_AMP_GPIO, 1);
+		gpiod_set_value(n810_headset_amp, 1);
 	else
-		gpio_set_value(N810_HEADSET_AMP_GPIO, 0);
+		gpiod_set_value(n810_headset_amp, 0);
 
 	return 0;
 }
@@ -327,14 +327,19 @@ static int __init n810_soc_init(void)
 	clk_set_parent(sys_clkout2_src, func96m_clk);
 	clk_set_rate(sys_clkout2, 12000000);
 
-	if (WARN_ON((gpio_request(N810_HEADSET_AMP_GPIO, "hs_amp") < 0) ||
-		    (gpio_request(N810_SPEAKER_AMP_GPIO, "spk_amp") < 0))) {
-		err = -EINVAL;
+	n810_headset_amp = devm_gpiod_get(&n810_snd_device->dev,
+					  "headphone", GPIOD_OUT_LOW);
+	if (IS_ERR(n810_headset_amp)) {
+		err = PTR_ERR(n810_headset_amp);
 		goto err4;
 	}
 
-	gpio_direction_output(N810_HEADSET_AMP_GPIO, 0);
-	gpio_direction_output(N810_SPEAKER_AMP_GPIO, 0);
+	n810_speaker_amp = devm_gpiod_get(&n810_snd_device->dev,
+					  "speaker", GPIOD_OUT_LOW);
+	if (IS_ERR(n810_speaker_amp)) {
+		err = PTR_ERR(n810_speaker_amp);
+		goto err4;
+	}
 
 	return 0;
 err4:
@@ -351,8 +356,6 @@ static int __init n810_soc_init(void)
 
 static void __exit n810_soc_exit(void)
 {
-	gpio_free(N810_SPEAKER_AMP_GPIO);
-	gpio_free(N810_HEADSET_AMP_GPIO);
 	clk_put(sys_clkout2_src);
 	clk_put(sys_clkout2);
 	clk_put(func96m_clk);

-- 
2.34.1

