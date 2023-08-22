Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34611784BAC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 22:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D010204;
	Tue, 22 Aug 2023 22:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D010204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692737829;
	bh=UUjx7rIhs6cNnqj+JPkrQuky40WZ8D1fOzy0Qs3syZk=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fvUkck0ea9sC2MGUTKihXfsr36sUSLkb1CI1pLz1zJpdBOj4o1YUqxH/OAroTQxeX
	 S6k0QkSSW0Y7OqLh96S1w+t66/KpZMhDU07+Vwp/+WT2Zq2hc0B3ZiRBPz5IRbl1P+
	 fOGwkQdNmEME6/NB8xBSXi24Vl3TmLswx+W/gDYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F21EF800F5; Tue, 22 Aug 2023 22:56:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD41F800F5;
	Tue, 22 Aug 2023 22:56:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 930E6F80158; Tue, 22 Aug 2023 22:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6058F800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 22:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6058F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ych5mZsV
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ff933f9ca8so7584715e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 22 Aug 2023 13:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692737749; x=1693342549;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxa8W0tGpWXnvFKMu4NNL+R/q6RrW41VkUdo91HjOOc=;
        b=ych5mZsVanyK/mP6vW7R/W8arEc84rXHIgFCAsM1E1pT8Ktn/d1WLB5LurOAe8k2O+
         wDBPeYxzbfQkQQ8a/YCaILFOT42qc9HfyJox72B44sdgYcZZPI3CI/O7DD6o/EATs12H
         GfTLeK/AWmKviUkbSVLbRvdxmmzACt0jkQyNtNNUQpxkXLMXz0kNKpciZg/s+i2EF15B
         5uzXMt3I4c7+IvpDOHRmOAVeaQbQzFFEK86fSB3iKbVxuTd/6rXuH/9fiuZnt4Bh7N2G
         Oxnw7Fe3p0O0k1QiC5mSzMB0hoW70BWtsUhs7xZK6RdGjYFzX4TIeDjMRf8Ds2StZlts
         TZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692737749; x=1693342549;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxa8W0tGpWXnvFKMu4NNL+R/q6RrW41VkUdo91HjOOc=;
        b=S+v38WJQa1ljMhZYnB+HEUobb+jqacxZD0pGLyN8oj1LwDGkb7oNaL59xcilS2jM4r
         3GdWy4VWYge0hQFDsGvCEAnFd0NvBLbJuFfR1A0RHgfOeQ7JXjxbsnU9jomSFudxLlNZ
         6302Y6vAmE6/OROaZ1uX57fJ928teCyhOkAb/rPTDqO8aAtON9EbNmwbo6SlD2EoDgnk
         TD1J9G9hiBWZHidwi65T1RYtNSt9tlNCa4BlXRXAvKwC9gkMmjdqM8hAId4Ibfo6OyGN
         aJ5gwS7lc8Uu823iZQn321c8rHYk+wjiKwHoaxWsTOMGbEMP1IhF/CypP3oT29cfekWe
         Rkag==
X-Gm-Message-State: AOJu0Yz26/lWiyvrjb0kP6ys1IyTXz2SA9m3eYLGV7uQe9kOqiZgh+DZ
	6GwbUMFVnuQ8wI0ec9zadmDQRg==
X-Google-Smtp-Source: 
 AGHT+IF4JH5IPn+zjCyjWWYle9NhFw8SvD36S5GiDeSLzyZolhe4Y2vcWC0TLoPsaS/A8ccvoQk2jw==
X-Received: by 2002:a05:6512:68d:b0:4f7:6017:8fb with SMTP id
 t13-20020a056512068d00b004f7601708fbmr9225405lfe.26.1692737748951;
        Tue, 22 Aug 2023 13:55:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 y9-20020ac255a9000000b004ff748f6f1fsm2381679lfg.69.2023.08.22.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:55:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Aug 2023 22:55:44 +0200
Subject: [PATCH v2] ASoC: Delete UDA134x/L3 audio codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-delete-l3-v2-1-b3ffc07348af@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM8g5WQC/23MQQrCMBCF4auUWRtJZtTWrryHdBGaaTsQGklKU
 Erubuza5f94fDskjsIJ+maHyFmShLUGnhoYF7vOrMTVBtRIukOjHHveWHlS15amS0eoDRPU/yv
 yJO/Deg61F0lbiJ+Dzua3/lOyUUbhzd1HR8itxYeX1cZwDnGGoZTyBSitxjejAAAA
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: HKC5GJCW5UTQ4TJDFPRVQA5W7W7CWDL6
X-Message-ID-Hash: HKC5GJCW5UTQ4TJDFPRVQA5W7W7CWDL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKC5GJCW5UTQ4TJDFPRVQA5W7W7CWDL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This codec was used by the deleted S3C board
sound/soc/samsung/s3c24xx_uda134x.c.

