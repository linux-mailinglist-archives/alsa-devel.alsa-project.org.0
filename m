Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A0355C0D8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 14:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028401669;
	Tue, 28 Jun 2022 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028401669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656417991;
	bh=1sNbI/dwlklA2M4/Ud9PxRI+qWyCtHcvwBKMIeTIZVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7dMCRQFeyqjddlemjY6ssSrNpWyB4tLbTHvcSrTvxi0FpNksPvHxKJREy7CsRrhz
	 UWcqsZ4Kk0LPFwdQy6IuVggTkM+t/gaCgUIMLz1haDHaPr+75nTqJEaGfYxJ61E8a7
	 npGu7ll5j7FGIECzVGN/koKL4KEhjDFQb6nVmjbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0528FF80536;
	Tue, 28 Jun 2022 14:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8304FF80107; Tue, 28 Jun 2022 14:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA3FEF80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 14:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3FEF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s3A+Tjnt"
Received: by mail-wr1-x429.google.com with SMTP id o16so17391429wra.4
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HA9Ju9WiWYMyHFa1RrEaM+Jl1wBHz+W0Kvbk+W2ZI4Q=;
 b=s3A+Tjnt6L5ct+uXElLKqAN+RCi5Q53fO2x4+Lzy+vMSEPrAskYDKsEIbQDI7w7tI+
 BkcCMWR8tlHAfFSk0Qf5L9EFZ5wJr+pMq0V0N5nR+pR4Z5v35M/HZBo6moSF2Rf0cJSF
 MU3va6nFgqpve/F6jHPiKzY+HlZ/EHa05HsVqDGsq5HQJ9sCpVb1oEzepj5TBDdYGZc+
 aWEUJIuF5VpSwwLGimI1H/X8mYZQE0NjZBkbk/vdaj6qcvwedpmJ9bxQqqLHR9OJfkP3
 yR8RfEoyctyjpiEP48XQ+jeeJO2aU4wlCJO4u+p+xN/i2iIWLGtDHLfxycSCX20my76B
 lipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HA9Ju9WiWYMyHFa1RrEaM+Jl1wBHz+W0Kvbk+W2ZI4Q=;
 b=vE1Xo6TtQldy+HKKk8slVSStJi7zSPVrUebk2io6w/bJWlJVnwhZnhhAshTx79g6ra
 BXdCvI3m/9vzIjf5vUs4/8ZNv3wQgOUlkELa9kuZrhZslAMxWr/DAqmLHV5K+WJAFJT6
 hP+wtCaASSoNekVzq1FDnThFUTsmzY06k14XVrt531Htr9e8FXfUnOL2YRAZhm37k66n
 wl43Y1GGuEOo4ScapzlTrJ6sj4CeAjPTqRByqSL5ANL9FZ5ARijsfllCJ3OIxJeZvium
 2IGHNJpG5z8KrBMWZ0J80LWcMrDx9zIQ4lYz2uEeA/XjLJcQRcODcjp2MLyt254zDYlH
 hlSg==
X-Gm-Message-State: AJIora8t2Ob604hJv6X/PBuMUui/yFJ5zOrTE9BHku8jT/EmVjFn2cVW
 Am88dF66PPLqyP5KIFex30NhRw==
X-Google-Smtp-Source: AGRyM1sCchwbqLWnT1eNhxSqPMIG3TnWhGdLsWF7fS7Cdz6ZFQdvj+vTi0FG+ORF366s/y1KfIOaXw==
X-Received: by 2002:a5d:64aa:0:b0:21b:c38b:bb81 with SMTP id
 m10-20020a5d64aa000000b0021bc38bbb81mr14388793wrp.666.1656417879960; 
 Tue, 28 Jun 2022 05:04:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 05:04:39 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v5 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Date: Tue, 28 Jun 2022 13:04:34 +0100
Message-Id: <20220628120435.3044939-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
References: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org, krzk+dt@kernel.org
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 1 +
 sound/soc/qcom/lpass-cpu.c     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 3efa133d1c641..abaf694ee9a3a 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -293,6 +293,7 @@ static struct lpass_variant apq8016_data = {
 
 static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
+	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa4..53f9bf6581d33 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1102,6 +1102,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	if (!match || !match->data)
 		return -EINVAL;
 
+	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016")) {
+		dev_warn(dev, "%s compatible is deprecated\n",
+			 match->compatible);
+	}
+
 	drvdata->variant = (struct lpass_variant *)match->data;
 	variant = drvdata->variant;
 
-- 
2.36.1

