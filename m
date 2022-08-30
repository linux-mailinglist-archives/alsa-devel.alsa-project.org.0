Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F65A6B4F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 19:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F70D1699;
	Tue, 30 Aug 2022 19:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F70D1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661882004;
	bh=vK46HLkJ2is2fXs67Kj7m8cZ1cDEjE0HroV1OpzpJgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YrVyY/0fWDbGCfViykwA21dOMFUA+OmfRP7/0UKN4QvqS1axj6fvaOEuWkNgOIqDY
	 KSkU43HPWBATFoWVcGMfQL0w/Zgc0oJP5PGtrw67Y7vRtHGoVayBY2qY3/0ZTuSzyc
	 hw6rNafjn0VCUPlg5NuBlnsU7heW2ow9o1TGoPYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1E0F804C2;
	Tue, 30 Aug 2022 19:52:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B668AF804B4; Tue, 30 Aug 2022 19:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7360EF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7360EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Oi+RM+tz"
Received: by mail-lj1-x22d.google.com with SMTP id p18so8853401ljc.9
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VTjkGMpau5/qRAdXn0AI5h8erS6BqzJeV7Kg59cVfQA=;
 b=Oi+RM+tzjrXAvwWJ/1F2E+IM9ParyeuSLNnrQVs15TSAVeSuAE0Infw2CS1/QiRQS/
 LlAQT6OHgfQwX2CiMKnx8lxZWKGZdYZtf3T1/+Wd6XEyxWKdC9/VoZx1W2IH3dnCyRxD
 vQonf5rzfi99B9n08RlW2+poiVwtJHH2/2gifP7L9jg1a8ZF7bS7mXRQYgDt1NnvYfEd
 SPAh1G+E2H6fiF2PX9PkBJYaQbdvyveYL7JizYQL0yGeSgbJh4AaTSK3KKOXPLrFkADV
 0HleTJnmPIEmZYXw6u5uWrWSGv2vJSrgFw+A28jF4U5nFY67+KbOj/DAdGNIlgIKDg2F
 lmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VTjkGMpau5/qRAdXn0AI5h8erS6BqzJeV7Kg59cVfQA=;
 b=RZ2yMFiUrEVHMc7P+OF3c6FqodUl4f//koOCsa3yvPXrWdVeMhKasjWJP6rtzQpq+J
 T2ldJdN6fw0pCZ0kA3SQhgiyosdhGHX0uqSsyX0l1p2rQr50Lqb+Bnp2SJGPjRxSgzPv
 R4hAyT8qnU4Q8D1q9nLxO3ZssuWWo6MB0u/X8BmKrXBYSAQbh7bM3vmBmACnM5/6pw5u
 LcovuTW4TYvnoox4BY1LdP1eC+7q5Rk9e3oyJQEwobFpAOgwdds6j5vMAH3W4W8G5Lt3
 UfpjW2GdXf45kKm5CjKFT26GqofPNycsSj+G4eaCtW1Dy47oc8Oi299WUYXQNeVUA1M6
 75Fg==
X-Gm-Message-State: ACgBeo2OQUKYsUk8a2SXlGaarSaqk8qtbnIHEZaP8N9Tj6A6thVjFUNO
 W8wo/Y6oYAgp7KyOQnIE/Ol/vQ==
X-Google-Smtp-Source: AA6agR6YVxd1GqkYJZb2vCNU9Na2hZJBEwqWFfETlz+jgEblX/6iRSkfaYv+JTOwOExVYOZfxz5+ZA==
X-Received: by 2002:a2e:b8ce:0:b0:261:ada1:d803 with SMTP id
 s14-20020a2eb8ce000000b00261ada1d803mr6901699ljp.143.1661881933438; 
 Tue, 30 Aug 2022 10:52:13 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05651c11d000b00266461bf934sm653420ljo.107.2022.08.30.10.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 10:52:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] slimbus: qcom-ngd: use correct error in message of
 pdr_add_lookup() failure
Date: Tue, 30 Aug 2022 20:52:05 +0300
Message-Id: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
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

Use correct error code, instead of previous 'ret' value, when printing
error from pdr_add_lookup() failure.

Cc: <stable@vger.kernel.org>
Fixes: e1ae85e1830e ("slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct typo
2. Return 'ret' instead of again PTR_ERR
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0aa8408464ad..f4f330b9fa72 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1581,8 +1581,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
+		ret = PTR_ERR(pds);
 		dev_err(dev, "pdr add lookup failed: %d\n", ret);
-		return PTR_ERR(pds);
+		return ret;
 	}
 
 	platform_driver_register(&qcom_slim_ngd_driver);
-- 
2.34.1

