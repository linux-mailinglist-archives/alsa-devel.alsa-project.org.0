Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9F2AF0A2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 13:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3461E173C;
	Wed, 11 Nov 2020 13:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3461E173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605097746;
	bh=q7N+Jmhjk8sSLq0IehmHBwAeu7UZxPeOLvylrtTaRb8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmCHhUudPELXo7zuO2DadbHYdEx9lGGuItmMN650wPgY5rYaTZK6eEMQbYEn+2E5w
	 KEgru8oqUDMyMePSG3CaO7ELba4/TM8t7Q1wJCgqWFDq3J9eyjsbYeBfsjUEPR1tmN
	 Om19n2K9n7Ka6p9PyxyON+ssI3iUCiuecLX2u4vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BBBF80271;
	Wed, 11 Nov 2020 13:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC41F800AE; Wed, 11 Nov 2020 13:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6822BF80059
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 13:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6822BF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="apC9Fbcx"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fabd8a60000>; Wed, 11 Nov 2020 04:27:18 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 12:27:11 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 12:27:09 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: audio-graph-card: Refactor schema
Date: Wed, 11 Nov 2020 17:56:52 +0530
Message-ID: <1605097613-25301-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605097613-25301-1-git-send-email-spujar@nvidia.com>
References: <1605097613-25301-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605097638; bh=s6JucEQhb3UOZuBf/Ti8tS8zH6e/6GIKsKPqPv9s3nE=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=apC9FbcxzdKsFC91BM4Q6dRak677TIy5rMLb10s+1H4E82ecbKMDq6eRC4Zfjam9F
 jp04iJ14dmsNrA5FuEgL+WaPBTtfZx0R8m8a46gyRmPGndR6/7JrlwjU20FPAEv1JZ
 kE0fMZe6sRTq490Y2oDBHm5DmotYrUMLkg70Ba2jJRW43l39DdivOx4K6ISWP6GvY+
 nTOY8FFqBrUpmdRLUblZRUU1QUtuvoV7ss3epP6gwKptTTcmxkhqbVJkCbSDAUXRfV
 OwXOqlp/3S4F7JcoG9SHzI/qDuP+FwbcBcxIf8c/URg7H13GGXjIKREOKW7V2PCpot
 p7UDEIBDlAJ6w==
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kuninori.morimoto.gx@renesas.com
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

There can be customized sound cards which are based on generic audio
graph. In such cases most of the stuff is reused from generic audio
graph. To facilitate this, refactor audio graph schema into multiple
files and the base schema can be reused for specific sound cards.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-card.yaml           | 102 +-------------------
 .../devicetree/bindings/sound/audio-graph.yaml     | 107 +++++++++++++++++++++
 2 files changed, 110 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
index 2329aeb..e047d7d 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
@@ -9,113 +9,17 @@ title: Audio Graph Card Driver Device Tree Bindings
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: /schemas/sound/audio-graph.yaml#
+
 properties:
   compatible:
     enum:
       - audio-graph-card
       - audio-graph-scu-card
 
