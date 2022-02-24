Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA14C2AC7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548D118BA;
	Thu, 24 Feb 2022 12:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548D118BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701747;
	bh=sibmX9Elp88A36YjDgJchhVf7Cv0ue61UPJqj8YLK2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhBjXU/iHoIS27PhXvNACNp36SJBlpXCeSM26YjiTqCDXjhLQ1ogFWTfFBRHRb3tP
	 S5CiEya/nH2f3CuXlpz7MMTr2o6eef5jXQTpfYXOPfq7o4jSI8pe6pC4pZh1MVcleE
	 yr2B3mXbJOTghHg1H6mMYDkQfRpts6zddIYY3Z20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E84AF80566;
	Thu, 24 Feb 2022 12:17:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE69F8053C; Thu, 24 Feb 2022 12:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C028AF8052E
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C028AF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iHgn2n0X"
Received: by mail-wr1-x435.google.com with SMTP id b5so1475796wrr.2
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QnhpDOk4CUU3lYsv0PpUfinJqZMQJnvxRMmJ0Ek2uv8=;
 b=iHgn2n0Xbc0eS5i5rmuVlIhBnrk1T9JqOx4lAmr9MjuuLqLPefIrWkjeUB03q3UJdk
 JcYDwzltbGzolGWroQQt8Gc6b1IoXLn8Agdj9/jJkDhkrcX5btQlkOFD8kmicnTI8mfw
 kQC15wMyxH7qrfe74fHBcLB6eSioWOWbGVFFev0Xmd6HZz5zyQZGi/3fE9VvSQuNwVje
 wugyuVvpNoeRhvzMmdW71VcyBtTpu8JnZgJOrRp9q9GkEf+8J2UhRtNGJ08Rn1bFqwW+
 GLErTgSwojHatENPHxxIP7hCsR3UF1UFlXyJzy7Xd/wSy+F7YK8LNI/+8fYhBHVvqRxM
 6xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QnhpDOk4CUU3lYsv0PpUfinJqZMQJnvxRMmJ0Ek2uv8=;
 b=5kB/6Kb/jOvvJFTgADnKm0d4qfqiA+1a9kkIxdfzG/rWVH4Ndd5XFVf4uARv+CsdM6
 LllawrEUjAwFXd820CSto4JsdgVFml4j/R7KbHU9Qg089eoDOHUIxmvsUzG9kTEtZimh
 u86/5WIVcih+DdARzSp52ZR8yN6lKZr03EWy0buCSBbrlgeuXUuF6+WAMzjEvi3stB/l
 1QdUq3FAq46QQrPndJB8zzEEyqK3PixA6sa6ea9Bzatkm7X8SUNBmlFYdtnm/XnQg4Qm
 BNQlkyDPTXKfgBNU7pIWt6c4aczpJOD19OHTOu4QvsCtCAt56MCRs5VJ0hXfVzTIW+Ey
 ZWnQ==
X-Gm-Message-State: AOAM532OZsKHItUbemnaSX4Z+D/FdpJAO+WHHDKYiQS8HHuP8xOoQOzA
 OVCl3iW957Grpy+1G2ql+VEOXQ==
X-Google-Smtp-Source: ABdhPJxGJ8YMd6U1ZvlIMkNGjumB115CP6WBkh2oFxGcgtmx9Xosrnqs/8pck2bBAImBOr/InU6k5A==
X-Received: by 2002:a05:6000:178a:b0:1ea:7db1:3159 with SMTP id
 e10-20020a056000178a00b001ea7db13159mr1819995wrg.9.1645701453670; 
 Thu, 24 Feb 2022 03:17:33 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 10/16] ASoC: codecs: va-macro: add runtime pm support
Date: Thu, 24 Feb 2022 11:17:12 +0000
Message-Id: <20220224111718.6264-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-va-macro.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index ff8120886eca..34aeee50332a 100644
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
@@ -1469,6 +1470,12 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return 0;
 
 err_clkout:
@@ -1492,6 +1499,39 @@ static int va_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
+{
+	struct va_macro *va = dev_get_drvdata(dev);
+
+	regcache_cache_only(va->regmap, true);
+	regcache_mark_dirty(va->regmap);
+
+	clk_disable_unprepare(va->mclk);
+
+	return 0;
+}
+
+static int __maybe_unused va_macro_runtime_resume(struct device *dev)
+{
+	struct va_macro *va = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(va->mclk);
+	if (ret) {
+		dev_err(va->dev, "unable to prepare mclk\n");
+		return ret;
+	}
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
@@ -1504,6 +1544,7 @@ static struct platform_driver va_macro_driver = {
 		.name = "va_macro",
 		.of_match_table = va_macro_dt_match,
 		.suppress_bind_attrs = true,
+		.pm = &va_macro_pm_ops,
 	},
 	.probe = va_macro_probe,
 	.remove = va_macro_remove,
-- 
2.21.0

