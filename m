Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3895B45A4
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FA316A4;
	Sat, 10 Sep 2022 11:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FA316A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801565;
	bh=1GA6v1ac+nH7f5I4fQVSG9pRkajN1rrbqZIdBvpoXdg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+65jQbLrmI5zyie891GH7FNa7zZPduN0gVf1jM5NP1bkD0VD7PpBS1bOyi/Im/vf
	 9meMErk8WFvw912e/4nyxWBglueTMhEb1jc6mzB2pGhrCOwPWgXVCEgRjbZBtW9Qyl
	 wq1NMT3AeGJpnXQ+x+xZW8wdYAPGf5Ia32gl0Kf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A87B5F805B4;
	Sat, 10 Sep 2022 11:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62F69F8058C; Sat, 10 Sep 2022 11:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58C2DF80552
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C2DF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RTrok220"
Received: by mail-lf1-x134.google.com with SMTP id i26so6680036lfp.11
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=RTrok220LM/b9Uk07c9RLsnqCOU6qZiUKKpYirj3esRthzT/dRh6M1tnOkAmYszt/5
 tBAj5b/x0emE8K6hqwk8VCcmxDdeG5nJfGGW6HgHUc3qq4FkvwAbGY5CzH0uw6r6U3Pg
 s17rwctZD+1HSp+zle7Yu6oQ1wOnWZqVNOAKOgwsAdr4adCq/kYPS07nPuJbvGSZsn1s
 SyrVzxDFbLXwlZDLZXeAu5gP7qI0t0AbDB4n/StHpfczrZb91kFGgz/W5fNte11s8c47
 dzChcLArJPeKcloinTdTyd4T3e2Y4aJmZ1LxKc9c8IihrxVJ++CmBcitQKaxDCTDg0M8
 elUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
 b=A/giJyjv1nF/NObzowG2iugoo3nfhUlLdm70VEMqa/BNlf5tTqEihsj9686cJiikHK
 /0q+bbUOeesSPRr/7vzIGKsHEFwr5KN7OPsaMEDL1rRUgbDRJpB08uBv5oTHRU2clSCx
 tM52EAEWRJ8qO1WGwD06xe75mKairsMUUQES4KzifkGL67NawivpN+zm3AYuzr+xPvaZ
 M1RJWePyhHl5yxCH+Nz3GLRrckDb9mHOb+v3iwbl6ynMftxhkpNtzXCtYmJQdw+vpRVJ
 yaH9bnc4+PCh3wb2zMxVY7kFhQ2LDVqDbXL6WlGKYTtrvuFJ+bCAi5pFGbP2+rJiKzWT
 v9ZQ==
X-Gm-Message-State: ACgBeo0OYx91Vhc2VJabWhI9VTbEtr9fcHNid4C9gIdxo4kZuw/Zlr2R
 aPWIHPyon6TbTl11Bj/SwC6fJQ==
X-Google-Smtp-Source: AA6agR42Ti+UFet+yPHWp/NC9BjFyAg2Iqnk5J3QWrDLMxCGYye3JpY/bZ52d4m3k49P4vYgqeNkyA==
X-Received: by 2002:a05:6512:3d02:b0:498:f4d4:e246 with SMTP id
 d2-20020a0565123d0200b00498f4d4e246mr3335630lfv.115.1662801292990; 
 Sat, 10 Sep 2022 02:14:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:52 -0700 (PDT)
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
Subject: [PATCH v4 13/15] ASoC: dt-bindings: qcom,
 q6dsp-lpass-clocks: cleanup example
Date: Sat, 10 Sep 2022 11:14:26 +0200
Message-Id: <20220910091428.50418-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