Fixes: 503278c12701 ("ASoC: samsung: remove unused drivers")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Properly delete the L3 codec Kconfig and Makefile entries :/
- Test with x86_64 allmodconfig
- Link to v1: https://lore.kernel.org/r/20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org
---
 include/sound/l3.h         |  28 ---
 include/sound/uda134x.h    |  24 --
 sound/soc/codecs/Kconfig   |   8 -
 sound/soc/codecs/Makefile  |   4 -
 sound/soc/codecs/l3.c      | 132 ----------
 sound/soc/codecs/uda134x.c | 587 ---------------------------------------------
 sound/soc/codecs/uda134x.h |  33 ---
 7 files changed, 816 deletions(-)

diff --git a/include/sound/l3.h b/include/sound/l3.h
deleted file mode 100644
index b6f58072237a..000000000000
--- a/include/sound/l3.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _L3_H_
-#define _L3_H_ 1
-
-struct l3_pins {
-	void (*setdat)(struct l3_pins *, int);
-	void (*setclk)(struct l3_pins *, int);
-	void (*setmode)(struct l3_pins *, int);
-
-	int gpio_data;
-	int gpio_clk;
-	int gpio_mode;
-	int use_gpios;
-
-	int data_hold;
-	int data_setup;
-	int clock_high;
-	int mode_hold;
-	int mode;
-	int mode_setup;
-};
-
-struct device;
-
-int l3_write(struct l3_pins *adap, u8 addr, u8 *data, int len);
-int l3_set_gpio_ops(struct device *dev, struct l3_pins *adap);
-
-#endif
diff --git a/include/sound/uda134x.h b/include/sound/uda134x.h
deleted file mode 100644
index db82516da162..000000000000
--- a/include/sound/uda134x.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * uda134x.h  --  UDA134x ALSA SoC Codec driver
- *
- * Copyright 2007 Dension Audio Systems Ltd.
- * Author: Zoltan Devai
- */
-
-#ifndef _UDA134X_H
-#define _UDA134X_H
-
-#include <sound/l3.h>
-
-struct uda134x_platform_data {
-	struct l3_pins l3;
-	void (*power) (int);
-	int model;
-#define UDA134X_UDA1340 1
-#define UDA134X_UDA1341 2
-#define UDA134X_UDA1344 3
-#define UDA134X_UDA1345 4
-};
-
-#endif /* _UDA134X_H */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ef279a27eb51..8964616275df 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -15,7 +15,6 @@ config SND_SOC_ALL_CODECS
 	tristate "Build all ASoC CODEC drivers"
 	depends on COMPILE_TEST
 	imply SND_SOC_88PM860X
-	imply SND_SOC_L3
 	imply SND_SOC_AB8500_CODEC
 	imply SND_SOC_AC97_CODEC
 	imply SND_SOC_AD1836
@@ -268,7 +267,6 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TWL4030
 	imply SND_SOC_TWL6040
 	imply SND_SOC_UDA1334
-	imply SND_SOC_UDA134X
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
@@ -994,9 +992,6 @@ config SND_SOC_JZ4770_CODEC
 	  This driver can also be built as a module. If so, the module
 	  will be called snd-soc-jz4770-codec.
 
-config SND_SOC_L3
-	tristate
-
 config SND_SOC_DA7210
 	tristate
 	depends on SND_SOC_I2C_AND_SPI
@@ -1953,9 +1948,6 @@ config SND_SOC_UDA1334
 	  and has basic features such as de-emphasis (at 44.1 kHz sampling
 	  rate) and mute.
 
-config SND_SOC_UDA134X
-	tristate
-
 config SND_SOC_UDA1380
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 2bdc0ef29a9e..e89698e239dd 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -129,7 +129,6 @@ snd-soc-jz4740-codec-objs := jz4740.o
 snd-soc-jz4725b-codec-objs := jz4725b.o
 snd-soc-jz4760-codec-objs := jz4760.o
 snd-soc-jz4770-codec-objs := jz4770.o
-snd-soc-l3-objs := l3.o
 snd-soc-lm4857-objs := lm4857.o
 snd-soc-lm49453-objs := lm49453.o
 snd-soc-lochnagar-sc-objs := lochnagar-sc.o
@@ -301,7 +300,6 @@ snd-soc-ts3a227e-objs := ts3a227e.o
 snd-soc-twl4030-objs := twl4030.o
 snd-soc-twl6040-objs := twl6040.o
 snd-soc-uda1334-objs := uda1334.o
