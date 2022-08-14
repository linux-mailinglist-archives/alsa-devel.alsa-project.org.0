Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 171535926CE
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 00:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E15782A;
	Mon, 15 Aug 2022 00:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E15782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660515583;
	bh=xbUf1EysWWebQDcWzBwIhvh61mtImi2N6Yve26PDhIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N9KgefS4Hy6amb2Z8sDqxub7HrfpCY8/LvypVx+bCgLeBAYBsrg3A97kjg7bB0bgT
	 XekMJwwHN5P7xuZziuJ4maBMoglYMNsvQ18pN3Jm3t9t0gLFA0rP5eCsY5V5HGRl8q
	 DmucwHbfptUvYy8cai3nd9x4tI/7l0l25I6ASgJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA814F80095;
	Mon, 15 Aug 2022 00:18:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B81F804BD; Mon, 15 Aug 2022 00:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dev.flatmax.com (41.68.233.220.static.exetel.com.au
 [220.233.68.41])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63CFFF800B8
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 00:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CFFF800B8
Received: by dev.flatmax.com (Postfix, from userid 1000)
 id A5E7D3846E8C; Mon, 15 Aug 2022 08:18:30 +1000 (AEST)
From: Matt Flax <flatmax@flatmax.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v3] ASoC: codecs: dt bind. doc for the new TI SRC4392 codec
Date: Mon, 15 Aug 2022 08:18:28 +1000
Message-Id: <20220814221828.118643-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 Matt Flax <flatmax@flatmax.com>
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

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---

Notes:
    v3:
    * Renamed to include ti,
    * fixed license to include BSD-2-Clause
    * removed generic description
    * renamed the node in the example
    v2:
    * Changed the maintainer

 .../devicetree/bindings/sound/ti,src4xxx.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,src4xxx.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,src4xxx.yaml b/Documentation/devicetree/bindings/sound/ti,src4xxx.yaml
new file mode 100644
index 000000000000..807b9e35b9b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,src4xxx.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/src4xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SRC4392 Device Tree Bindings
+
+description: |
+  The SRC4392 is a digital audio codec that can be connected via
+  I2C or SPI. Currently, only I2C bus is supported.
+
+maintainers:
+  - Matt Flax <flatmax@flatmax.com>
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  compatible:
+    const: ti,src4392
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@70 {
+            #sound-dai-cells = <0>;
+            compatible = "ti,src4392";
+            reg = <0x70>;
+        };
+    };
+...
-- 
2.34.1

