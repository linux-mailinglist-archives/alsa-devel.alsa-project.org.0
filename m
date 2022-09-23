Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF335E7F2D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D2382B;
	Fri, 23 Sep 2022 17:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D2382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663948763;
	bh=vWUxtbWP6tdrbx8LpwJUKttZ+VXef6bXKaXQHRjlm28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGaubyVyeqXJLxZRvHeSsGKT04hsrJ1dZVrt47l8Oj0ridyIYKyfMo3xS96UWnuhm
	 M5HalLT83KHEiA3jeiRXhQiroYrKQKB7KxUc03qbtnnTWKftWG9BSDrsw0A5n+hHhn
	 /U3J5nPBkB+7iOL8xiAqI7pkDqX/W02fvGqAmuDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD0AF8053D;
	Fri, 23 Sep 2022 17:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5E02F804AC; Fri, 23 Sep 2022 17:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C534F80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C534F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K90C3hBC"
Received: by mail-lj1-x235.google.com with SMTP id h3so586766lja.1
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QErVhPRsr6N34SxJtyWhiwnyHyeW0kuOVw7a/uaJPXU=;
 b=K90C3hBC6wd5wX5fUY+1rT0FrcxSVMtXeBam2xxfpXbCDnmo2fyDcdgG9nSnADKhgc
 o2OWb061x6VWvbk9dEQrp/ePFAimAEzue6BUNwKD8D+jnciw5fX8KSljEMbkxJ4ubc5+
 JcsV14M4u1b4vcTxCWhY/vF4t5qB+ONaqEsca+a0xJ8LewPoup13Tr+JooMVwEw/6NfW
 VL9HsHhxI9BEbeBoZsgPhA7P5nhbAvydwvQo8DZ9hwF9uZ+OY35lyF9WSCg/iLLERh1O
 Hy6hTcAaGuVVEh5xCawr/KmXvG54ToUvvcdhRwVK6HCyTvcjHApHE4dAHP4Q5DniMhzR
 lwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QErVhPRsr6N34SxJtyWhiwnyHyeW0kuOVw7a/uaJPXU=;
 b=oTXFx1lEoSpP/c6b6XXp4F+QzLo04ARLJbi0KMYNz0SqhagN24eG/UNkEA8KYEyhZo
 9QpUvEWIbVS0CkWxs0ZAZBk6BUIYArEfDssqLLbhrneJs9cf8KjiCCUC+JjTk9mo1GZW
 h/624bOj0lfVzlcmqF8AhVNtraAQ0G1BfZo5dwLpgrPIlkD0c0+6goPGfkkNn213SNCB
 t+ou/srr8tfOsQF/KV48GNIpYF+uhRCOOagLbEjbfougj1r+vVIeUjgpGTqvv0VcAFET
 lLevsk6u3obqJnKy5r811IcL7RB/clpvq0sGWgHilO72aeVviq6KxmOIGQjGus0cBl1W
 QMiA==
X-Gm-Message-State: ACrzQf0AUS04AgU9Bc/R4xmR9F2TnCpCRAmR0ProzwSGfSeX/F1VncgS
 gL/VwH+PcoLEJbfpvO0zU+HObkz/EI8vsg==
X-Google-Smtp-Source: AMsMyM75V1fMGaL7US5/aDsMjZmatRFTONq2M7J8EAALYekOySKgoE+XfmX2rP9Y0C4bmxwyKYSNYQ==
X-Received: by 2002:a2e:9dd3:0:b0:26c:3c23:a7e0 with SMTP id
 x19-20020a2e9dd3000000b0026c3c23a7e0mr3014306ljj.22.1663948668446; 
 Fri, 23 Sep 2022 08:57:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 08:57:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] slimbus: qcom-ctrl: drop unneeded qcom,
 apq8064-slim compatible
Date: Fri, 23 Sep 2022 17:57:37 +0200
Message-Id: <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
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

Bindings require usage of fallback "qcom,slim" compatible, so
"qcom,apq8064-slim" is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index c0c4f895d76e..bb106eab8ae2 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -718,7 +718,6 @@ static const struct dev_pm_ops qcom_slim_dev_pm_ops = {
 
 static const struct of_device_id qcom_slim_dt_match[] = {
 	{ .compatible = "qcom,slim", },
-	{ .compatible = "qcom,apq8064-slim", },
 	{}
 };
 
-- 
2.34.1

