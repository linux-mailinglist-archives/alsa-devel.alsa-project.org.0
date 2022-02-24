Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E474C2AB0
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F391841;
	Thu, 24 Feb 2022 12:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F391841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701551;
	bh=lYCnQREJ99nbwCOUeyO+ubN3tvGOgqRHABHChgQ9SU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ui4OZ9EwgQeeoiVsdXJdLe1IxuLaOohdrFpNkUStw8o4Uy6ymoQJ9QpkTsnY5PkYI
	 GzG29ohw41p+sImxJtmCfdcQMs8qD21os6E6x6hiUaoqmFSw7YpTXJRU7VHGDHPlEr
	 28u5t4qMTby9iuNehDSe3ICcQoEBTVIvApyJW1E0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BE3F80515;
	Thu, 24 Feb 2022 12:17:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C94F80508; Thu, 24 Feb 2022 12:17:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 885ACF8030F
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 885ACF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RR/+PwJj"
Received: by mail-wr1-x429.google.com with SMTP id s1so2421279wrg.10
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWsSPZ5U3+bqYjJaCO6OED1zl8vj8mnYeogeLtvqmRM=;
 b=RR/+PwJjsVqGDzeC9JrdPksN+ltMOCoIRXBnYkZ9bXG40+tZNmGkF8zQk1c80L7mEE
 4IVPjgxbvK6jPj+hGYZg4rRf40Y2c7roBRh2AOgxHm8+Z6lLyI9ClogLiaTtKJSUvQ4h
 /CKjYlUJI22yX0Aeq38Umd4d0WzYEc7fHphBinSK9huuwoilOu08Ko2SrndDmVjGhyjn
 qN2egLYVdGXsceETkTO0QckDYHwQMw8sCJ0c9J1lEluRULmAl9Ljqaq9lK+NY9XYaCMc
 4kYi7T7l9xwQq20yv3t15WBlvhHNl9BCSCuFNir60cXYbysXkC/QCHfK7PYiezt1Qa8T
 BCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWsSPZ5U3+bqYjJaCO6OED1zl8vj8mnYeogeLtvqmRM=;
 b=40OX3jXs/mVsgusIPI9ZCkSoybV44zgMQl0dyQlZZGltv8+G3QHsPpuHvcKUm2unjQ
 YJzT/K72FrcPadbrY6t5Vn1yZHQEWwfrYlmj+3TKxebW8WhZOOFU9Xz7q1UL4Op2Dtup
 iSdo6LhZoTy+uxv9EKaDnfK21sulsT8gTtU9FJzK6uP8tWUmmkbgDaaE7Qc/iLhBQFyF
 rXAxD6QqyARvtLP6yn8WkEE9gSUa11HN/6O1sPdMZpKDhVah2HxBeREOeV7qonzARKY4
 n6Yfv5e9cLVYsG40E7MuLs//YBj4fJc0o+pcSqn9cbN73/SI+/i9OrhK7Xq+iNvMENdA
 RjDA==
X-Gm-Message-State: AOAM5329hkweavMtxNCx+NO/l+1BX2Fh/5yGNblazqTHNgZnJg8DCQPx
 Wgnf+B1URLYFrrK/Ekz//ZgkMw==
X-Google-Smtp-Source: ABdhPJzIi7dV/bk4DmzD358ma3NticqhA9MhGRi1I3omiaBHEtqLdbOEJWsPweglGrtEdoDdDbMkHQ==
X-Received: by 2002:adf:fb06:0:b0:1e6:8b27:f1ea with SMTP id
 c6-20020adffb06000000b001e68b27f1eamr1802817wrr.353.1645701444328; 
 Thu, 24 Feb 2022 03:17:24 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 02/16] ASoC: codecs: rx-macro: move clk provider to managed
 variants
Date: Thu, 24 Feb 2022 11:17:04 +0000
Message-Id: <20220224111718.6264-3-srinivas.kandagatla@linaro.org>
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

move clk provider registration to managed api variants, this should help
with some code tidyup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3a3dc0539d92..6c61b4d35df9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3479,10 +3479,9 @@ static const struct clk_ops swclk_gate_ops = {
 
 };
 
-static struct clk *rx_macro_register_mclk_output(struct rx_macro *rx)
+static int rx_macro_register_mclk_output(struct rx_macro *rx)
 {
 	struct device *dev = rx->dev;
-	struct device_node *np = dev->of_node;
 	const char *parent_clk_name = NULL;
 	const char *clk_name = "lpass-rx-mclk";
 	struct clk_hw *hw;
@@ -3498,13 +3497,11 @@ static struct clk *rx_macro_register_mclk_output(struct rx_macro *rx)
 	init.num_parents = 1;
 	rx->hw.init = &init;
 	hw = &rx->hw;
-	ret = clk_hw_register(rx->dev, hw);
+	ret = devm_clk_hw_register(rx->dev, hw);
 	if (ret)
-		return ERR_PTR(ret);
-
-	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+		return ret;
 
-	return NULL;
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct snd_soc_component_driver rx_macro_component_drv = {
@@ -3562,22 +3559,26 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rx_macro_register_mclk_output(rx);
+	ret = rx_macro_register_mclk_output(rx);
+	if (ret)
+		goto err;
 
 	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
 	if (ret)
-		clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+		goto err;
 
 	return ret;
+err:
+	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+	return ret;
 }
 
 static int rx_macro_remove(struct platform_device *pdev)
 {
 	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
 
-	of_clk_del_provider(pdev->dev.of_node);
 	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
 	return 0;
 }
-- 
2.21.0

