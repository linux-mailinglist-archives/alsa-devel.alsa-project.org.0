Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788274C2ABF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AAD7189C;
	Thu, 24 Feb 2022 12:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AAD7189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701660;
	bh=2RRtirZpeO3Ma6QoBWpYkUjAaB0QYFN2rYv5YSpi2Rg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BP2Ryr3k49OsMgFf6xe5+dDtNglFWOE6fqzlCWHGsegD53Nai3XALzNAU9HgR0iiW
	 P+Qczn0MQNz1wh63MBmMsj7o30Nnau8wl44LqsMlQ8SfhyNG8JMOLJJ4yp2+r7K7nk
	 7Cr+bQL8hnljY+sv62nncbc71Ou4UsYwXcTEy4tM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E12F8052F;
	Thu, 24 Feb 2022 12:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B04AAF800F3; Thu, 24 Feb 2022 12:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E1DF80430
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E1DF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="z6JE71CN"
Received: by mail-wr1-x429.google.com with SMTP id s13so2447107wrb.6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5S4jXtQt9zJ/FIRoN63CnQsA0xt3UoiFNydOwJT7zD0=;
 b=z6JE71CNpxeyixCb5JaVsSk+O1A7pELVFqhrIgDySs+Jcfd0zkkOszUfV0rIukSnQP
 7adLbDNkyvEXin/k9GziX1kzVZns79F42T6OCz6xsFQ9BqZequUOkrCfl1lhvxra+iKm
 9qs9nDExoCTnc9/8FKhCYGm/tIevqh2zFyda3kE9JHnPmTrCivpYrHCcmv7uPaYtwVSU
 QOxVlpD4R8JGiZoC7FMMP+NDAIndxsBVRCsqQ3t1uBe5ibckSDmbDuqWSJS+ShTEHUsN
 aiByH/S+88QMkusp2rOo7BN0z3RPNnPIccwcGKG//jxbviWMCPIA+LpyVjUef/D+0KPV
 ZJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5S4jXtQt9zJ/FIRoN63CnQsA0xt3UoiFNydOwJT7zD0=;
 b=vF+zDUjlEILb5zA5YwU5Ef7b3fKiMrxsW6WnEjrtAi/6HNrcDEKEVWImtH7EOxflq+
 X3Qofp0XxCYW9svqkCLT+/7Iy9uNRy8KyC4NkkuZjbyn1/BPSk0a5w3oklyol9+GClh9
 ZrF4TAfgI3UZQ2ugxR4XKppkWHy+D8snHyesC/NXnuBGB5ZzGOEbp2H4nTTLEMPgNGIr
 01ba9rjXs5nsXkp4G8jRir4kleoKDWSyjtQjvU+dqU9LEucq/fMooxukWSaKty7byLdM
 Qo9nDEnafRKCzGS+n0M0OoMLjfxcT9o9W+AuZGcUDOOCzmfmXEhFTMWqnsf9WIoZJD9r
 mDrg==
X-Gm-Message-State: AOAM530Wcb6qEfv70EqKIFEqw2Fma44RvhXKT6LN2+zdHCGGA/FnyEYs
 ndTCy4cgalnhTh4gU3fmHov3Ag==
X-Google-Smtp-Source: ABdhPJyaqVEQef4+d4t/15H05ZMObVdYcIsikILB5quawSWQpvCzVILcxu0ingwfWR6rQGI2Xm7WUA==
X-Received: by 2002:a5d:44cf:0:b0:1ea:9cc3:504e with SMTP id
 z15-20020a5d44cf000000b001ea9cc3504emr1845612wrr.706.1645701446658; 
 Thu, 24 Feb 2022 03:17:26 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 04/16] ASoC: codecs: rx-macro: move to individual clks from
 bulk
Date: Thu, 24 Feb 2022 11:17:06 +0000
Message-Id: <20220224111718.6264-5-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 85 +++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6c61b4d35df9..83b570403c59 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -608,7 +608,11 @@ struct rx_macro {
 	int softclip_clk_users;
 
 	struct regmap *regmap;
-	struct clk_bulk_data clks[RX_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 };
 #define to_rx_macro(_hw) container_of(_hw, struct rx_macro, hw)
@@ -3488,7 +3492,7 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->clks[2].clk);
+	parent_clk_name = __clk_get_name(rx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -3526,17 +3530,25 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (!rx)
 		return -ENOMEM;
 
-	rx->clks[0].id = "macro";
-	rx->clks[1].id = "dcodec";
-	rx->clks[2].id = "mclk";
-	rx->clks[3].id = "npl";
-	rx->clks[4].id = "fsgen";
+	rx->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(rx->macro))
+		return PTR_ERR(rx->macro);
 
-	ret = devm_clk_bulk_get_optional(dev, RX_NUM_CLKS_MAX, rx->clks);
-	if (ret) {
-		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
-		return ret;
-	}
+	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(rx->dcodec))
+		return PTR_ERR(rx->dcodec);
+
+	rx->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(rx->mclk))
+		return PTR_ERR(rx->mclk);
+
+	rx->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(rx->npl))
+		return PTR_ERR(rx->npl);
+
+	rx->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(rx->fsgen))
+		return PTR_ERR(rx->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -3552,26 +3564,52 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(rx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(rx->clks[3].clk, 2 * MCLK_FREQ);
+	clk_set_rate(rx->mclk, MCLK_FREQ);
+	clk_set_rate(rx->npl, 2 * MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(RX_NUM_CLKS_MAX, rx->clks);
+	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		return ret;
+		goto err;
+
+	ret = clk_prepare_enable(rx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(rx->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(rx->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(rx->fsgen);
+	if (ret)
+		goto err_fsgen;
 
 	ret = rx_macro_register_mclk_output(rx);
 	if (ret)
-		goto err;
+		goto err_clkout;
 
 	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
 	if (ret)
-		goto err;
+		goto err_clkout;
 
-	return ret;
+	return 0;
+
+err_clkout:
+	clk_disable_unprepare(rx->fsgen);
+err_fsgen:
+	clk_disable_unprepare(rx->npl);
+err_npl:
+	clk_disable_unprepare(rx->mclk);
+err_mclk:
+	clk_disable_unprepare(rx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(rx->macro);
 err:
-	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
 	return ret;
 }
 
@@ -3579,7 +3617,12 @@ static int rx_macro_remove(struct platform_device *pdev)
 {
 	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+	clk_disable_unprepare(rx->mclk);
+	clk_disable_unprepare(rx->npl);
+	clk_disable_unprepare(rx->fsgen);
+	clk_disable_unprepare(rx->macro);
+	clk_disable_unprepare(rx->dcodec);
+
 	return 0;
 }
 
-- 
2.21.0

