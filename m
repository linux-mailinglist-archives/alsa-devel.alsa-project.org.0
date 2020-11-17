Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C162B564B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 02:35:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18791770;
	Tue, 17 Nov 2020 02:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18791770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605576935;
	bh=is12N99AVe9VrVkMBPEKTEp42zLsu69pf00M5UqHhgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WT8zNQC6YEukkSEXtYTfhaoFlKAoprIHYmM6YUZnF8EdpBu4JttDiTItuCH+0QkQ4
	 cZq3m3bP21otDx0gi1Uc+7ydLOZ9DkmJEaYm/qJeTxgqPLLGOxdn64sCudWpX/GkC2
	 UQXo9yJ1NJLMNMezJpJC5zMBemGXP9sFn6oAhhuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63DC0F80168;
	Tue, 17 Nov 2020 02:34:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB465F80229; Tue, 17 Nov 2020 02:34:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA06F80167
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 02:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA06F80167
Received: by mail-oo1-f44.google.com with SMTP id n2so4373751ooo.8
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 17:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qK36A5rVThIRP81jEbeCpq/j9+HO/HBCjgD8p63pIAY=;
 b=P4Quqnz320gWc9WFW2BLfQVcar5xgBi9vGvShxyJFhEpwTYgg97RtOWVOT9HM3P0zy
 aIzjiZzZMxi/BXPODMAlfFv1rhtDimdQosVorTHufcZDxrCim/tWeUnXzJ/m2+QPYqS3
 9pzjpn8d+v76zpb3fkiEjah/XDUQHihZi3owChvJTK8gDWU/xpdbW1LhKnxhxWZNLdlR
 MWhD4C7wt6UQg6UbyIsuvpvr92y2foPQR//q2wG+1ZSccXrtJ7UelJ+En/ZWja4AsJ3G
 Gce4KqsoHDdmQaRKf0RWeuzScgD4fWw9+GxzP7IjTOOhGApCwuf6616qefmmt7Yg91o2
 dUKA==
X-Gm-Message-State: AOAM5326o1kW+Zk6jQFeB4zflvh0/oh9yfyWyyXCzh7W6Z/PQTVASbJV
 5oaGh67asHltnFjyoKjimA==
X-Google-Smtp-Source: ABdhPJykb52AnSl4SEA/E7nSB7S68jQee/nKPxZolW8lsORhSo9gx3/n5M5AC1cckKrEW8rbVno8Ww==
X-Received: by 2002:a4a:e09a:: with SMTP id w26mr1528078oos.18.1605576831640; 
 Mon, 16 Nov 2020 17:33:51 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j9sm3861325oij.44.2020.11.16.17.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:33:51 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: audio-graph-card: Refactor schema
Date: Mon, 16 Nov 2020 19:33:46 -0600
Message-Id: <20201117013349.2458416-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117013349.2458416-1-robh@kernel.org>
References: <20201117013349.2458416-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>
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

From: Sameer Pujar <spujar@nvidia.com>

There can be customized sound cards which are based on generic audio
graph. In such cases most of the stuff is reused from generic audio
graph. To facilitate this, refactor audio graph schema into multiple
files and the base schema can be reused for specific sound cards.

The graph card nodes and port nodes are separate entities, so they
should be separate schemas.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[robh: Split out port schema. Add graph.yaml in subsequent commit]
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/audio-graph-card.yaml      | 106 +-----------------
 .../bindings/sound/audio-graph-port.yaml      |  86 ++++++++++++++
 .../bindings/sound/audio-graph.yaml           |  45 ++++++++
 .../bindings/sound/renesas,rsnd.yaml          |  12 +-
 4 files changed, 141 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-port.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
index 2329aeb91db7..109e55f9e597 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
@@ -4,120 +4,24 @@
 $id: http://devicetree.org/schemas/sound/audio-graph-card.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Audio Graph Card Driver Device Tree Bindings
+title: Audio Graph Card Device Tree Bindings
 
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
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
new file mode 100644
index 000000000000..9db19d4edc6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-graph-port.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Graph Card 'port' Node Bindings
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+select: false
+
+properties:
+  port:
+    description: single OF-Graph subnode
+    type: object
+    properties:
+      reg:
+        maxItems: 1
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
+          remote-endpoint:
+            maxItems: 1
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
+        required:
+          - remote-endpoint
+
+  ports:
+    description: multi OF-Graph subnode
+    type: object
+    patternProperties:
+      "^port(@[0-9a-f]+)?":
+        $ref: "#/properties/port"
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
new file mode 100644
index 000000000000..4b46794e5153
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-graph.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Graph Device Tree Bindings
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
+required:
+  - dais
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 51f4dcaa970d..cbfd5914b432 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -9,6 +9,10 @@ title: Renesas R-Car Sound Driver Device Tree Bindings
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: audio-graph.yaml#
+  - $ref: audio-graph-port.yaml#
+
 properties:
 
   compatible:
@@ -111,13 +115,7 @@ properties:
         - pattern: '^dvc\.[0-1]$'
         - pattern: '^clk_(a|b|c|i)$'
 
-  port:
-    description: OF-Graph subnode
-    $ref: "audio-graph-card.yaml#/properties/port"
-
-  ports:
-    description: multi OF-Graph subnode
-    $ref: "audio-graph-card.yaml#/properties/ports"
+  port: true
 
 # use patternProperties to avoid naming "xxx,yyy" issue
 patternProperties:
-- 
2.25.1

