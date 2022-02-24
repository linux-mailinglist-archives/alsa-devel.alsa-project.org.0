Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105144C2ACF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39D318ED;
	Thu, 24 Feb 2022 12:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39D318ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701796;
	bh=SoqPMdlX+r5GsWhurtYbOsZ9hPg72HtLQcLL2GkxPGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZ9dVx6p/7EL0RsH3L8Q9FOG0jqLwXDd0WpT65mUJyMCFeqRIyJ81XJmXWpZS575/
	 1crpY3nt36RAP26+Lqg8cn1GLYHw7nWTIhNs3i9MmDIUpG7IQLiKOh+PHBuUC8dQbZ
	 mGth+/mCctu0nJtFtWU45b2BkVbm28TyZPQilfXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F052CF80587;
	Thu, 24 Feb 2022 12:17:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4415F80551; Thu, 24 Feb 2022 12:17:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33BE6F804FC
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33BE6F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RFQzpDwg"
Received: by mail-wr1-x432.google.com with SMTP id p9so2411818wra.12
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBRWbGG3hXrowhqp61BdFvJmp09eFX4PXrA2EU5LRPo=;
 b=RFQzpDwgQRIX0yGLn4YfC6ANknqYHJ6rJ/TY2pD6gHlbityGXrfOMxGVYg340Ddr9k
 a6QwKq0nHHECWIAW5QTRZNZNpJYFjK7o8opbLHX656DjtzraCU0ZGg5aq1gzPliOQvou
 WhuVlsmrYWkUhqO4Ggd/ruelD0oB6U9elXIBgIhQeO839VxzGkAsuKe87pfbXmKp/u4i
 VRr9oNXWkSroGZfbeeR+XOEHHDbqzVGA9IF8kdVrUxWl20+s5o3cn9ZBHWkAh55WH0q+
 npod77c4D1IRi5B1UU0lRF04uM51uVVPFdEO+VaLC4gH1URjWIZonJQksJ/epWwcHjcU
 0+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBRWbGG3hXrowhqp61BdFvJmp09eFX4PXrA2EU5LRPo=;
 b=IYB+FmlFvdZg7QcNGqs4x+nyIx9t9017/+szH+0SQIb+XTVFgGE0zOAnm8MvCW4JUE
 ZaQu1OIvP6k5LxYtWluKEuN4Wh4796Omk+xhTa1WsMd5Dm0Yckez/5ROR8ySeuq8Of52
 bwuU1OboGhL41nKKrpSfoJhIAwlkecFHDwLDyzvIDGi/QhOkw3rrqLriSYM8kEeFNWjw
 a47ERrzVbpa7JQCyjfzfO/zTqmXncvY5D7yHfVbrS2v8aa+u04M5HQ97eKrs5YV4wft2
 jIuG1foPWz9Cv8Aj+0QPZEt6t2IAUaQ0v63gbEEpqO4zwuUgeTy9n3r0xjzNB8NM6O96
 PkJg==
X-Gm-Message-State: AOAM532kHZDV53ybpFp43GjFYPEbIpLPioyf3iiA/5ogjcmGhOSyb3m5
 +w4OCY95LH9RDOVfS5DBu/UgBA2JT0xcwg==
X-Google-Smtp-Source: ABdhPJx4PbfZIRdTPPLjfaKJk9COSJSQw2JAq202emZ0PODnzYAXfVQ3C/JVsLYSfYFLHFZjHMI+jA==
X-Received: by 2002:a5d:64ce:0:b0:1e4:9b8d:4ccd with SMTP id
 f14-20020a5d64ce000000b001e49b8d4ccdmr1892266wri.37.1645701456920; 
 Thu, 24 Feb 2022 03:17:36 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:36 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 13/16] ASoC: codecs: tx-macro: add runtime pm support
Date: Thu, 24 Feb 2022 11:17:15 +0000
Message-Id: <20220224111718.6264-14-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-tx-macro.c | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b32235a9e1e5..2b2b93ddb4d6 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1887,6 +1887,12 @@ static int tx_macro_probe(struct platform_device *pdev)
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
@@ -1916,6 +1922,60 @@ static int tx_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
+{
+	struct tx_macro *tx = dev_get_drvdata(dev);
+
+	regcache_cache_only(tx->regmap, true);
+	regcache_mark_dirty(tx->regmap);
+
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->fsgen);
+
+	return 0;
+}
+
+static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
+{
+	struct tx_macro *tx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(tx->mclk);
+	if (ret) {
+		dev_err(dev, "unable to prepare mclk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(tx->npl);
+	if (ret) {
+		dev_err(dev, "unable to prepare npl\n");
+		goto err_npl;
+	}
+
+	ret = clk_prepare_enable(tx->fsgen);
+	if (ret) {
+		dev_err(dev, "unable to prepare fsgen\n");
+		goto err_fsgen;
+	}
+
+	regcache_cache_only(tx->regmap, false);
+	regcache_sync(tx->regmap);
+	tx->reset_swr = true;
+
+	return 0;
+err_fsgen:
+	clk_disable_unprepare(tx->npl);
+err_npl:
+	clk_disable_unprepare(tx->mclk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops tx_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
+};
+
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
@@ -1927,6 +1987,7 @@ static struct platform_driver tx_macro_driver = {
 		.name = "tx_macro",
 		.of_match_table = tx_macro_dt_match,
 		.suppress_bind_attrs = true,
+		.pm = &tx_macro_pm_ops,
 	},
 	.probe = tx_macro_probe,
 	.remove = tx_macro_remove,
-- 
2.21.0

