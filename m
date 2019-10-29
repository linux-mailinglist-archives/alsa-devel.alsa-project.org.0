Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C688E873C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1531F2252;
	Tue, 29 Oct 2019 12:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1531F2252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572348947;
	bh=niKM3nm3XAUFQvy2GwTq2R3JIRpSGdmXNLluZ8pF+/s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YErYj4/QLEr0mJUcHD3saOYDgR+yCNgLGHDBunv+mra6TkFzd+4n67Kygpx+BvJ3Q
	 mxA3mjUegEdCL0LlBPLYOMJjY7xEeSkrsKXbp6He0YA2LVIAAz8wye439mtCEK2MM0
	 vilqjVwQz5RLQGV4hSs7ZVkYEXB1NYHllfGI37PQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D75F806F5;
	Tue, 29 Oct 2019 12:29:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E8A1F80642; Tue, 29 Oct 2019 12:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EBF7F8060D
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EBF7F8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EA1r3HXJ"
Received: by mail-wm1-x341.google.com with SMTP id w9so1981647wmm.5
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RliGfxjeZRZKsvz7+xFZDSC6zQkkXVAUlzYsp0mzbo=;
 b=EA1r3HXJQSw1Wc/1K8+BmJ1oGZOA1scoI+iD/EvM0ZkSCrsgix7EYZSzLH2+yOOnlf
 a4dr691lyhUVb2AJqJGeTnZIRr/uHkmK2/OEeg0t1ZmsdjTKL8Mrv2hB2J2v6jOdi8dz
 1Z+l31KZH+2xwp1PxWzyEzwE9k8YkdzjH3wSA5LS5yBJ5J2L1fa8U5FfzUX8Neb12QYW
 69YuJnS2iwDWfK4aGK4UreoTdwZIGz8C96LDNOcgBV7KLCQSU/d8oLlv78/vw8WLd9O4
 LNeibi8s4HtNlabgpVgSjlIPfUZrm9EGUQ4xGfMmFm0eFeC2KxSs/I05KusodbUCPh6P
 9RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RliGfxjeZRZKsvz7+xFZDSC6zQkkXVAUlzYsp0mzbo=;
 b=L+1qsSFcqMu+j0sJtPSIASqdhJTpWvl6rcVkj7i0MhgKBUToB2wtR/fkIuVG4dsVO9
 OwBUllKrz4elwx1VtKZJUz7u4S69RZHdRMnz7f+V7kMRd3UiMM1T9KWzTdA7/3Y1P18U
 Ih0xSw6TgFGKPUHF+pvkySa2nJGkTPecBNVshrYtrSTr5jPDXZjs5lFg2bjCw+WNK48m
 igHq8n4FuusgYfWgDe3z5apJ9jcOO4M1juQcoBfEpvfk3SKjr6f1xlgSXNwdfa3308Wk
 wHGsfKJc8f4gGG2HOaZMrT0M8MGZcDCrQcTRebavscU+zWG8tqyM8ArNq6ZVUjRyzOyI
 L7Dg==
X-Gm-Message-State: APjAAAUSz0pZ+7MXn3yjpwlyq/i97vojtbzIaT29UJBdrHnaUsu6mw0Y
 WrgwVNqUIJrRGw9h9CSJTohcf0t/gL0=
X-Google-Smtp-Source: APXvYqyyXUH29YzkT8TrafrF9AotGHHKFEQ4zZ8CQ4t/MCXVculHlP/PhSsj+O6ynB5w7Sp8f+IgAg==
X-Received: by 2002:a05:600c:1009:: with SMTP id
 c9mr3586096wmc.6.1572348544385; 
 Tue, 29 Oct 2019 04:29:04 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:29:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 29 Oct 2019 11:26:57 +0000
Message-Id: <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x:
	Add bindings for gpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
gpio controller to control 5 gpios on the chip. This patch adds
required device tree bindings for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
new file mode 100644
index 000000000000..432486d753b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,wcd934x-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO Pin controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
+  gpio controller to control 5 gpios on the chip.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9340-pinctrl
+      - qcom,wcd9341-pinctrl
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdpinctrl: pinctrl@42 {
+        compatible = "qcom,wcd9340-pinctrl";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        gpio-ranges = <&wcdpinctrl 0 0 5>;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
