Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BC4C2AC2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3D4183B;
	Thu, 24 Feb 2022 12:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3D4183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701693;
	bh=wXm8+7A7oZb6zV9jJ42M7SnF+x4Un9g5R48U6zgupZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGgCXFu589L3KjNaUg4Eve8F1FIwyrT7J5OpsYFqSb3RwOYc4VAzkZ+5KRZKKCCjh
	 1mTgn5vInGSl+cHR2BydZEMCHhgWE/rxdLYj9TwNI5AB5hSsGUQl3RKUJTR4cuXLz2
	 HfwyEH/0k5oYpTSCMxAs+pqGY8DCGuRO7+TIAmGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6B7F80549;
	Thu, 24 Feb 2022 12:17:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F9A3F80537; Thu, 24 Feb 2022 12:17:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C9BF80524
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C9BF80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BgqwvFh2"
Received: by mail-wm1-x32b.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso1024275wmb.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cbjsxCnwDWXHhy887xSacuizUGg3UE/QEHYO2FNZug=;
 b=BgqwvFh2NPOZWo/43igYz9dplEN9ywPQIC+tP75/FD9MiDSMm2FPbL22A//EuT73hU
 7vhj8McsZuFw+RvtPOqiD+gxu/rxLUMd7oQYYOf+qe30OhlisjwrGmVDpMteh2mFst/b
 jILEiDTzLgsnCF5Kgm3Igoponk+Osh1zGm9jnm2oMv4RfCIKdfZ++7s1I4DlYgP/DsxH
 HHiI3sR4nCLsWr8AK5loL92+wKbZjHB+qG0P0dhOZ044KvP4CuODA0uJnHKQ4S3iRnbQ
 2T663q+al/5JFIGlwZnTFgYxS5f55AKQDlcPNWVdt4H+dC4Q8iMYymzUpJ5rp7IRdwAp
 X4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8cbjsxCnwDWXHhy887xSacuizUGg3UE/QEHYO2FNZug=;
 b=DkAwIbS/XJXEM1BTkxGo9VhBXu4GtzXv12mq4SyRDb1bV0e7GaH/RZz0JAvg1mRcPm
 tW9RfH0Ve0Tet+c/V288VH7/ONh0XCeMHVAfBlZd49LgqW1GqwvqUXx0gQx4PBewcaxC
 ESInmiu6pxKVyvAc+We+VG4vM1gyBTZNFyMMJ3eXCBhmqWnKHwfBB5Sgt2ScvTSkkSXd
 s4FlYOpST0lpjzXOjSNVqjqWmAeuPI6jJAqQE2gQtTLsBljoUydninhUE35DCWWqEeMo
 yppP4WGe5twxCeX9fq8xofJEcsXt08cw3MPIsAR46vPChY6+cymyWvcUjbp3fqigcvqV
 cBSA==
X-Gm-Message-State: AOAM531DFBCjJyZAUKI+wjlxLEqBAhgEsckvfRRc5c3hYVprXu1NubSt
 skHzv7QCp/lPA1XeELmZdDWaqw==
X-Google-Smtp-Source: ABdhPJz5yjsGGYmbzbcKMglDTtROqnuOEqI3XWpxcYBLcKIQk4RLuVyxqapOo5JrHW4l9FhodTmeZg==
X-Received: by 2002:a05:600c:384c:b0:37b:c771:499c with SMTP id
 s12-20020a05600c384c00b0037bc771499cmr11105362wmr.141.1645701454723; 
 Thu, 24 Feb 2022 03:17:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:34 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 11/16] ASoC: codecs: wsa-macro: add runtime pm support
Date: Thu, 24 Feb 2022 11:17:13 +0000
Message-Id: <20220224111718.6264-12-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 61 ++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2586d6350f20..97ef788ab65d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
 #include "lpass-wsa-macro.h"
@@ -2468,6 +2469,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
@@ -2498,6 +2505,59 @@ static int wsa_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
+{
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
+	regcache_cache_only(wsa->regmap, true);
+	regcache_mark_dirty(wsa->regmap);
+
+	clk_disable_unprepare(wsa->mclk);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->fsgen);
+
+	return 0;
+}
+
+static int __maybe_unused wsa_macro_runtime_resume(struct device *dev)
+{
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(wsa->mclk);
+	if (ret) {
+		dev_err(dev, "unable to prepare mclk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(wsa->npl);
+	if (ret) {
+		dev_err(dev, "unable to prepare mclkx2\n");
+		goto err_npl;
+	}
+
+	ret = clk_prepare_enable(wsa->fsgen);
+	if (ret) {
+		dev_err(dev, "unable to prepare fsgen\n");
+		goto err_fsgen;
+	}
+
+	regcache_cache_only(wsa->regmap, false);
+	regcache_sync(wsa->regmap);
+
+	return 0;
+err_fsgen:
+	clk_disable_unprepare(wsa->npl);
+err_npl:
+	clk_disable_unprepare(wsa->mclk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops wsa_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
+};
+
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
@@ -2509,6 +2569,7 @@ static struct platform_driver wsa_macro_driver = {
 	.driver = {
 		.name = "wsa_macro",
 		.of_match_table = wsa_macro_dt_match,
+		.pm = &wsa_macro_pm_ops,
 	},
 	.probe = wsa_macro_probe,
 	.remove = wsa_macro_remove,
-- 
2.21.0

