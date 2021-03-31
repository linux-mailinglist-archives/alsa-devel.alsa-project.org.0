Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4F350234
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 16:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60852168C;
	Wed, 31 Mar 2021 16:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60852168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617200985;
	bh=ac4dAT6SYpYvm8XFhCrwaPR7jbNvEEbXnZIw1srWXJA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pig0b1qks/qSgZVQ1RiNaqmNNZ5KwxBc0OSqjvRSTp7Z8fOuHHxW+RG8ebcqcuk5m
	 rtuETtDryoFRL0RnHAjkbZFRMZpOAHrOaH7WJqhE6AxqRV6cphNtV5GScXYmXYfCvp
	 xwvjxvCn/wCnzdOF5X1FSHaPEyUk5cU52GK9YXQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00860F8014E;
	Wed, 31 Mar 2021 16:28:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA177F8016E; Wed, 31 Mar 2021 16:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4B0F8015A
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 16:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4B0F8015A
Received: by mail-oi1-f177.google.com with SMTP id k25so20186066oic.4
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 07:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UOao0m/Bn1YkU2jMNcSrGiOHpHxGysYjlCZm6zEeco=;
 b=toSZMd7dLYEF4PX61KJF9dU/D7Jks6EEcjn/ljLB7pjWzlGXtpSaueHiiPt/bw5p1r
 suk4tbOU6qT43Mkbmr2Jbh9md6agwOmANFSaHlWem/lNYrhyPhUsXPNvabUuslwICQnZ
 Phxiq0aT/E+EkbpjmYSB4rGQK/EKGA/0bhnPb3yMDCe9n+C4Y9qA3y+1JowLAet/SJIb
 04/PfihnOjnRdD7KED2GgzuRreh8uIE7oXqnmhp3ilxRePTVmcx2jq9hT7JgLeoIThJO
 onIbQWvKfknPCgZLBhhcQOjXK47azOq7HEYfcjiYMguyQFhSZeuGg+vqozko5neLAHWO
 qLBg==
X-Gm-Message-State: AOAM532O0BBvTN6uM/5sZyEL1CkDb4quPUiz2zNakwylYJY+LCiAYszI
 YLKVAWr4Jl1TdnQMToseNA==
X-Google-Smtp-Source: ABdhPJyk9NI9naEUiBByyCVh4hOJWOwenBW/2jPJL//9ZMasSjRVomslNsHMAo5ZGABaNdSPsK99eg==
X-Received: by 2002:aca:1a01:: with SMTP id a1mr2474227oia.33.1617200873720;
 Wed, 31 Mar 2021 07:27:53 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id v136sm451146oie.15.2021.03.31.07.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 07:27:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Move port/ports properties out of
 audio-graph-port.yaml
Date: Wed, 31 Mar 2021 09:27:46 -0500
Message-Id: <20210331142748.2163272-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331142748.2163272-1-robh@kernel.org>
References: <20210331142748.2163272-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

Users of the audio-graph-port schema need to define how many ports
and what each port is, so they need to define 'ports' and/or 'port'
anyways. Let's drop 'ports' and 'port' from the schema and adjust users
to reference audio-graph-port.yaml from a port property.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/audio-graph-port.yaml      | 101 ++++++++----------
 .../bindings/sound/marvell,mmp-sspa.yaml      |   6 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml  |  11 +-
 .../sound/nvidia,tegra210-admaif.yaml         |  11 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml   |  11 +-
 .../bindings/sound/renesas,rsnd.yaml          |   5 +-
 8 files changed, 82 insertions(+), 85 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 766e9109b2f7..9f68142c9ae3 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -12,70 +12,59 @@ maintainers:
 select: false
 
 properties:
-  port:
-    description: single OF-Graph subnode
+  reg:
+    maxItems: 1
+  prefix:
+    description: "device name prefix"
+    $ref: /schemas/types.yaml#/definitions/string
+  convert-rate:
+    description: CPU to Codec rate convert.
+    $ref: /schemas/types.yaml#/definitions/uint32
+  convert-channels:
+    description: CPU to Codec rate channels.
+    $ref: /schemas/types.yaml#/definitions/uint32
+patternProperties:
+  "^endpoint(@[0-9a-f]+)?":
     type: object
     properties:
-      reg:
+      remote-endpoint:
         maxItems: 1
-      prefix:
-        description: "device name prefix"
-        $ref: /schemas/types.yaml#/definitions/string
+      mclk-fs:
+        description: |
+          Multiplication factor between stream rate and codec mclk.
+          When defined, mclk-fs property defined in dai-link sub nodes are
+          ignored.
+        $ref: /schemas/types.yaml#/definitions/uint32
+      frame-inversion:
+        description: dai-link uses frame clock inversion
+        $ref: /schemas/types.yaml#/definitions/flag
+      bitclock-inversion:
+        description: dai-link uses bit clock inversion
+        $ref: /schemas/types.yaml#/definitions/flag
+      frame-master:
+        description: Indicates dai-link frame master.
+        $ref: /schemas/types.yaml#/definitions/phandle
+      bitclock-master:
+        description: Indicates dai-link bit clock master
+        $ref: /schemas/types.yaml#/definitions/phandle
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+            - ac97
+            - pdm
+            - msb
+            - lsb
       convert-rate:
         description: CPU to Codec rate convert.
         $ref: /schemas/types.yaml#/definitions/uint32
       convert-channels:
         description: CPU to Codec rate channels.
         $ref: /schemas/types.yaml#/definitions/uint32
