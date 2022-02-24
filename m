Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F484C2AB5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EB6183B;
	Thu, 24 Feb 2022 12:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EB6183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701628;
	bh=rrMwlt9FMqzvUXc6GVf83UkPGRThkpjzexTxONFVVuE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4hdg8yl49iIUHPN0DseQOd9hKnLeJiXBNJ0iROVUnUIVJQJfyAYRyt5t9PKGgnhV
	 iCT0ZnmgTcRQcNpxQe57Kf31Tp6YNTnepUhlySLq6qJK6qR8KCb/aDwLMN1PBqNO6c
	 bvQ81B9fcu4X0kcGYpC6G7X4a9icFcsKiTP02LVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B4F7F80526;
	Thu, 24 Feb 2022 12:17:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1B5F80539; Thu, 24 Feb 2022 12:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C85FF800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C85FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mWWsTocp"
Received: by mail-wr1-x42a.google.com with SMTP id n14so2074661wrq.7
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGwet8zq/q+oBO0cHbSkm6maZjXBTGE7Z1lKpvdPae8=;
 b=mWWsTocp+FaeXz7m6q2G2l6HK5IYTE8CBN/r+4zYwmSlwTs8jvDyI5kpnqO/55AZIj
 Mr3mWD0Mud3PA7EUu88qZ/uSSn0yLLYRJxgV5XqLEVjhTUTyMXM0kA5kq4B94T8M2JUf
 SQ24J0/n7Y+TjfEpntKWKgJeCAT3rfF0p1QXBfMEDY7nvr/NbFuaOQ6xf7aUTHaFWHs/
 ocRU7fNhUxLAgMeC7bySbxvSXtED6drR7kNSMrXQLR7ghStTK5y2QGA2xt9ZS1NUKjk+
 O9Gv5jQFdLp9Mx/378+VicOE0YufzQsokqZjAxm9/Yy1s37N+JITqE+WAXVeoMhQYf2p
 ZqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGwet8zq/q+oBO0cHbSkm6maZjXBTGE7Z1lKpvdPae8=;
 b=Rq5VhdbapSeozi/2xYemp1PAvPIg6NW6laMixgXNbWwNue672IDFSSQya5C4RWBV7v
 PNDb9bRummaN6EOeZgpw5AQkf69ZfRYsCTq6mWLISrvIQKL74pz3kZovSmNDPtdwKqM9
 fQmgryY7I/OZBeetysi7dqxPq3nQNZw0ZKO3OA8GCbFCE8JtyYtrm4zeyWOFAFei7E/g
 MCBEgWV8YY460f69isHbeIbTvjboEp+xgNJnqUjcZ421FejQdMwOcLOndO9T4Nun7z09
 v8h2cifmn60rb3BTuICxXq1Kwsjk41RfhtB0uch9xbYzcamp38dQLwZI1nVqxbEyPfxp
 Er+g==
X-Gm-Message-State: AOAM530O8mbGWVcnis+uMP8rjoBA8GUvkK27e1Jna82v4UzUeeONkWa0
 PIUsfXAaJ7cusxuLqTKWxqLisQ==
X-Google-Smtp-Source: ABdhPJybg1t1xKJqLsGn0nQIlVpKXFYckwd6gkVxdYrY1KAog6yCEynqxw1UNdzl30rR089a6pB39Q==
X-Received: by 2002:a5d:64ce:0:b0:1e4:9b8d:4ccd with SMTP id
 f14-20020a5d64ce000000b001e49b8d4ccdmr1891746wri.37.1645701447824; 
 Thu, 24 Feb 2022 03:17:27 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 05/16] ASoC: codecs: tx-macro: move to individual clks from
 bulk
Date: Thu, 24 Feb 2022 11:17:07 +0000
Message-Id: <20220224111718.6264-6-srinivas.kandagatla@linaro.org>
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

Using bulk clocks and referencing them individually using array index is
not great for readers.
So move them to individual clocks handling and also remove some unnecessary
error handling in the code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 87 +++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 75a5513bff16..920b6e93fbaa 100644
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
@@ -258,7 +259,11 @@ struct tx_macro {
 	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
 	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[TX_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 	bool dec_active[NUM_DECIMATORS];
 	bool reset_swr;
@@ -1754,7 +1759,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->clks[2].clk);
+	parent_clk_name = __clk_get_name(tx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -1793,17 +1798,25 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (!tx)
 		return -ENOMEM;
 
-	tx->clks[0].id = "macro";
-	tx->clks[1].id = "dcodec";
-	tx->clks[2].id = "mclk";
-	tx->clks[3].id = "npl";
-	tx->clks[4].id = "fsgen";
+	tx->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(tx->macro))
+		return PTR_ERR(tx->macro);
 
-	ret = devm_clk_bulk_get_optional(dev, TX_NUM_CLKS_MAX, tx->clks);
-	if (ret) {
-		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
-		return ret;
-	}
+	tx->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(tx->dcodec))
+		return PTR_ERR(tx->dcodec);
+
+	tx->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(tx->mclk))
+		return PTR_ERR(tx->mclk);
+
+	tx->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(tx->npl))
+		return PTR_ERR(tx->npl);
+
+	tx->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(tx->fsgen))
+		return PTR_ERR(tx->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -1833,26 +1846,52 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(tx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(tx->clks[3].clk, 2 * MCLK_FREQ);
+	clk_set_rate(tx->mclk, MCLK_FREQ);
+	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(TX_NUM_CLKS_MAX, tx->clks);
+	ret = clk_prepare_enable(tx->macro);
 	if (ret)
-		return ret;
+		goto err;
+
+	ret = clk_prepare_enable(tx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(tx->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(tx->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(tx->fsgen);
+	if (ret)
+		goto err_fsgen;
 
 	ret = tx_macro_register_mclk_output(tx);
 	if (ret)
-		goto err;
+		goto err_clkout;
 
 	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
 	if (ret)
-		goto err;
-	return ret;
-err:
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+		goto err_clkout;
 
+	return 0;
+
+err_clkout:
+	clk_disable_unprepare(tx->fsgen);
+err_fsgen:
+	clk_disable_unprepare(tx->npl);
+err_npl:
+	clk_disable_unprepare(tx->mclk);
+err_mclk:
+	clk_disable_unprepare(tx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(tx->macro);
+err:
 	return ret;
 }
 
@@ -1860,7 +1899,11 @@ static int tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+	clk_disable_unprepare(tx->macro);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->fsgen);
 
 	return 0;
 }
-- 
2.21.0