-snd-soc-uda134x-objs := uda134x.o
 snd-soc-uda1380-objs := uda1380.o
 snd-soc-wcd-mbhc-objs := wcd-mbhc-v2.o
 snd-soc-wcd9335-objs := wcd-clsh-v2.o wcd9335.o
@@ -514,7 +512,6 @@ obj-$(CONFIG_SND_SOC_JZ4740_CODEC)	+= snd-soc-jz4740-codec.o
 obj-$(CONFIG_SND_SOC_JZ4725B_CODEC)	+= snd-soc-jz4725b-codec.o
 obj-$(CONFIG_SND_SOC_JZ4760_CODEC)      += snd-soc-jz4760-codec.o
 obj-$(CONFIG_SND_SOC_JZ4770_CODEC)	+= snd-soc-jz4770-codec.o
-obj-$(CONFIG_SND_SOC_L3)	+= snd-soc-l3.o
 obj-$(CONFIG_SND_SOC_LM4857)	+= snd-soc-lm4857.o
 obj-$(CONFIG_SND_SOC_LM49453)   += snd-soc-lm49453.o
 obj-$(CONFIG_SND_SOC_LOCHNAGAR_SC)	+= snd-soc-lochnagar-sc.o
@@ -683,7 +680,6 @@ obj-$(CONFIG_SND_SOC_TS3A227E)	+= snd-soc-ts3a227e.o
 obj-$(CONFIG_SND_SOC_TWL4030)	+= snd-soc-twl4030.o
 obj-$(CONFIG_SND_SOC_TWL6040)	+= snd-soc-twl6040.o
 obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
