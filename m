Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB4629683
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99880168C;
	Tue, 15 Nov 2022 11:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99880168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668509864;
	bh=7zDS7OasafTD4N2CxQrxEfhjvQzL+0nqnx1oR0rHj7k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wofxu1ZbVPR0bOhnVhho2/7FeWJx+/ZnTNVm+xzD6gktmoO3teRF1wZXtY0nIt424
	 u/CvkaCN2rrDKaXjDpSt1xZHb0iSBlhaGANk7KZ9CfwgsWRS6PfkP5eEI66RU3qtnS
	 RX+IaQjM0zE7Z2Mh4Rr6KUnQRMi33ahapWr3Rhf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF17F80558;
	Tue, 15 Nov 2022 11:56:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8483F80557; Tue, 15 Nov 2022 11:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69339F804C2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69339F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fJcHcyqO"
Received: by mail-wr1-x430.google.com with SMTP id v1so23542519wrt.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEZm7AO72PHR8XXAieuiGQq4vGYxo48R04rB6nNJWT4=;
 b=fJcHcyqOrrgOgwsSt2rCsZ/uwD3S/JL4d47KGHeh/Tf6mK9Vku8dZ/oXPmb0CQV71J
 P/s1aoBhCg2+b7c0tJIIg6yjtekcSENMpBdMa7u0QLrWoJ5Z7LeuFxaeC5Ho+z34MMmf
 gP3KVaSJePtzcW4nXsHWNIhsEd1Cl2J/HqN9nHxC9Tr29J/BWN15Gj0lqYGJ1EqmWoF3
 Th0R3cv0rglBYQ0SbQ8fWFTh0bkaU8d7P81eWas1KYEViDmobZWR0kMMAc8IDGcOhUlw
 Yf76wd8OZqbJZU4K0Bj5Y7/k/2x0bgW4EVD5s14hUlW3CKHzDos1A+sbmqn1fHios0lk
 EQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tEZm7AO72PHR8XXAieuiGQq4vGYxo48R04rB6nNJWT4=;
 b=ay8oasom/lAQQqDF6YmeUf+lZUyrbhzRPftMKf0MS/qGPR913UhTfunYY+Q4EUOCcS
 Eo/6nQxWMeRdMf3YwhD3Os22w8awpMZzzTzOkj0FQpWVBYUZStahN0Zaw6fpPtheBbpy
 NVkkwlgITt/hT0mzYval0/utg1UUPxXUZksk0o1qViS7WsU5OmIhQKIXqlgUBF08GIPZ
 RRLjY4KugOcgOqrbddNWt/dZ+vVLpBLAAo6t/Tts3OEqQD+hmhaeRyhMtPy7EE4E4+tX
 iQvDLebpkNushI39GWR2Lv2hHgWZ8Fl1PgwN3v1TfE6rYnKqaAvW9Mo4+YRGIrYG1D0x
 7mpg==
X-Gm-Message-State: ANoB5pkjYaAhgxBa/Yz4ov9rVdxSvJ1JREi/WUvZMm52cIR7KpuSlzzI
 hKff3+ba+TBUg3BDOKYFirrWqQ==
X-Google-Smtp-Source: AA0mqf7oQ489FlIYTfH3cZtinRIV71JUf+S41oATkJUojhgXTUN+VHbPv2Mnn1V6OHWujQnZGO4TkQ==
X-Received: by 2002:a5d:4290:0:b0:236:6e66:3447 with SMTP id
 k16-20020a5d4290000000b002366e663447mr10318548wrq.24.1668509764523; 
 Tue, 15 Nov 2022 02:56:04 -0800 (PST)
Received: from localhost.localdomain ([185.201.60.217])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b00238df11940fsm12185046wrm.16.2022.11.15.02.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 02:56:03 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: codecs: va-macro: add npl clk
Date: Tue, 15 Nov 2022 10:55:41 +0000
Message-Id: <20221115105541.16322-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

New versions of VA Macro has soundwire integrated, so handle the soundwire npl
clock correctly in the codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b0b6cf29cba3..d59af6d69c34 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -205,6 +205,7 @@ struct va_macro {
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
+	struct clk *npl;
 	struct clk *macro;
 	struct clk *dcodec;
 	struct clk *fsgen;
@@ -1332,6 +1333,9 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
+	if (va->has_swr_master)
+		clk_prepare_enable(va->mclk);
+
 	ret = va_macro_mclk_enable(va, true);
 	if (!va->has_swr_master)
 		return ret;
@@ -1358,6 +1362,8 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->mclk);
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1386,6 +1392,9 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
 	struct clk_init_data init;
 	int ret;
 
+	if (va->has_swr_master)
+		parent = va->npl;
+
 	parent_clk_name = __clk_get_name(parent);
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
@@ -1512,6 +1521,14 @@ static int va_macro_probe(struct platform_device *pdev)
 	/* mclk rate */
 	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
 
+	if (va->has_swr_master) {
+		va->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(va->npl))
+			goto err;
+
+		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+	}
+
 	ret = clk_prepare_enable(va->macro);
 	if (ret)
 		goto err;
@@ -1524,6 +1541,12 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_mclk;
 
+	if (va->has_swr_master) {
+		ret = clk_prepare_enable(va->npl);
+		if (ret)
+			goto err_npl;
+	}
+
 	ret = va_macro_register_fsgen_output(va);
 	if (ret)
 		goto err_clkout;
@@ -1563,6 +1586,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	return 0;
 
 err_clkout:
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+err_npl:
 	clk_disable_unprepare(va->mclk);
 err_mclk:
 	clk_disable_unprepare(va->dcodec);
@@ -1578,6 +1604,9 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+
 	clk_disable_unprepare(va->mclk);
 	clk_disable_unprepare(va->dcodec);
 	clk_disable_unprepare(va->macro);
@@ -1594,6 +1623,9 @@ static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(va->regmap, true);
 	regcache_mark_dirty(va->regmap);
 
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+
 	clk_disable_unprepare(va->mclk);
 
 	return 0;
@@ -1610,6 +1642,15 @@ static int __maybe_unused va_macro_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (va->has_swr_master) {
+		ret = clk_prepare_enable(va->npl);
+		if (ret) {
+			clk_disable_unprepare(va->mclk);
+			dev_err(va->dev, "unable to prepare npl\n");
+			return ret;
+		}
+	}
+
 	regcache_cache_only(va->regmap, false);
 	regcache_sync(va->regmap);
 
-- 
2.25.1

