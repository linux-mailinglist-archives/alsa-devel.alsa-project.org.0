Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D688F5B188F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E4116ED;
	Thu,  8 Sep 2022 11:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E4116ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629060;
	bh=5aVS9zbw+auoJ64SOOwsUpuCWmmgiTqFs0Rqk/ryF5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGllBGd+pRy9gCAQKcmm+8uyaFs1spSh/wEJjAsRtUbw3CpwP1q8iy1HBmTLdm60P
	 ddhaO/3ueYIf687zNJGOJ05t3pXecLG4CY/FaRFU1wB7eqmzWtGDwjwxYtnrBRpr4R
	 HNNDgNUepNP0UDShoNGT/d2on/n1tOmGsqvC/VoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B997DF80571;
	Thu,  8 Sep 2022 11:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E8FF805A8; Thu,  8 Sep 2022 11:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E809F80552
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E809F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FuG9ZNkA"
Received: by mail-lf1-x12d.google.com with SMTP id bt10so26709977lfb.1
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
 b=FuG9ZNkAYfZmgoVUKeD0vr8+/eD4ewspZSqIt6YqeHMI/2uBDkplRWQb+jjYTfksVT
 fzQ2tUNHqzgi6dS2RLIAuU8LrlXZuLw9nqwcyejfNWMYcV2QmUg6vmC4IU+LB4OAEdrI
 CMzZcKWvqlWBxqnUcNdCELRc0tCT3DAgQQYDlEuTaOcmNgW2i09KbWLoRMU86e/6wfxS
 JfhV/1UdjnT34p9W+/vHKfK2hVFRizv+nfi/dv1Gt0sgYhSpBJzgwJqZwDcB3IPZLp5d
 F9TpUid6CK1Hv3Emvlr0DXWeGylJ5A60Wt4G3LKIbE4L8cBFgFifdmAVC5c8JCxOBHt3
 Cwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
 b=Yjy4/PVrsMIjtCR0QbbRgimb9qiMb2EoEDPAVYrxYk72UUNupJsxkITP6Tp0LpEX8w
 JssFwKV+sNPvlT6g266Z2pIfcIPiYclgQQ4UGDXOTZkgFSjiJh9og/j8Pe8yBRbjnpz+
 +QBd2fILELNy+VzWfWsiO2gbrjoQ+Yl41MMARBO7zPcs02wScQPHT3cWlk1yMUwOCkrD
 Y0K3c7Cgj9G7ScJxMytEx0kJGMKvSrejdXDaj9ngxoThwxUfhO15gnKAmyU9KYqnN5mm
 3jzV+g2J7DAZnOWACzgCuORMOPGOfHJl6QDLfD7t9phwp7KWbK7IJbfeIHphm4XolOVl
 iidA==
X-Gm-Message-State: ACgBeo31j/Oifu4ZE+bo86WxWdBzaeBrVWAuzYNCmKCsp8ptuwMSfdjd
 MY8OVZo7dGeI9lvQAg8qon5Trnfd7pUxKw==
X-Google-Smtp-Source: AA6agR7AH8GvHNpm6AveyQ5Y23ze3KD+DMB6gLno8Ajk/ENVucohLgMW1NuJXoXQLtZn9ioOftdhww==
X-Received: by 2002:a05:6512:258b:b0:497:aa94:e10a with SMTP id
 bf11-20020a056512258b00b00497aa94e10amr1836072lfb.223.1662628804291; 
 Thu, 08 Sep 2022 02:20:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/14] ASoC: dt-bindings: qcom,
 q6dsp-lpass-ports: cleanup example
Date: Thu,  8 Sep 2022 11:19:43 +0200
Message-Id: <20220908091946.44800-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 48 +++++++++++--------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 5e666d9fb388..e53fc0960a14 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -153,24 +153,29 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     apr {
+        compatible = "qcom,apr-v2";
         #address-cells = <1>;
         #size-cells = <0>;
-        apr-service@4 {
+        qcom,domain = <APR_DOMAIN_ADSP>;
+
+        service@4 {
+            compatible = "qcom,q6afe";
             reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             dais {
-              compatible = "qcom,q6afe-dais";
-              #address-cells = <1>;
-              #size-cells = <0>;
-              #sound-dai-cells = <1>;
-
-              dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
-              };
+                compatible = "qcom,q6afe-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@22 {
+                    reg = <QUATERNARY_MI2S_RX>;
+                    qcom,sd-lines = <0 1 2 3>;
+                };
             };
         };
-      };
+    };
   - |
     #include <dt-bindings/soc/qcom,gpr.h>
     gpr {
@@ -178,20 +183,21 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
             compatible = "qcom,q6apm";
             reg = <GPR_APM_MODULE_IID>;
 
             dais {
-              compatible = "qcom,q6apm-lpass-dais";
-              #address-cells = <1>;
-              #size-cells = <0>;
-              #sound-dai-cells = <1>;
-
-              dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
-              };
+                compatible = "qcom,q6apm-lpass-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@22 {
+                    reg = <QUATERNARY_MI2S_RX>;
+                    qcom,sd-lines = <0 1 2 3>;
+                };
             };
         };
-      };
+    };
-- 
2.34.1