-  dais:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-  label:
-    maxItems: 1
-  prefix:
-    description: "device name prefix"
-    $ref: /schemas/types.yaml#/definitions/string
-  routing:
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the
-      connection's sink, the second being the connection's source.
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-  widgets:
-    description: User specified audio sound widgets.
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-  convert-rate:
-    description: CPU to Codec rate convert.
-    $ref: /schemas/types.yaml#/definitions/uint32
-  convert-channels:
-    description: CPU to Codec rate channels.
-    $ref: /schemas/types.yaml#/definitions/uint32
-  pa-gpios:
-    maxItems: 1
-  hp-det-gpio:
-    maxItems: 1
-  mic-det-gpio:
-    maxItems: 1
-
-  port:
-    description: single OF-Graph subnode
-    type: object
-    properties:
-      reg:
-        maxItems: 1
-      prefix:
-        description: "device name prefix"
-        $ref: /schemas/types.yaml#/definitions/string
-      convert-rate:
-        description: CPU to Codec rate convert.
-        $ref: /schemas/types.yaml#/definitions/uint32
-      convert-channels:
-        description: CPU to Codec rate channels.
-        $ref: /schemas/types.yaml#/definitions/uint32
-    patternProperties:
-      "^endpoint(@[0-9a-f]+)?":
-        type: object
-        properties:
-          remote-endpoint:
-            maxItems: 1
-          mclk-fs:
-            description: |
-              Multiplication factor between stream rate and codec mclk.
-              When defined, mclk-fs property defined in dai-link sub nodes are ignored.
-            $ref: /schemas/types.yaml#/definitions/uint32
-          frame-inversion:
-            description: dai-link uses frame clock inversion
-            $ref: /schemas/types.yaml#/definitions/flag
-          bitclock-inversion:
-            description: dai-link uses bit clock inversion
-            $ref: /schemas/types.yaml#/definitions/flag
-          frame-master:
-            description: Indicates dai-link frame master.
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-            maxItems: 1
-          bitclock-master:
-            description: Indicates dai-link bit clock master
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-            maxItems: 1
-          dai-format:
-            description: audio format.
-            items:
-              enum:
-                - i2s
-                - right_j
-                - left_j
-                - dsp_a
-                - dsp_b
-                - ac97
-                - pdm
-                - msb
-                - lsb
-          convert-rate:
-            description: CPU to Codec rate convert.
-            $ref: /schemas/types.yaml#/definitions/uint32
-          convert-channels:
-            description: CPU to Codec rate channels.
-            $ref: /schemas/types.yaml#/definitions/uint32
-        required:
-          - remote-endpoint
-
-  ports:
-    description: multi OF-Graph subnode
-    type: object
-    patternProperties:
-      "^port(@[0-9a-f]+)?":
-        $ref: "#/properties/port"
-
 required:
   - compatible
-  - dais
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
new file mode 100644
index 0000000..1e338d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-graph.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Graph Card Driver Device Tree Bindings
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+allOf:
+  - $ref: /schemas/graph.yaml#
+
+select: false
+
+properties:
+  dais:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+  label:
+    maxItems: 1
+  prefix:
+    description: "device name prefix"
+    $ref: /schemas/types.yaml#/definitions/string
+  routing:
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the
+      connection's sink, the second being the connection's source.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+  widgets:
+    description: User specified audio sound widgets.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+  convert-rate:
+    description: CPU to Codec rate convert.
+    $ref: /schemas/types.yaml#/definitions/uint32
+  convert-channels:
+    description: CPU to Codec rate channels.
+    $ref: /schemas/types.yaml#/definitions/uint32
+  pa-gpios:
+    maxItems: 1
+  hp-det-gpio:
+    maxItems: 1
+  mic-det-gpio:
+    maxItems: 1
+
+  port:
+    description: single OF-Graph subnode
+    type: object
+    properties:
+      prefix:
+        description: "device name prefix"
+        $ref: /schemas/types.yaml#/definitions/string
+      convert-rate:
+        description: CPU to Codec rate convert.
+        $ref: /schemas/types.yaml#/definitions/uint32
+      convert-channels:
+        description: CPU to Codec rate channels.
+        $ref: /schemas/types.yaml#/definitions/uint32
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?":
+        type: object
+        properties:
+          mclk-fs:
+            description: |
+              Multiplication factor between stream rate and codec mclk.
+              When defined, mclk-fs property defined in dai-link sub nodes are
+              ignored.
+            $ref: /schemas/types.yaml#/definitions/uint32
+          frame-inversion:
+            description: dai-link uses frame clock inversion
+            $ref: /schemas/types.yaml#/definitions/flag
+          bitclock-inversion:
+            description: dai-link uses bit clock inversion
+            $ref: /schemas/types.yaml#/definitions/flag
+          frame-master:
+            description: Indicates dai-link frame master.
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            maxItems: 1
+          bitclock-master:
+            description: Indicates dai-link bit clock master
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            maxItems: 1
+          dai-format:
+            description: audio format.
+            items:
+              enum:
+                - i2s
+                - right_j
+                - left_j
+                - dsp_a
+                - dsp_b
+                - ac97
+                - pdm
+                - msb
+                - lsb
+          convert-rate:
+            description: CPU to Codec rate convert.
+            $ref: /schemas/types.yaml#/definitions/uint32
+          convert-channels:
+            description: CPU to Codec rate channels.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - dais
+
+additionalProperties: true
-- 
2.7.4

