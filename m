Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD294BD9D2
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:12:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 716B816E3;
	Mon, 21 Feb 2022 14:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 716B816E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449175;
	bh=u1BiLCznRG8rz31uFjBClqMlMp7EKoy4qoD2AfonvWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EG5YDc2gSzDARgllW2jOpp5G+zzoA2ksHNhKhnP4JkRkv+G7ZQWWr720vYiWLqt/u
	 95ewXakJ5W1IAvh/SJ6pg+1rkeeUEziSrFdetmDc7DdeKo9xFNFxuQzvKetrsH1aob
	 SAD01M6dUTI+T2OP0BvMyKc9ZtM1EGpCDG/vVsGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF5BF80525;
	Mon, 21 Feb 2022 14:10:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC88BF80524; Mon, 21 Feb 2022 14:10:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43255F80166
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43255F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CnZFhCDb"
Received: by mail-wm1-x336.google.com with SMTP id o34so9494252wms.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RewL+3EtNxhC0ou/pYILBVrh1qSfkoLM81IegMwgi94=;
 b=CnZFhCDbVNq8YUQgIUgkcn7+ZwM1cLOb2I1C7hnWQq/B7122caLSKIX1vYxPKwTVI9
 tAGaU4oDRPjyZ5ZfScYain86omjfyxk0tYYwx6JxRIt+CdACoJXVIXIPObS9i7LdM43t
 4GVsw7WZNQNwNYXzapJaFtgt+WwQalTTvOTIlhFjCnjRv41VHKLkHX1TPY9HEG45IV70
 mKYifBTkAZZ9sCLKrnFXOhxTWnpniQc24Y6feTJb+2AHWQGbP0ex/lQX34OYpwqD1WMH
 85SzasVkc/Vn44HV+j4UA83UZvQUXKkVXychSJEhW77gfKkWmlWhNOxUhvsYm/HZRcRL
 Du9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RewL+3EtNxhC0ou/pYILBVrh1qSfkoLM81IegMwgi94=;
 b=L1g88bxtuRYT/pUiacka6jt+zhiY8DQxYNPwZXlxVyP5a6Dd1QCrcd/5JLpZ7R9pnl
 kBiGDXDEl+eFKT7RK4SetluABVhiBpotr0dVJWM5yGFpriEj45UxA8eY+JLDOazq5hPs
 /xAh7bkcLIUCdGOEm+LXBSukR+tU5nk2xmiw0xtsXW7PiC13+4D2hTHaXEkbTOK2+bQv
 2EmvZTKJfd5bqf049l0UqvB9HV+VjeJ/x3UtMliM/LeOXHudS4lL5oWf4KL0brBiiGDn
 emPJ+EP5rH1SMsSobV8aO+7JHHMtuTlXnh8IJhA3M9v23Xb6f4IPb8rwiaaqhNXfkSmk
 3GBA==
X-Gm-Message-State: AOAM533X03iqrsGttxDf6QoewxkJ738Qzt/jcvPvN/KmZLuciRjBZbH2
 53nYET/hA6ePQVOfz+ff/in/KQ==
X-Google-Smtp-Source: ABdhPJxGMd0Ms8x6dw0XsYi8KALi9pePtOLeIdPF5Bpu7BL8TvC7gxCHwewtjeASsZJ2rFGToWHbow==
X-Received: by 2002:a05:600c:410d:b0:37b:b8f2:a1b1 with SMTP id
 j13-20020a05600c410d00b0037bb8f2a1b1mr16948525wmi.123.1645449044140; 
 Mon, 21 Feb 2022 05:10:44 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 03/10] ASoC: codecs: rx-macro: add runtime pm support
Date: Mon, 21 Feb 2022 13:10:30 +0000
Message-Id: <20220221131037.8809-4-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 45 ++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 0ed032b220a4..fb5d4bb8bd8b 100644
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
@@ -3568,8 +3569,17 @@ static int rx_macro_probe(struct platform_device *pdev)
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
 	if (ret)
-		clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+		goto err;
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
+	return ret;
+err:
+	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
 	return ret;
 }
 
@@ -3589,11 +3599,44 @@ static const struct of_device_id rx_macro_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 
+static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
+{
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
+	regcache_cache_only(rx->regmap, true);
+	regcache_mark_dirty(rx->regmap);
+
+	clk_disable_unprepare(rx->clks[2].clk);
+	clk_disable_unprepare(rx->clks[3].clk);
+	clk_disable_unprepare(rx->clks[4].clk);
+
+	return 0;
+}
+
+static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
+{
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
+	clk_prepare_enable(rx->clks[2].clk);
+	clk_prepare_enable(rx->clks[3].clk);
+	clk_prepare_enable(rx->clks[4].clk);
+	regcache_cache_only(rx->regmap, false);
+	regcache_sync(rx->regmap);
+	rx->reset_swr = true;
+
+	return 0;
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

