Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C959A3FF
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 01:40:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E5A1668;
	Fri, 23 Aug 2019 01:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E5A1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566517259;
	bh=QgGeaWHD3pWFYRzPSVWFbzVFmqWl+mbcbFN+CPDzQls=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRXD6EPIFz8uLB+kfPSm2jtyAemyD013wdbSyCqeYz/RRX4zYVpIQbMKG1BZv98We
	 dkewRGVHhKqO1C0sN+p9vklpe/wQ4fP2o+9zedI9S0rKQDSMQvodJICj3QOL4jAcBA
	 YfxciGK1azcvw/mQ2UGknND+P4T3+pOkCW8AoNs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23017F805E0;
	Fri, 23 Aug 2019 01:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 253C2F803D5; Fri, 23 Aug 2019 01:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B86BF80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 01:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B86BF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iY8KkGny"
Received: by mail-wr1-x441.google.com with SMTP id u16so6966716wrr.0
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v9d/d2yrBEqMxyVUvtC9u6negI/GjvLEoHxmexWbzCs=;
 b=iY8KkGny6S220CBXX2T7jx7aefiA/Vv9UW3QwrB0vE6NsZzkssDjbQ/bqISsNMr80C
 snZNROcyoPxTJANixCShBxYCPwef2G1XRNNnRwPt8FPSQ41rPrMwgvRmDASB4zORtAqS
 155MxZU4FDxfhEGlHROWjCInOdhNnTflCdjMCad8pLYGlL8BwJi0tqMo41esglBi5nq9
 yULUr3pC02vNc+AvLIBxF9pEpinv+p6LyRSfr0Ur1JgCbnVw5GMa+JdDTIolnEmog9f/
 z62M3Zu8A9AVIhyYo5xGPz94gKkhGTVQHyShMCSKbpGZxJ1UwbVMFXabe4ulvStXytel
 IR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v9d/d2yrBEqMxyVUvtC9u6negI/GjvLEoHxmexWbzCs=;
 b=uO354AVhRJfJGbmZdWQt4YkmixVW0O3qimnb5AfjVq1hdmnpe27hotgevwS0x1YOeB
 JWOLFq1KLVJc68XtGH71uEyxcJgo84k5jKuOZ2Xq7Y+KkUw51k3fnak+ijXqbPIwXumQ
 SCxuw8o74CjFE6Us0yvwXx5+Jum7kV2i68yZbI0NUpopZPQBjufRZqOP/3wO4Xp7SHTK
 2nNIIdf8MF9WgEURXe1yHv69BDqzvJtA9JXow6HFgoyitexj4K2Br5Durp/DmiXbrizj
 Qkwkx6lpG6giqORrMaqtVSrXC7uPxD/eje0qQn8m2tp0AHPflr/DUcfyaKmHeStdtHRR
 6fgg==
X-Gm-Message-State: APjAAAWJxKmtTJEmpKoZOE6ToMcoPS1/Ts91cdl1r52V+z6I1Bxt+4fp
 p6A1ufW52mOrMCvTKLRwM7Ql3w==
X-Google-Smtp-Source: APXvYqwMxr4euoSdw6tZMAdlKkFkMJJqaYyCS3rH1/SXz/TqB1Qdw0hIvcFUY+AWWGrgVadPjNubyg==
X-Received: by 2002:adf:d088:: with SMTP id y8mr1279072wrh.181.1566517101130; 
 Thu, 22 Aug 2019 16:38:21 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f134sm1705157wmg.20.2019.08.22.16.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 16:38:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Fri, 23 Aug 2019 00:37:56 +0100
Message-Id: <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
	slave bindings
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

This patch adds bindings for Soundwire Slave devices that includes how
SoundWire enumeration address and Link ID are used to represented in
SoundWire slave device tree nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../soundwire/soundwire-controller.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
new file mode 100644
index 000000000000..91aa6c6d6266
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SoundWire Controller Generic Binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  SoundWire busses can be described with a node for the SoundWire controller
+  device and a set of child nodes for each SoundWire slave on the bus.
+
+properties:
+  $nodename:
+    pattern: "^soundwire(@.*|-[0-9a-f])*$"
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+    properties:
+      compatible:
+      pattern: "^sdw[0-9][0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
+      description:
+	  Is the textual representation of SoundWire Enumeration
+	  address. compatible string should contain SoundWire Version ID,
+	  Manufacturer ID, Part ID and Class ID in order and shall be in
+	  lower-case hexadecimal with leading zeroes.
+	  Valid sizes of these fields are
+	  Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
+	  and '0x2' represents SoundWire 1.1 and so on.
+	  MFD is 4 nibbles
+	  PID is 4 nibbles
+	  CID is 2 nibbles
+	  More Information on detail of encoding of these fields can be
+	  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
+
+      reg:
+        maxItems: 1
+        description:
+          Instance ID and Link ID of SoundWire Device Address.
+
+    required:
+      - compatible
+      - reg
+
+examples:
+  - |
+    soundwire@c2d0000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "qcom,soundwire-v1.5.0";
+        reg = <0x0c2d0000 0x2000>;
+
+        speaker@1 {
+            compatible = "sdw10217201000";
+            reg = <1 0>;
+        };
+
+        speaker@2 {
+            compatible = "sdw10217201000";
+            reg = <2 0>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
