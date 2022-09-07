Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF75B01C3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF35615C3;
	Wed,  7 Sep 2022 12:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF35615C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546072;
	bh=DRIoh5hCfNENfG/JcUlLQQDz0pWYklCK4FZSRxn/dxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucWR0gt9xFIMrbcFtbbHK5Yj0FNUh2TrG9nIjeCBwZIN1Q9SlhLFWak3zPD+u6faq
	 RbTcOlStgdSs0My6EzNajJ6AparebTrxtzYiFhHqHnoMvQCq3TTNyKnaHn+xFpYQgw
	 3edgryvvds/dMAnt6o+Ep0oGMae+o31y7+AQ5dpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EA6F80564;
	Wed,  7 Sep 2022 12:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCED7F80423; Wed,  7 Sep 2022 12:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB664F8057F
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB664F8057F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ChWRI8qD"
Received: by mail-lj1-x22a.google.com with SMTP id bn9so15382698ljb.6
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=ChWRI8qDis+YWkKe0I+qyMCm0aW5WKr/0HGHzuKwD32pRYC5t8LRindSrtP0Cd3ajj
 eIUcTl+TvJd5BR0FR4oHNqM3YPOjV3cNUPt7ubturR3ZceiLSDdufIbavuNYSkhW3APo
 /e+tKcLEObXGRRip17WUYl0nffilkBw2qRH1INCiaoNdj94+ndnw2N02CcylccwJenFk
 EhlX2HfbZKPsrxTRhp+Ep3xcDMioWlBBw5VcV6L2As+NavAZY3izxUb6Gw0IYyYqZWvg
 MrUWAfbWXv74yLWFbkPNguDu0y6bbrdc35P2HV2NOG2gBGtQIDnfmG3y5hvcqi4RtxPJ
 W0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=GpOFe8e4xFZ3uhON0oSmLeDxhMe6LJGAA6s27UZfQpR2SYaxQhsnvfCcUxRma/Tsmk
 CQbH0tFhcFpJPZzsJQs6QsbxGRbWXupxv2HIYXmbhUxDG6aUxsnl5jSeBC/L6Jan7zgv
 co5vTCyCJrq5FZYju3QieVguzkhi3CEb550MSmA6HeH8Iwlpd1Q6agrye9G4Bg0vBMSN
 OYF0selsXgtl3OWg+21YxzZSmoxR4IKW5eP4aUKOAKpP4HlY+aBUDx42SFS3eRP0QtvI
 Leec0Ip9M43jXpByW3aMZJl7Po4JBFfQP6OGZOcgPvJPTxkGxLX+nBR+niTQ5RphB4mk
 3gHQ==
X-Gm-Message-State: ACgBeo1s7gWoOdpvXgstiUiRPPUb50ZE2F0v/tLyQreRBr03z1ZSQueJ
 iWyd+sdIHxZPaCp0moZ3RYeFFQ==
X-Google-Smtp-Source: AA6agR4qNoMuCGTXy/UbzjBcRROS+BhHEWrT0sR/EQ2fEGnRWEpeJSviNxaq4edkYpNdKXZZvg87oQ==
X-Received: by 2002:a2e:b003:0:b0:26a:d07d:c501 with SMTP id
 y3-20020a2eb003000000b0026ad07dc501mr204338ljk.388.1662545782589; 
 Wed, 07 Sep 2022 03:16:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 13/14] ASoC: dt-bindings: qcom,
 q6apm-dai: adjust indentation in example
Date: Wed,  7 Sep 2022 12:15:55 +0200
Message-Id: <20220907101556.37394-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by fixing indentation to 4-spaces and adding
blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 844d72b30969..24f7bf2bfd95 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -33,13 +33,14 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
-          compatible = "qcom,q6apm";
-          reg = <1>;
+            compatible = "qcom,q6apm";
+            reg = <1>;
 
-          dais {
-            compatible = "qcom,q6apm-dais";
-            iommus = <&apps_smmu 0x1801 0x0>;
-          };
+            dais {
+                compatible = "qcom,q6apm-dais";
+                iommus = <&apps_smmu 0x1801 0x0>;
+            };
         };
     };
-- 
2.34.1

