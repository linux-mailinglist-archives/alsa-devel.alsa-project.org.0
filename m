Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402B5B01C2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EFB916A3;
	Wed,  7 Sep 2022 12:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EFB916A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546058;
	bh=1GA6v1ac+nH7f5I4fQVSG9pRkajN1rrbqZIdBvpoXdg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I08iebEWBabF5rboqVt4MIIS826+Vxe0wLw7xzF2cQm/VEBbu95WiVm9wDuO8W+dY
	 DNVXntVe+V+Dxl+ntFJTOz3TGAj0w7kXlXOoBqfv81qTNztmE2Jq3YHP42lEq5fteF
	 oJz/sHrHR58YBli8+wub9P+45gjgSL9iUFzC+0dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E50FF805CB;
	Wed,  7 Sep 2022 12:16:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7D18F80551; Wed,  7 Sep 2022 12:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACCE4F80567
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCE4F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iJEBGiJq"
Received: by mail-lf1-x133.google.com with SMTP id bq23so21674841lfb.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=iJEBGiJqXXiegmiXuqo2B6OiveypNmJ9RC1K3vIBsRvmE5sWUR8BpA0SyfLrwY8XtT
 QklZYpDoETo0BsCpJuIJ83vTg7OzPgcoQXi4jAXQRJxO07vuAYkPfF3XS1njodL4+mvp
 842sAvQdgqH8HdJmV4n/Z1Lrv2b8dWHZ3jysdK4yTeHMSDG5FXdBTp+kx+DaAjJsYfwf
 I1jEXiL2UUa3M2EV1x0oTL5WKZgZPgav1VWcASoDkG4d+MQVlqQB2UoZz9J1rUfdT63r
 0ny2ca7CvEJU24ggz9S3ZMqGJshAJJFvKw3TST+pse8d+R1gjIhC69IBSqHg7IMHgrdr
 4D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=D17BEh7X+HMUVgPOp10h8y7vjCPy+S2vH/OidcMQEupw6BPAd/DkTAtA41YWyVpGNT
 mHzVNpUipujA/Qua58CYm0+d74O2SEBPdbekoVAQxa3Y73POGHIkoS8Q9QnvQOzZPD/z
 2ivkpVnv+ZVO4r+gDgGVeUhUDnNGAhUf/REcDhBRa7NGNiYEisYAtgtVdaFyoyzRdlix
 XmDdnmOJwm4rC5qunpUTGEJywfpKFDsFQ6ef4+sWnrHFs5mhdhTjf1/bLtQaLWkf/y5x
 xTF7R8tqBdAphwAVVmFd68APbyomNKqgihFHsDkqiCa7NnTE1m/WRfopoxzA5aRFgv1l
 P+4g==
X-Gm-Message-State: ACgBeo2tzoxp9USpvBi1rX8VNKZAjk9Xc/iaBpal9g6HtOpX4Ap4Z4wZ
 qkso1BoG+BSHGEz9oTKdkJC3Pw==
X-Google-Smtp-Source: AA6agR4Zn1G3W5prvOClIzFDIxdFRH12bnmFLoC3HL6Q2qsxBu/1/06d7WEYmFZRjXArrk4N9g/y6A==
X-Received: by 2002:a19:7b0e:0:b0:494:6a97:fec2 with SMTP id
 w14-20020a197b0e000000b004946a97fec2mr867822lfc.87.1662545781307; 
 Wed, 07 Sep 2022 03:16:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 12/14] ASoC: dt-bindings: qcom,
 q6dsp-lpass-clocks: cleanup example
Date: Wed,  7 Sep 2022 12:15:54 +0200
Message-Id: <20220907101556.37394-13-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by adding APR and service compatibles, adding
typical properties, using proper device node names for services and
fixing indentation to 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Add few more properties.
2. Adjust indentation (better).
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index 604861d84ffa..fd567d20417d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -38,17 +38,22 @@ examples:
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
+            compatible = "qcom,q6afe";
             reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             clock-controller {
-              compatible = "qcom,q6afe-clocks";
-              #clock-cells = <2>;
+                compatible = "qcom,q6afe-clocks";
+                #clock-cells = <2>;
             };
         };
-      };
+    };
 
   - |
     #include <dt-bindings/soc/qcom,gpr.h>
@@ -57,13 +62,14 @@ examples:
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
-      };
+    };
-- 
2.34.1