-    patternProperties:
-      "^endpoint(@[0-9a-f]+)?":
-        type: object
-        properties:
-          remote-endpoint:
-            maxItems: 1
-          mclk-fs:
-            description: |
-              Multiplication factor between stream rate and codec mclk.
-              When defined, mclk-fs property defined in dai-link sub nodes are
-              ignored.
-            $ref: /schemas/types.yaml#/definitions/uint32
-          frame-inversion:
-            description: dai-link uses frame clock inversion
-            $ref: /schemas/types.yaml#/definitions/flag
-          bitclock-inversion:
-            description: dai-link uses bit clock inversion
-            $ref: /schemas/types.yaml#/definitions/flag
-          frame-master:
-            description: Indicates dai-link frame master.
-            $ref: /schemas/types.yaml#/definitions/phandle
-          bitclock-master:
-            description: Indicates dai-link bit clock master
-            $ref: /schemas/types.yaml#/definitions/phandle
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
-
-  ports:
-    description: multi OF-Graph subnode
-    type: object
-    patternProperties:
-      "^port(@[0-9a-f]+)?":
-        $ref: "#/properties/port"
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
index 234f64a32184..81f266d66ec5 100644
--- a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
+++ b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
@@ -9,9 +9,6 @@ title: Marvel SSPA Digital Audio Interface Bindings
 maintainers:
   - Lubomir Rintel <lkundrak@v3.sk>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^audio-controller(@.*)?$"
@@ -54,7 +51,8 @@ properties:
       - const: rx
 
   port:
-    type: object
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index b8645d9c38ac..5f6b37c251a8 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -17,9 +17,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^dspk@[0-9a-f]*$"
@@ -59,14 +56,18 @@ properties:
       available instances on a Tegra SoC.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           DSPK ACIF (Audio Client Interface) port connected to the
           corresponding AHUB (Audio Hub) ACIF port.
 
       port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           DSPK DAP (Digital Audio Port) interface which can be connected
           to external audio codec for playback.
@@ -80,7 +81,7 @@ required:
   - assigned-clock-parents
   - sound-name-prefix
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 7cee7722df41..19eaacc3f12a 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -17,9 +17,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^admaif@[0-9a-f]*$"
@@ -41,6 +38,7 @@ properties:
   dma-names: true
 
   ports:
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
       Contains list of ACIF (Audio CIF) port nodes for ADMAIF channels.
       The number of port nodes depends on the number of ADMAIF channels
@@ -48,6 +46,11 @@ properties:
       in AHUB (Audio Hub). Each port is capable of data transfers in
       both directions.
 
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+
 if:
   properties:
     compatible:
@@ -92,7 +95,7 @@ required:
   - dmas
   - dma-names
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 61d0c944e972..1118a9488345 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -17,9 +17,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^ahub@[0-9a-f]*$"
@@ -60,12 +57,18 @@ properties:
   ranges: true
 
   ports:
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
       Contains list of ACIF (Audio CIF) port nodes for AHUB (Audio Hub).
       These are connected to ACIF interfaces of AHUB clients. Thus the
       number of port nodes depend on the number of clients that AHUB may
       have depending on the SoC revision.
 
+    patternProperties:
+      '^port@[0-9]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+
 patternProperties:
   '^i2s@[0-9a-f]+$':
     type: object
@@ -93,7 +96,7 @@ required:
   - "#size-cells"
   - ranges
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 89f4f471be24..fd275a575055 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -16,9 +16,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^dmic@[0-9a-f]*$"
@@ -60,14 +57,18 @@ properties:
       on the maximum available instances on a Tegra SoC.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           DMIC ACIF (Audio Client Interface) port connected to the
           corresponding AHUB (Audio Hub) ACIF port.
 
       port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           DMIC DAP (Digital Audio Port) interface which can be connected
           to external audio codec for capture.
@@ -80,7 +81,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index 556460332ffb..38e52e7dbb40 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -16,9 +16,6 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
-allOf:
-  - $ref: audio-graph-port.yaml#
-
 properties:
   $nodename:
     pattern: "^i2s@[0-9a-f]*$"
@@ -78,14 +75,18 @@ properties:
       on the maximum available instances on a Tegra SoC.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           I2S ACIF (Audio Client Interface) port connected to the
           corresponding AHUB (Audio Hub) ACIF port.
 
       port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
         description: |
           I2S DAP (Digital Audio Port) interface which can be connected
           to external audio codec for playback or capture.
@@ -98,7 +99,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 2e1046513603..1e0e14e88913 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -111,7 +111,9 @@ properties:
         - pattern: '^dvc\.[0-1]$'
         - pattern: '^clk_(a|b|c|i)$'
 
-  port: true
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
 
 # use patternProperties to avoid naming "xxx,yyy" issue
 patternProperties:
@@ -257,7 +259,6 @@ required:
 
 allOf:
   - $ref: audio-graph.yaml#
-  - $ref: audio-graph-port.yaml#
   - if:
       properties:
         compatible:
-- 
2.27.0

