Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A744C2AC4
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:21:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C001838;
	Thu, 24 Feb 2022 12:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C001838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701717;
	bh=POFCCXytIsjGE75xZA9ZpyaHCbbMYGOu5GGTt68pNK0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asvjVVHGbacSHY7AjNG2MWOmlI6FyzUi5qdOWAG1Ea1tdDQDfaB/gJYY7nXIznjLi
	 F7itdzl3Q6c92CRc2I+ofv6XgGVXYzUZ4y5k27IHxYgybJw1T0cvmom2wa/v61m2SU
	 0NIvbAlrgQAz5hV1dYm5CuJx4mGmhB0pGLhuPyww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0ADF80557;
	Thu, 24 Feb 2022 12:17:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 207E8F80524; Thu, 24 Feb 2022 12:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D464FF80526
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D464FF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CAztRwtv"
Received: by mail-wr1-x433.google.com with SMTP id s13so2447842wrb.6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNHsk/5D9xGPuJd373nmHea73ZrQBMQ8kphOXj5avdc=;
 b=CAztRwtvkUV4S/jm0VRCSY3/l6SYaa3FYziJw4jCHUV/3ExCknj5i6ayCefxIAqzSC
 kG9WgCMWy8FVch3L0V0n8ICxsoWJKfSN/f6Tu7foDLn5FXExsAJl50LfxsAvcTSXXbul
 x+1GXhyHoGAq7sYB/kMdZmjIS7n3QxTO3VmTPhn3M/ZR2+ViLKT3DIKeR9IeQDRzA10B
 3ND4iaYG0x3kBKKCdzYTBtJHrKyEVHZ+atcNHEJFUxltIeS7pC+k49o1yxkbloVz/hyC
 qUIaYKNy337fHJ6H8rFOotqmXV6nweemfI6jbDAX2GbNvq57z3sxydYi+FOHY8u073zd
 C6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNHsk/5D9xGPuJd373nmHea73ZrQBMQ8kphOXj5avdc=;
 b=pD573zxu/OxKJyOUyOCIDnYuYRLWz8/VHBu0OWEDONCxQyt0YeSxCtzqDRlx42HXfy
 Qc3/D1hxa8ppIq3qeDifjQ03Hys0qXV1ILU9JW88kigzMmLcXfa3tLp8QbiP+MNM1LD6
 F2r7eoivB7FfOK9GqKSxecUKawDj88eb5uqsldyaQ7GFa0n2S/KgT1i+JADW6ZyHWofp
 QJ2Uf5Zm+lO/5/uOHktpZlBa88lZ/HDwjDBMaotBqjL56skh/WUOz/L5erHBaDhtjlPt
 CdN9EWCjpcLUpNuq1fgAwoXT+99klE5LEkemR1zFaxBR0a7OYvjKIVrq10dauEb1vQHg
 k7Ow==
X-Gm-Message-State: AOAM530GOlCVEPymVQc+JhQmetIsDZMY29exZ3a4fKmNXLb4JhiPoJaZ
 A7Zu9QxscOK0oVFwwVS/bNo2zg==
X-Google-Smtp-Source: ABdhPJxFwqIv17XbkPAGUFEk1/FooN+/RsYed3Q2KhAOJZC9eVgY/J8T/Cw/4GeSyGQvbfdPGN9fbA==
X-Received: by 2002:a5d:6c68:0:b0:1e8:9827:b978 with SMTP id
 r8-20020a5d6c68000000b001e89827b978mr1716361wrz.633.1645701455898; 
 Thu, 24 Feb 2022 03:17:35 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 12/16] ASoC: codecs: rx-macro: add runtime pm support
Date: Thu, 24 Feb 2022 11:17:14 +0000
Message-Id: <20220224111718.6264-13-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a2f49a21678b..67bec5befc02 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -3605,6 +3606,13 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return 0;
 
 err_clkout:
@@ -3641,11 +3649,65 @@ static const struct of_device_id rx_macro_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 
+static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
+{
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
+	regcache_cache_only(rx->regmap, true);
+	regcache_mark_dirty(rx->regmap);
+
+	clk_disable_unprepare(rx->mclk);
+	clk_disable_unprepare(rx->npl);
+	clk_disable_unprepare(rx->fsgen);
+
+	return 0;
+}
+
+static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
+{
+	struct rx_macro *rx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(rx->mclk);
+	if (ret) {
+		dev_err(dev, "unable to prepare mclk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(rx->npl);
+	if (ret) {
+		dev_err(dev, "unable to prepare mclkx2\n");
+		goto err_npl;
+	}
+
+	ret = clk_prepare_enable(rx->fsgen);
+	if (ret) {
+		dev_err(dev, "unable to prepare fsgen\n");
+		goto err_fsgen;
+	}
+	regcache_cache_only(rx->regmap, false);
+	regcache_sync(rx->regmap);
+	rx->reset_swr = true;
+
+	return 0;
+err_fsgen:
+	clk_disable_unprepare(rx->npl);
+err_npl:
+	clk_disable_unprepare(rx->mclk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops rx_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(rx_macro_runtime_suspend, rx_macro_runtime_resume, NULL)
+};
+
 static struct platform_driver rx_macro_driver = {
 	.driver = {
 		.name = "rx_macro",
 		.of_match_table = rx_macro_dt_match,
 		.suppress_bind_attrs = true,
+		.pm = &rx_macro_pm_ops,
 	},
 	.probe = rx_macro_probe,
 	.remove = rx_macro_remove,
-- 
2.21.0