-obj-$(CONFIG_SND_SOC_UDA134X)	+= snd-soc-uda134x.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
diff --git a/sound/soc/codecs/l3.c b/sound/soc/codecs/l3.c
deleted file mode 100644
index b84f6f1f6800..000000000000
--- a/sound/soc/codecs/l3.c
+++ /dev/null
@@ -1,132 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * L3 code
- *
- *  Copyright (C) 2008, Christian Pellegrin <chripell@evolware.org>
- *
- * based on:
- *
- * L3 bus algorithm module.
- *
- *  Copyright (C) 2001 Russell King, All Rights Reserved.
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/gpio.h>
-
-#include <sound/l3.h>
-
-/*
- * Send one byte of data to the chip.  Data is latched into the chip on
- * the rising edge of the clock.
- */
-static void sendbyte(struct l3_pins *adap, unsigned int byte)
-{
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		adap->setclk(adap, 0);
-		udelay(adap->data_hold);
-		adap->setdat(adap, byte & 1);
-		udelay(adap->data_setup);
-		adap->setclk(adap, 1);
-		udelay(adap->clock_high);
-		byte >>= 1;
-	}
-}
-
-/*
- * Send a set of bytes to the chip.  We need to pulse the MODE line
- * between each byte, but never at the start nor at the end of the
- * transfer.
- */
-static void sendbytes(struct l3_pins *adap, const u8 *buf,
-		      int len)
-{
-	int i;
-
-	for (i = 0; i < len; i++) {
-		if (i) {
-			udelay(adap->mode_hold);
-			adap->setmode(adap, 0);
-			udelay(adap->mode);
-		}
-		adap->setmode(adap, 1);
-		udelay(adap->mode_setup);
-		sendbyte(adap, buf[i]);
-	}
-}
-
-int l3_write(struct l3_pins *adap, u8 addr, u8 *data, int len)
-{
-	adap->setclk(adap, 1);
-	adap->setdat(adap, 1);
-	adap->setmode(adap, 1);
-	udelay(adap->mode);
-
-	adap->setmode(adap, 0);
-	udelay(adap->mode_setup);
-	sendbyte(adap, addr);
-	udelay(adap->mode_hold);
-
-	sendbytes(adap, data, len);
-
-	adap->setclk(adap, 1);
-	adap->setdat(adap, 1);
-	adap->setmode(adap, 0);
-
-	return len;
-}
-EXPORT_SYMBOL_GPL(l3_write);
-
-
-static void l3_set_clk(struct l3_pins *adap, int val)
-{
-	gpio_set_value(adap->gpio_clk, val);
-}
-
-static void l3_set_data(struct l3_pins *adap, int val)
-{
-	gpio_set_value(adap->gpio_data, val);
-}
-
-static void l3_set_mode(struct l3_pins *adap, int val)
-{
-	gpio_set_value(adap->gpio_mode, val);
-}
-
-int l3_set_gpio_ops(struct device *dev, struct l3_pins *adap)
-{
-	int ret;
-
-	if (!adap->use_gpios)
-		return -EINVAL;
-
-	ret = devm_gpio_request_one(dev, adap->gpio_data,
-				GPIOF_OUT_INIT_LOW, "l3_data");
-	if (ret < 0)
-		return ret;
-	adap->setdat = l3_set_data;
-
-	ret = devm_gpio_request_one(dev, adap->gpio_clk,
-				GPIOF_OUT_INIT_LOW, "l3_clk");
-	if (ret < 0)
-		return ret;
-	adap->setclk = l3_set_clk;
-
-	ret = devm_gpio_request_one(dev, adap->gpio_mode,
-				GPIOF_OUT_INIT_LOW, "l3_mode");
-	if (ret < 0)
-		return ret;
-	adap->setmode = l3_set_mode;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(l3_set_gpio_ops);
-
-MODULE_DESCRIPTION("L3 bit-banging driver");
-MODULE_AUTHOR("Christian Pellegrin <chripell@evolware.org>");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/uda134x.c b/sound/soc/codecs/uda134x.c
deleted file mode 100644
index 1a62bec94005..000000000000
--- a/sound/soc/codecs/uda134x.c
+++ /dev/null
@@ -1,587 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * uda134x.c  --  UDA134X ALSA SoC Codec driver
- *
- * Modifications by Christian Pellegrin <chripell@evolware.org>
- *
- * Copyright 2007 Dension Audio Systems Ltd.
- * Author: Zoltan Devai
- *
- * Based on the WM87xx drivers by Liam Girdwood and Richard Purdie
- */
-
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/initval.h>
-
-#include <sound/uda134x.h>
-#include <sound/l3.h>
-
-#include "uda134x.h"
-
-
-#define UDA134X_RATES SNDRV_PCM_RATE_8000_48000
-#define UDA134X_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
-		SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S20_3LE)
-
-struct uda134x_priv {
-	int sysclk;
-	int dai_fmt;
-
-	struct snd_pcm_substream *master_substream;
-	struct snd_pcm_substream *slave_substream;
-
-	struct regmap *regmap;
-	struct uda134x_platform_data *pd;
-};
-
-static const struct reg_default uda134x_reg_defaults[] = {
-	{ UDA134X_EA000, 0x04 },
-	{ UDA134X_EA001, 0x04 },
-	{ UDA134X_EA010, 0x04 },
-	{ UDA134X_EA011, 0x00 },
-	{ UDA134X_EA100, 0x00 },
-	{ UDA134X_EA101, 0x00 },
-	{ UDA134X_EA110, 0x00 },
-	{ UDA134X_EA111, 0x00 },
-	{ UDA134X_STATUS0, 0x00 },
-	{ UDA134X_STATUS1, 0x03 },
-	{ UDA134X_DATA000, 0x00 },
-	{ UDA134X_DATA001, 0x00 },
-	{ UDA134X_DATA010, 0x00 },
-	{ UDA134X_DATA011, 0x00 },
-	{ UDA134X_DATA1, 0x00 },
-};
-
-/*
- * Write to the uda134x registers
- *
- */
-static int uda134x_regmap_write(void *context, unsigned int reg,
-	unsigned int value)
-{
-	struct uda134x_platform_data *pd = context;
-	int ret;
-	u8 addr;
-	u8 data = value;
-
-	switch (reg) {
-	case UDA134X_STATUS0:
-	case UDA134X_STATUS1:
-		addr = UDA134X_STATUS_ADDR;
-		data |= (reg - UDA134X_STATUS0) << 7;
-		break;
-	case UDA134X_DATA000:
-	case UDA134X_DATA001:
-	case UDA134X_DATA010:
-	case UDA134X_DATA011:
-		addr = UDA134X_DATA0_ADDR;
-		data |= (reg - UDA134X_DATA000) << 6;
-		break;
-	case UDA134X_DATA1:
-		addr = UDA134X_DATA1_ADDR;
-		break;
-	default:
-		/* It's an extended address register */
-		addr =  (reg | UDA134X_EXTADDR_PREFIX);
-
-		ret = l3_write(&pd->l3,
-			       UDA134X_DATA0_ADDR, &addr, 1);
-		if (ret != 1)
-			return -EIO;
-
-		addr = UDA134X_DATA0_ADDR;
-		data = (value | UDA134X_EXTDATA_PREFIX);
-		break;
-	}
-
-	ret = l3_write(&pd->l3,
-		       addr, &data, 1);
-	if (ret != 1)
-		return -EIO;
-
-	return 0;
-}
-
-static inline void uda134x_reset(struct snd_soc_component *component)
-{
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-	unsigned int mask = 1<<6;
-
-	regmap_update_bits(uda134x->regmap, UDA134X_STATUS0, mask, mask);
-	msleep(1);
-	regmap_update_bits(uda134x->regmap, UDA134X_STATUS0, mask, 0);
-}
-
-static int uda134x_mute(struct snd_soc_dai *dai, int mute, int direction)
-{
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(dai->component);
-	unsigned int mask = 1<<2;
-	unsigned int val;
-
-	pr_debug("%s mute: %d\n", __func__, mute);
-
-	if (mute)
-		val = mask;
-	else
-		val = 0;
-
-	return regmap_update_bits(uda134x->regmap, UDA134X_DATA010, mask, val);
-}
-
-static int uda134x_startup(struct snd_pcm_substream *substream,
-	struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-	struct snd_pcm_runtime *master_runtime;
-
-	if (uda134x->master_substream) {
-		master_runtime = uda134x->master_substream->runtime;
-
-		pr_debug("%s constraining to %d bits at %d\n", __func__,
-			 master_runtime->sample_bits,
-			 master_runtime->rate);
-
-		snd_pcm_hw_constraint_single(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_RATE,
-					     master_runtime->rate);
-
-		snd_pcm_hw_constraint_single(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
-					     master_runtime->sample_bits);
-
-		uda134x->slave_substream = substream;
-	} else
-		uda134x->master_substream = substream;
-
-	return 0;
-}
-
-static void uda134x_shutdown(struct snd_pcm_substream *substream,
-	struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-
-	if (uda134x->master_substream == substream)
-		uda134x->master_substream = uda134x->slave_substream;
-
-	uda134x->slave_substream = NULL;
-}
-
-static int uda134x_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params,
-	struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-	unsigned int hw_params = 0;
-
-	if (substream == uda134x->slave_substream) {
-		pr_debug("%s ignoring hw_params for slave substream\n",
-			 __func__);
-		return 0;
-	}
-
-	pr_debug("%s sysclk: %d, rate:%d\n", __func__,
-		 uda134x->sysclk, params_rate(params));
-
-	/* set SYSCLK / fs ratio */
-	switch (uda134x->sysclk / params_rate(params)) {
-	case 512:
-		break;
-	case 384:
-		hw_params |= (1<<4);
-		break;
-	case 256:
-		hw_params |= (1<<5);
-		break;
-	default:
-		printk(KERN_ERR "%s unsupported fs\n", __func__);
-		return -EINVAL;
-	}
-
-	pr_debug("%s dai_fmt: %d, params_format:%d\n", __func__,
-		 uda134x->dai_fmt, params_format(params));
-
-	/* set DAI format and word length */
-	switch (uda134x->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		break;
-	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 16:
-			hw_params |= (1<<1);
-			break;
-		case 18:
-			hw_params |= (1<<2);
-			break;
-		case 20:
-			hw_params |= ((1<<2) | (1<<1));
-			break;
-		default:
-			printk(KERN_ERR "%s unsupported format (right)\n",
-			       __func__);
-			return -EINVAL;
-		}
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		hw_params |= (1<<3);
-		break;
-	default:
-		printk(KERN_ERR "%s unsupported format\n", __func__);
-		return -EINVAL;
-	}
-
-	return regmap_update_bits(uda134x->regmap, UDA134X_STATUS0,
-		STATUS0_SYSCLK_MASK | STATUS0_DAIFMT_MASK, hw_params);
-}
-
-static int uda134x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				  int clk_id, unsigned int freq, int dir)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-
-	pr_debug("%s clk_id: %d, freq: %u, dir: %d\n", __func__,
-		 clk_id, freq, dir);
-
-	/* Anything between 256fs*8Khz and 512fs*48Khz should be acceptable
-	   because the codec is slave. Of course limitations of the clock
-	   master (the IIS controller) apply.
-	   We'll error out on set_hw_params if it's not OK */
-	if ((freq >= (256 * 8000)) && (freq <= (512 * 48000))) {
-		uda134x->sysclk = freq;
-		return 0;
-	}
-
-	printk(KERN_ERR "%s unsupported sysclk\n", __func__);
-	return -EINVAL;
-}
-
-static int uda134x_set_dai_fmt(struct snd_soc_dai *codec_dai,
-			       unsigned int fmt)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-
-	pr_debug("%s fmt: %08X\n", __func__, fmt);
-
-	/* codec supports only full consumer mode */
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
-		printk(KERN_ERR "%s unsupported clocking mode\n", __func__);
-		return -EINVAL;
-	}
-
-	/* no support for clock inversion */
-	if ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_NF) {
-		printk(KERN_ERR "%s unsupported clock inversion\n", __func__);
-		return -EINVAL;
-	}
-
-	/* We can't setup DAI format here as it depends on the word bit num */
-	/* so let's just store the value for later */
-	uda134x->dai_fmt = fmt;
-
-	return 0;
-}
-
-static int uda134x_set_bias_level(struct snd_soc_component *component,
-				  enum snd_soc_bias_level level)
-{
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-	struct uda134x_platform_data *pd = uda134x->pd;
-	pr_debug("%s bias level %d\n", __func__, level);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		break;
-	case SND_SOC_BIAS_PREPARE:
-		/* power on */
-		if (pd->power) {
-			pd->power(1);
-			regcache_sync(uda134x->regmap);
-		}
-		break;
-	case SND_SOC_BIAS_STANDBY:
-		break;
-	case SND_SOC_BIAS_OFF:
-		/* power off */
-		if (pd->power) {
-			pd->power(0);
-			regcache_mark_dirty(uda134x->regmap);
-		}
-		break;
-	}
-	return 0;
-}
-
-static const char *uda134x_dsp_setting[] = {"Flat", "Minimum1",
-					    "Minimum2", "Maximum"};
-static const char *uda134x_deemph[] = {"None", "32Khz", "44.1Khz", "48Khz"};
-static const char *uda134x_mixmode[] = {"Differential", "Analog1",
-					"Analog2", "Both"};
-
-static const struct soc_enum uda134x_mixer_enum[] = {
-SOC_ENUM_SINGLE(UDA134X_DATA010, 0, 0x04, uda134x_dsp_setting),
-SOC_ENUM_SINGLE(UDA134X_DATA010, 3, 0x04, uda134x_deemph),
-SOC_ENUM_SINGLE(UDA134X_EA010, 0, 0x04, uda134x_mixmode),
-};
-
-static const struct snd_kcontrol_new uda1341_snd_controls[] = {
-SOC_SINGLE("Master Playback Volume", UDA134X_DATA000, 0, 0x3F, 1),
-SOC_SINGLE("Capture Volume", UDA134X_EA010, 2, 0x07, 0),
-SOC_SINGLE("Analog1 Volume", UDA134X_EA000, 0, 0x1F, 1),
-SOC_SINGLE("Analog2 Volume", UDA134X_EA001, 0, 0x1F, 1),
-
-SOC_SINGLE("Mic Sensitivity", UDA134X_EA010, 2, 7, 0),
-SOC_SINGLE("Mic Volume", UDA134X_EA101, 0, 0x1F, 0),
-
-SOC_SINGLE("Tone Control - Bass", UDA134X_DATA001, 2, 0xF, 0),
-SOC_SINGLE("Tone Control - Treble", UDA134X_DATA001, 0, 3, 0),
-
-SOC_ENUM("Sound Processing Filter", uda134x_mixer_enum[0]),
-SOC_ENUM("PCM Playback De-emphasis", uda134x_mixer_enum[1]),
-SOC_ENUM("Input Mux", uda134x_mixer_enum[2]),
-
-SOC_SINGLE("AGC Switch", UDA134X_EA100, 4, 1, 0),
-SOC_SINGLE("AGC Target Volume", UDA134X_EA110, 0, 0x03, 1),
-SOC_SINGLE("AGC Timing", UDA134X_EA110, 2, 0x07, 0),
-
-SOC_SINGLE("DAC +6dB Switch", UDA134X_STATUS1, 6, 1, 0),
-SOC_SINGLE("ADC +6dB Switch", UDA134X_STATUS1, 5, 1, 0),
-SOC_SINGLE("ADC Polarity Switch", UDA134X_STATUS1, 4, 1, 0),
-SOC_SINGLE("DAC Polarity Switch", UDA134X_STATUS1, 3, 1, 0),
-SOC_SINGLE("Double Speed Playback Switch", UDA134X_STATUS1, 2, 1, 0),
-SOC_SINGLE("DC Filter Enable Switch", UDA134X_STATUS0, 0, 1, 0),
-};
-
-static const struct snd_kcontrol_new uda1340_snd_controls[] = {
-SOC_SINGLE("Master Playback Volume", UDA134X_DATA000, 0, 0x3F, 1),
-
-SOC_SINGLE("Tone Control - Bass", UDA134X_DATA001, 2, 0xF, 0),
-SOC_SINGLE("Tone Control - Treble", UDA134X_DATA001, 0, 3, 0),
-
-SOC_ENUM("Sound Processing Filter", uda134x_mixer_enum[0]),
-SOC_ENUM("PCM Playback De-emphasis", uda134x_mixer_enum[1]),
-
-SOC_SINGLE("DC Filter Enable Switch", UDA134X_STATUS0, 0, 1, 0),
-};
-
-static const struct snd_kcontrol_new uda1345_snd_controls[] = {
-SOC_SINGLE("Master Playback Volume", UDA134X_DATA000, 0, 0x3F, 1),
-
-SOC_ENUM("PCM Playback De-emphasis", uda134x_mixer_enum[1]),
-
-SOC_SINGLE("DC Filter Enable Switch", UDA134X_STATUS0, 0, 1, 0),
-};
-
-/* UDA1341 has the DAC/ADC power down in STATUS1 */
-static const struct snd_soc_dapm_widget uda1341_dapm_widgets[] = {
-	SND_SOC_DAPM_DAC("DAC", "Playback", UDA134X_STATUS1, 0, 0),
-	SND_SOC_DAPM_ADC("ADC", "Capture", UDA134X_STATUS1, 1, 0),
-};
-
-/* UDA1340/4/5 has the DAC/ADC pwoer down in DATA0 11 */
-static const struct snd_soc_dapm_widget uda1340_dapm_widgets[] = {
-	SND_SOC_DAPM_DAC("DAC", "Playback", UDA134X_DATA011, 0, 0),
-	SND_SOC_DAPM_ADC("ADC", "Capture", UDA134X_DATA011, 1, 0),
-};
-
-/* Common DAPM widgets */
-static const struct snd_soc_dapm_widget uda134x_dapm_widgets[] = {
-	SND_SOC_DAPM_INPUT("VINL1"),
-	SND_SOC_DAPM_INPUT("VINR1"),
-	SND_SOC_DAPM_INPUT("VINL2"),
-	SND_SOC_DAPM_INPUT("VINR2"),
-	SND_SOC_DAPM_OUTPUT("VOUTL"),
-	SND_SOC_DAPM_OUTPUT("VOUTR"),
-};
-
-static const struct snd_soc_dapm_route uda134x_dapm_routes[] = {
-	{ "ADC", NULL, "VINL1" },
-	{ "ADC", NULL, "VINR1" },
-	{ "ADC", NULL, "VINL2" },
-	{ "ADC", NULL, "VINR2" },
-	{ "VOUTL", NULL, "DAC" },
-	{ "VOUTR", NULL, "DAC" },
-};
-
-static const struct snd_soc_dai_ops uda134x_dai_ops = {
-	.startup	= uda134x_startup,
-	.shutdown	= uda134x_shutdown,
-	.hw_params	= uda134x_hw_params,
-	.mute_stream	= uda134x_mute,
-	.set_sysclk	= uda134x_set_dai_sysclk,
-	.set_fmt	= uda134x_set_dai_fmt,
-	.no_capture_mute = 1,
-};
-
-static struct snd_soc_dai_driver uda134x_dai = {
-	.name = "uda134x-hifi",
-	/* playback capabilities */
-	.playback = {
-		.stream_name = "Playback",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = UDA134X_RATES,
-		.formats = UDA134X_FORMATS,
-	},
-	/* capture capabilities */
-	.capture = {
-		.stream_name = "Capture",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = UDA134X_RATES,
-		.formats = UDA134X_FORMATS,
-	},
-	/* pcm operations */
-	.ops = &uda134x_dai_ops,
-};
-
-static int uda134x_soc_probe(struct snd_soc_component *component)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
-	struct uda134x_platform_data *pd = uda134x->pd;
-	const struct snd_soc_dapm_widget *widgets;
-	unsigned int num_widgets;
-	int ret;
-
-	printk(KERN_INFO "UDA134X SoC Audio Codec\n");
-
-	switch (pd->model) {
-	case UDA134X_UDA1340:
-	case UDA134X_UDA1341:
-	case UDA134X_UDA1344:
-	case UDA134X_UDA1345:
-		break;
-	default:
-		printk(KERN_ERR "UDA134X SoC codec: "
-		       "unsupported model %d\n",
-			pd->model);
-		return -EINVAL;
-	}
-
-	if (pd->power)
-		pd->power(1);
-
-	uda134x_reset(component);
-
-	if (pd->model == UDA134X_UDA1341) {
-		widgets = uda1341_dapm_widgets;
-		num_widgets = ARRAY_SIZE(uda1341_dapm_widgets);
-	} else {
-		widgets = uda1340_dapm_widgets;
-		num_widgets = ARRAY_SIZE(uda1340_dapm_widgets);
-	}
-
-	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
-	if (ret) {
-		printk(KERN_ERR "%s failed to register dapm controls: %d",
-			__func__, ret);
-		return ret;
-	}
-
-	switch (pd->model) {
-	case UDA134X_UDA1340:
-	case UDA134X_UDA1344:
-		ret = snd_soc_add_component_controls(component, uda1340_snd_controls,
-					ARRAY_SIZE(uda1340_snd_controls));
-	break;
-	case UDA134X_UDA1341:
-		ret = snd_soc_add_component_controls(component, uda1341_snd_controls,
-					ARRAY_SIZE(uda1341_snd_controls));
-	break;
-	case UDA134X_UDA1345:
-		ret = snd_soc_add_component_controls(component, uda1345_snd_controls,
-					ARRAY_SIZE(uda1345_snd_controls));
-	break;
-	default:
-		printk(KERN_ERR "%s unknown codec type: %d",
-			__func__, pd->model);
-		return -EINVAL;
-	}
-
-	if (ret < 0) {
-		printk(KERN_ERR "UDA134X: failed to register controls\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_component_driver soc_component_dev_uda134x = {
-	.probe			= uda134x_soc_probe,
-	.set_bias_level		= uda134x_set_bias_level,
-	.dapm_widgets		= uda134x_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(uda134x_dapm_widgets),
-	.dapm_routes		= uda134x_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(uda134x_dapm_routes),
-	.suspend_bias_off	= 1,
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-};
-
-static const struct regmap_config uda134x_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = UDA134X_DATA1,
-	.reg_defaults = uda134x_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(uda134x_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
-
-	.reg_write = uda134x_regmap_write,
-};
-
-static int uda134x_codec_probe(struct platform_device *pdev)
-{
-	struct uda134x_platform_data *pd = pdev->dev.platform_data;
-	struct uda134x_priv *uda134x;
-	int ret;
-
-	if (!pd) {
-		dev_err(&pdev->dev, "Missing L3 bitbang function\n");
-		return -ENODEV;
-	}
-
-	uda134x = devm_kzalloc(&pdev->dev, sizeof(*uda134x), GFP_KERNEL);
-	if (!uda134x)
-		return -ENOMEM;
-
-	uda134x->pd = pd;
-	platform_set_drvdata(pdev, uda134x);
-
-	if (pd->l3.use_gpios) {
-		ret = l3_set_gpio_ops(&pdev->dev, &uda134x->pd->l3);
-		if (ret < 0)
-			return ret;
-	}
-
-	uda134x->regmap = devm_regmap_init(&pdev->dev, NULL, pd,
-		&uda134x_regmap_config);
-	if (IS_ERR(uda134x->regmap))
-		return PTR_ERR(uda134x->regmap);
-
-	return devm_snd_soc_register_component(&pdev->dev,
-			&soc_component_dev_uda134x, &uda134x_dai, 1);
-}
-
-static struct platform_driver uda134x_codec_driver = {
-	.driver = {
-		.name = "uda134x-codec",
-	},
-	.probe = uda134x_codec_probe,
-};
-
-module_platform_driver(uda134x_codec_driver);
-
-MODULE_DESCRIPTION("UDA134X ALSA soc codec driver");
-MODULE_AUTHOR("Zoltan Devai, Christian Pellegrin <chripell@evolware.org>");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/uda134x.h b/sound/soc/codecs/uda134x.h
deleted file mode 100644
index 664618c2571c..000000000000
--- a/sound/soc/codecs/uda134x.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _UDA134X_CODEC_H
-#define _UDA134X_CODEC_H
-
-#define UDA134X_L3ADDR	5
-#define UDA134X_DATA0_ADDR	((UDA134X_L3ADDR << 2) | 0)
-#define UDA134X_DATA1_ADDR	((UDA134X_L3ADDR << 2) | 1)
-#define UDA134X_STATUS_ADDR	((UDA134X_L3ADDR << 2) | 2)
-
-#define UDA134X_EXTADDR_PREFIX	0xC0
-#define UDA134X_EXTDATA_PREFIX	0xE0
-
-/* UDA134X registers */
-#define UDA134X_EA000	0
-#define UDA134X_EA001	1
-#define UDA134X_EA010	2
-#define UDA134X_EA011	3
-#define UDA134X_EA100	4
-#define UDA134X_EA101	5
-#define UDA134X_EA110	6
-#define UDA134X_EA111	7
-#define UDA134X_STATUS0 8
-#define UDA134X_STATUS1 9
-#define UDA134X_DATA000 10
-#define UDA134X_DATA001 11
-#define UDA134X_DATA010 12
-#define UDA134X_DATA011 13
-#define UDA134X_DATA1   14
-
-#define STATUS0_DAIFMT_MASK (~(7<<1))
-#define STATUS0_SYSCLK_MASK (~(3<<4))
-
-#endif

---
base-commit: 17b9f4387ebabb19b871bbe2d06562e48e4e7130
change-id: 20230821-delete-l3-573f483201e3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

