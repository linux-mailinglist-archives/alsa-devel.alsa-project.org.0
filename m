Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588A5E7F32
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAED4825;
	Fri, 23 Sep 2022 17:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAED4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663948779;
	bh=dWsPbHyRn1Kw68WQytw7fmieAtju/ZHKC2yycx7ntjw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5eKfrfk+hTPDbHuJDFA1zp6m8L1qHZf/BU5ZBAYPhKROn/RFa/6+mhSDEodL1JVz
	 HCtSYhVuTuEEmAc+EpyXS4Mrpv7OV6f5dhFJQTmXLpM4A0DY/ILW7lx+3of4pcqkKB
	 NbinlpUgUV7HbHVa/6lbJk6UVvh6DjJj4S3pHdQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1CD4F80542;
	Fri, 23 Sep 2022 17:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 995A1F804AC; Fri, 23 Sep 2022 17:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52DF9F80269
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52DF9F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NxT9e5oC"
Received: by mail-lj1-x232.google.com with SMTP id b24so553298ljk.6
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9pEICJNZ5nO4P1+qOCCLWpWUXxTuEVpFceB0baO81JE=;
 b=NxT9e5oCLYKT3a6UU77vYEEwrXRUDdJCwgbS+hOxcuLdlHIMlTMMxhSgdQnrZzyEly
 JHxvA7uR2vuZXCbjYsfLJ+AyHAJiFgQ1vFYG01HGsmhe/BN4RcBkH2iPXCgoN492oL+m
 ++JDv5Oy+UDcW3Ne7acj8VTsu7SavjAnbCTaZ1e/VREnOGufN1N9whgAGD87ZcOupuvF
 LVDjVzNcmPZ8TfenVaL/R3n7vmimEBiW7S070ZDPd8MdF9hddErFB14sjuNi2DsPa8os
 uIhn3RSCCCxjbwVQlx5094CsuZ8I77E5lmPFDmFyIdwsrXquoMGN4iLqfbZFhZppZpjc
 O00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9pEICJNZ5nO4P1+qOCCLWpWUXxTuEVpFceB0baO81JE=;
 b=76r4Rix+QyJlkBySFr4pAFSZmzqSSAxRTfE0R20d4GojCMha6J/UUFUhco0W80ndb8
 20bEWXM75BL/Idzy/xV5lMhxZr0e1k9rafjTVWqar6Yh5Y9UKn7qFPL0rPq7AWhsriWu
 jgm/hLRshutbPVguTHbrv2N0kfZb3UI4fqBhJibq9tFXv+1VY/cbdPDHanLgjF19wZpW
 GXyMg5YQIgWYhHKQSuYyNXq5Onnh+39d5dsAeFZfgvcfKbuNmiouHD4fl1emwJ0xdtS+
 cnJ5zMl72gKVD/Hhuf9sO3ZyjzQ5tAKSRji0K8hkFa4ryvxSL0oC0yDXRVqq1nVea9GC
 osvQ==
X-Gm-Message-State: ACrzQf3nLzvocRWo8xLekVKsFWpymObyCP/n1VHKd/gn3P2TQecGGOeM
 fq9eJ0ysV5BjKLOj8zBi+x/s2Q==
X-Google-Smtp-Source: AMsMyM5oOoFxS2EKXFonjqhk3x8OIxrbxXsljwIAKoZi/K/SCJqMWRX+2YH61wuqXvRvi2m8t9zeOg==
X-Received: by 2002:a2e:b889:0:b0:26c:22e0:71aa with SMTP id
 r9-20020a2eb889000000b0026c22e071aamr3188671ljp.501.1663948670392; 
 Fri, 23 Sep 2022 08:57:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] slimbus: qcom-ngd-ctrl: use
 devm_platform_get_and_ioremap_resource()
Date: Fri, 23 Sep 2022 17:57:39 +0200
Message-Id: <20220923155740.422411-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Simplify the code with devm_platform_get_and_ioremap_resource().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index cec11aa106bf..548dd7661334 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1522,7 +1522,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_slim_ngd_ctrl *ctrl;
-	struct resource *res;
 	int ret;
 	struct pdr_service *pds;
 
@@ -1532,8 +1531,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, ctrl);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctrl->base = devm_ioremap_resource(dev, res);
+	ctrl->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-- 
2.34.1

