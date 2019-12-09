Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A811746C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 19:39:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F2091666;
	Mon,  9 Dec 2019 19:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F2091666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575916791;
	bh=IZVdkcPIcmQEfjxU75heodAGBovLurUjRCjrSRn6Hjs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVEs1ul3P9Y0aV5U7pWRjCbDBfXcN3fw2iUnDTHTy4r6QroiiAYcfgcKESDWovjDp
	 wX6MxjvNRRYS4jp8/y2uqY2XuHTevl43kofxLXBx8qHZiTrzYPWCLOCArmyDLr5yxN
	 VvKTFan4GfNBFeigNEN7ajuitUrIlwE5KhobtukA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44041F80277;
	Mon,  9 Dec 2019 19:35:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D7BF8025A; Mon,  9 Dec 2019 19:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id C926BF801F4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C926BF801F4
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
 by mail.bugwerft.de (Postfix) with ESMTPSA id AE0892E5CE4;
 Mon,  9 Dec 2019 18:29:09 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  9 Dec 2019 19:35:05 +0100
Message-Id: <20191209183511.3576038-6-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 04/10] dt-bindings: clock: Add documentation
	for AD242x clock providers
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

This device must be placed as a sub-device of an AD242x MFD node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/clock/adi,ad242x-clk.yaml        | 32 +++++++++++++++++++
 include/dt-bindings/clock/adi,ad242x.h        |  9 ++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
 create mode 100644 include/dt-bindings/clock/adi,ad242x.h

diff --git a/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
new file mode 100644
index 000000000000..f434b3e4928e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/adi,ad242x-clk.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x clock provider
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  This module is part of the AD242x MFD device. For more details and an example
+  refer to Documentation/devicetree/bindings/mfd/ad242x.yaml.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-clk
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names:
+    minItems: 2
+    maxItems: 2
+    description: |
+      Array of two strings to use as names for the generated output clocks
+
+required:
+  - compatible
+  - '#clock-cells'
\ No newline at end of file
diff --git a/include/dt-bindings/clock/adi,ad242x.h b/include/dt-bindings/clock/adi,ad242x.h
new file mode 100644
index 000000000000..307a6cd1f5a6
--- /dev/null
+++ b/include/dt-bindings/clock/adi,ad242x.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __DT_BINDINGS_AD242X_CLK_H
+#define __DT_BINDINGS_AD242X_CLK_H
+
+#define MAX9485_CLKOUT1        0
+#define MAX9485_CLKOUT2        1
+
+#endif /* __DT_BINDINGS_AD242X_CLK_H */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
