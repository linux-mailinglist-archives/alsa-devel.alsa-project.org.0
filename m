Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2453EE7C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:22:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0069E1B21;
	Mon,  6 Jun 2022 21:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0069E1B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654543338;
	bh=fwsZUqtbKH9qnqRc/Y3vOs4NVBlr26YG3znOKrtJdC0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZxuyJH8RCaeVrOzYiqNTW9Niu2K/EUpdAfFbtMxQMi8pyIec4s3MZRhQ6RCYm8RaN
	 MuhuISt/V9y0xJCLztXrmylWVvAlvKVnu5NG00ul8NddatTZEP7GPCcjmGgIfqWeFD
	 VzlZ70s0vyfAq3AMM7/SvtfVXKmUyYxJK2B8dNgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A052BF8053D;
	Mon,  6 Jun 2022 21:20:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A11DDF80533; Mon,  6 Jun 2022 21:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46777F8051E
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46777F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Ny6Dtaju"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654543192; bh=Vla6Rhfl/gMBj6xgJ0VP7fQelpDgmC8OEg+qQWxrpmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ny6DtajuT28g+Hn74q+dQy3n8P98yg8HxM2Q2EGHrASbKTqYagLJ4C99wA52Wy8aJ
 EfSFqLu6+/CcTDGF6vq6pnWADSLQltOYIeVoqG+8EnqMZaRLewBpRxvRPV/2A5x9W3
 blGBSzzqkwiD2T1MsUTMV4vEQg9LMMN83v7byraY=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH v2 1/5] dt-bindings: sound: Add Apple MCA I2S transceiver
Date: Mon,  6 Jun 2022 21:19:06 +0200
Message-Id: <20220606191910.16580-2-povik+lin@cutebit.org>
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Add binding schema for MCA I2S transceiver found on Apple M1 and other
chips.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../devicetree/bindings/sound/apple,mca.yaml  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml

diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
new file mode 100644
index 000000000000..c8a36d8c38ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,mca.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple MCA I2S transceiver
+
+description: |
+  MCA is an I2S transceiver peripheral found on M1 and other Apple chips. It is
+  composed of a number of identical clusters which can operate independently
+  or in an interlinked fashion. Up to 6 clusters have been seen on an MCA.
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-mca
+          - apple,t6000-mca
+      - const: apple,mca
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    maxItems: 6
+    description: |
+      One interrupt per each cluster
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  dmas:
+    minItems: 16
+    maxItems: 24
+    description: |
+      DMA channels associated to the SERDES units within the peripheral. They
+      are listed in groups of four per cluster, and within the cluster they are
+      given in order TXA, RXA, TXB, RXB of the respective SERDES units.
+
+  dma-names:
+    minItems: 16
+    maxItems: 24
+    description: |
+      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
+      based on the associated SERDES unit.
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+    description: |
+      Clusters' input reference clock.
+
+  power-domains:
+    minItems: 5
+    maxItems: 7
+    description: |
+      First the overall power domain for register access, then the power
+      domains of individual clusters for their operation.
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - power-domains
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    mca: mca@9b600000 {
+      compatible = "apple,t6000-mca", "apple,mca";
+      reg = <0x9b600000 0x10000>,
+            <0x9b500000 0x20000>;
+
+      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+                      <&ps_mca2>, <&ps_mca3>;
+      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+                  "tx1a", "rx1a", "tx1b", "rx1b",
+                  "tx2a", "rx2a", "tx2b", "rx2b",
+                  "tx3a", "rx3a", "tx3b", "rx3b";
+
+      #sound-dai-cells = <1>;
+    };
-- 
2.33.0

