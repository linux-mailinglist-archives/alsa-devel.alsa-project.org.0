Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 155135B01BD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1C8169B;
	Wed,  7 Sep 2022 12:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1C8169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545993;
	bh=5aVS9zbw+auoJ64SOOwsUpuCWmmgiTqFs0Rqk/ryF5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IjxZ1+4iu0iwgz2S082mLybZEig0i6lRliJ/5XEDXwdf/hVWhN0xdw3djIgkKnqnL
	 pfCPzJ0mXHGuSrjxZDnLxXQ2xsMjU1Q3CZKZabtetWT9tFLTyAnkNTwa3ysCuV8V4r
	 ww8j9awoOvGGGCCt8iGN7qt2iHZYFc5hxbykPE+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EDB4F805B6;
	Wed,  7 Sep 2022 12:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E017F805B1; Wed,  7 Sep 2022 12:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D492F80535
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D492F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wmrxO8LM"
Received: by mail-lf1-x12c.google.com with SMTP id x14so6299687lfu.10
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
 b=wmrxO8LMD+MTnqYrEWS8VoI8pGCdL92Hp+n3t0Z0BQpJ3QzEK7Gut2SM5hUwsYxqkT
 Ut8wyoI1y+83zVBJbote2nDxz1zm8g5uFQ27seyEpurRfGghwg9feePY4XUZmm/eGzeP
 tWU+7OrftmbVC9O9vlRIc9KEgfuwmTfSrojB89i0AIKc6iRU9LSjKn0tpCUKki/Qgsp6
 zRvqfWygycZPc81nbZw3sHpGj8y8HlCquVXKx5+JbhmmbQaHJiIN7XKwIjNCeRSySGIR
 spjhhozeJTwT2eJ5UloQ5yY5SE+QsLpHU/B8PS4yMfm/PLlnooUeUQNSZlnBSPceOrnt
 AJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
 b=3mu4q4ddQkFfaZvhSFGHLcwB+rgTsc3QEMCTrdqI9WhYcUejkyWhIwhsD02/M8BsAi
 G60dqP2AY3A9GNHtz7LJegM0OsNV4F1xrLnZkNNCMZbt5wYHZbdWtPMquWkCGBsxGuTH
 jObVLl5ERtrrKqmMlf6HGaeTFA07pewbdOnKVGmgRcu/KEFcC/wC6SvGFjc5MgrkpPJx
 hno6yNsrnqqS+BvI9V/XBJOFdvrsg2bGp9g+PXx+pbrc//hW3Ybm2bAsM9s/7oqx28u0
 ckfjn8733Ni6KoxJrZfdpGWasWs+PesGNroRb1s9iiMs2U/ZSYedEkYVdcK3/0SrmuWV
 exlA==
X-Gm-Message-State: ACgBeo2XRzhjAkGmouuEFWGv+ILElQunRmVUYri0EQPbEnuxxq5rY2Qq
 ApxqsTfdzVWjQDbcaRcTNGPJLQ==
X-Google-Smtp-Source: AA6agR7C4ChseY66F7QZIfa9vAhumII2zndyeu9DBWtPdLZ1Bzuwapq/6WLgTNqkWa6T94uUHDrJdQ==
X-Received: by 2002:a05:6512:3f94:b0:496:5e1b:a1c5 with SMTP id
 x20-20020a0565123f9400b004965e1ba1c5mr905346lfa.483.1662545779790; 
 Wed, 07 Sep 2022 03:16:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 11/14] ASoC: dt-bindings: qcom,
 q6dsp-lpass-ports: cleanup example
Date: Wed,  7 Sep 2022 12:15:53 +0200
Message-Id: <20220907101556.37394-12-krzysztof.kozlowski@linaro.org>
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

