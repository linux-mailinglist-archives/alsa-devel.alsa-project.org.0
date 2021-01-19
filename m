Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF22FB4E3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687AC1879;
	Tue, 19 Jan 2021 10:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687AC1879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611048667;
	bh=+G9XETU/j4vL/5mke9Aw0BxZajxjOo+L4ASpSoK0R+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrzS2ofD1/unb9Mb/GHWXlNbauUrSrSwnIAhnoNUK+CaghIig/BHGR7uxZ25ZNx3U
	 4PhquXrXhJVU4Roh7/YNNw+G7gtWUzpY0hyHsQuDZNUoSwna/cSU6roKCng0WncXzw
	 2/V0J1VEAtFH8HSyvjvLA73BGQcpBTrD9BbzBsbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58812F80272;
	Tue, 19 Jan 2021 10:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D5ACF80273; Tue, 19 Jan 2021 10:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440AEF80255
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440AEF80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="gd6Q+iHy"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6006a6480007>; Tue, 19 Jan 2021 01:28:40 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:40 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:37 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [RESEND PATCH v6 1/6] ASoC: dt-bindings: tegra: Add graph bindings
Date: Tue, 19 Jan 2021 14:58:11 +0530
Message-ID: <1611048496-24650-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611048520; bh=wSbiZL/NM0UtDU3bPzfMihVkMzdLJDTXJ2ICU4gUlTc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=gd6Q+iHytfAu0HGTrnQEj+V7rlLL9DN4LDh7raUz8lVIXEJxYaZIf8JiiwtxJDY/4
 q1vAFagpitZ5s0ljsHaNy3LXOlXmibnf4B2rv3ymcWCnXZB6u95O3ElGlOVV5jAhAJ
 XeWL2p8m/M6UYvwULFOM0ElzzkJF8VMmqup5SIHUnlFT2seDA0p5xoAdjg05g0fOdC
 kpRqE5f0S5TkRvvkzZ6gD91SjiRkFn2KCeb6N05IS3tg0NYkusLNQaIKKYG0CUagmP
 OS7Sn7xBWwT7Ukq6NYy5YsaGII1O8ET5SnXIjyxvN3jAxht15m6JKzNp4RA9ZA8ioY
 /rAahmO2QnHbw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

Add device tree binding properties of generic graph to ASoC component
devices. This allows to define audio ports out of these components or
DAIs and audio graph based sound card can be realised with this.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/sound/nvidia,tegra186-dspk.yaml           | 18 +++++++++++++++++-
 .../bindings/sound/nvidia,tegra210-admaif.yaml         | 13 ++++++++++++-
 .../bindings/sound/nvidia,tegra210-ahub.yaml           | 13 +++++++++++--
 .../bindings/sound/nvidia,tegra210-dmic.yaml           | 18 +++++++++++++++++-
 .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml | 18 +++++++++++++++++-
 5 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index ed2fb32..b8645d9 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^dspk@[0-9a-f]*$"
@@ -55,6 +58,19 @@ properties:
       The name can be "DSPK1" or "DSPKx", where x depends on the maximum
       available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          DSPK ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          DSPK DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for playback.
+
 required:
   - compatible
   - reg
@@ -64,7 +80,7 @@ required:
   - assigned-clock-parents
   - sound-name-prefix
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index c028b25..7cee772 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^admaif@[0-9a-f]*$"
@@ -37,6 +40,14 @@ properties:
 
   dma-names: true
 
+  ports:
+    description: |
+      Contains list of ACIF (Audio CIF) port nodes for ADMAIF channels.
+      The number of port nodes depends on the number of ADMAIF channels
+      that SoC may have. These are interfaced with respective ACIF ports
+      in AHUB (Audio Hub). Each port is capable of data transfers in
+      both directions.
+
 if:
   properties:
     compatible:
@@ -81,7 +92,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index d772197..31f3e51 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^ahub@[0-9a-f]*$"
@@ -56,6 +59,13 @@ properties:
 
   ranges: true
 
+  ports:
+    description: |
+      Contains list of ACIF (Audio CIF) port nodes for AHUB (Audio Hub).
+      These are connected to ACIF interfaces of AHUB clients. Thus the
+      number of port nodes depend on the number of clients that AHUB may
+      have depending on the SoC revision.
+
 required:
   - compatible
   - reg
@@ -67,8 +77,7 @@ required:
   - "#size-cells"
   - ranges
 
-additionalProperties:
-  type: object
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 2a3207b..89f4f47 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^dmic@[0-9a-f]*$"
@@ -56,6 +59,19 @@ properties:
       The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          DMIC ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          DMIC DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for capture.
+
 required:
   - compatible
   - reg
@@ -64,7 +80,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index dfc1bf7..5564603 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -16,6 +16,9 @@ maintainers:
   - Jon Hunter <jonathanh@nvidia.com>
   - Sameer Pujar <spujar@nvidia.com>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^i2s@[0-9a-f]*$"
@@ -74,6 +77,19 @@ properties:
       The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    type: object
+    properties:
+      port@0:
+        description: |
+          I2S ACIF (Audio Client Interface) port connected to the
+          corresponding AHUB (Audio Hub) ACIF port.
+
+      port@1:
+        description: |
+          I2S DAP (Digital Audio Port) interface which can be connected
+          to external audio codec for playback or capture.
+
 required:
   - compatible
   - reg
@@ -82,7 +98,7 @@ required:
   - assigned-clocks
   - assigned-clock-parents
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.7.4

