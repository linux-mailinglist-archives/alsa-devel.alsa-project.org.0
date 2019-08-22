Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731CD9A315
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 00:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28CA166D;
	Fri, 23 Aug 2019 00:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28CA166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566513542;
	bh=b6ixQ+NOnP3JaBWBJnmaH0fFLRJfiLirgqBultXJiUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/TK9iRaxu9sIuOEGW+cdlICzXS2ryfn8c+JUDZKHCkR6SaXTcDOAh7ZgLwYSTamM
	 V8CXda21vfFs4kfUPwSxHZqxS4bugQZgHi21DSt9YQzdKj+qPgCpc5jF0KXACg9WOW
	 LeLuL4E0uBGjXhl6MjU6WZlNmic8N9mKrxi9Sw5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF35F805A1;
	Fri, 23 Aug 2019 00:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4155F80529; Fri, 23 Aug 2019 00:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F007BF800BF
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 00:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F007BF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NHwJIpoO"
Received: by mail-wr1-x442.google.com with SMTP id c3so6837032wrd.7
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ICylmLaXjvjxyRupyDXag7YX8QEWl2rJ5Qnlp9tRyNI=;
 b=NHwJIpoOygjAesmcaT9cgKgK5EmbkcoPBCgr/XVzQGV8/jwWWF9xDjRXqnPFirYByQ
 yCnYOdCUS3SZfZjfrXBGJKwRVnfm1/lrbnCsfiiN89KsgfjqPjM+DgZ+qaHDAi3S4ReQ
 517z9ZCq8+POKOrhJSVBX66zdPEVT45GrNTcSpfVdnTZDi+eAYXwuxX8E+zCg4ptrW4s
 kGnd+ATL2tbfubrA46gtMMH5LSYrayS3xTsSzUownEhr8lpne5QgzsyI5QckwJW2elvy
 VvQEtJyuxkhIEduKetGIaTLTvlGt1CGGIQ4UFlmkE98X2GVPi8iwZ0kCwjm1I3jCCKhL
 q6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ICylmLaXjvjxyRupyDXag7YX8QEWl2rJ5Qnlp9tRyNI=;
 b=QQOQGJujMevft8AhXOBm4cXsb1zp0pIkawSNCUgqkta9Go/3CsnShC+1Caz3M4lj1A
 hAcDFuNQ3v/uAQHJZB/qGVLTAj9Q31xeh4e2r6Omfvi0pm+FnIguzX+CM9VbU+G7woaz
 uG443UTg8tstT9L1+BKvgzblouhP5pNGIb8qFqyWRt2UdYX8fv4icrhGC+Nlh7L37UnS
 fw2rJYa6PiQAIKSnb0aGJoRsS+yLb++nnTfMlc7yQWO1InQhSs99e9uDpTaFrKb3a6zJ
 yaDigbWLmcQl+mPvNaF++ZYUGltIpDyJcdTgXxLTv7iU27iUjMgtgfI9FSyVZFc1X0DA
 kXVw==
X-Gm-Message-State: APjAAAXyelICwLrKMvnCB7hNK5gvrdgY3CDNOvkOlyQP36bVVuBDb+x4
 Vke1EVcYZURi0rba89QcS9LekQ==
X-Google-Smtp-Source: APXvYqyWyQV/XNltW8o4rBAsXauwGsJAMNrtyIc5bFPN4+DmieytyPJI5Sa7f+OuakCvrBzDLa/fhQ==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr1114734wro.125.1566513382808; 
 Thu, 22 Aug 2019 15:36:22 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id m188sm1886380wmm.32.2019.08.22.15.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 15:36:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 22 Aug 2019 23:36:03 +0100
Message-Id: <20190822223606.6775-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
References: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 1/4] dt-bindings: soundwire: add slave
	bindings
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
 .../soundwire/soudwire-controller.yaml        | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/soudwire-controller.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/soudwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soudwire-controller.yaml
new file mode 100644
index 000000000000..91aa6c6d6266
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/soudwire-controller.yaml
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
