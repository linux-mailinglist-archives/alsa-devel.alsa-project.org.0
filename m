Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2191BC6F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18D3A2344;
	Fri, 28 Jun 2024 12:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18D3A2344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569650;
	bh=mHTTaZNpcGoV/mUxNlKDTFQQYgAom9YHnI/rebyFS7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YlX0boDwtDlOq7yPZW3FM0EbuYvnnM3tCgwwqlV1qqPjsJIkWF+F082Fc0ialu38q
	 rXNU6BvafUKtotofhRInTjDrdd8McjQzSJdS7dSY1h8UgjVW8K9mwhVoL9a8sp3DzG
	 cqBZrBnAVmVBMit1/W0pS4+gDlUZkYjHzepblK4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E61DF805C5; Fri, 28 Jun 2024 12:13:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68FE8F800E4;
	Fri, 28 Jun 2024 12:13:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECBFCF800E4; Fri, 28 Jun 2024 12:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6075DF800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6075DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jKGIVRcw
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso3817505e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569497; x=1720174297;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=jKGIVRcwd39Twv0/S6Rflc4pAECxVpD2mYrTmUtH46mQlEND0DYzwQJKTB/6cLo46s
         wJSpVqf/NvmnXQslenv+elhNtrwvOy0mkyITyIb0KXfpenI9wZXnn3foUhmQCG41npr/
         x3Hoqf9Z2YS4dXssQl25/7XJLYzm95C06C9kqpGgPspKSfCK5f2BQwUG9LSfo3ptxiNK
         2lfsTRlOVG2pqfti7jTTPSzr7z/zqYsn3A+VU9R5XyTHokJhIACe/f4+gPBfj57RjsgK
         astVYLlyYIKWSMk6djJIH+GGOxLgVkODkgYX/LSka/KtTkLnabmLRxAHyCh04zhX1Od6
         nNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569497; x=1720174297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkhZEX+m4yRFERQhljwkeNudJNH97Tx+yLOdy4DNmag=;
        b=ifwRyCrFx/tgaGw0eW3TP6zszDxFdEVo0BZiQkuqBW5Vhx0nLoo6B6RCOnJAjsjWYF
         NOAmRi9ofP94qaBTzvTg4wWlTqYkLpGAsNn3ZleJqKUteqFlNDz26xga6BpVf99wlGPL
         k/aXvn1qqv3wrZZNHyGb7S7Dmu7ii4lOFh56yxT2bArXFKZ7pYNU/9Tvm7xjZPsUDLUO
         bwa8p0u5fhtUIUEFYhuuvlY6Zviklje5S2+WDfIdQfRgBcnxudyi4wtZFH0ynuHETx6q
         Mph4PD+h+VsANvN1CDZF9PqENLT3vmHkCW9Kq1Hx5FGDQK9F1Z7aPcb4kMFMdaN0jVUb
         MLsg==
X-Gm-Message-State: AOJu0YxxpexwPJ2rxDuw2e2+bhE3RX4NFwyfZ4XZrcovMjYNaausqWDu
	ublEf7YecN9YE9lazaQxYljgLjybwsYed8Cns/xJI9A0D/w6R0lU5xFygRF/acE=
X-Google-Smtp-Source: 
 AGHT+IFZAKYRP0ELHRLqVkzPXiFVn5Ahxi3UScj47Vi/DSByvBMN7t47V/esD9G6nGISyat/slInbA==
X-Received: by 2002:a05:600c:5819:b0:421:5966:ca40 with SMTP id
 5b1f17b1804b1-4248cc2a7c5mr108666635e9.10.1719569497596;
        Fri, 28 Jun 2024 03:11:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:59 +0200
Subject: [PATCH v2 5/5] ASoC: codecs: lpass-wsa-macro: Simplify with
 cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-5-e9741143e485@linaro.org>
References: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfoxByjErZrFpA2io6CZmKX5eVHl0S31rLIcwQ
 2f2VwflwMOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MQQAKCRDBN2bmhouD
 18JEEACLa57k2Kdt04/TAWG2YVD7j2medFXWR35HQqZq7tCGbwlbGgmOIKAkK7gTKhV0C29W70s
 K4EUklMzCu1T1sfEXj6loRtyiBuF8ECRNzkDmUSRosn79fMoSb0O5AjiFEREM/x+kTZB8dhE5P8
 eGSW7/ZSPR6xwngg/6MXkoYvAkoUhygozoe+s28L9kOdaHGyWL+P+dR1vt68dR4xieRaD4ODGE3
 AACvLmKGSDKw9nnyo+d+2+KMPX9rmgZTPXFLA4WAS1X+C5i6ZK5MkDI2SyGs18M9Mhn/beLJ8+2
 +RmSuGfpAiaeD3el/FM1sIQPLbPE96AcoxHB9SwtogsJF9HvO7+PkiRGhtDmOk+G84pgt9NGwgA
 9/Tyo5wZffwXH3UmzTC5VylYGtZ30lcZDR/K4Ls/iLMZowfqF2UtAIbEKj6t3ds3SYLZ5TNxYT/
 vxetsm0/b8K/2eKgcsmN4RRQYCFmSUYv42sy/Aa0KhPMltTdaPfJmcPZI8DcEo27ihzMdM8i8fG
 SbtIZf5DlMSMQMKqSkLMu/1PqlIOlHNMyhIpHJJ+5WbOfWiFdL9TZ8SAYwjR/5hwIs0U4PVE2JO
 BO4yzz6ETyhEimP5i9EWWrxI0n5JPxufOWDo2CKnk9XoLTyFXCUVAfQtUOFXBKrLDa3PAQMhqN9
 fC8hCTxQmqvjJaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: RGMJKPFPC6CQ2WU4RE3DAB7ZIC4NN72F
X-Message-ID-Hash: RGMJKPFPC6CQ2WU4RE3DAB7ZIC4NN72F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGMJKPFPC6CQ2WU4RE3DAB7ZIC4NN72F/>
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

