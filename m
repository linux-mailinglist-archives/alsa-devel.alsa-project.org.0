Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653665157D8
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 00:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012831632;
	Sat, 30 Apr 2022 00:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012831632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651269944;
	bh=xp7C7UTpuk8jvqSzOKV3HirmLKsptC8a3kv9Tt+qSbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyfDQmlyZMxJeJaIEVlZ1smKfiPL/JJoF2ZudMPTFJfgaRd5r94DVXQy5Mlnr8glz
	 gEIKbiKP7OHpxGR55bi5watkQqEd/B+rrnZWszGlc58UoPMwzu3iTBpEPlptZjMOQj
	 UViDdZ8xX0RWWAgQVM4VXopOsIqz/06b92HW7jc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8397BF80507;
	Sat, 30 Apr 2022 00:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F303EF804A9; Sat, 30 Apr 2022 00:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 602FDF8016E
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 00:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602FDF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f8f/c/cT"
Received: by mail-wm1-x32d.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so5455565wmb.4
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2mHHs9RiQ0Cwt9nao+8sO16iLMStFW4oWbdufcxBAas=;
 b=f8f/c/cTt3LssA9qXtjrOXFQPPavMOVTGZzpLcbXhurIAQzfWMJoP3GCLGl0ZMonWM
 eV/vF62G+AYpTnkUY9OO93Vj2WXHdG200uV5F2iwpR/aH4FHQEw1peimC2U55a6hkI+E
 m8Vf4wiQ9wE06sG/+b9X+82stcqLaMIWac0hauq9j4E5kSwhUdInDaieIB0f2inIelJg
 tMbDepMlC1zBlf09k6orCogIpEYFkzg51S31VaJ8GTFCa/VQ7KkKuyftLaqDtwp2UFiy
 GzfW95tvh3wQ2liE4YD6ZSsetNNl77It0r15PPtxV0fz6ikkACMzhx8EoYKeZKZ6rOSw
 TbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2mHHs9RiQ0Cwt9nao+8sO16iLMStFW4oWbdufcxBAas=;
 b=3Xgrk54IBEjwFqPjnp7VN7Sz5IFajF+xs33Gb8uG52luASfMu4Hf2mZ6mb5zfSRm59
 DQkOjt/zRZnqvxbxawCqRsxlasNyHNZyZfJKM7kdMByDFz1e9EJJ5wHEx/0DD5IQBiS5
 FaQaQZz2ajQHbkON842Cvkug8VaitwRCo1YIhR/dZg/3WzNKLFh9WLDxKhM8mKjwPimV
 XETM4gN5sq/fNPYR9rQbjJCcUuKsf/oy6mGzP2hTM0QthEAStQA3sqGCPSlFOYMCayFD
 FtrDCm1WrWr2gu2J9Qmq1rAgp079Sz4IQLcVSQL0D0rn3FvHhWeomq67TKAoFqB7h5eP
 HZyg==
X-Gm-Message-State: AOAM533FL9Z+DsZoa90SSdIiyzkduf9gGpLHwwZg3sGJKIT7kGoCtsVc
 Llm+r+vSD4pL4/onfe7Z/S5H9Q==
X-Google-Smtp-Source: ABdhPJx10OSweAWnFAfVBF8dE47IPSunHd4vm9HIlx8cMrsY5ylg8dBwo2QKcmir6edFrtpmwqXphQ==
X-Received: by 2002:a05:600c:3503:b0:38f:fbd7:1f0d with SMTP id
 h3-20020a05600c350300b0038ffbd71f0dmr857994wmq.170.1651269833182; 
 Fri, 29 Apr 2022 15:03:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020adfc70f000000b0020c5253d90dsm338311wrg.89.2022.04.29.15.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 15:03:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Subject: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Date: Fri, 29 Apr 2022 23:03:48 +0100
Message-Id: <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 bryan.odonoghue@linaro.org, devicetree@vger.kernel.org
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 1 +
 sound/soc/qcom/lpass-cpu.c     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 3efa133d1c64..abaf694ee9a3 100644
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
index e6846ad2b5fa..53f9bf6581d3 100644
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
2.35.1

