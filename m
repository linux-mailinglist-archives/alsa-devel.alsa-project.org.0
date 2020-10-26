Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A7298F19
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:21:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B5B16A6;
	Mon, 26 Oct 2020 15:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B5B16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722110;
	bh=eAoSJv1jV15tmfQ+88dZxxPrZAx36ZkMDMbWZtrbHx8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+0fpnRvdnJ0xHSA5SD2tSL1DUoW7pivwB0iuu25J5VcTo8e/F8t4LXFJ9CtcgYUp
	 zeN2hh7PkDnPGAeGEukz484662q6IgSNhDVdFX9Mzn/nXr9ibzxeqMurn0JxedDt2l
	 DHnqUkKOO1ZuowSOswrkgEy24cdbbyZrwkvYvDd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B2FF804BB;
	Mon, 26 Oct 2020 15:20:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25348F8026D; Mon, 26 Oct 2020 15:20:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A174F80212
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A174F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VtqluNgO"
Received: by mail-wm1-x344.google.com with SMTP id h22so1573875wmb.0
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lL98uNKY4MHm3XdA4qICH5iQBbu3vZ12fypi1tkdJtc=;
 b=VtqluNgOZrXHFfeBjfqvh6nrDjHFFrC2GHp5ILryvFqy0DPnpR4OrF3BJcxXKON/K+
 9GJsPCjrauvfANYLkd4vQN3yIvzdvEA1MDxRymiB9nu8gowS/cAC6EFmbOajsTUVybxq
 CeavafZnyKz8HkiuPkh/AtnVqMB3atQTwk2eKiimoze29LA5EPVleTejFX1PSItQzS/p
 E2rPiiDFHgSZtLbeyr4J0yXj1yGtWePBu0hkYhQjNu4vfC4+HHQETS3oW/874/spCbqg
 S3si2X9451WKMmWparfVtHL9dJ/QlpujTj8BtgPNSAr2zU/jdVKNqmqEkMZ1GnQAIueS
 2Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lL98uNKY4MHm3XdA4qICH5iQBbu3vZ12fypi1tkdJtc=;
 b=jaroSgIUFjVgbPkn85A43w4woSf3sBq0H7hLGLcG5Gw5Aw45ruHGVwAmECt66XAVx/
 QfDPMisEVzri9jkGLRa0JAK8K8CW5eohc0PUjvvgJjLWdfvIDPCbgC02u408S8c0qIGW
 JNsS1ZcfNMo5KRvS9ddJNfxIweglYTk0iEIclkZdWigY+1esdF7YgLDx+3V9YhwCJe6A
 sCo0CIezUxoLmOZaKf63F9EU/ca9EFoGCGmglfSIsUWgWrrxOKAzmQJUqnGxfhDwXZGr
 R7JaDMw++dVYlFrpifDgo/LRxD6Tw1P9NMx1KK8k4yIgLZ/E7uYaMiDWEXXsi+Qf/sbn
 WBew==
X-Gm-Message-State: AOAM530Pk/7sZvBhalO1fIakuJLIf+d4FqiBzM5BDo3aupyjfCSxcG72
 Q2Ovzx1gQyUaJS2a7aLmYJe6cQ==
X-Google-Smtp-Source: ABdhPJxXMGoAU22hHhWUasDH8Fm5MNAfxEXV8ZQo/ciYj9SfPoH/6Farn1XMzEEcYj+yUsm5khsWkg==
X-Received: by 2002:a1c:b7c6:: with SMTP id
 h189mr17240075wmf.154.1603721994586; 
 Mon, 26 Oct 2020 07:19:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g4sm20253333wmh.13.2020.10.26.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:19:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 1/6] ASoC: qcom: dt-bindings: add bindings for lpass wsa
 macro codec
Date: Mon, 26 Oct 2020 14:19:40 +0000
Message-Id: <20201026141945.19707-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
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

This binding is for LPASS has internal codec WSA macro which is
for connecting with WSA Smart speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

bindings depend on gfm headers from "clk: qcom : add sm8250 LPASS GFM drivers"
patches posted at
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2352255.html

 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
new file mode 100644
index 000000000000..7054f6feac47
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) VA Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-wsa-macro
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
+  qcom,dmic-sample-rate:
+    description: dmic sample rate
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  vdd-micb-supply:
+    description: phandle to voltage regulator of MIC Bias
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
+    #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3240000 {
+      compatible = "qcom,sm8250-lpass-wsa-macro";
+      reg = <0x3240000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&audiocc LPASS_CDC_WSA_MCLK>,
+               <&audiocc LPASS_CDC_WSA_NPL>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+    };
-- 
2.21.0

