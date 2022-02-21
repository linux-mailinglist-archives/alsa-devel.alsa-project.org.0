Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C854BD9D4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:13:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC20616F9;
	Mon, 21 Feb 2022 14:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC20616F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449200;
	bh=3IU/tRv0KjefSCVQHvgDaPsB1jiAkzW/LrK7ObF3uXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhTi9ViJSK8bgZwUgU9z7Q5gLYKCLtm3XDjfdX46RjZmaFtcGthdZ0JcnoSNArgXa
	 LbNO+nWfP9Po9+jMsA0F425SJAMQwJ+CYC57e/M6LzipUU6lLEx1qX7XkpjI2xzYGc
	 APWBTzwcyynxAUrtCLFCnxNRZaxdAFi1zcJim86w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E167F8052F;
	Mon, 21 Feb 2022 14:11:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC673F80527; Mon, 21 Feb 2022 14:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6189CF800D1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6189CF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WWR2i/oD"
Received: by mail-wm1-x32b.google.com with SMTP id w13so9005849wmi.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/873brHhZR6xm18sDiZdhD33uqz5ep38GtGCx69qMY=;
 b=WWR2i/oD1/ImYmqzvGm+tSJJ7MlYn6oWxndq5vCHMn2AFVVnhZ/RRBzCsMw6c831ag
 +5JoERRNMn0iyyrGiJxWZv6FFkwWZRl9yv32YVwUpqYgbh28p7CYJV7h+9P867hF010F
 r9gP6OdjsJuWvEZ6BIxpy84WwiSP8clBu/odr+AgHbHNqlRYq3YZ8pTwaJtxSqY3HmGy
 NG7tReTFSjSfIeBzXa7yaIxwjoZcEaaPtpo7mXeyubfh/lBjeNlLp5Z1qTozN0i9ub0R
 dq0L6M1nwXV5wBuMnUEb9/zMUQdVainoXaQ9FZp2P6Py7yg7TWFfqdRqZ0S0EVI5kF2W
 6IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/873brHhZR6xm18sDiZdhD33uqz5ep38GtGCx69qMY=;
 b=YM48upB9hg4OmTA4+poKhu9+sbJaNnA5agKMLgouOSzu0/0GbAD5JsU+7UldS9LR2g
 JeRqibk2iA2DYPwXyQkXmKEJJ4++MTMdDhyQz7uEUP3dO7MUQmOxg4GZuC9DJEiplYcr
 SkeYuD2QhapswFsP2SQaCGMCtDX0T/knTJDTt5QSSFq+1Xerr1v3/IeQ7yUEBlvzFoks
 TlDCJ7Mk3koQZoe0CpUzHMm6mDI/39UHPsM2h+JfRWUbXILsVPPWqoahZvj+FjnX2WGP
 ZdrdIkh7hRefLub2n3fW69RzIYrmr9A06lzGsIu5ILmdJSjg0Cpe6VSfaaVmi2nSrhLl
 VJhQ==
X-Gm-Message-State: AOAM530Jap0AvK+xwge9FvbEt7SLKzYYNH7uJe5eoqsBfUKSrp6SdFMo
 DHd7WbCJWHBFNPqQFmwZl1IP2Q==
X-Google-Smtp-Source: ABdhPJwsozEEOuF/0rPoouuPwDOTCYZ96rRUj9bR+ckw7xR4Yo/oO3Yc462V1ta/luwtz7dIWCoRHQ==
X-Received: by 2002:a05:600c:384a:b0:37b:e8ac:851f with SMTP id
 s10-20020a05600c384a00b0037be8ac851fmr9358623wmr.158.1645449045225; 
 Mon, 21 Feb 2022 05:10:45 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 04/10] ASoC: codecs: tx-macro: add runtime pm support
Date: Mon, 21 Feb 2022 13:10:31 +0000
Message-Id: <20220221131037.8809-5-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 7347d79a6329..1c0f0d27ed42 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -1844,6 +1845,13 @@ static int tx_macro_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(tx_macro_dai));
 	if (ret)
 		goto err;
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return ret;
 err:
 	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
@@ -1862,6 +1870,38 @@ static int tx_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
+{
+	struct tx_macro *tx = dev_get_drvdata(dev);
+
+	regcache_cache_only(tx->regmap, true);
+	regcache_mark_dirty(tx->regmap);
+
+	clk_disable_unprepare(tx->clks[2].clk);
+	clk_disable_unprepare(tx->clks[3].clk);
+	clk_disable_unprepare(tx->clks[4].clk);
+
+	return 0;
+}
+
+static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
+{
+	struct tx_macro *tx = dev_get_drvdata(dev);
+
+	clk_prepare_enable(tx->clks[2].clk);
+	clk_prepare_enable(tx->clks[3].clk);
+	clk_prepare_enable(tx->clks[4].clk);
+	regcache_cache_only(tx->regmap, false);
+	regcache_sync(tx->regmap);
+	tx->reset_swr = true;
+
+	return 0;
+}
+
+static const struct dev_pm_ops tx_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
+};
+
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
@@ -1873,6 +1913,7 @@ static struct platform_driver tx_macro_driver = {
 		.name = "tx_macro",
 		.of_match_table = tx_macro_dt_match,
 		.suppress_bind_attrs = true,
+		.pm = &tx_macro_pm_ops,
 	},
 	.probe = tx_macro_probe,
 	.remove = tx_macro_remove,
-- 
2.21.0

