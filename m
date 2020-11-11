Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865452AF834
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9311784;
	Wed, 11 Nov 2020 19:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9311784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605119818;
	bh=a711pNLzcpbfoMe49qIseHYBzOxhko8EN9B7iWtFMjA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MN1AtoiGMPyll0XuwVMmzCWPHia0TXYXBcffaH9L57rvWVk8DD0XYbJq9xnFx4Idd
	 FThal1xiow6IY6WQbw8gotnG9LdIcqauX0GLDv4xK7F2z6PbxvnILZLVIkjE+kgsf/
	 a26GJf+RenMNEt/hiKddUET71hkohjPsUuo7aAPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E04F80271;
	Wed, 11 Nov 2020 19:35:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E54AEF8025E; Wed, 11 Nov 2020 19:35:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDA62F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 19:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA62F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="hfkdllZf"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fac2edf0000>; Wed, 11 Nov 2020 10:35:11 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 18:35:07 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 18:35:04 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH v5 1/6] ASoC: dt-bindings: tegra: Add graph bindings
Date: Thu, 12 Nov 2020 00:04:31 +0530
Message-ID: <1605119676-32273-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605119711; bh=y9pmkBo0Xo9gSBsbd1j0T8HjEGB1r9oTdkUiJEWLVS4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=hfkdllZfFzDgcOFjUHjYqJJpd6hOlNDo3TJGYa3BxQF4NI/grcrEtwk+WjTueIKj1
 KlgX03Bg6+w/X3JzxbzkUBVJuzKFfLyJiWbJ1s7SVP9/ZAGmocLmKbzklgtTJkTat/
 J4dSy881zze/EWtqkSENPHcO6r0N8AcEP8+fwoaMm5e56wFhoaH+DFY1r36PgfycRl
 xwoZVyUoAZwPgBY6CL0uGHuo4/aTkdiOBBRMPiSDTJ5A2AXnvgPR9SoP/leXSpex5C
 AFulsjzHb8b+3m0UC5Ej53WqXi+x93k0vEro0TtrYyg0lgLL/ENuxHmg7oARoB4rf5
 A2NRPJcryQOjA==
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
---
 .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     |  6 ++++++
 .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   |  6 ++++++
 .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 13 +++++++++++--
 .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     |  6 ++++++
 .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      |  6 ++++++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index ed2fb32..3c9364d 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -55,6 +55,12 @@ properties:
       The name can be "DSPK1" or "DSPKx", where x depends on the maximum
       available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: /schemas/sound/audio-graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index c028b25..162823d 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -37,6 +37,12 @@ properties:
 
   dma-names: true
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: /schemas/sound/audio-graph.yaml#/properties/port
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index d772197..59cd1f1 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -56,6 +56,16 @@ properties:
 
   ranges: true
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: /schemas/sound/audio-graph.yaml#/properties/port
+
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -67,8 +77,7 @@ required:
   - "#size-cells"
   - ranges
 
-additionalProperties:
-  type: object
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 2a3207b..b16bf5e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -56,6 +56,12 @@ properties:
       The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: /schemas/sound/audio-graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index dfc1bf7..598f763 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -74,6 +74,12 @@ properties:
       The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: /schemas/sound/audio-graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
-- 
2.7.4

