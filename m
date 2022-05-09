Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAC51FC63
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 14:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE7D174A;
	Mon,  9 May 2022 14:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE7D174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652098479;
	bh=1Q6yWvBm5Ihp9YgBSMD5Iiq00FBh6b+82aJtBZDCgqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RqX9OLu91/lyZwZNBuKAlSZQ7YYMlmQkRTdFf6wgTwjPqgzfN/XQRxJA5FDr37Xgl
	 r5wFddJkufBIY8Cv0cif5Poz7s1JLk3d2Y3HVSwmHL07gQTnA+dIxSoPeW+4S+rlms
	 RUzGx7UB8LA5C9mi7jbRAGKATvyGXrOTUn2TIMhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0281F80237;
	Mon,  9 May 2022 14:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0515F8025D; Mon,  9 May 2022 14:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29CC5F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 14:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29CC5F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="sAUQQOYB"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 97F7083B32;
 Mon,  9 May 2022 14:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652098410;
 bh=42Zy28pg37OAk1vRPr/3wZvq3TQDaK06uRqMNZn/Ujw=;
 h=From:To:Cc:Subject:Date:From;
 b=sAUQQOYBMJG1CYDfYTpVColDkqwimfIxjAyr+eXrgiMK2/Aw99hTu/nZWGYRJy/GK
 byHBj1aNhVdPmJGq6Tszs4uF5WuDA1CyPyh2nUJ1yhx1z2X1ebpKPJhdXMhbATRvm3
 5cd4vlVOLY76iWLmix4TUNPi3AR7YfYA0eTXOtoX0AgL6l/IW9MVlR3JLXpF0FWtkL
 LeKHOHX8A/PhfdGxttFnunjrUGMjrxQcinpkGwVBo8bTdQkOO4g3dO/SAoflJDBgjL
 piCdKfM/c4eOtElJhsHQfAd5hwm7XD3vCHXtB89Ou53HyEoWS/UWcHDQHaN28mtnoT
 o2lCYw3yyPl0Q==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] doc: dts: Add device tree information regarding wm8940
 codec
Date: Mon,  9 May 2022 14:13:13 +0200
Message-Id: <20220509121313.31216-1-lukma@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Lukasz Majewski <lukma@denx.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

This commit provides documentation entry for wm8940 codec.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 .../devicetree/bindings/sound/wlf,wm8940.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8940.yaml

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
new file mode 100644
index 000000000000..8aadcbeed502
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8940.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8940.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8940 Codec Device Tree Bindings
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  '#sound-dai-cells':
+    const: 0
+
+  compatible:
+    const: wlf,wm8940
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 526000
+
+required:
+  - '#sound-dai-cells'
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@0 {
+            #sound-dai-cells = <0>;
+            compatible = "wlf,wm8940";
+            reg = <0>;
+            spi-max-frequency = <500000>;
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            #sound-dai-cells = <0>;
+            compatible = "wlf,wm8940";
+            reg = <0x1a>;
+        };
+    };
+
+...
-- 
2.35.1

