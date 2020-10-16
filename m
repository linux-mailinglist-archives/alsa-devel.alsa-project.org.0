Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C32907B4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 16:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107BF17B7;
	Fri, 16 Oct 2020 16:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107BF17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602859782;
	bh=RnTV4BkVrVC6aXwzz4qCGlJRrSCdgB0ef0hUBEcCUpM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScHDpcl3dwTOSvKmYLQKbUPOZoJR8nBTgnq0KgIbt1QHDJfQyHekHwwxPidhGQecJ
	 K6x+0CIcVzzkCjUzT1WI97rQMEFmZ2MkkWBT5yv9sdebDBt8dffHPsMoHhLeHDaKJJ
	 KYjlqShuqK+qI0HHFgPGXX4x4K7b0RR3TxcPM0zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE20F80308;
	Fri, 16 Oct 2020 16:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AE00F80303; Fri, 16 Oct 2020 16:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5135FF802EA
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 16:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5135FF802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MXBmyFPG"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f89b1a10003>; Fri, 16 Oct 2020 07:43:45 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:25 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:20 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <p.zabel@pengutronix.de>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
Subject: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
Date: Fri, 16 Oct 2020 20:12:57 +0530
Message-ID: <1602859382-19505-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602859425; bh=p/k/pqswaom0r/vwo+mzlUVsgythPhPIMLpr24Czlus=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=MXBmyFPGWhWqFCutwCNWlANGF19yEf+D7LKKG/HyJwNyxP7nJJh7FVLY7J2D8JEbu
 Dd9TjuJRvNQ+zPMBPSBtKsIZey14QKrOo/0BJQaS3jijjURrwVxnyha9Mjq8T46IZa
 hZ3A4d4oSQyFz8oWMG/yNn3r6xN/hXjCvEGNa69P104JexNBiQOyqJ4A5gRiOjfMYO
 +8zWn2hQ5Ei+4d0OVaTTQLy9St8BwGQyGkd0EPxLv7KtjmHVjhj7tYtleCQS6pP9F8
 O11Y6wmKsVr6/qYfuFg77RGhHyyVJTB52rDlv2wzY77eGmVv7dxssOA4EH44SDYK6w
 DpXritlNZ9i7Q==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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
 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
 .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
 5 files changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index ed2fb32..23875b1 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -55,6 +55,13 @@ properties:
       The name can be "DSPK1" or "DSPKx", where x depends on the maximum
       available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index c028b25..26ba725 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -37,6 +37,13 @@ properties:
 
   dma-names: true
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index d772197..d6aa849 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -56,6 +56,13 @@ properties:
 
   ranges: true
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index 2a3207b..36232ed 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -56,6 +56,13 @@ properties:
       The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index dfc1bf7..f5cdf33 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -74,6 +74,13 @@ properties:
       The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
       on the maximum available instances on a Tegra SoC.
 
+  ports:
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
+
 required:
   - compatible
   - reg
-- 
2.7.4

