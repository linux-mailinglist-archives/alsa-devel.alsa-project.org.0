Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A791D937
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B1B21A4;
	Mon,  1 Jul 2024 09:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B1B21A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819707;
	bh=mHTTaZNpcGoV/mUxNlKDTFQQYgAom9YHnI/rebyFS7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vy0zdFYS6nvLWXuy9v6KSTAd9ZCd/C6woollR6XZjHrHV+WJZ8+85RqZyNh4ZwJdx
	 EACRKmZ1elUKwSOVJK3tBKBdxwTcN9SLFGZnqgKyJMNA8XELUUsLGmVpNEW90dBlTE
	 SLVp+O4E9uU0ouX9zVABdsyAKNfeJcrTIoOQw3Q4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D98F8064C; Mon,  1 Jul 2024 09:40:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A34AF8065B;
	Mon,  1 Jul 2024 09:40:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56B54F800E4; Mon,  1 Jul 2024 09:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 138F1F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 138F1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jli5E1dP
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3676447928bso1556092f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819594; x=1720424394;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=jli5E1dP4UVRUiRPsBXgUUO7412SU5dcSNqao7xyq2/O6bdpkYErNWaw4phHIaVhrM
         5JQre60COfzK1vtZJON4jcOebXjDzofexpSPBSeOrwBAeVQoZ8WgS2E4/+aEEbiAzNrP
         Jg3NG+8xXiH0MvE+h+4WwPxYyuZVSCeycGVG3KptvRH01xzps6taI8wkbEDyfvCStEmB
         5WzL9TdrO+m/rC18FM9zKXgRG/uS90r6S7GS964ZPvVpQRA3yVE1iCGGtUUgxuRdWYg0
         tiGGG+Gx9MBgiG7SVlB01vap8fTtUDsQsQ1QlbouEQffWsY/U/9o+M7g0O87gGaiszlG
         OYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819594; x=1720424394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=kFj4SliOupBK2NkjOedotaJ11ffCOxM2bXCduUmnird7piASyG4KVFJxNeVUgIHWFV
         bpW7YUNXFLkWIdYW8d9LZMQ2xmT3UuCFgb8vVcfDQQiVLlbDh2Y7kV0y+ncqL2PMw+7w
         3irpP1kpmocDWgajAhQlkYTOhPZ7FGyseELVJRrqkqgK9WJYt7lLJEtnPYxlfmhEz6o5
         H2HKh4qIzHfkVLXcWRCpmb5mTRMDMJ/RApqJr1P9WHGxCMtXUvSwz1GGY5re2gCpMYqR
         7USpCM3fENRIjXcdKMO8S2A/4SdZpkExyy3n8Z6bmlrQR7E1lld+ZnRTxwiit06ycoMF
         KOCA==
X-Gm-Message-State: AOJu0YyUSo5A52uTlf6nwJRe+0J8SIcum5p7XiUeT/98g39oviFEG4Kv
	ObWA8YssslHCaFHYdRcfhkjUNWihN6Yj8aOM5oesH9HWbI9arvVljWapceFuQiY=
X-Google-Smtp-Source: 
 AGHT+IELAP7OOkaVhC6selMuvtx3yRVOwXrHRpbUfCYh3qaNYGybZnve/dhn7uV2G1WhEKJKJ5oHWw==
X-Received: by 2002:adf:f48e:0:b0:360:8537:ce27 with SMTP id
 ffacd0b85a97d-367756e5165mr3354107f8f.42.1719819594023;
        Mon, 01 Jul 2024 00:39:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:38 +0200
