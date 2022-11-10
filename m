Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFD62435B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0DA1678;
	Thu, 10 Nov 2022 14:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0DA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668087418;
	bh=JO01unIMxYMApyBGVRBxOT3upI6NI+JpIKmZJYe/EoM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IM2KVRxiuiMF56PIsPDsyCU+R2/BIvaOlbPHZPg0yBDprsp7V5oBqEzcEW7ItOl0m
	 3x14ou8MHKKA+O/OFyzAVUJfcl3pBVRAMbvbb0ES+prgAXatwuI/3aFlXfTVXDs8S4
	 oKb5u96hBQSj9noPqzFCVfQBOfTbWOfs+v3VXRAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00496F80507;
	Thu, 10 Nov 2022 14:35:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2108F8021D; Thu, 10 Nov 2022 14:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693DEF80163
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693DEF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hZtgk+Xq"
Received: by mail-lj1-x236.google.com with SMTP id u2so1177591ljl.3
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3pEWPACClIQY3/paQHJjNw2VtpoudfeFxBlbc9fm0M=;
 b=hZtgk+XqtQAv+XWLfm84wxLLD2mPgWzuTTgp8Q0gOl8kIZxpQ9re6jZSm2PXIKKGqx
 c31ha8v+rxkThYcBDq5FWVw4hy6UJyI3akUrMqkCTR2vsXYsbRF8RNm5VJneNYRuicyl
 VsH2HgHOPW6W2Wc58pc70r82T9XnpuHae4jendFqDSRr8eKqniKHDJa21hi1rt3+R0+D
 0G+AGf5nVyUzXegkHB9zkPSzgunEFp7vQd3e+4xTIJgxSbRq8AgvHoldrA4gtZPbNCqe
 56XD4jn2HTi4jP9H1TX+bfVYbY9YtNcf4TgJiVhz3viswLTMR+vcaaFLlR62CclV1Y13
 xhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3pEWPACClIQY3/paQHJjNw2VtpoudfeFxBlbc9fm0M=;
 b=g0k/vUbwooIdQK7hiDvUkYjPbcpIhRfvP60Tba16o/QeZC/Pp0XhLZyMVI+NxDl0Oq
 7YbceTKP1lQWNlM6vRRJpmmLB+lqhszQRmS1x4v5xmB2pRVjRvqVRScyT1LrXzS8KJAB
 a0KXDZpaM3RtZjzvEW7b/YfWif3fw6BsuCqi6qEqiQc7GX3jehmezIASM5RqzOuGfNnV
 79m+lijlUiGcHKM9QmKuP0jrfDbrE9VQBuwRXekbCAdTYMF7N0OtDU0kpR6YMXHhd2S2
 09PcfmBOurmaULPKzhZdUMQ8/pgtj5+yX0ph/oK7ku1JiGke9BfIU/HHEgeDM2zp7VLl
 helA==
X-Gm-Message-State: ACrzQf22924LeTAF9IOes5t6YmUwrJzElonJtCBr7mawYCbOvYm7dwjN
 dxJH7+uQUKLdDL5lGn3w5oR+Rw==
X-Google-Smtp-Source: AMsMyM7ZsAaCoMRKyH64gFWu9/lw3JKr1YbEwgIWT7QSSmLf+YECbGSbvB+NikQpWYTycsz3LoJzmA==
X-Received: by 2002:a2e:a0d0:0:b0:261:d86f:3cde with SMTP id
 f16-20020a2ea0d0000000b00261d86f3cdemr9308321ljm.86.1668087326182; 
 Thu, 10 Nov 2022 05:35:26 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a0565123a8e00b004ad5f5c2b28sm2752576lfu.119.2022.11.10.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:35:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,
 wsa883x: Use correct SD_N polarity
Date: Thu, 10 Nov 2022 14:35:11 +0100
Message-Id: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Use correct polarity in example and powerdown-gpios description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 6113f65f2990..99f9c10bbc83 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -23,7 +23,7 @@ properties:
     maxItems: 1
 
   powerdown-gpios:
-    description: GPIO spec for Powerdown/Shutdown line to use
+    description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
   vdd-supply:
@@ -47,6 +47,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     soundwire-controller@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
@@ -55,7 +57,7 @@ examples:
         speaker@0,1 {
             compatible = "sdw10217020200";
             reg = <0 1>;
-            powerdown-gpios = <&tlmm 1 0>;
+            powerdown-gpios = <&tlmm 1 GPIO_ACTIVE_LOW>;
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
@@ -64,7 +66,7 @@ examples:
         speaker@0,2 {
             compatible = "sdw10217020200";
             reg = <0 2>;
-            powerdown-gpios = <&tlmm 89 0>;
+            powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
-- 
2.34.1

