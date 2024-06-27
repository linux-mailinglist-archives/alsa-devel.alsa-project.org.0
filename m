Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453C91AB28
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7E21944;
	Thu, 27 Jun 2024 17:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7E21944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501900;
	bh=bGXi5j7RtMWqTV/YOEsZohRFyc1PuafBeHL3YjZpRpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMD/6OLvHc/YRtczkK7Wz/2Gjkv09VUx7VCyyXcGkHLzUzhSfjoJ1tCcyaAI/3Qku
	 ZFm0Py13kYiC27nb77Fs6o75QnHNUkHHKlrqBbbZjiCImssQEyyYCDqyO8l8gMDlAN
	 amMKEebFa6BBo7GvPHqzWpPBx+NSnCiY87LKbxKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D8FBF80601; Thu, 27 Jun 2024 17:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 225C4F805F9;
	Thu, 27 Jun 2024 17:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F321F80495; Thu, 27 Jun 2024 17:23:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AD15F80154
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD15F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iV+vsZAe
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cdd03d6aaso6090744e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501832; x=1720106632;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYQGDqdm11IXNknTjts1TE9ajQ2ABZYYP3j2vEJ9x9w=;
        b=iV+vsZAeMeb1M+RzlL50X1znydFPqJdGdjWTnW9pcjT29/L58URUTHs7ZBvpMHguh6
         nL/KQPLvf71R2Opy/5U+PJ9cVXWdvPiZrfUGR2utlEm9QW9XlPHXva+9KUkL4COetj0J
         TiUrmsY2ACjZ2CX7A9FQTKB5G4XgJ+KZ+jP7w2vu4lQ3OYWc01J98iyFkojCSAQC8z7p
         OQUNI14KaXdZi2qxLo5C4ieE8/9MtWUdS2Fk8pV1UQk0xpbSEMmZKIWpACAHvqBhsIrV
         b/stngKjcfPFMJkWrQopNgjd3hGDSLPmDj7riYyTmYOQwi18om+/wmJBkbJjDyrJ2pA1
         CSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501832; x=1720106632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYQGDqdm11IXNknTjts1TE9ajQ2ABZYYP3j2vEJ9x9w=;
        b=dcUSEDeJDk7F+XwZOmbHHQqX/+xgpPWwadHvyh+XMMN5UIIrGv7Q84HkKavraHsUZ/
         GPI0snmz+2VrRVUcHsBT/O/m0ySMnPTiTW5gnmBrjfouP16eTggLnObjKopK22qwowNJ
         JdF0KNKMUcDJrUGd/J2331CsYb7OoAPnoRcIkIOejsruSiMdDVbJf7DZfcVnG0ZU50S7
         MDqbA8YR2OTHzPsVSlERZScF//87TwifcYNeYLAsPpnTwr7VUT/kup7DnQZIbccejYV/
         BKO6sNE2yOO2gaJQ56B8WZfn3/BJWCtFgNscE+cuSO63SXu9qwyqB/pMLzNRBNCWjOp5
         I72g==
X-Gm-Message-State: AOJu0Yyg5JCV7dp2Mwy2DL3h+yYt8gDV6vSEOj9mT98JtdHEJFRaXqNZ
	xBMZrgfhhPHayeM/Rfg7VV7vIISpinsGImagWj1LRDmYEoiLKXtNXkZjySq7ydg=
X-Google-Smtp-Source: 
 AGHT+IF9f7edEKwKerNIjhX3uTXOTM1OPnrW5fODb6A/0TRznA8i8xLuQYfbAyXq18C3tMQn2lJbpQ==
X-Received: by 2002:a05:6512:3988:b0:52d:b1e4:b327 with SMTP id
 2adb3069b0e04-52db1e4b3eamr4743847e87.43.1719501831927;
        Thu, 27 Jun 2024 08:23:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:44 +0200
Subject: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bGXi5j7RtMWqTV/YOEsZohRFyc1PuafBeHL3YjZpRpI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQBx7fY0kBJ6jxCqWdY53la071tLtaabndv0
 1oUeEZeorqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAQAKCRDBN2bmhouD
 1yaxEACWVO+e6qA0ml86PfmOMaxQrfhrDhHJZDwq9gLbpH9gauNvKjHRjs/cRMitM74rqiTToDr
 LhxqR09dLUBiLiFNXwXlT6jvzLrDeFq8JJiQER1cwbe3woa7ZVT/eCdPDg1oBD0Iqt/bJZZmoLJ
 Ook2x1Wst9yTJ3XtyYN7PYn5MU7saXsHWiXIMonKKzkGF6EZYLNSQeZoQua12hI4Os/SFRleSvK
 jJ4WfYQjlrKGH7vgKEWF8LbFWdr89OHdACdjNHDipmvFaH2+JmOYuM8xdBhR67qLi3y/BZFiPIC
 EgzMM7qpSQyK7GUPnycZgim+5ZXmUmQ4RmwvfaZx+eeM3jyP1fDbNYmep1nfUZRh4XWm3xhVd+r
 4KNh6/ymz9ockw8H6J8gYkr9VoVROJ8DXUlm2eaf7vXaliBPfatmhejfdKOXkrjQRvzRi3A14tr
 tIUr+oehD9e//w99AgzREShKuZ4NYIratbA6YRftz3s2t6D3pLdoD4ocrzO8I9W00jX/CSNzX8g
 +qvXzqmNC5xcwevDI2drbRpb6qn7j5ZcTRaDSgfwI9/a+9xzgeJ0d7cJMhU7vEAEncPdrsf4LxV
 2Kt019sa3oRdD/xoAk6VKaI6wHqaaItuD6GUY+Bwmuf9t5iTf/0XtV2yXMAR0qLAk1/W+S4XLoL
 fURMQr5rzgXvFYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JXH3OSBFWTNL7JO4BQ5MM2IJUPPXNKXZ
X-Message-ID-Hash: JXH3OSBFWTNL7JO4BQ5MM2IJUPPXNKXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXH3OSBFWTNL7JO4BQ5MM2IJUPPXNKXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has static 'struct regmap_config', which is then customized
depending on device version.  This works fine, because there should not
be two devices in a system simultaneously and even less likely that such
two devices would have different versions, thus different regmap config.
However code is cleaner and more obvious when static data in the driver
is also const - it serves as a template.

Mark the 'struct regmap_config' as const and duplicate it in the probe()
with devm_kmemdup to allow customizing per detected device variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 59fe76b13cdb..3d8149665439 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static struct regmap_config rx_regmap_config = {
+static const struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
@@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 static int rx_macro_probe(struct platform_device *pdev)
 {
 	struct reg_default *reg_defaults;
+	struct regmap_config *reg_config;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	rx_regmap_config.reg_defaults = reg_defaults;
-	rx_regmap_config.num_reg_defaults = def_count;
+	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
+				  GFP_KERNEL);
+	if (!reg_config) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	reg_config->reg_defaults = reg_defaults;
+	reg_config->num_reg_defaults = def_count;
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
 		goto err;
 	}
+	devm_kfree(dev, reg_config);
 	devm_kfree(dev, reg_defaults);
 
 	dev_set_drvdata(dev, rx);

-- 
2.43.0

