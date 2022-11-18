Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087262EE39
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 08:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A47516B9;
	Fri, 18 Nov 2022 08:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A47516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668756046;
	bh=bMMeM4B3Nn/hpzGcQomDdiwdoChasMtEK6tk4zNFAFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vT01Xu+PI32KqC2HR6iszu789/D6y0tcD4XlLvnlS5uhp1rjussIqV37cUnSJQh46
	 tgnLsxaVOBZBTO+hkiABL/d1MYntxDg3FAj5G4M9S4sLRoX300gvLmz8qLTqp4sa9A
	 W2PCMpjQSL8J8FJzBauM/y4zUOu6U9zViebdoSQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E716EF80558;
	Fri, 18 Nov 2022 08:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 176E9F8024C; Fri, 18 Nov 2022 08:19:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C86F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 08:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C86F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vehHn/Vw"
Received: by mail-wr1-x430.google.com with SMTP id d9so7855464wrm.13
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 23:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5HJML9y11R46OtDRqClWdXS2bPj3NqH8YWdkAW2AqU=;
 b=vehHn/Vw/9TXfh7L4TosD4ihMHZH/NB/MEGLeKv62iak0qOdKU9xf9JojCGVMUgXhZ
 VaXjZagbTPvMnAaqbyUviDH3MluJCiHdlHPwJzC5WvFE/cFfwZI48OfJVeS4KdtauJEC
 DV4z59mH2o+iLxLS+5KuMFoCZYNFZXD58fbQWghJJQbwnhfVNbuZwMvjx64mh18wo8kC
 a2tOSTlTYgKl3DQIwPP1Ziwr90kcMPXRaHLERlfVVwhWoUWvp7xbck9E+cugx0gVrmdY
 NOhKJUZgjE1PkN0XPsPFIKaaT5lAnfP7Ro+PLJhcLyOlMgZSER5T3uHjJ8hyhYmOrG1c
 d76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5HJML9y11R46OtDRqClWdXS2bPj3NqH8YWdkAW2AqU=;
 b=V6cNVR5lBSSa+K2YqRka55KQv3xLPm/ZiKbQ5AFdRGapyNN8y0gMTt2MrBc7pk8fiU
 tjYPyTHq7MmsGBhQtXVnLWefKv07jWyIl4nE9qejDECJ+oNcL+DQa32eW4PPy2Rfej/i
 PqFZjqocQfq47e4243ZBLnPvCWKaCIWG0U7sJXvbE+jotTTjGevesfAjOY1kEPgNqSb/
 QBJBRceUg0gyiDtzjyKzHZoQxuYh/yWWWWKBCftpWrj1Ws4LAp5DAm4nQk5zlJb4DUOH
 QmAqnfhVX19Wd0zXn6/RtFm7JXcClsye6vYly/9DnaueFrtk3Vc7S8XbeeOIvnGgU18L
 oAgw==
X-Gm-Message-State: ANoB5pmYkoBDA9w63XKKbaRv+yISaPmS4+D3+hp+jSo5MbU+ILShSBT7
 Wr1T7aayusdPfQR+OZlBoeMAWA==
X-Google-Smtp-Source: AA0mqf56CJ26kLueuIdSHI5Va9mNO3O4FkA0Hh3vNp+3FpyeQCH8CIMFyNEqEE8MVJCD9u8V8mHofQ==
X-Received: by 2002:a5d:6b0c:0:b0:241:c595:9f05 with SMTP id
 v12-20020a5d6b0c000000b00241c5959f05mr16601wrw.439.1668755937028; 
 Thu, 17 Nov 2022 23:18:57 -0800 (PST)
Received: from localhost.localdomain ([167.98.215.174])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adff010000000b002302dc43d77sm2754349wro.115.2022.11.17.23.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 23:18:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: codecs: va-macro: add npl clk
Date: Fri, 18 Nov 2022 07:18:49 +0000
Message-Id: <20221118071849.25506-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
References: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-va-macro.c | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b0b6cf29cba3..eef8dd5d58f8 100644
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
@@ -1332,6 +1333,12 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
+	if (va->has_swr_master) {
+		ret = clk_prepare_enable(va->mclk);
+		if (ret)
+			return ret;
+	}
+
 	ret = va_macro_mclk_enable(va, true);
 	if (!va->has_swr_master)
 		return ret;
@@ -1358,6 +1365,8 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->mclk);
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1386,6 +1395,9 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
 	struct clk_init_data init;
 	int ret;
 
+	if (va->has_swr_master)
+		parent = va->npl;
+
 	parent_clk_name = __clk_get_name(parent);
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
@@ -1512,6 +1524,16 @@ static int va_macro_probe(struct platform_device *pdev)
 	/* mclk rate */
 	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
 
+	if (va->has_swr_master) {
+		va->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(va->npl)) {
+			ret = PTR_ERR(va->npl);
+			goto err;
+		}
+
+		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+	}
+
 	ret = clk_prepare_enable(va->macro);
 	if (ret)
 		goto err;
@@ -1524,6 +1546,12 @@ static int va_macro_probe(struct platform_device *pdev)
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
@@ -1563,6 +1591,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	return 0;
 
 err_clkout:
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+err_npl:
 	clk_disable_unprepare(va->mclk);
 err_mclk:
 	clk_disable_unprepare(va->dcodec);
@@ -1578,6 +1609,9 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+
 	clk_disable_unprepare(va->mclk);
 	clk_disable_unprepare(va->dcodec);
 	clk_disable_unprepare(va->macro);
@@ -1594,6 +1628,9 @@ static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(va->regmap, true);
 	regcache_mark_dirty(va->regmap);
 
+	if (va->has_swr_master)
+		clk_disable_unprepare(va->npl);
+
 	clk_disable_unprepare(va->mclk);
 
 	return 0;
@@ -1610,6 +1647,15 @@ static int __maybe_unused va_macro_runtime_resume(struct device *dev)
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

