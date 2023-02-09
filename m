Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00126908DA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC40E83;
	Thu,  9 Feb 2023 13:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC40E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945908;
	bh=g8yWAMHOEtKPU4VyJRz6nq4Fyg2cTCoz+RcmRnQqw44=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tkSsJ21uRI0Sj4xASPof+wqFvJKxNCbrVFcUW83/ora++R7GgvyQ078ncxjkN6pPD
	 rO+s/gJiyBD00szJQloYTa4XAf8lsC+RnJ6Ygc9rYAowIrmF14rMXN0yDjs/2a7Thy
	 liXPam98p2Qll0qoJYuXPad5H3oOvMVWBdkiGWj8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C26F80570;
	Thu,  9 Feb 2023 13:29:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39023F80551; Thu,  9 Feb 2023 13:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CC7DF8021D
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC7DF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QJVTqSRd
Received: by mail-wr1-x436.google.com with SMTP id bk16so1568699wrb.11
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdgbNuhnuI8HvGFss/JHz5QrLG7sfZSeSJMIaBHo/bk=;
        b=QJVTqSRdqqHcybqhGKd2Rfv9F2xEWixeuwVkVGwpshvwk/g848tUi0Tnis3ZZPWjWV
         6Uy+gztl/cYhIirToJICkm5iwqJYu/Uk85Q15oUO6TjGoexpBWWIy1trXUCg7Ynh46Ku
         t/Qkd/tQhXlzuF43Oqd24cCfB/nMbl3CCCqJFaU/U1CWygEnXA+1F2esIadvmGjC2o1e
         MBGndlLA5y0/4A6mQ9+piQKENLzl3YM0lVIF3lZdPskfaTS8IuqVw2espMWsccbBEfc2
         oiGb/P7q7J9IzWau5/7x0jw+TWoH2Nvpo0RxUUMKnuArv9rj1EMfl2khyTzwD+VxJHLj
         R0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdgbNuhnuI8HvGFss/JHz5QrLG7sfZSeSJMIaBHo/bk=;
        b=09WD9TSP7wu2dLXU8JEohkKb58iuVLCbh9+g32lQwkRgn6Q5NYQmOrew3gAbmm0BvP
         Lqez/aP6zbqX5rmfwAYQT1vLZbuVNzVGxcXR4fLhB5Vxt82u376AoPslRjUyxHOuvXw+
         2SyxBxcutJtdblD890aDafwIHFnSwADCTgy2AgcnO2XYPNyPoHE7xW5TmckN5+Dsy59b
         8nl70YLWh1rs4+iPyg4KO3gZ20Nl+VGRB/N+e85dIlmNOnrZC+dtp1uHdVSpwFLCivgb
         627nNon6Fy5fiTLWTdbryJxneTv1frKzqwVxebDIi2h/56c2dNr3bTirCqEcwtpH1Gt6
         562A==
X-Gm-Message-State: AO0yUKVLkjUsNgkKOjqmX2coX4HHu1E1lNGe5aicVssSk41yT/q9TR0/
	BYKODvMvb2cHq5FCYnOk64fuPw==
X-Google-Smtp-Source: 
 AK7set/t5oKzjlWyATb/30pIVAqCDe9grRBKvQ8EXy0hhIFD0gb2WbEgVKamQN6iPJkux3DL11JsNQ==
X-Received: by 2002:a5d:4806:0:b0:2c3:ea6b:ef83 with SMTP id
 l6-20020a5d4806000000b002c3ea6bef83mr11677540wrq.12.1675945701608;
        Thu, 09 Feb 2023 04:28:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 5/8] ASoC: codecs: lpass: register mclk after runtime pm
Date: Thu,  9 Feb 2023 12:28:03 +0000
Message-Id: <20230209122806.18923-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W42NEK6ORAWDOJEOL4HUGSHX2QZDJQI3
X-Message-ID-Hash: W42NEK6ORAWDOJEOL4HUGSHX2QZDJQI3
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W42NEK6ORAWDOJEOL4HUGSHX2QZDJQI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

move mclk out registration after runtime pm is enabled so that the
clk framework can resume the codec if it requires to enable the mclk out.

Fixes: c96baa2949b2 ("ASoC: codecs: wsa-macro: add runtime pm support")
Fixes: 72ad25eabda0 ("ASoC: codecs: va-macro: add runtime pm support")
Fixes: 366ff79ed539 ("ASoC: codecs: rx-macro: add runtime pm support")
Fixes: 1fb83bc5cf64 ("ASoC: codecs: tx-macro: add runtime pm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c  |  8 ++++----
 sound/soc/codecs/lpass-tx-macro.c  |  8 ++++----
 sound/soc/codecs/lpass-va-macro.c  | 20 ++++++++++----------
 sound/soc/codecs/lpass-wsa-macro.c |  9 ++++-----
 4 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a9ef9d5ffcc5..dd6970d5eb8d 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3601,10 +3601,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
-	ret = rx_macro_register_mclk_output(rx);
-	if (ret)
-		goto err_clkout;
-
 	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
@@ -3618,6 +3614,10 @@ static int rx_macro_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	ret = rx_macro_register_mclk_output(rx);
+	if (ret)
+		goto err_clkout;
+
 	return 0;
 
 err_clkout:
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 2ef62d6edc30..b9475ba55e20 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2036,10 +2036,6 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
-	ret = tx_macro_register_mclk_output(tx);
-	if (ret)
-		goto err_clkout;
-
 	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
@@ -2052,6 +2048,10 @@ static int tx_macro_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	ret = tx_macro_register_mclk_output(tx);
+	if (ret)
+		goto err_clkout;
+
 	return 0;
 
 err_clkout:
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b0b6cf29cba3..1623ba78ddb3 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1524,16 +1524,6 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_mclk;
 
-	ret = va_macro_register_fsgen_output(va);
-	if (ret)
-		goto err_clkout;
-
-	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
-	if (IS_ERR(va->fsgen)) {
-		ret = PTR_ERR(va->fsgen);
-		goto err_clkout;
-	}
-
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
@@ -1560,6 +1550,16 @@ static int va_macro_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	ret = va_macro_register_fsgen_output(va);
+	if (ret)
+		goto err_clkout;
+
+	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
+	if (IS_ERR(va->fsgen)) {
+		ret = PTR_ERR(va->fsgen);
+		goto err_clkout;
+	}
+
 	return 0;
 
 err_clkout:
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5cfe96f6e430..c0b86d69c72e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2451,11 +2451,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
-	ret = wsa_macro_register_mclk_output(wsa);
-	if (ret)
-		goto err_clkout;
-
-
 	ret = devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
@@ -2468,6 +2463,10 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
+	ret = wsa_macro_register_mclk_output(wsa);
+	if (ret)
+		goto err_clkout;
+
 	return 0;
 
 err_clkout:
-- 
2.21.0

