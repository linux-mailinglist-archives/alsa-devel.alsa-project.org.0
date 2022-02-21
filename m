Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE244BD9CE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:12:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA77816DF;
	Mon, 21 Feb 2022 14:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA77816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449148;
	bh=Oq4jnxdN8IhLcGlgpMIsKyJPoGRtlrm9Gv2J3yea9jg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PK3EmuhJBe0OnlXbOpGhXvuPmuep5xuWmr+8vrcvDTT0CgJ9UnQfnGz/TAJ4u4P/+
	 sopPoVh7iRiIjOYDeyFxtYvKfmf+xf59mbkA7UpsC1ik7ThnERGxXJG5L4/+oO3hlT
	 22sVGnoVjyWMeDM7/B/TKBAzVppTjLjoi2l/jeEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A83F8051A;
	Mon, 21 Feb 2022 14:10:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B375CF8047C; Mon, 21 Feb 2022 14:10:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09574F80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09574F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c2g0VovJ"
Received: by mail-wm1-x334.google.com with SMTP id o34so9494239wms.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgNio1ZvxWIjmLiWAXPcv23sMXfkT0s/qjcyQ67ngqM=;
 b=c2g0VovJKiBK1IfUHsT9ZWkD+jMmc5eAnx8gpqpTf1nikF0NGpWBJGc5pznxONHQOi
 6RXneI3djEXJ4phPE59BCMbNwBP2Y1HM9HnKs0x+xTe2HqfJUiaHUR8F4/rqS46q17MJ
 vvBmcjCHtbZwHRMk22pleCopI9rcxUr4SuMpoYqd5Z8bWnSwHCk7zwSIghtHBYyK1SNY
 Bla9OSgaMrMyQSJCOXA8r3aAroRdWcUrKx0/szRrucHrbFf/FEMN8GERHJUPFUN/KaFh
 3nmLWcxKDkpiPC48lKcTC0+sJIBuXf1b5sAo6HNrlMt8e2bcBF9Qr+MC48qohzMVMAJg
 ZT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgNio1ZvxWIjmLiWAXPcv23sMXfkT0s/qjcyQ67ngqM=;
 b=gMqNpEKFEy+cim62WA6WsBjkvotMgCtxT6bYptE53xgHwl5c+7Tsl+dgC3/XieIiGk
 Hvv7svE3WWGry5AR1yCNSFi5XV9AhltL70M8JIjsC5lqPHadqHxQ5wkfD0i+C1Tj0IQE
 ArrjqxTdZ3c8s5ZmrNgI05n9QWjulcJPMhjgpNk1oNyBh4LkXlszV+zBirPy366jLMsL
 uCoSHu7mqRfxqmOE1+AgJ08fQ6rruweMlN58jqsGwKoT3EWOz57Wrr5+QM7tIKwB7VEE
 YhYw6CqpxJ05Mkk0oevWkNwFowhBy6Sp+X0+qjO/yzEsjq6sgzRbKqKCmTZr8Ua8AEbw
 g0gg==
X-Gm-Message-State: AOAM5335SODTBOotimSBrvj1U1h3YaXRN5f2vsf8VZG1CLjZPdCHU6vi
 LB3fkRU2zEIJQrrZdZReApHE/A==
X-Google-Smtp-Source: ABdhPJyzeB8CHlxlcGvrBT+0mVWWMBylBQTmHurQddon5V0aVF2Zh2s9fbXV0IfiC6X21JW517eZaQ==
X-Received: by 2002:a1c:7908:0:b0:37b:e93c:10dd with SMTP id
 l8-20020a1c7908000000b0037be93c10ddmr17877679wme.181.1645449042983; 
 Mon, 21 Feb 2022 05:10:42 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 02/10] ASoC: codecs: wsa-macro: add runtime pm support
Date: Mon, 21 Feb 2022 13:10:29 +0000
Message-Id: <20220221131037.8809-3-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-wsa-macro.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 21a4b8cc4a0a..a8d30f3b3fdf 100644
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
@@ -2429,6 +2430,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
 	clk_bulk_disable_unprepare(WSA_NUM_CLKS_MAX, wsa->clks);
@@ -2446,6 +2453,37 @@ static int wsa_macro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
+{
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
+	regcache_cache_only(wsa->regmap, true);
+	regcache_mark_dirty(wsa->regmap);
+
+	clk_disable_unprepare(wsa->clks[2].clk);
+	clk_disable_unprepare(wsa->clks[3].clk);
+	clk_disable_unprepare(wsa->clks[4].clk);
+
+	return 0;
+}
+
+static int __maybe_unused wsa_macro_runtime_resume(struct device *dev)
+{
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
+	clk_prepare_enable(wsa->clks[2].clk);
+	clk_prepare_enable(wsa->clks[3].clk);
+	clk_prepare_enable(wsa->clks[4].clk);
+	regcache_cache_only(wsa->regmap, false);
+	regcache_sync(wsa->regmap);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wsa_macro_pm_ops = {
+	SET_RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
+};
+
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
@@ -2457,6 +2495,7 @@ static struct platform_driver wsa_macro_driver = {
 	.driver = {
 		.name = "wsa_macro",
 		.of_match_table = wsa_macro_dt_match,
+		.pm = &wsa_macro_pm_ops,
 	},
 	.probe = wsa_macro_probe,
 	.remove = wsa_macro_remove,
-- 
2.21.0

