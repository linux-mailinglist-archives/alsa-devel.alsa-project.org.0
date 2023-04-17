Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E471E6E4B3B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 16:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEBFBE11;
	Mon, 17 Apr 2023 16:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEBFBE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681741041;
	bh=Ka4LVzUhoMFE3p8/rmvKZeBMoeQATjlJQ/Lo5zaeFQM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VA3RdokgVNZxXtzoEGEl09iGgbyVBzMYQMvKupaUrWlGq70cj0esqOf4tN1SQAh9Q
	 UwXlg2Uobmcznfu93/9BOi9+VE60xTFQKS1keH5oqCtyReyyEv9cgUZirRtTNI5PA2
	 YRLWx9loVogwrqzGnAs3CtkmjTuWUHy621Yc0HgM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD003F8025D;
	Mon, 17 Apr 2023 16:16:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF76EF80269; Mon, 17 Apr 2023 16:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 614CEF8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 16:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 614CEF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RzE+hWQv
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so20347974a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681740897; x=1684332897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdSLfFTkv6LYV3M0mzyuGaPRuWS7s/5vp6QK5VHSwvw=;
        b=RzE+hWQvLG+ToUxcaDtEz9Q3e8NAYpfR7V5FIpzDQuomR5owNFdDhUvH2QaJipF10D
         GWjQqAHBtrZGC615Ls7NgtT+6C4C1jOjVw0B7hMOEY3u/fUyHuT3t4TsOAkAKWsVI1h4
         AEfglOWetOIog4xZls6MOZJkql6492Ni2Zw4EoF5Qo+zrz5dJPENj1jeJIRTF9U1khZ6
         fn936x3xvUrAzwgWBXafJCWCBWUufiAkTrw9X8JlPtynRTseumDspzinwkfJVPxg/qgG
         ZZ4hsxxTHKzvHpblKwulKigeP7Nw7tZNwiWpKpZlNnxIC1QrXUS+vvo4QSm+yRiHh8Qc
         zanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681740897; x=1684332897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdSLfFTkv6LYV3M0mzyuGaPRuWS7s/5vp6QK5VHSwvw=;
        b=VzQBDZRIgxYXlfXR6LXCmdx5T4eyTKepn78FNTVnraS+8hcGHdCV6UKmhFgklCFtZE
         LPlBpffyRZ75MCxAw2kAI1puomm+KSQw9BCFoO1+6N10OK6bp0tZJ+cBCRqL9LTS3SNS
         mQHCpY0wRsOb3ED59GRxIzGDNx1iBt3wH5gKad2DJJWrYjIuSt+IBNBAy/xs1mY7G3Bl
         q4hHh7whOsQYJ7KF1It15LctlO0mogRDLbzE0CAJqWHJwKyHYIynUfFaTkNG7hhmRNiK
         1iX5wpqz/5Fw/AcqIQ/jRFSYi3VjM4xAndUPzffafsQV4p0aBiyJ3C5+o478BG49omyO
         DQjA==
X-Gm-Message-State: AAQBX9cekzKn26rgzCgmHeVcx97csALiPPj+kvttdGKN/2pM4/qzg1cA
	iOQCdZ90PJpSG3xNb1jC2Q7tng==
X-Google-Smtp-Source: 
 AKy350ZpK+Q0Lk/sUrpuzdbTEMJgrM0zQiaQj9MfhnmQ30N0Ripjw7eud+5jh+xVfNdGhumzqyNY+Q==
X-Received: by 2002:a05:6402:4cb:b0:504:9350:f458 with SMTP id
 n11-20020a05640204cb00b005049350f458mr13585489edw.1.1681740897195;
        Mon, 17 Apr 2023 07:14:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a056402040600b004f9e6495f94sm5832034edv.50.2023.04.17.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:14:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Date: Mon, 17 Apr 2023 16:14:51 +0200
Message-Id: <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWSG3TVJRA6WJJQH4HEWJPGVLEX6NPEW
X-Message-ID-Hash: BWSG3TVJRA6WJJQH4HEWJPGVLEX6NPEW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWSG3TVJRA6WJJQH4HEWJPGVLEX6NPEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Code can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 783479a4d535..56487ad2f048 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5868,10 +5868,9 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	slim_get_logical_addr(wcd->sidev);
 	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
 				  &wcd934x_ifc_regmap_config);
-	if (IS_ERR(wcd->if_regmap)) {
-		dev_err(dev, "Failed to allocate ifc register map\n");
-		return PTR_ERR(wcd->if_regmap);
-	}
+	if (IS_ERR(wcd->if_regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
+				     "Failed to allocate ifc register map\n");
 
 	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
 			     &wcd->dmic_sample_rate);
@@ -5923,19 +5922,15 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 	memcpy(wcd->tx_chs, wcd934x_tx_chs, sizeof(wcd934x_tx_chs));
 
 	irq = regmap_irq_get_virq(data->irq_data, WCD934X_IRQ_SLIMBUS);
-	if (irq < 0) {
-		dev_err(wcd->dev, "Failed to get SLIM IRQ\n");
-		return irq;
-	}
+	if (irq < 0)
+		return dev_err_probe(wcd->dev, irq, "Failed to get SLIM IRQ\n");
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					wcd934x_slim_irq_handler,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"slim", wcd);
-	if (ret) {
-		dev_err(dev, "Failed to request slimbus irq\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request slimbus irq\n");
 
 	wcd934x_register_mclk_output(wcd);
 	platform_set_drvdata(pdev, wcd);
-- 
2.34.1

