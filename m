Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4455A6B55
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 19:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DFA16AD;
	Tue, 30 Aug 2022 19:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DFA16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661882050;
	bh=E4KgCSBFUe40RGwc++ui/SvzQSItuqwlYZq/fp/UwH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFw/Bk+7S0MpJ6Y2BUgV+Vjt5M5JB0/SD2UA0mPfcz11Bgbw/fsAl2c7y9zXxWQbC
	 S3Ui4oVe15L7HdYkaoti0uhvGNlSUR1H2BfBrW+TdgsuMRALxUHZ+nIxZGXz+Rn1Pc
	 hOJ+7tq4BlCOcd0thzH2sWv25hsQKc/9S7l2z390=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C120F80535;
	Tue, 30 Aug 2022 19:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C781DF80533; Tue, 30 Aug 2022 19:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE6D5F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6D5F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ewGMkAia"
Received: by mail-lj1-x230.google.com with SMTP id q16so12171716ljp.8
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sc5HxHmlEPh4tH86ykJVfO3JOxEms3jA1Un8zaoNfDc=;
 b=ewGMkAiae9VuZkt4oRyIeJ/oPXeBsBitYVe3mfJD7hFMno1cINAZb4OxH2DS8r+EAn
 i1OkVYlRf9fHLgBcAAfduWzaNibqKm5TjARI9LTYey03wRkAX/3NR2oFjVmNoh4eSJ65
 0yNRuTNsRz51WGkG4aHctkKtRQeNXyY3FfwxE9jYmmFC4GXL8mmvr0DU06/OwMqBDYEQ
 4mA1WcjpJ+wsOH2uuAlTqCLhHjFj/Y65dWMFWkFDMpIkT3ZqwZNA6R2H6vgImijTynGh
 Ymzg8lYvhv7Slk8oUSiyu2uWVL4A6nHoShpudcoCs1SO7reDcunMRvZkudjbA592vsBk
 Yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sc5HxHmlEPh4tH86ykJVfO3JOxEms3jA1Un8zaoNfDc=;
 b=feRBn84XvPAxymMPiyeriUZxIYTbqdVUKf9vhp9A3EcxsQ7IVxvmzXXbTKI8ow89N8
 kDArsw4vReIyNca3Y7v3E32hnGb4bg/sMzkm4GmLT08ntwolAc4BetXt3cElFUJGxRyh
 z0cdrwDJzZZ7P8oeGWdTncJd+EGJOVtifGC9eiC3XBqHIypr7cRemVZ2kijVgDVwcpIS
 PdojpCOK9rnDdH+O/4007s0T3Ibf0LMIcXyWH2rI9aE/4aTp9T++0C1iZmP6kqzEno9A
 NPvEDv8vsdlcd7noVWuEp4j4d1mrbmfsdQ8cSrKzQvyeTl8k9aLaqcbofdv+A+NtaWzR
 /2vw==
X-Gm-Message-State: ACgBeo18NM1pxn1U++d7FJHs8oKDLS0W+gGfBOZkT8vXFjxUjGkdhy9m
 aFNwXPMiy0qIF+175e5QuUjoHA==
X-Google-Smtp-Source: AA6agR7kEED4eOUmvqvRHvp6dhNWSxVrTH8RHc95EoPsVY0hEEJFr94M6PDkfztbkEiF3n4pWIdU4A==
X-Received: by 2002:a2e:b808:0:b0:266:52d9:ac6a with SMTP id
 u8-20020a2eb808000000b0026652d9ac6amr2201215ljo.14.1661881935998; 
 Tue, 30 Aug 2022 10:52:15 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05651c11d000b00266461bf934sm653420ljo.107.2022.08.30.10.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 10:52:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] slimbus: qcom-ngd: simplify error paths with
 dev_err_probe
Date: Tue, 30 Aug 2022 20:52:07 +0300
Message-Id: <20220830175207.13315-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
References: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
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

Use dev_err_probe to skip printing of deferred probe errors and to
simplify error paths.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index bacc6af1d51e..cec11aa106bf 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1543,10 +1543,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
 			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
-	if (ret) {
-		dev_err(&pdev->dev, "request IRQ failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
 
 	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
 	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
@@ -1575,15 +1573,14 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
 	if (IS_ERR(ctrl->pdr)) {
-		dev_err(dev, "Failed to init PDR handle\n");
-		ret = PTR_ERR(ctrl->pdr);
+		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
+				    "Failed to init PDR handle\n");
 		goto err_pdr_alloc;
 	}
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
-		ret = PTR_ERR(pds);
-		dev_err(dev, "pdr add lookup failed: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
 		goto err_pdr_lookup;
 	}
 
-- 
2.34.1

