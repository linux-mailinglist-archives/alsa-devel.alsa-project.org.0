Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8D10581F
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 18:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78F11797;
	Thu, 21 Nov 2019 18:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78F11797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574356361;
	bh=Zds6JBxevasQxe6EdaZpFMc/ajIlmu0hqw4NphwqIGY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UR25zKWedlaMTqAgTrsrxazMB4wYwxGhC91RMwTBI/EoDcRGLP25QlunP6TLVf5nd
	 tQvlt4h51vdiaUz6o+TPG+K8CF9PLZVrDnTcZiqTrXbsnpNwPa1Bfbv3DqfrKCxG/A
	 ENYNKt9/7AyBt/ciVaSjGTEVQkUwF+nyvnRKVsvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15131F8022D;
	Thu, 21 Nov 2019 18:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3417DF80247; Thu, 21 Nov 2019 18:06:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFC6DF8022B
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 18:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC6DF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H36Ym9ke"
Received: by mail-wm1-x336.google.com with SMTP id l1so4574143wme.2
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XyoLjI/p85FmtU9sQ7uHTafXrtQ51MQgfkvDFnGjUfc=;
 b=H36Ym9keWbPzJ5lVYh8uv0JYNxaxXo75tGofwCllVhQwj7OG9xKnvGdqaHh0VZdnb9
 MMRSCIAKpgB4xNLSj3lV2b0YH8jgRE5PA8he+wPCxiAZovM9rYZ2amS3oxNE0L4y6/UJ
 O0iTxRYugHqAXlLerh05MTpyFowxjiCOHc/C7tOX6HaarHA8tPGZa6CsJTbbYXgL4Lmz
 aCPwfMJ0/nOt0D2bPTYxLaGB4eBmvCMezudjSSj0gr20jrYJco51sehio+UsMmy4Bi97
 jGutvRTVG8UB9DVL5yu7lI9m/bMEy7dAQaySfFlxCXJogWj+LgAlp88r1WGA2+/OMJat
 xQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XyoLjI/p85FmtU9sQ7uHTafXrtQ51MQgfkvDFnGjUfc=;
 b=FWkHLtr9Pd9vgxj2dpvA+9s9/EMl/q4I+m6nM8u/8hoSeiB6aA8eqf8qAWVCJ0ceLW
 mrF6KeU08OtnXnOOtcdhqVXbLQMe5AhODrfPkerQVw59c3OKczVMXe8RSg90piWxdW7R
 T4QnXdEXU3a1SPJuW/Kn4JLvujQONPfQCKij7dR03tPssWpn8KGL9tMKrUkpKQEqO0e7
 60eTgfx5sKaSAqCbvSowQcP7FeT+GUbom5/zqguHg3+tOUPzNL2/0XN/QAx2+O0l9XDF
 nIpku7Q/NSTZY6hV3UlVqD7tFfnwpCScgCCIF/bxQzhiVOppcvseDBs7HEido2V0WgFJ
 rXOg==
X-Gm-Message-State: APjAAAXHlnkYteJzUidKUrVFscXwI6Cy4u/pYcF1oR7JT8mZTQ6b7MHk
 m4vDNFRbyRbl7jkyoj1y3ZG95A==
X-Google-Smtp-Source: APXvYqxEwo8PX1yZ5dMNrtuP1K3nSh9t2jtx/KIyNWa7VtUCekIxRfaZK+K1UUKvfdsSacXI1QqpmA==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr10405135wmc.148.1574355956834; 
 Thu, 21 Nov 2019 09:05:56 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 09:05:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Thu, 21 Nov 2019 17:05:06 +0000
Message-Id: <20191121170509.10579-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 09/12] dt-bindings: gpio: wcd934x: Add
	bindings for gpio
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
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
new file mode 100644
index 000000000000..32a566ec3558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qcom,wcd934x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO controller
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
+      - qcom,wcd9340-gpio
+      - qcom,wcd9341-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdgpio: gpio@42 {
+        compatible = "qcom,wcd9340-gpio";
+        reg = <0x042 0x2>;
+        gpio-controller;
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