Subject: [PATCH v3 6/6] ASoC: codecs: lpass-wsa-macro: Simplify with
 cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-6-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3389;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mHTTaZNpcGoV/mUxNlKDTFQQYgAom9YHnI/rebyFS7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl1AQS92yL9416c8UVe+w7/0WkAuH7E1cdUAC
 ++EDTJccBuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdQAAKCRDBN2bmhouD
 1wEfD/wIHxe8tcpCX1EmCOcXJt2sUUnucJDFR+nNQ+DNVcA7ZufKmvMsEHQ1Mi7g7Ju0uhaRR9J
 DU9kt5wS350/08AZerCK99VA1Og8ddZwmAZ/gJoQXzKowQyjbwMw0gLheSEWkr1i1t3vJGpQNnS
 NbN/Gjg+IVHxrOCKgq68825mk5Q7v5WWM76u2201s4xIcSWajthZDoY6TM0C3x1rFsFckGBbvnc
 5zaPV8b5+UENozlrb2tSuKcDpoCJ2WS5MmmfkDhRzya23JADD3/shIZOzt26mrGnItt5ZRS7az0
 BQMFrrPRyYkc4GD1Po0YF72bdvPUTLyEt67WmKIlnnDUcOWe9kH4sE/Aey/+/JfURjkho0uEHpZ
 l6v9dHxXFMK2v9T5MMsh2IHA4sxRxyF0329W8cHUOFMMe/UM/KKXJPBkB1VbVacSukanSyyPt5D
 fVVisrQTdJbZWNdnCKCOXi0OEFBMr5m08sg0Oqn45wxTywy0E9yuuOHE5P9YXKnoQy5QhgDiS67
 zJfBW//uMxxbHNeFS9UMCc2/7Jv6hWt70uKbtsAM0D3/faMH1AZrVwbv0CbRiIrn4PGdZsVMLPz
 zqXSAD0WJtPyD1Y3i1yIeqy09EzyrfW66qIKWYsncv5VcNTY3+3lv1axz1fX3DfXqPbMniYeF1y
 ydRmGBLBBIPO6Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: APCJIY23YIJ74E7TJNKXHNSMYQKUUVUU
X-Message-ID-Hash: APCJIY23YIJ74E7TJNKXHNSMYQKUUVUU
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APCJIY23YIJ74E7TJNKXHNSMYQKUUVUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver's probe() has two allocations which are needed only within the
probe() itself - for devm_regmap_init_mmio().

Usage of devm interface is a bit misleading here, because these can be
freed right after each scope finishes.

This makes the code a bit more obvious and self documenting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/codecs/lpass-wsa-macro.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index b4e7139bac61..73a588289408 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -2725,8 +2726,6 @@ static const struct snd_soc_component_driver wsa_macro_component_drv = {
 static int wsa_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct reg_default *reg_defaults;
-	struct regmap_config *reg_config;
 	struct wsa_macro *wsa;
 	kernel_ulong_t flags;
 	void __iomem *base;
@@ -2765,6 +2764,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	wsa->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (wsa->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -2773,9 +2774,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_1:
 		wsa->reg_layout = &wsa_codec_v2_1;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_1);
-		reg_defaults = devm_kmalloc_array(dev, def_count,
-						  sizeof(*reg_defaults),
-						  GFP_KERNEL);
+		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
+					     GFP_KERNEL);
 		if (!reg_defaults)
 			return -ENOMEM;
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
@@ -2789,9 +2789,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_8:
 		wsa->reg_layout = &wsa_codec_v2_5;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_5);
-		reg_defaults = devm_kmalloc_array(dev, def_count,
-						  sizeof(*reg_defaults),
-						  GFP_KERNEL);
+		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
+					     GFP_KERNEL);
 		if (!reg_defaults)
 			return -ENOMEM;
 		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
@@ -2804,8 +2803,9 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	reg_config = devm_kmemdup(dev, &wsa_regmap_config,
-				  sizeof(*reg_config), GFP_KERNEL);
+	struct regmap_config *reg_config __free(kfree) = kmemdup(&wsa_regmap_config,
+								 sizeof(*reg_config),
+								 GFP_KERNEL);
 	if (!reg_config)
 		return -ENOMEM;
 
@@ -2816,8 +2816,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->regmap))
 		return PTR_ERR(wsa->regmap);
 
-	devm_kfree(dev, reg_config);
-	devm_kfree(dev, reg_defaults);
 	dev_set_drvdata(dev, wsa);
 
 	wsa->dev = dev;

-- 
2.43.0

