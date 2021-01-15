Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB902F7122
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 04:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA86916D2;
	Fri, 15 Jan 2021 04:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA86916D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610682422;
	bh=slYBos8ceFp/SHhEK9MaVysu2m84Tw87Nbj9APVmbn4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k2KUmJ+KBFgBOhqhoG8Jdr1AlchrH1HH6UQrwYVknQAiQV0xiwhdTJCkcMDGTX5SC
	 f7+HDSLbr9IAPyapW9kvP4z6+cJxRgocbDZSYRK1LC+/YJaBE+vYNVc6shf1TQKq1V
	 zu1Gd2gdPrOJtSQcaPP51ah1h+RlcblTcW3gMNNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15EC8F804E0;
	Fri, 15 Jan 2021 04:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEB79F80134; Fri, 15 Jan 2021 04:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75311F801ED
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75311F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mKunPSwe"
Received: by mail-pl1-x630.google.com with SMTP id r4so3995213pls.11
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N02fXbKOI7v6bUS+6ErTrlEXeCZ9jXtdBRasx3q08w0=;
 b=mKunPSwe5cY8Jq+pZp/q/jWVNLm6J/94C7SlgZ1saNZD+u179Yg5eJLEWVwdN9ac6T
 3UmexIt33g2zin8AqRYNL7+wPKLVZ2mGBcaI3VL4hswRnnaw6f5zEbVTAnUJ93GwBA6q
 jKW2LWlcA+zSMTCRInUKsnLh/PSkLcstavtt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N02fXbKOI7v6bUS+6ErTrlEXeCZ9jXtdBRasx3q08w0=;
 b=Y6pR0ZFxAYKNrxrfqzyFqQbbPwHPtpMk82GWX0ZEr2oSIcyLIkwJ3FbwB8Is1m8y9L
 Zub71+oYUhpBheobupJAXMmezHsdQ4mc4G7I7j/+ZRgTRl1cnQMNmIVuEOJ8DpFD/Q7j
 qMvqjHIO/9FP4gd2VkgEl5pZdzpDdekF1Y8RFYwdxTl5OOE1ipiSBcfmT4rGxaeYr2O1
 CwQGTD4qZOA0zth4JFB9J7Ziw2cL5CQTJ/s9iGJ0XnHiihJL2YSdSBhxbF5GzbREwxeQ
 hj89tbIlHOkNSCqIHTLwzm44Y9Asy6zBR8/qfJwgJQ4XzQRqriBSEMQO2gj17nn15hFG
 FVEg==
X-Gm-Message-State: AOAM533MyXHt02c7if/GXQaIRLNzS75eI2uvj42JEj82xWcmz0ZxnAfo
 rJ/DuBbNqxJ44CibPmnDLe2Okg==
X-Google-Smtp-Source: ABdhPJwONZ49KttbKspvQKQ84ZbdgIuIs4XUSlLwyr+p6TbSHNrMDViOQjMd8t54JjJoO3hLbKGLWw==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr8330161pjr.227.1610682214983; 
 Thu, 14 Jan 2021 19:43:34 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:43:34 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: qcom: Remove duplicate error messages on ioremap
Date: Thu, 14 Jan 2021 19:43:27 -0800
Message-Id: <20210115034327.617223-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

We don't need to print an error message when these ioremap operations
fail. The function that returns an error already prints an error message
and properly attributes it to the device. Drop them to save some code.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index b267fe8db3fc..0ca957dcd3fe 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -788,11 +788,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
-	if (IS_ERR(drvdata->lpaif)) {
-		dev_err(dev, "error mapping reg resource: %ld\n",
-				PTR_ERR(drvdata->lpaif));
+	if (IS_ERR(drvdata->lpaif))
 		return PTR_ERR(drvdata->lpaif);
-	}
 
 	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
 						variant->wrdma_channels +
@@ -810,11 +807,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
 
 		drvdata->hdmiif = devm_ioremap_resource(dev, res);
-		if (IS_ERR(drvdata->hdmiif)) {
-			dev_err(dev, "error mapping reg resource: %ld\n",
-					PTR_ERR(drvdata->hdmiif));
+		if (IS_ERR(drvdata->hdmiif))
 			return PTR_ERR(drvdata->hdmiif);
-		}
 
 		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
 					variant->hdmi_rdma_channels);
-- 
https://chromeos.dev

