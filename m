Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566392BEEF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0451D21A2;
	Tue,  9 Jul 2024 17:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0451D21A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540611;
	bh=Xq8uJAy88lv1uxCiheZGM9OSarqyJTMwcEDG1B96A2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QBjyxaVm7OMZVYmBy9eVL1WafcnS1lnfXmfAGPYDJFnNFPpX+R7bws3E7ATccUHkD
	 6W3Dv5ATPvxy2LkCniI8jxtV1flot3IMcrgZTD8oxOX1k7SoHNfNEfFRe6r1Mga6A9
	 5SCd328VTuBz45u9YZ9RYTog2i85UvspI+xcUmFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B839F80621; Tue,  9 Jul 2024 17:55:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D2A4F8061A;
	Tue,  9 Jul 2024 17:55:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB4AEF8020D; Tue,  9 Jul 2024 17:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8F40F80074
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 17:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F40F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DMQo9k7S
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4265c2b602aso24577495e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jul 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538927; x=1721143727;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNtSueuDtXsARVEbcRgGrAWRHcIqldsm424wzohUyiY=;
        b=DMQo9k7SgV3ruwwRw0QFbYfm1v4Y4+K2P4Cxxg8hi6PvacWpovzYX5CSWBMsTwdoKq
         3b0uMUsuH2ZVCKpzmvd6ifitEVadqbFP0rS542i+QcFYXu+S+cH5rAHk/8kWyELx30tJ
         HuRKTsxnEbcel6AwPQenkFWqqRJ/JoRR+T6GNCQekfvGrkOPvFGy+CQd8KnDXizsBaxu
         uxco3GR9pzvHOZXZVBvBsf8Ds88AjkIkRctoU0SGjo+cgb3IakGnVclkd4nqUUw7dt/j
         b6hQCd3w5OyW+nF/e4nydmMf3Hz1/9TyffgT0sUROSeEFb8h76bBoEx611L8/J5RuH1L
         j3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538927; x=1721143727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNtSueuDtXsARVEbcRgGrAWRHcIqldsm424wzohUyiY=;
        b=ulH0QfMHWJZmabrcdXbJeKLHVVQGM2CN+8sDFJPASRtecJACKwQiDebIvPfEb7SMl6
         DjpzV2OIREnD9j7gakYWd7UjpzlctpaRsVl8aLXb9co725Lqr3tMmXrXJXl9Gvo7HvIi
         UoLJVruY+0Op8IwaafzYDwmurjwzWiLoF7vRzMJXR5jq1cB8ma7WfnreFy6pnuxSMN+5
         lnmdkf9EMcHRAe9k66mU/6TfJiQFpdo4Rc3GTbPhGJlQg1NiIJkg4eaZl0CzviotWasy
         vk4w6GKGccG44HbgGuicMnIpkroMgZraTfZ2LbX0ujnloTwPPo9Zo91+vjVNZkHPIJ3X
         4zPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw0LPET4Vgkd0QySDDvRK8FiPP6jEsj81arvZEEOe926SLFv9NlAtm/kFt3iK8mLCIfBZNRu4vq4FqdUxFytoCyot336jiPNZpIRQ=
X-Gm-Message-State: AOJu0YxbwTMhdfr2tGN6LGxExABfuCTpwBaLLBJJXjrYy78Cj1upZDAn
	EZzyAo+UNM32M06f5KF3aVqOJ9xZqGq3mH76VMkIc8lr7Xa+p2E33FIA2OAkYNI=
X-Google-Smtp-Source: 
 AGHT+IEiiEdiOEJvS824Y/O3HEpYDyOdjBG53LXdLiwlz6IeDKbNx00nUjCQ8cB6GpjwQh1jLEsC5w==
X-Received: by 2002:a05:600c:4a05:b0:426:6618:146a with SMTP id
 5b1f17b1804b1-426707cf1c8mr19505775e9.2.1720538927353;
        Tue, 09 Jul 2024 08:28:47 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a32sm45883775e9.24.2024.07.09.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:47 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec:
 convert to dtschema
Date: Tue,  9 Jul 2024 16:24:42 +0100
Message-ID: <20240709152808.155405-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709152808.155405-1-rayyan.ansari@linaro.org>
References: <20240709152808.155405-1-rayyan.ansari@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VS5AROCPGI6FSPW6QG7BMDELZ6RFFV5G
X-Message-ID-Hash: VS5AROCPGI6FSPW6QG7BMDELZ6RFFV5G
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:55:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VS5AROCPGI6FSPW6QG7BMDELZ6RFFV5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Qualcomm MSM8916 WCD Digital Audio Codec bindings from text
to yaml dt schema format.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../sound/qcom,msm8916-wcd-digital-codec.yaml | 53 +++++++++++++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        | 20 -------
 2 files changed, 53 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
new file mode 100644
index 000000000000..5e7d15b61ad6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,msm8916-wcd-digital-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 WCD Digital Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  The digital WCD audio codec found on Qualcomm MSM8916 LPASS.
+
+properties:
+  compatible:
+    const: qcom,msm8916-wcd-digital-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    audio-codec@771c000 {
+        compatible = "qcom,msm8916-wcd-digital-codec";
+        reg = <0x0771c000 0x400>;
+        clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+                 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+        clock-names = "ahbix-clk", "mclk";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
deleted file mode 100644
index 1c8e4cb25176..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-msm8916 digital audio CODEC
-
-## Bindings for codec core in lpass:
-
-Required properties
- - compatible = "qcom,msm8916-wcd-digital-codec";
- - reg: address space for lpass codec.
- - clocks: Handle to mclk and ahbclk
- - clock-names: should be "mclk", "ahbix-clk".
-
-Example:
-
-audio-codec@771c000{
-	compatible = "qcom,msm8916-wcd-digital-codec";
-	reg = <0x0771c000 0x400>;
-	clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-		 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "ahbix-clk", "mclk";
-	#sound-dai-cells = <1>;
-};
-- 
2.45.2

