Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD55B188E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1D116D0;
	Thu,  8 Sep 2022 11:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1D116D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629050;
	bh=1GA6v1ac+nH7f5I4fQVSG9pRkajN1rrbqZIdBvpoXdg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNmMT+AWLtjpo1TE/u5uI6pvtwBKgUjhN5ybZW5EgYrCMrUR4IYpEa5JNdD3bsceY
	 gIiBLYDSg//NYq3J80hNAGklzJrP5tl80+zQl5DkF6E76PQXN3seWrV+AISBM74K+e
	 Jc4uLNwkN1x+617CMtH36+oecadRfWoe/nw6cnhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B2C3F805AB;
	Thu,  8 Sep 2022 11:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81986F80566; Thu,  8 Sep 2022 11:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687CFF80566
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687CFF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="STkAO52I"
Received: by mail-lf1-x130.google.com with SMTP id u18so14395382lfo.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=STkAO52IXS/Ne+G7o1janZCHKmsFWEbU6ydvE68Loee8Eot1WuyapeRtnr9ymZoz/d
 JIXFD7beHdEDHQ3VF3VhYEM5dtkO45PgjI0pL3jRUapdn/wjJHlEDi+DHVX3iIeXEMTw
 P3Ei96oYsOWiiUsLkijh5NCC5T3oxKK0r0nATBzKehqffrnSObLuTjiNr0OhoJHnKFT+
 6g5YgscknXOzI3R8doAtMUe0UW3sxHWxewC3/3vkJJNAlOLVw8UpR3jD1Ctjl4BD9nKt
 SNdk444Mb9Fobs1EWv0AAskoSH0146HDKCEKQnII52mhUBCQJSYdxf6ZGoZbriIUQuTY
 u1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=turrbKMy2AHQzXG8cWJ8yOk7MkD11gvurRlpugKl2zm5KaA8H/ia+B2AeDKGcICuke
 k0eIykZdcalGzDKB5xWVQWDtBIHjy502HKDhGCz4vs6xUn8hOpnLJvh0NW9HtuQP2WlA
 Is3zHLzlFwrPMuRJI6U/KHrZOa8E0cxyuMxEMk+gGOG0XAjP1lgQMz8EC0Z8IhVbLyJn
 Oh6sT3VUDT/ikDRgKZzCW57Dq6B7TcCgwOV+PPMGyn+fObqwzF9vkLGLX3PibRhyPxij
 TbycmkieCj0C77y3Yd3OdwHRc+0vcMROGwilqcPOzfgv8qLDndSetC8pDTE1Jrma59X5
 lB+A==
X-Gm-Message-State: ACgBeo1mm2zA+ksGMNPypRUb3XmIExcGR+5In6dGFAhytVb86OjY/Zum
 RRyaP0AQ53jV01HtqG+M50mLoQ==
X-Google-Smtp-Source: AA6agR6YPj8Gite+sHZFi9BVVTGaZny0fPnGxb5dmZMFjYlGnR7twVfVVokoDyVYz7ealMa94T2phw==
X-Received: by 2002:a05:6512:22d5:b0:494:7988:f591 with SMTP id
 g21-20020a05651222d500b004947988f591mr2339291lfu.548.1662628805515; 
 Thu, 08 Sep 2022 02:20:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:05 -0700 (PDT)
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
Subject: [PATCH v3 12/14] ASoC: dt-bindings: qcom,
 q6dsp-lpass-clocks: cleanup example
Date: Thu,  8 Sep 2022 11:19:44 +0200
Message-Id: <20220908091946.44800-13-krzysztof.kozlowski@linaro.org>
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

