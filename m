Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1454BD9CD
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0585316CE;
	Mon, 21 Feb 2022 14:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0585316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449144;
	bh=LUjNgEauWdovrXpGXMhF/Hy02jEjywwCJ8JS3jPaM4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cNIprubawfQYYayILipzs8Poh6gO038yp6YBfmL7TLrEynK2LF02vNHn8ctQe61Ub
	 9h33hD6Hy3omz7dP83Zv2mt2kqhHnZ7e3fShewQfYeVzKhj7W3lFpTDkBZC7HbEpuO
	 ABC17NLkavcM/xzMfyb0ewcxHPJikK6zI1PtH/z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C40F80508;
	Mon, 21 Feb 2022 14:10:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06DBFF804AB; Mon, 21 Feb 2022 14:10:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95310F80139
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95310F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LGamMUK0"
Received: by mail-wr1-x433.google.com with SMTP id j22so923728wrb.13
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CALk/6ca7iO7/xBqMHHMOaqmUFWsovsA/Kq66L5KIA8=;
 b=LGamMUK0B2xkMZwpcmUL37yW6Z3TUIr5n5SrtxOkaisKG1588ss/Yu5E3C/KXo3TnI
 MmRzj1y+mJeBasHZ/W8PcwubZM9uleE2/V0Jsv19j/FLzbdkkwzA7pShMI6wHQky4r35
 2MZnwtat7HskNH3Z/KNyL/0sdhrH3mk9Xd2o75Ix5sbQISvXJ9oUFzb+0/J4dTtMVv3U
 OL2QixZibH0rWwZIwK4f1qMM4jCr0EKhxTpiN4AnSJQSIWeg5cYyDI/6kAS2abLHj/g8
 PETLpTzdddsbeEGTn9GMinPoa/TeuwetOWA+F78ksyS2KJLXdpuYz+tKNaZnQZbLWKRU
 O0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CALk/6ca7iO7/xBqMHHMOaqmUFWsovsA/Kq66L5KIA8=;
 b=QhrfXOVVOrw/SWzOBUvzutYya33vZ9aqekMlmBao/nzMrVsXh2KyWd5/XBf5TIPWqU
 USgHPGlxi+s7KIJ4bCkWcMBh3YrQnpwoNO+Oh/5l1o4SSI1FQbsyYod0Y93Vat8iXf8p
 W6Tol7Shctov2YB+S9o+odLk1ktubHZYF42A4kJq7qMwwDArRhK07cBv/yIv8yrNrpEy
 Hk38XICfaZhkDr/pNaG3K5LLexHa/sHCZ5HdetOK1ghN3DzE5wKKrxMEUQ73mH4mWktF
 M9+m/c2psYMZKM+PDlcTFCaFtlacuNy65mr5DvJ7DpsLpuaU/LFXZcOf7YN53unhPy9e
 VaxA==
X-Gm-Message-State: AOAM533QUjo6OuY54COf9Be0byFb81KurCkqMZjVD3DuyD9zP50fTknG
 qoCiOwqzZNIBhs+f8b11vGAFvg==
X-Google-Smtp-Source: ABdhPJxqajVm7LxH5nEQV46AvjifUaSWOSb7GZHElKDVaAEoKDL3QMy5CpreSZ8ZutAb/8jHZlq6gQ==
X-Received: by 2002:adf:e883:0:b0:1e4:b617:bc9d with SMTP id
 d3-20020adfe883000000b001e4b617bc9dmr15806525wrm.132.1645449041832; 
 Mon, 21 Feb 2022 05:10:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 01/10] ASoC: codecs: va-macro: add runtime pm support
Date: Mon, 21 Feb 2022 13:10:28 +0000
Message-Id: <20220221131037.8809-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Add pm runtime support to VA Macro.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index e14c277e6a8b..0fd0139e8229 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -9,6 +9,7 @@
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -1454,6 +1455,12 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return ret;
 
 err:
@@ -1471,6 +1478,34 @@ static int va_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
+{
+	struct va_macro *va = dev_get_drvdata(dev);
+
+	regcache_cache_only(va->regmap, true);
+	regcache_mark_dirty(va->regmap);
+
+	clk_disable_unprepare(va->clks[2].clk);
+
+	return 0;
+}
+
+static int __maybe_unused va_macro_runtime_resume(struct device *dev)
+{
+	struct va_macro *va = dev_get_drvdata(dev);
+
+	clk_prepare_enable(va->clks[2].clk);
+
+	regcache_cache_only(va->regmap, false);
+	regcache_sync(va->regmap);
+	return 0;
+}
+
+
+static const struct dev_pm_ops va_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(va_macro_runtime_suspend, va_macro_runtime_resume, NULL)
+};
+
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro" },
 	{ .compatible = "qcom,sm8250-lpass-va-macro" },
@@ -1483,6 +1518,7 @@ static struct platform_driver va_macro_driver = {
 		.name = "va_macro",
 		.of_match_table = va_macro_dt_match,
 		.suppress_bind_attrs = true,
+		.pm = &va_macro_pm_ops,
 	},
 	.probe = va_macro_probe,
 	.remove = va_macro_remove,
-- 
2.21.0

