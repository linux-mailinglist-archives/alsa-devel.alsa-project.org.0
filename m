Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9441348B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 15:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F1715E2;
	Tue, 21 Sep 2021 15:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F1715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632231686;
	bh=6S4MMf0P9KUf4QLmZga52h7TMUJCzxWqw1kXeq7znlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZkQbk1SOjaXlMZS21n2eRHoD6kWVWyCMMIvtI/CMVfzpIZFgNIwgJs3yfJADOOqF
	 VZkJZY9ZdbrF64E0RG9JWhuBQ3NwUqdKjEAer9YBVbutyDiWVeb0z1ACeD4taAFxYI
	 cLGDWJ54E5cQB2LituKENryZ2g3dhwkgxJJVmJGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03D59F80508;
	Tue, 21 Sep 2021 15:39:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B889AF8050F; Tue, 21 Sep 2021 15:38:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1349BF804EC
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 15:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1349BF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="J5KYw5/J"
Received: by mail-ed1-x52e.google.com with SMTP id co2so28030227edb.8
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXUzKXqyFK0FF7TuDfDOhSheb5jJRieIFIcaHFlaH0I=;
 b=J5KYw5/JHY3SHsYK5xunLWBHiyNjKDGJmh26R0nD5SXMSzMzRszw7/jYFBUI3oMjBd
 Hv0eQNrj3VXxdR8p+9FlEqmRci3tjUCzv/7uF6npiknFzmdtSITr2nuAS4CxOXCDjJ7q
 h2BcHFbfCJFezSKXwaQb6kUUOce2QHxJF0v7x0SVEMicJnOlH++3vcsNhlvuPgflJGKu
 Z8k+511YeuMjyMwRR/RyEhQ6q0fxhCXSnCJAvbCNcDZDXZE1vLEekD4fTAORXuDqMoxM
 x4j4AJg2qjbyHKXWlb4JJC54wDGXY9f2v8CdkL0a06Ow/YuBo3CJU8YiYvtPbW15ZEMG
 HFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXUzKXqyFK0FF7TuDfDOhSheb5jJRieIFIcaHFlaH0I=;
 b=BXybbcPzoJWm3H/CHQouP1RoGIPnQPfEPtCT01KtmaNHcIYMY8GYtzzEsg7f/7MwGB
 owIa/RVm/jjCaQ7y1MT2RCGufvwjQnoCtsP2Ga5Gw8cBqTO7oRBGaotE9WJLmTq7SGMS
 MxbHI++YD/gXQwkWCvaj8eRKMvH1/OpqjRzu2crbRJ9UDuF3iQbyJx7IxZodkg4ee1Rc
 fI6S3G+RELnHv2Qz9ItVwuKj3V473UZPjP0i08dLPPJEb3CBPSS5zbPRRFze+HMreDa+
 rU9w1ml+nFhDgkCdo9uiXQek0jr1MvWnbn12vlnazmimu/QmP79WEHT8WE9/rN/G34uQ
 0vJw==
X-Gm-Message-State: AOAM533t83hVXjgjwUdYDdU9mK5tpC3oXqu02U7e8q4pMmWIewWYloQN
 lg0JaqXn8j44rfQVg7C8eW8/QQ==
X-Google-Smtp-Source: ABdhPJxtEV/r1kUQl09tKJkIr/Lk3YzeGcoAz7qrFNky6Uuzy9MibbGzeXxennhqj5pAGCSZfjuiBA==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr11954771edk.90.1632231446434; 
 Tue, 21 Sep 2021 06:37:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b3sm7915799edx.55.2021.09.21.06.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 06:37:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v7 02/22] soc: dt-bindings: qcom: apr: deprecate qcom,
 apr-domain property
Date: Tue, 21 Sep 2021 14:36:49 +0100
Message-Id: <20210921133709.4973-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

replace usage of qcom,apr-domain property with qcom,domain property so
that bindings and driver can be reused.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index a52b955b8b39..bfe04fca8aa3 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -31,6 +31,21 @@ properties:
         5 = Application processor Domain
         6 = Modem2 Domain
         7 = Application Processor2 Domain
+    deprecated: true
+
+  qcom,domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 7
+    description:
+      Selects the processor domain for apr
+        1 = APR simulator
+        2 = PC Domain
+        3 = Modem Domain
+        4 = ADSP Domain
+        5 = Application processor Domain
+        6 = Modem2 Domain
+        7 = Application Processor2 Domain
 
   '#address-cells':
     const: 1
@@ -96,7 +111,7 @@ patternProperties:
 
 required:
   - compatible
-  - qcom,apr-domain
+  - qcom,domain
 
 additionalProperties: false
 
@@ -105,7 +120,7 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     apr {
         compatible = "qcom,apr-v2";
-        qcom,apr-domain = <APR_DOMAIN_ADSP>;
+        qcom,domain = <APR_DOMAIN_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.21.0

