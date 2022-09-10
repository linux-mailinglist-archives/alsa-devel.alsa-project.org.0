Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41725B45A5
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A35C016C5;
	Sat, 10 Sep 2022 11:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A35C016C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801577;
	bh=DRIoh5hCfNENfG/JcUlLQQDz0pWYklCK4FZSRxn/dxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ohZ6kMWnCXIxVmH3HzhfdFuL19tNGCBKLpp4gwBeOENvT9UH28uPDRRop0heYYBMJ
	 72N6vSZfxo/Zs49UTeZ8QehoLq404Sn//uTnX1ghcpII9dz/aP9IrR8RHBXMcC4reh
	 Im8XiT4OK0FjAUPXoRvk6vs8RTT2W7fxz/qrg0lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35015F805BD;
	Sat, 10 Sep 2022 11:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07FE8F805A1; Sat, 10 Sep 2022 11:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27B1FF80551
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B1FF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mGm4MLh3"
Received: by mail-lf1-x135.google.com with SMTP id bt10so6748340lfb.1
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=mGm4MLh3f/e5mggqAL1D1Kyqh5doHaIDBFrQtK8sqNRJPkcfwS2iFvOA5guvHH+dgV
 EBzMZdNvPu7ErIJLMwzcNb955UGATfLJrVGLqOowWM/I8QI+6Fg6rxyUWVKW4MTcOSLc
 QZCHAusEkyjCj6XzOmr0R2AbY5Q4N6CZJd+Z6uZSxjLivkBc5XZzYAIimtvQatqnoRR4
 Lp6gVu1Vuqudc8kwQUWaZDNkMNtMbDOtv3om/Z0mP3ly0pXjJum/zNUD808pavcy2Erg
 AFyF4+xt52W2F/07B5I4UvnlVmDiy5O1fIUNNHiVo85K01H0dJ7j+Q7CpjyjW32Zz5+/
 kLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=vPNVWFT8gN0JAUfM78pdmhtygSxOvo4+/V/2x72F0eWM3NJMYVUV1Gh3wa4wEFSR6C
 q8Il+o2dTHLtjEo4+kxY6C4K2RQF968TeCFLULxxNRFMBQDVN15uCuQgqNCR4/rX2dh1
 fYNYy+XhM1FFPc99kHX08kOmSY1lfc/q8P7/MdOz9SEEUUIKSXWgzw9RWL1vH+fOiZAA
 HJ62t914y6Wg7H1fUva/egfA498r9/nx8yN2tGxOXtE1MD4U+04SKjsAWaUzi9bzXH/2
 qlLAaDQb4KXarvpnZyt5pFNb1e3YcfFzGI4ycVozT5mqcqWWx27NVi7liTupF/iH84FG
 ULyA==
X-Gm-Message-State: ACgBeo3/Z/+8eRm32X3rIwknMI5GvEZeOa/vPg6N8F2jCmV5D6W5Arwo
 KJSKCUfB+gls5OGAi04VWH8CaQ==
X-Google-Smtp-Source: AA6agR44h4+WA2C462fMoiaHwZtPDvoMp6F4veeqc9MlUjgS9Rk8dYhpQ54H9gDph02QLVvtTYkaAg==
X-Received: by 2002:a05:6512:3281:b0:496:f9b5:eb55 with SMTP id
 p1-20020a056512328100b00496f9b5eb55mr5786203lfe.279.1662801294072; 
 Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:53 -0700 (PDT)
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
Subject: [PATCH v4 14/15] ASoC: dt-bindings: qcom,
 q6apm-dai: adjust indentation in example
Date: Sat, 10 Sep 2022 11:14:27 +0200
Message-Id: <20220910091428.50418-15-krzysztof.kozlowski@linaro.org>
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

