Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B354C2ABE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E228184D;
	Thu, 24 Feb 2022 12:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E228184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701644;
	bh=DnKdTzFijA9f9sj/wFfkSjlRJr87gS/wi1IRyljQZa0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5m7Q8dxJdeDxx9lFoFqURlAtqBU9XIiUSypAmH39JqJeLVix8e5bhiyknkNcx3g3
	 wM6TEqs718rhGJilsDvPrBIbNbiVwy7EvPnCkYyneMLcHcGOWqPKwiuZHhoqwvGtrV
	 pSKJu3d91X+9fk68bG83W3/qlFPumE3JvK6XF9c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B13C1F8053A;
	Thu, 24 Feb 2022 12:17:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05B0F80537; Thu, 24 Feb 2022 12:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1CB1F804FC
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1CB1F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OP7gussU"
Received: by mail-wr1-x431.google.com with SMTP id r10so1440210wrp.3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dWp2Fe/HSQ+rB2BK7g54G2X9Fg00bBu78re9wNgZTM=;
 b=OP7gussUK/k/nGkTuGchNVAg0jPit6crNED+AQEbariWj8nKHtbiO6QItPUloFGTOF
 XrpznEN1BzBHqaXn2qi4X9ROvqh/MPxRGE1Nl84AGKaceSli87k2gvevOFJQd5x1cYca
 aQ0rgAgpVPGjg3LTBogyj5AZKIMP3CZKpwMCbuuax32CGELtjml/jhiBYTZmYUvlIHYZ
 JbR4gYyGUG0BqDlDufpfycd2L2YyPN+cUcnhumMQ6J3Mni6YraHJiryITYvuq7kyFned
 +rZakHzcLXuEEVJ8dEebmuLm245drguBb2yEKxrw8AKlpkJcClJ86H3F0TBVGshXpt76
 eA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dWp2Fe/HSQ+rB2BK7g54G2X9Fg00bBu78re9wNgZTM=;
 b=8KPJ7XR/ETLSGDcoCiLY+fNcSZ+mjtN9bmnrnwwuYBd9HFjpcoQzG1CKbzxnEag4ah
 sRXZtmwogAhmdDtRBBELU8BfL2WSsUcBQ1xVVLwga6oWupQwe7fK6Se4G/I3nxN7vNTd
 ZQOc2itydaXVju0bZcet9R4FKyANL0QKu2O2fB9BLaUVEGUwUuHWdHlQMuOl3ps0Mbjf
 rq9WNacjiqk+jH/AvuVPdj/DYimt0q1xfEP+pVBZxt4uG1WrI++nt7jI2JAKyDs23SRQ
 VZ9KOdevSWQNUF0DYKoOdULMn6BiHYsgVKfJqFI3Hy/K32nr/hA0PbPbNsV0XMZBzMPY
 +RBA==
X-Gm-Message-State: AOAM530UAbcH9STD1snJf4ye9vmr1Y/tX4PThwTEOXxBkljqeUq7tjp0
 5cx0dD6kH75upb/g3S5Jco/cQQ==
X-Google-Smtp-Source: ABdhPJwE3TDJ0aj5cjMLlFFgTarElFfnvkUpMJoteRHH9/WRjApx63jVvNg8Wq3Ty1x3b/vq07Befg==
X-Received: by 2002:a05:6000:1547:b0:1ea:7d56:83e8 with SMTP id
 7-20020a056000154700b001ea7d5683e8mr1909079wry.404.1645701449140; 
 Thu, 24 Feb 2022 03:17:29 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 06/16] ASoC: codecs: wsa-macro: move to individual clks
 from bulk
Date: Thu, 24 Feb 2022 11:17:08 +0000
Message-Id: <20220224111718.6264-7-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-wsa-macro.c | 88 ++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ddde17e2dc35..ac5f94fff0a9 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -347,7 +347,11 @@ struct wsa_macro {
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[WSA_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
@@ -2350,7 +2354,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->clks[2].clk);
+	parent_clk_name = __clk_get_name(wsa->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -2388,17 +2392,25 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (!wsa)
 		return -ENOMEM;
 
-	wsa->clks[0].id = "macro";
-	wsa->clks[1].id = "dcodec";
-	wsa->clks[2].id = "mclk";
-	wsa->clks[3].id = "npl";
-	wsa->clks[4].id = "fsgen";
+	wsa->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(wsa->macro))
+		return PTR_ERR(wsa->macro);
 
-	ret = devm_clk_bulk_get(dev, WSA_NUM_CLKS_MAX, wsa->clks);
-	if (ret) {
-		dev_err(dev, "Error getting WSA Clocks (%d)\n", ret);
-		return ret;
-	}
+	wsa->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(wsa->dcodec))
+		return PTR_ERR(wsa->dcodec);
+
+	wsa->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(wsa->mclk))
+		return PTR_ERR(wsa->mclk);
+
+	wsa->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(wsa->npl))
+		return PTR_ERR(wsa->npl);
+
+	wsa->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(wsa->fsgen))
+		return PTR_ERR(wsa->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -2414,25 +2426,53 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(wsa->clks[2].clk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->clks[3].clk, WSA_MACRO_MCLK_FREQ);
+	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
+	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(WSA_NUM_CLKS_MAX, wsa->clks);
+	ret = clk_prepare_enable(wsa->macro);
 	if (ret)
-		return ret;
+		goto err;
+
+	ret = clk_prepare_enable(wsa->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(wsa->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(wsa->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(wsa->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	ret = wsa_macro_register_mclk_output(wsa);
+	if (ret)
+		goto err_clkout;
 
-	wsa_macro_register_mclk_output(wsa);
 
 	ret = devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
 	if (ret)
-		goto err;
+		goto err_clkout;
 
-	return ret;
-err:
-	clk_bulk_disable_unprepare(WSA_NUM_CLKS_MAX, wsa->clks);
+	return 0;
 
+err_clkout:
+	clk_disable_unprepare(wsa->fsgen);
+err_fsgen:
+	clk_disable_unprepare(wsa->npl);
+err_npl:
+	clk_disable_unprepare(wsa->mclk);
+err_mclk:
+	clk_disable_unprepare(wsa->dcodec);
+err_dcodec:
+	clk_disable_unprepare(wsa->macro);
+err:
 	return ret;
 
 }
@@ -2441,7 +2481,11 @@ static int wsa_macro_remove(struct platform_device *pdev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(WSA_NUM_CLKS_MAX, wsa->clks);
+	clk_disable_unprepare(wsa->macro);
+	clk_disable_unprepare(wsa->dcodec);
+	clk_disable_unprepare(wsa->mclk);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->fsgen);
 
 	return 0;
 }
-- 
2.21.0

