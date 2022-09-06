Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC85AE7CD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F6F829;
	Tue,  6 Sep 2022 14:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F6F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466870;
	bh=yq9WCBsIZLoDQvtgo3Jo4/Rihu5hKZDGcQj1JRgluF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LinQVFqfMy8wePLsqnljjoyh+wtomn22l3V/5kz/G2Lg2SPFbnWri8pts8KJWn0lN
	 1CJlhobYu+0CH3Q00dSNxmZqaNFqFKAPt+1h0VWKTGR4lorzgcY4pB33w7llwsxXpO
	 XTupG/vEwDQE7IiF+KZjn/NZTXoegBfA4GJllJtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 507D1F8059F;
	Tue,  6 Sep 2022 14:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 299F0F8057E; Tue,  6 Sep 2022 14:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B57F8055C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B57F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="N139uZEt"
Received: by mail-lj1-x235.google.com with SMTP id s15so12075267ljp.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OEJpYrvp/+MPWaO5UKqFt1HDoLTGd+E143aJwfuryW8=;
 b=N139uZEt73ijI/qnsX6l3Rn4kYjqI8UgZygHGge6OzJ4TUbW4BXDPLXaO976apXlS1
 1oOGpJS8OKu5qhYhd72qh97tSwoMh/E+9PPSk4zmmed7gqoYbFNWk63wTz2s8Ihg771i
 7rHPRR0IrcNX3UDAb5FKEqWxHXpJcZtvCY8TGlIIgWhYYjPcrwAvMOJwrcKnvKS5VwHz
 G/UE3OltGDseWQjPAup9qnJ8GIAQ6NS/u6hJBw9uUpTiNkuAPxqy1Z4SvJadpCxFhdQW
 q5FOpuiocWaqpo7+GDotvamtnRxI4i3XaQy03ByAzFyyvqvNLiVq2AmJQzhtSdKtAiuD
 gnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OEJpYrvp/+MPWaO5UKqFt1HDoLTGd+E143aJwfuryW8=;
 b=xJWAZreCLGdomTY+d+Ecu6zr7I47nVJhP7Go4sqz9Z9knJZ0IMOPEpgcqvXwH0YkC+
 +/QqRPPVQyxxr4L6HcfsZ4ehf6C1WPP4VKeDVW1BpGqUFVe6cItLqNzYaWuyJyOI/JfM
 Mbd24FlTzvPV4Ae89p53LNLTPwMBRY8mmu+MCcp7d9ounknSSeNX/Tk7FVzG7/233b4V
 yUcsvwx9yodLJiLL6z0jFbr4m1D22pTq/NuNIP1jEmuZQk/UHL/BU7V3vsEw33Sa1QlV
 Pa+FombiklBnyyr2QLjJlSwx3RvCrgvV07Obelp7i0HXAILHWjQL5iuK2CmqqGywe9a6
 nlDA==
X-Gm-Message-State: ACgBeo0BHHqARdxtER87u+AK2l417aE0Dfj7exAzAKPhG/nyOZrelCCJ
 q+W84MM50nFqAkwElnq+MGdL2Q==
X-Google-Smtp-Source: AA6agR7YrWKYTS92mqGGCKwSsmB3O/NlIfmpKLoq3IaviuVAfksz+FOONLitLdJw1N//UntYXqceeQ==
X-Received: by 2002:a2e:b892:0:b0:25f:db66:3b86 with SMTP id
 r18-20020a2eb892000000b0025fdb663b86mr17029652ljp.79.1662466632760; 
 Tue, 06 Sep 2022 05:17:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 11/12] ASoC: dt-bindings: qcom,
 q6dsp-lpass-clocks: cleanup example
Date: Tue,  6 Sep 2022 14:16:54 +0200
Message-Id: <20220906121655.303693-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by adding APR compatible, using proper device
node names for services and fixing indentation to 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6dsp-lpass-clocks.yaml    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index 604861d84ffa..1e1114286d3a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -38,14 +38,17 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     apr {
+        compatible = "qcom,apr-v2";
+        qcom,domain = <APR_DOMAIN_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
-        apr-service@4 {
+
+        service@4 {
             reg = <APR_SVC_AFE>;
 
             clock-controller {
-              compatible = "qcom,q6afe-clocks";
-              #clock-cells = <2>;
+                compatible = "qcom,q6afe-clocks";
+                #clock-cells = <2>;
             };
         };
       };
@@ -57,13 +60,14 @@ examples:
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
+
         service@2 {
             reg = <GPR_PRM_MODULE_IID>;
             compatible = "qcom,q6prm";
 
             clock-controller {
-              compatible = "qcom,q6prm-lpass-clocks";
-              #clock-cells = <2>;
+                compatible = "qcom,q6prm-lpass-clocks";
+                #clock-cells = <2>;
             };
         };
       };
-- 
2.34.1

