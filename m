Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8955BCB5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 02:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6AB1663;
	Tue, 28 Jun 2022 02:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6AB1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656376241;
	bh=nEWsLGmF8325vJZpm07WbegkyjvD8bhloxc2S0eAn6c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0oZTJqf2kUhnkGrOeEM7Wjxuo/rtnO9Y48YHelmKl09WRQkhN6gMdmOGO2MBBm5i
	 SvNgLMGmsuN0z8pWONx2qTcyJ1MZye8kx90lv4G1rHIN1vlaUgThItnGiMhwg1hGwd
	 1YdNKsRNkH54dbuigJq0qeFlU0J5LFb+nRFv6OZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33620F80107;
	Tue, 28 Jun 2022 02:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30CC3F8012F; Tue, 28 Jun 2022 02:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81CBFF8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 02:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81CBFF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aQqKlx2n"
Received: by mail-wm1-x334.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so8438517wma.4
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JhHo/c96RqUx3d1BSnJliVbZrX3rYoCTCoQbgEL1koc=;
 b=aQqKlx2nvthEI5iO+lZtBomWQE46C7nR5V8+E0UX9CBiYyfEPrxs1FIWpkUD1uTrrJ
 oDLPBcA4VNXrv/luMpXIUX2bsV/B0IxqbOXHcFdg1g6HdjWV+InlQrbQZPf/zd2KYxw4
 xbkgSd9Mc1wAKEuAQLX6N+iqgnmX63Yre6PwwPudj0haEg7bs25bdRgSpCcRfbZm/t7c
 +FDjRqmIh7XOedj/+n8RgCvDYwUWLBar7lL/Xb+lPFEEs8g6Fzz0MgnbMVDhuHoMqQd/
 pCGZajqqPtOCi4jMzLjcpDEnCzJCh/4NID3+aPaqFogjkBu/G2rJlgEqTrUqRSdxrihc
 viEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhHo/c96RqUx3d1BSnJliVbZrX3rYoCTCoQbgEL1koc=;
 b=ED7HmyUZK44Sy6t+Qu3nQv/UZ+3xCxNz/6fXwd1LmagN6xdqfshgdNX4BByZ1SHtuD
 hO8oZpSTGHEalMUEk9ygBGhSlIIlxnrIzN+6IOtPn4B5/w6Mv8Ch9YvaLGQe1xcqczCg
 pDaPdzeH28KpvloPN/UlfM6yPjW0jhutHGP+GwPftvM/H5FKXvGlofaFnJOFcvUACCJu
 b0ZUiwvSfeTAiBCnjLXonhyL7E3VMSJZjIFxaEwSMD5JhdmrOWXXERbGzl6lXnYrFTFs
 IrAtA/FUG2LNq9Aq4/htvxdS+G9lu48YCKKFNh5a/TI7MiSZFGX071vcqXH9HKo+gi70
 lJig==
X-Gm-Message-State: AJIora8dhrSYIl07mJMwNpZrOZkhbs4JOMT9QuvkCenAde1vvfP/1N2z
 bez+LCSlQLzatiCAevnNNXkDZA==
X-Google-Smtp-Source: AGRyM1sNO9bsuFeQ5fHsF8c8Qskqwu0+/VCb/SKdTn8IG3y/OOaVd5SNGjQXVdS7iZrotMfL+w1x8g==
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id
 j6-20020a05600c190600b0039c7f823090mr22930876wmq.152.1656376143620; 
 Mon, 27 Jun 2022 17:29:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 17:29:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Date: Tue, 28 Jun 2022 01:28:57 +0100
Message-Id: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
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

Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
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

