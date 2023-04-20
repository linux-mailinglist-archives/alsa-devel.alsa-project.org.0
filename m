Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0326E8FEC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2796EF1;
	Thu, 20 Apr 2023 12:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2796EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985923;
	bh=zxar5ggTufySclyWeDoPzCaSQfjlBFR1buy6QsfVEp8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pThwNHoxigUsyo9S0z7QpDclSSQL/wvYHEGaJ5OoX9RaqoPJW0Vs//I1zeqkZbSZK
	 i5/SNlJxQCNavRIeWmsBfjd8lJomoEL+CQ5T/Z/Rlo5C/Qaq6DXNgHFY97eNt+CsrC
	 TSbpVdxjH0htdQbxtDzbvux0SjYNcJzGcVfDQY8w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3828F80544;
	Thu, 20 Apr 2023 12:16:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95CF9F80548; Thu, 20 Apr 2023 12:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2E79F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E79F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ut6iQ/+C
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50506ac462bso671359a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985784; x=1684577784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rqhyU6uXoU+/LhRADh+Yrxp3II6kKdCrObNCj5zZIk=;
        b=Ut6iQ/+CoIv1rPMxqnZvK0NSWdqeCFUzd6OEx1lKkUgb/r52SzTay59vOp6CZkva05
         8SGuiVyeXnxzYx/n6GIJRR8oUGw9tjeCMCLAcQATcoAebowSItrF3GwVrDQDCqTYJTfv
         nVq35AQtK5pxpUcHSNBA7H0d14o3p7Dzu0lQ4p8r82XQdBVUBsvr4GJ7X4HY22Xt/IIt
         bUMDdwpLFNd8eyAy7mD+F1M84wUS4ga+3/PganPMZM3Cln5eEY8lqVR/OApIs0lFZn9M
         pVShqreCbx9e8O1gOETlPSNg8pzNbkIaLUyskwjwBn/1ifnBr+LoakoKoqAWmiDuDezk
         A3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985784; x=1684577784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rqhyU6uXoU+/LhRADh+Yrxp3II6kKdCrObNCj5zZIk=;
        b=d4QhXeSGD2RRR8bLBVhWO3l5CRJPZb0Nj/iIDJPyTDKxPv2Mqkq+A3kaz47zfViscA
         NbqngvW82odB/Q2LMZbaoWWXLN8BZg7SUK07Il/7a7bgyHRovi2SH3v/6yFTKms5qSDm
         mnYpZSKz01kcrBJ4ECTsN4TVXxg/rGa3pvky7mM1i9lePDs2qhBfAOmRhWfmw8kaMSmT
         LLDdNP+552g4Y6+79qrUQNh8Gu7ZPhw8wKXDXqf0auNHoKCfai4tVRc1cwq7bPxlwvOY
         0GB+7nxkiWJPUWtzo0UoaiC7yipjwPwxHZHkwZRS+4pUQngA/9QOtfNIz2V5mTh0py9c
         IoFw==
X-Gm-Message-State: AAQBX9egKwolHPCkgKX89kKfTCHAI+Gbs/1NLkDe4ihQyccz4ZAUobdV
	OeS9O7ntwBGRFpGHnDaTAIV7pQ==
X-Google-Smtp-Source: 
 AKy350Y+TpaiL2KGRHt+2QkWwuPO6mgxsHGZDuQwdBnUEOwDHb/sJRBqccPNe3HpJgRk5w3gFxXlBw==
X-Received: by 2002:aa7:d81a:0:b0:504:98f1:464c with SMTP id
 v26-20020aa7d81a000000b0050498f1464cmr1260446edq.23.1681985783905;
        Thu, 20 Apr 2023 03:16:23 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Date: Thu, 20 Apr 2023 12:16:12 +0200
Message-Id: <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 37SIXIGYNN22OY5TF5KYIB4RIAHJGAVI
X-Message-ID-Hash: 37SIXIGYNN22OY5TF5KYIB4RIAHJGAVI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37SIXIGYNN22OY5TF5KYIB4RIAHJGAVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
[krzysztof: rebased on recent dev_err_probe() changes]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 sound/soc/codecs/wcd938x.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 11b264a63b04..33fd8fdde9fd 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -6,12 +6,14 @@
 #include <linux/platform_device.h>
 #include <linux/device.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -194,7 +196,7 @@ struct wcd938x_priv {
 	int flyback_cur_det_disable;
 	int ear_rx_path;
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct gpio_desc *us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
@@ -4234,16 +4236,16 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
-	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd938x->reset_gpio < 0)
-		return dev_err_probe(dev, wcd938x->reset_gpio,
-				     "Failed to get reset gpio\n");
+	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(wcd938x->reset_gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get reset gpio\n");
 
 	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
 						GPIOD_OUT_LOW);
-	if (IS_ERR(wcd938x->us_euro_gpio))
-		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
-				     "us-euro swap Control GPIO not found\n");
+	ret = PTR_ERR_OR_ZERO(wcd938x->us_euro_gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "us-euro swap Control GPIO not found\n");
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
@@ -4278,11 +4280,11 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 static int wcd938x_reset(struct wcd938x_priv *wcd938x)
 {
-	gpio_direction_output(wcd938x->reset_gpio, 0);
-	/* 20us sleep required after pulling the reset gpio to LOW */
+	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
+	/* 20us sleep required after asserting the reset gpio */
 	usleep_range(20, 30);
-	gpio_set_value(wcd938x->reset_gpio, 1);
-	/* 20us sleep required after pulling the reset gpio to HIGH */
+	gpiod_set_value_cansleep(wcd938x->reset_gpio, 0);
+	/* 20us sleep required after releasing the reset gpio */
 	usleep_range(20, 30);
 
 	return 0;
-- 
2.34.1

