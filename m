Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101C6CA5B5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F386846;
	Mon, 27 Mar 2023 15:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F386846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923509;
	bh=sx2XkzMuiINxVl/uYCDE4zONXVOIZXGGgJd3KWWStT4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X6yaVv+onKkGrFGcx9twA6l5yLiU9XNtb4/xdQdkVH4tdEHuRyZxxN8wVL6oycquB
	 O6Zs6lvTr+kGoLtTNe42FICjHGkl5yYDXMhN2CT622DmjgHBs4si/WKD9A/vAzJQiT
	 bBk4z2qPV7Yn8mCPs3QyNbU6J1oR2+mJsipWo3Og=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A22FF80557;
	Mon, 27 Mar 2023 15:23:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EFFEF80549; Mon, 27 Mar 2023 15:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDFBDF8032D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDFBDF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=az4uIKb/
Received: by mail-ed1-x531.google.com with SMTP id x3so36069447edb.10
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a67ZOiT2KfjiEjYrFPwDekMeNpv3czyvxhnWd0/zIc=;
        b=az4uIKb/12yPmBeHcyfAcgIIWW2EHltUAJIhxzSP2LxUgnKxodnLJlMfr08lDXYYBf
         TIxObZRbbhhYXnvX3rKCkZEVMl/orgmbb2f3ql54+XtIEddlhGAhAMbpKC10jiN6+bFt
         rGzSiWXy3WjZrYGiyMJ7xEpCc+7w+UzqUiVVYoaxcddwk62VaKeVo8tYjDJsw/ed5RA0
         bCmBrCiFMTcIP2KgqIGZvF9AgkPMxEXFTFjhOsG5bRAZx+oItfoVoehCuIc1o2J0VXjm
         TynKYCmRwN6DET4YN+FBFlt8vOk4bIs4fqPl9NQN0Fcst2itkWWA47ZoeluJDM+n6hK7
         gBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7a67ZOiT2KfjiEjYrFPwDekMeNpv3czyvxhnWd0/zIc=;
        b=MXbPVBwiLTX/KOKramWaFVbX74EWCNqC4+MN3df8G0S8STfs5SlCEPxoDrySCBAwJ2
         0teh+2rzGBPyzr9LYeyHz5yqSYigK/oYMJFdp/1qjW3HP26AOMfEuHorjPad1PDbNaxi
         iH3uZSbwpF+ZJHXabuxscf76PiM6sqfE8D8TGc61YXIhd5MyrTqRlXT15OEf9BUPppnm
         /NE2SXGC/po5SYERue9aIuBIrqpaWWqOIxfaj9MGrLFN+FPfdZ99CNzUVrinaPS2kgLT
         0qB7VEyYO7ys+cfQe+PQHvTBwNtZZiMq1ARHXoWs519LJ5mKZRn2sjMlzvvDhVkp2W/r
         g9Xg==
X-Gm-Message-State: AAQBX9fnC+cq4IKS6ssDGR8cYfRJgcSefGftx0+PMgyyp77s0sIaj+Zo
	QqLjP0d6HnIV181UaZgZ+LdliQ==
X-Google-Smtp-Source: 
 AKy350YNqlH9FY7SJSed3F0rsVsq/wJy1/Z5BpFQat8+QvN7Il7dBiaXRWwqeI79HqLgfTTJY+ijMg==
X-Received: by 2002:a17:906:e0c6:b0:93b:a133:f7e6 with SMTP id
 gl6-20020a170906e0c600b0093ba133f7e6mr11457539ejb.46.1679923395297;
        Mon, 27 Mar 2023 06:23:15 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550
 TX macro
Date: Mon, 27 Mar 2023 15:22:49 +0200
Message-Id: <20230327132254.147975-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G3TTGRXSYLZPDGQMPZV2JRIAHNV476XQ
X-Message-ID-Hash: G3TTGRXSYLZPDGQMPZV2JRIAHNV476XQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3TTGRXSYLZPDGQMPZV2JRIAHNV476XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the TX macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 768757cd077d..4156981fe02b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
       - qcom,sm8450-lpass-tx-macro
+      - qcom,sm8550-lpass-tx-macro
       - qcom,sc8280xp-lpass-tx-macro
 
   reg:
@@ -96,6 +97,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

