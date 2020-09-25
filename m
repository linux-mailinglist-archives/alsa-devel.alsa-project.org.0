Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3D27840A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 11:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123A8182F;
	Fri, 25 Sep 2020 11:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123A8182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601026277;
	bh=H0DMnkJkEyWkAoJo1m0n1iJGu/lBiLQLXP5joqeztT4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvyQnGyoCw3cBRRgDVXB6N32ihxV6IuUaKWFXhI4KG4WylEj/uQz1WbyQOhN6rL2b
	 mbOrhNHGsbyggu9JH2byiVmmGgI60Fr3zSJBI6Oko1XReaoLkJidx25inpenEmmwIQ
	 8Pz1GFPgjubp3d/m5UzT+YAzSlLW2H2ymUkR3pNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E05F802A2;
	Fri, 25 Sep 2020 11:28:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A5FF800DA; Fri, 25 Sep 2020 11:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E452F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E452F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LNznKUHS"
Received: by mail-wr1-x444.google.com with SMTP id z4so2822625wrr.4
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+lQmvGIW34Fed8sffLC/RmBoE8wLwQ9s9GB7PfHXuY=;
 b=LNznKUHScZpcbVBxTTF2/ypBWXKkc8wBM9UV9nb/DgTkEiwfxUYkczzbFEG8RkMWUX
 lP7MurZarRW7M0/dXDSmFrlZhe1Ow6Caz+Jl/Sj7Inx/i4+1hi22xwa+2ynB+3SA73T5
 H/k7KNVtHyZNypCILFyhsCfPg9YgGLgyhZR21ACLyCTSiRDpF8+t2UDq7rtoMN4lHBba
 7MqHRMod7qyO8iI7qB3pm8cmNMsnLiYwCp33yHv20vFnw9XjNZ3TMN8BDuNU8E7f3S1K
 mrUDYXOL9gQDlj0b+vQC7r9OgRLAMvs6dlRH/ngDAzh5stAiNr9I5z6MqTpJSmhSBC6F
 05Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+lQmvGIW34Fed8sffLC/RmBoE8wLwQ9s9GB7PfHXuY=;
 b=ML13oMnPwOExIQCuz4h215pYUB1WlC+ckAdtLYQe7i31NTda5OvZs6NsUEgY07YzlK
 PG8ZV00phIyb0i6eQdTkZgdRpCWIdvsFquQqlsZIcmjOoJOLVm8QR+nMPug39EAHSsiW
 E613qsFdYxpNY+orTMfXWj07MgZqBtvqmG0GkVGJ8KaLA6UmjZGx2BwtVYVUv7dzDj6q
 EuQGP+ol7mrwezdd2oeuL/IJsSREvoKcSCrlTGOtcV5gMGM8HrUkOj0hWcevgkc65Y3a
 RG539bhZXx7g7yl/fgpdT7LvOEpbbhSPMthZs8hICTawnHJz5ktxBVTfj+UWWWdu4vY5
 v+Kw==
X-Gm-Message-State: AOAM532zZu+MZpZeeFeKRp4zwuL5CEo+l4mri+6T0ux1YaW7Fo0kc6ve
 vitg8jE94SVTZTEK5WOpAOhmJg==
X-Google-Smtp-Source: ABdhPJwe0tGhwlRBHQfo0XPNmflmh1mkrdlaabZjOOBmINRUpSzPw9GJzqrYNZkjHavFfPXH6KD/cQ==
X-Received: by 2002:adf:9e06:: with SMTP id u6mr3515710wre.208.1601026115714; 
 Fri, 25 Sep 2020 02:28:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n2sm2366859wma.29.2020.09.25.02.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 02:28:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: lpass-platform: use devm_regmap_field_bulk_alloc
Date: Fri, 25 Sep 2020 10:28:04 +0100
Message-Id: <20200925092804.23536-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925092804.23536-1-srinivas.kandagatla@linaro.org>
References: <20200925092804.23536-1-srinivas.kandagatla@linaro.org>
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

