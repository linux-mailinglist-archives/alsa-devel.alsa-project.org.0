Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E9E389B0D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 03:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24781676;
	Thu, 20 May 2021 03:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24781676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621475389;
	bh=mVi6bGZnrWhJ49mCtvV1u+jc/4QHTNQwTHGJR9i+eNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V/lXLiWr8Wno2HFbdNfjzQhp1DBKsFIxLk47cjM4iW4GwSO/7NfUsHH8roiqpd6fR
	 i3dpOHStNKAO88wLbMO8DeqhglgamIxTdBuMWz108mppayE3+HX3GAaCZ4E4izS5F2
	 z7Iq8w10lzap87kbUC+cWjZqV1ILgJ9X6MFMfN34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B17CF800C8;
	Thu, 20 May 2021 03:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8070F80217; Thu, 20 May 2021 03:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ED10F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 03:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED10F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PtufKgnm"
Received: by mail-pl1-x62b.google.com with SMTP id v12so8088207plo.10
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ir1Dpg3bgUq0v/H9js0abZRsZHQ5PmTY8mx+eB1aHs0=;
 b=PtufKgnmd6DXX0n+Vuz+quN0FhXP/QXYDqTuIbfCCrI+RpSi1wz08zBNGC8LZKvZfr
 6Rarw7f4CMCfDB3Z2FRqJgd7rRYjBj34A/6TGR/0TmJOlrfC53kLnN2c1X4JGAAPqSTW
 l5i/oyLhU1BOH2qUsvcGKVwx7q62nSJljlteI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ir1Dpg3bgUq0v/H9js0abZRsZHQ5PmTY8mx+eB1aHs0=;
 b=NBlYDOu+FjzgM/0mHCwCGM4tKDQVMbsJ7E+nJwkrxJgcMetr1rpLBTS2Qr4Q+Paiaw
 MrYshJvNyyMe0oiZFWWgHqs3dbKBqOeRkZv3tFMckr5tbBdUTTXiI/sEYOAx3sywrRZv
 gtGbG3X//e1CXfHEQaz09a3Ygh0aXRJ2MGcdjZJ8uGb2g20sgztphGeQ6SnujXqxXyzB
 185QFhzXOj8duJe1OM2ZknoxbLKjf/ETaqU+/6URkaloN0WWgq4xP0dDKdmK3tI3XCvK
 E+SrTvx9lgeln5RI61t+EMM0nyc79IZpm8bbcKavUbkn1Dt0rHtmAXszYRI6nsymI7mV
 8Q3g==
X-Gm-Message-State: AOAM530kjko5FzBguzSbZXDWI5fKdvvvhVcQBLjbjQdPznppcTTb62St
 42ImP63/elkvIYkCuIKy9WdOJw==
X-Google-Smtp-Source: ABdhPJz7N0VmwvOgwy+qH0pZAbQ7t9pnPLjhIpOgCLFaidWogYGP3K6a/k6jHeTHfiDGcnQs+GOsQg==
X-Received: by 2002:a17:902:f291:b029:f0:ba5b:5c47 with SMTP id
 k17-20020a170902f291b02900f0ba5b5c47mr2963239plc.41.1621475288909; 
 Wed, 19 May 2021 18:48:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id v14sm490668pfi.25.2021.05.19.18.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 18:48:08 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
Date: Wed, 19 May 2021 18:48:07 -0700
Message-Id: <20210520014807.3749797-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org
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

This driver spits out a warning for me at boot:

 sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2

but it looks like it is all an optional clk. Use the optional clk APIs
here so that we don't see this message and everything else is the same.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Fixes: 3e53ac8230c1 ("ASoC: qcom: make osr clock optional")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..28c7497344e3 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -835,18 +835,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (dai_id == LPASS_DP_RX)
 			continue;
 
-		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
+		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
 					     variant->dai_osr_clk_names[i]);
-		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
-			dev_warn(dev,
-				"%s() error getting optional %s: %ld\n",
-				__func__,
-				variant->dai_osr_clk_names[i],
-				PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
-
-			drvdata->mi2s_osr_clk[dai_id] = NULL;
-		}
-
 		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
 						variant->dai_bit_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {

base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
-- 
https://chromeos.dev

