Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6331511548
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 13:27:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E56517A9;
	Wed, 27 Apr 2022 13:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E56517A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651058824;
	bh=Z+vixEzL9h4i6hD9dVi/JbALafw3vzktF/dCd4Az7c0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nfzd2V07oT3lWOae0i7hR8zCcGYk/IQtf0yz4QzNT5Rt5qxcFYSmGdL9C9xQlk154
	 gxP61GkVxt3kvsvqnvzalMqup86oQyiXCE4+3sxa/3Wy4pdDIMyNiG0pjrStAyW37c
	 w+nszOZiFWUFPl7foRrMZDET2oAMxaZO7la6Ad6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C8CF80253;
	Wed, 27 Apr 2022 13:26:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EAA0F8016E; Wed, 27 Apr 2022 13:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 37412F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 13:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37412F800AE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39E66143D;
 Wed, 27 Apr 2022 04:25:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB6913F5A1;
 Wed, 27 Apr 2022 04:25:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Date: Wed, 27 Apr 2022 12:25:21 +0100
Message-Id: <20220427112528.4097815-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427112528.4097815-1-andre.przywara@arm.com>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
a peripheral that provides communication with an audio CODEC.

Add a simple DT schema binding for it, so that DTs can be validated
automatically.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/sound/amba-pl041.yaml | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amba-pl041.yaml

diff --git a/Documentation/devicetree/bindings/sound/amba-pl041.yaml b/Documentation/devicetree/bindings/sound/amba-pl041.yaml
new file mode 100644
index 0000000000000..f00796d5ea473
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amba-pl041.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amba-pl041.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Ltd. PrimeCell PL041 AACI sound interface
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+
+description:
+  The Arm PrimeCell Advanced Audio CODEC Interface (AACI) is an AMBA compliant
+  peripheral that provides communication with an audio CODEC using the AC-link
+  protocol.
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        const: arm,pl041
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: arm,pl041
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: APB register access clock
+
+  clock-names:
+    const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    aaci@40000 {
+            compatible = "arm,pl041", "arm,primecell";
+            reg = <0x040000 0x1000>;
+            interrupts = <11>;
+            clocks = <&v2m_clk24mhz>;
+            clock-names = "apb_pclk";
+    };
+
+...
-- 
2.25.1

