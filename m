Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42A278F19
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089EA18D5;
	Fri, 25 Sep 2020 18:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089EA18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601052702;
	bh=H0DMnkJkEyWkAoJo1m0n1iJGu/lBiLQLXP5joqeztT4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOQGToPX5tB9wLiNsvxrkYbPxS8uwC6SKtujoHC5JBGD2Z1mzZ3w9OVy58pjLUru6
	 FVd9z4UiSV0yPNG79ROZu9v1K1pqlMhgDIZi1C1RKW1xVurdAEy3ZmRdfqh9Yg8mJI
	 dIia2bLY7SxlgO5H6esphZshr3iywZv268HahihA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5650F8028F;
	Fri, 25 Sep 2020 18:49:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC033F802A2; Fri, 25 Sep 2020 18:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8EF6F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8EF6F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M/XtpBob"
Received: by mail-wr1-x442.google.com with SMTP id x14so4291670wrl.12
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+lQmvGIW34Fed8sffLC/RmBoE8wLwQ9s9GB7PfHXuY=;
 b=M/XtpBobcAIos+IdHsIK68CgjPPg2rsTajJNuovI45M/2jPmSRHobGneHaX9YLNRP3
 pTCMj+z1dh3MXU4NBXKht0kqjDD29ym7UXPVGQop6w+sq427UZstFfc+2nmCE1NtwCPy
 Y6vmo6TRTuFHeG+0gQX2OFxHS8IetqimALxKatB+YUMcPKNiN/D1RJY0kK4lRjEKK325
 lZm5ryF8uY6UFRGrmI510cJm2MLnhVyN9v0A1rrePF9aC+OQpzZN6HJOt2/AEPiYx/5x
 qeyqEKi3qiOt7qhb0EJQAWdtBN043nHeA928CHBkxLNnoeWx68GtBUUMnoPa/Cqr8dEV
 3k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+lQmvGIW34Fed8sffLC/RmBoE8wLwQ9s9GB7PfHXuY=;
 b=qbDjtdusK185LggQTZk/GV8kllbas1b0YhqkuwRGQQmTH/g5cnSDVY+b8WWceiM/yJ
 C27ImVx3OFM3x7hWsib/ywYikwmqlZ52GtZgIwUXSdMp3lrauoxTsHoxkUhCvSa7i8U4
 kx4XkaqtZOdVFzGYi8YoCt2ZavFbrh6jSYxVJmHv1rcTOzbmU054vR10uVIfbUJM4EQ0
 DEqQ+bdzjHqQjK8WVy4KpydPh5Wzg+Dous49iM8xXM7cKjCE+BHRSG0dUYBNpmKmeJjy
 OKob9PLJYkVriz53QM465P5cK1yOTwj2OX1O2IIfTNKRfl0Zu9qdqxKjwuCuGk2vFqBJ
 F5bg==
X-Gm-Message-State: AOAM531G7RQIgbCQpHCFIhv1MlN3wJXUHNoDxTLPeSZRoed1f8w2+4DZ
 kBktM4ojv2efrx9pmw0KWmzrjw==
X-Google-Smtp-Source: ABdhPJx/JB5PBClWY2jrtfogYCCMqfSI3zpnGS+eBAJ/wTTG6XHNczADwF1DBHMnRE49dlurlJ67xg==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr5799478wrq.313.1601052548481; 
 Fri, 25 Sep 2020 09:49:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id a5sm3604247wrp.37.2020.09.25.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:49:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: lpass-platform: use devm_regmap_field_bulk_alloc
Date: Fri, 25 Sep 2020 17:48:56 +0100
Message-Id: <20200925164856.10315-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
References: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, lgirdwood@gmail.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, tiwai@suse.com,
 rohitkr@codeaurora.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

use new devm_regmap_field_bulk_alloc to allocate fields as
it make the code more readable!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index df692ed95503..7ac26290082f 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -56,6 +56,7 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+	int rval;
 
 	drvdata->rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
 					  GFP_KERNEL);
@@ -70,31 +71,13 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 	rd_dmactl = drvdata->rd_dmactl;
 	wr_dmactl = drvdata->wr_dmactl;
 
-	rd_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->rdma_bursten);
-	rd_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->rdma_wpscnt);
-	rd_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->rdma_fifowm);
-	rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
-	rd_dmactl->enable = devm_regmap_field_alloc(dev, map, v->rdma_enable);
-	rd_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->rdma_dyncclk);
+	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->bursten,
+					    &v->rdma_bursten, 6);
+	if (rval)
+		return rval;
 
-	if (IS_ERR(rd_dmactl->bursten) || IS_ERR(rd_dmactl->wpscnt) ||
-	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->intf) ||
-	    IS_ERR(rd_dmactl->enable) || IS_ERR(rd_dmactl->dyncclk))
-		return -EINVAL;
-
-	wr_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->wrdma_bursten);
-	wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->wrdma_wpscnt);
-	wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->wrdma_fifowm);
-	wr_dmactl->intf = devm_regmap_field_alloc(dev, map, v->wrdma_intf);
-	wr_dmactl->enable = devm_regmap_field_alloc(dev, map, v->wrdma_enable);
-	wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->wrdma_dyncclk);
-
-	if (IS_ERR(wr_dmactl->bursten) || IS_ERR(wr_dmactl->wpscnt) ||
-	    IS_ERR(wr_dmactl->fifowm) || IS_ERR(wr_dmactl->intf) ||
-	    IS_ERR(wr_dmactl->enable) || IS_ERR(wr_dmactl->dyncclk))
-		return -EINVAL;
-
-	return 0;
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->bursten,
+					    &v->wrdma_bursten, 6);
 }
 
 static int lpass_platform_pcmops_open(struct snd_soc_component *component,
-- 
2.21.0

