Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAC3134D6
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 15:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2B01694;
	Mon,  8 Feb 2021 15:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2B01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612793953;
	bh=wZPshLqGR2Le1bMG/am1PfeNZZwaf74QF6887B0Gi5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nv9VRNMkTEQTRquuIBPlOEy4Yz5QB7CSGyBn9gd6+c6ryN4M7IktxzmgVhhLsZI5C
	 BQj7GWk3uJVkQ8+ir1yki4W40+OhTtT+7gDwnCuz5BddEdkVTUUypni9PR9uYAd9Nr
	 hWcyvy2R3t6A9OaV8gHJFWSET3wbxmY/co8O7gIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC699F80277;
	Mon,  8 Feb 2021 15:17:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3FC8F80277; Mon,  8 Feb 2021 15:17:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3146AF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 15:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3146AF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g///r3gP"
Received: by mail-wr1-x433.google.com with SMTP id b3so17316104wrj.5
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=g///r3gPY7GNdhBKs6DE1SEDvLXVa81vGXGmKGu9HUrSVJT3Wh9Sr1+MfJcub7ZaQe
 O0f8grh9i3M7W3NVMAf3XhhViExaiTZVHLcEqYBXIyJNY+irSybgrffJEfOu9jknin7e
 5bBxKPrONG5NtHoEvVXUJRdhXPE/uHyHXsjCKWEM7gA1505WIT7SeeQ2I8GmDEjkA0W2
 FYXMxMm+aGcAD6LZkHArfA8VMx7rjvWBc8R4LB3W4Uygudq4coECVw7xt9qb5U2dr92/
 r6i0nGcUuuWbN2PBGOz5QAj978Ps1QKVm83hkklBVcFRCjiFXbsSPuRfgnjqIXEYttJf
 9saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=So8UGikwqUNPBXEL7PBOe5SYO2qoJc3csoTha1utOnW6zARLpJy51Q5StAnteURjam
 1d9BfoANCSoul9lG9rjDPExPDCm8BHWg2oT6fKgG4D1rh3qv+0JzweNJJom6BcWf7cSz
 U7mBDQg35m2pxqF+FUpIfLwZBbPZwp5SiW3gE1MqNqbxMfHG8fCcSYxqN4sm6AdT9Mym
 50s/BGoiaM9MnmHAOi9bXiOjx6TqRsvY8J1HZCI86kRH1XOnEWFRSyS5cbae9quKrWa7
 EeW3gtW1L4Zlc3knBj3DHnGbRUG5giREdAheuwiEff+9XJroSnL3x168fwDNibYVrzgb
 b8kA==
X-Gm-Message-State: AOAM5316l5eBXDUvl2I9EhuRyuK3kqa47aoy0wAm/sVVgaWkoa1F0u1g
 x8iqJMEFASe+hzonrD1rxwEF9A==
X-Google-Smtp-Source: ABdhPJwMkCxKYq4tdA44lB6usqGaRMv3DQ6GHp9OnWCsn2MwYabUhWMcc2ubUIOlGVCI3fBF6tK1cg==
X-Received: by 2002:adf:e642:: with SMTP id b2mr20289781wrn.221.1612793845728; 
 Mon, 08 Feb 2021 06:17:25 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t18sm27949809wrr.56.2021.02.08.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:17:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx
 macro codec
Date: Mon,  8 Feb 2021 14:17:13 +0000
Message-Id: <20210208141719.23305-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210208141719.23305-1-srinivas.kandagatla@linaro.org>
References: <20210208141719.23305-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This binding is for LPASS has internal codec RX macro which is
for connecting with SoundWire RX codecs like WCD938x.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
new file mode 100644
index 000000000000..443d556caa69
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-rx-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) RX Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-rx-macro
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: npl
+      - const: macro
+      - const: dcodec
+      - const: fsgen
+
+  clock-output-names:
+    items:
+      - const: mclk
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3200000 {
+      compatible = "qcom,sm8250-lpass-rx-macro";
+      reg = <0x3200000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&audiocc 0>,
+               <&audiocc 1>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+    };
-- 
2.21.0

