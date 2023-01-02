Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4765B15D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D4C94C0;
	Mon,  2 Jan 2023 12:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D4C94C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659783;
	bh=19hoyM7gyr+iZri5Jkw92etnXJ/987uLNLGSpQhCvD4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cyP8wmChdN7SLlRaYxOgF7ALgIigKHs3BKPkKXdh55+h/ApTRiH+P9Wd5wJUgasQ1
	 tno5QDgk2WYKE3o+EIuxC14sEd0RCtwo4fUkJhHI7rrgUGLNRzNcJlew0P8LDrX6tF
	 ly+ZjyosB3XU1E6PoUaOfpQ83BpLW5YVTsoE/izw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C70F804A9;
	Mon,  2 Jan 2023 12:42:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD9BF80240; Mon,  2 Jan 2023 12:42:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A884F800D0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A884F800D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ROrZRy6C
Received: by mail-lf1-x12e.google.com with SMTP id g13so41222830lfv.7
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ot07odIMBdi99ZptGGtgBesy1j3BRGxC/hcJ0N+TCxs=;
 b=ROrZRy6C2QbxPLI+6Vx8HBTPv6HMBgAkapWo4sNLlX5XPiqHt6cS/4G2lfiTCCQmUj
 pGJ0nRz91ehp4Po8Du+hLVqytJyUgi90OkhcfIv0jKwYu4ZfVVt8MxDUZmQH5FORMLSW
 67wHSUpVcnXxIT0LsIhhTdu3JD/UxQ9HrbZc7Ep98ixE7tTtP3o7Xw3OSIqwMNjnf9jH
 ZlJ3UOr7X3M/fcDlNiUneZk2HyBMw6rLHFMI1zFTWVsIrRxzWj/XJ21W8o9WqBpcVnl9
 HcUGI6MVNFYOGKxf9p4soTjaWJKwHlvEhG+4qPrFw+/9Cz+vQ16xPrV/AjN/u1Fezuvk
 SHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ot07odIMBdi99ZptGGtgBesy1j3BRGxC/hcJ0N+TCxs=;
 b=RxLqRzmk5antd582su8m0ogWZKrqn0R0T6fo9kdwTbWQr43PtdPzpi3gCXJettTem6
 3AxsGJZZ5IvFrWJSn9WCeghr3OvaR5jMohgB2hEodCB3Lxmza1O2w6DtFUu1AwFLCnsQ
 vFyPEI2IMaPtevm9vZDi2Po/O49ReF2RQAnHzxy3tAy4IAVlBD10rVXNO8zDFmjyx2N3
 N/YslK4KTFUgfAy31lSMP7naoW2I8bUrOiFn+NDKzSQ4r1wI4TCLzCksBZNr96MHCANF
 65sRz/4ebcnvGbLhaPYyvU22MxXAXza1FIJnOpPQMfUsaKWq72yuyk0s+pXul09m5CRX
 pqzg==
X-Gm-Message-State: AFqh2krxEpo6W8sszNR8NETjKCC8sq6g/JNL5LZRROv9NB7t9rCTEZnG
 nAtzH98+u+HXO/v3fhhQfWVL0w==
X-Google-Smtp-Source: AMrXdXvnjqG2Y/pyr5nZjYWE9uLYb988hSA8gSfnRbitymR+6iWVJQzN6BffnHeN7xCV/A4uvftQNA==
X-Received: by 2002:a19:f517:0:b0:4c3:35b3:9a0e with SMTP id
 j23-20020a19f517000000b004c335b39a0emr9440867lfb.56.1672659717229; 
 Mon, 02 Jan 2023 03:41:57 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:41:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ASoC: codecs: wsa883x: Simplify &pdev->dev in probe
Date: Mon,  2 Jan 2023 12:41:45 +0100
Message-Id: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The probe already stores pointer to &pdev->dev, so use it to make the
code a bit easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 966ba4909204..8d69ed340e83 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1375,7 +1375,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	wsa883x = devm_kzalloc(&pdev->dev, sizeof(*wsa883x), GFP_KERNEL);
+	wsa883x = devm_kzalloc(dev, sizeof(*wsa883x), GFP_KERNEL);
 	if (!wsa883x)
 		return -ENOMEM;
 
@@ -1388,17 +1388,17 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
+	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(wsa883x->sd_n),
+		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
 				    "Shutdown Control GPIO not found\n");
 		goto err;
 	}
 
-	dev_set_drvdata(&pdev->dev, wsa883x);
+	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
-	wsa883x->dev = &pdev->dev;
+	wsa883x->dev = dev;
 	wsa883x->sconfig.ch_count = 1;
 	wsa883x->sconfig.bps = 1;
 	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
@@ -1413,7 +1413,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
 		gpiod_direction_output(wsa883x->sd_n, 1);
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(wsa883x->regmap),
+		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
 				    "regmap_init failed\n");
 		goto err;
 	}
@@ -1423,7 +1423,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
+	ret = devm_snd_soc_register_component(dev,
 					      &wsa883x_component_drv,
 					       wsa883x_dais,
 					       ARRAY_SIZE(wsa883x_dais));
-- 
2.34.1

