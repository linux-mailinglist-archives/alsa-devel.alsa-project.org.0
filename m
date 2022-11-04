Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0E619C83
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 17:05:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE63C1632;
	Fri,  4 Nov 2022 17:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE63C1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667577909;
	bh=3j0shTM841gixHo+KJ50q9T+saf7FR5cF7ftJmcfR6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9H08GDMx6PAMFs2tz1ABhFeBdT9Hw660jxX6Qmpxynz5rOT7ZNDrBUGkcQdlLzbV
	 ojl5ae/b5hUtbbPAcJLPOrXiC6dKWsEu0oD3B/A5RXZcOFkoof+ei4JbH3NBtvvEJS
	 +Wse04axvo3NqaQQC4WFombphh6wX3RTSdk6ij6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5CBF80566;
	Fri,  4 Nov 2022 17:03:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E68F804AC; Fri,  4 Nov 2022 17:03:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32EC7F804AC
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 17:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32EC7F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="mK/Qxp0x"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CD11B85240;
 Fri,  4 Nov 2022 17:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667577809;
 bh=kiR4euSdQwIl+MZxkiOMePFGV+vs3O4ipYS8iMd8u10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mK/Qxp0xTisVdl9WhCqqXs3u2oCqMZ9gSDMzr0gpVgJg8FTMeqwAapL/I9wPce7Nb
 TEGhlcoRZE2lkfYy/hA+VZaVGeWpFEZYMOLtLv6y5QOTB7QrfyS37G03YmPbVdAf0j
 JEnTW79riqFYFWmEDpd762TRjQ03FcQKeZ0iMxK3b+35KIJCa2qFddcJii9WE7wIuI
 RsYLlXAZxWkladW1VFNNZxmm6D/joROKi33JS5UoCybogSxlGOWXK2oWergiLhUMX5
 jp9H3GuNN80AhtLSankfNEgcjgMhRTB5v1lfzgArK+R6LS0xQGF6JMyMmoialoFM0x
 oyzm1L9VAZ0Pw==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH 3/3] ASoC: dt-bindings: fsl-sai: Sort main section properties
Date: Fri,  4 Nov 2022 17:03:15 +0100
Message-Id: <20221104160315.213836-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104160315.213836-1-marex@denx.de>
References: <20221104160315.213836-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

Sort main section properties, no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
To: devicetree@vger.kernel.org
---
 .../devicetree/bindings/sound/fsl,sai.yaml    | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 59a13cd0887e9..022da1f4583d6 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -43,16 +43,6 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    items:
-      - description: receive and transmit interrupt
-
-  dmas:
-    maxItems: 2
-
-  dma-names:
-    maxItems: 2
-
   clocks:
     items:
       - description: The ipg clock for register access
@@ -84,19 +74,37 @@ properties:
           - const: pll11k
         minItems: 4
 
-  lsb-first:
-    description: |
-      Configures whether the LSB or the MSB is transmitted
-      first for the fifo data. If this property is absent,
-      the MSB is transmitted first as default, or the LSB
-      is transmitted first.
-    type: boolean
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: receive and transmit interrupt
 
   big-endian:
     description: |
       required if all the SAI registers are big-endian rather than little-endian.
     type: boolean
 
+  fsl,dataline:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Configure the dataline. It has 3 value for each configuration
+    maxItems: 16
+    items:
+      items:
+        - description: format Default(0), I2S(1) or PDM(2)
+          enum: [0, 1, 2]
+        - description: dataline mask for 'rx'
+        - description: dataline mask for 'tx'
+
+  fsl,sai-mclk-direction-output:
+    description: SAI will output the SAI MCLK clock.
+    type: boolean
+
   fsl,sai-synchronous-rx:
     description: |
       SAI will work in the synchronous mode (sync Tx with Rx) which means
@@ -115,26 +123,18 @@ properties:
       of transmitter.
     type: boolean
 
-  fsl,dataline:
-    $ref: /schemas/types.yaml#/definitions/uint32-matrix
-    description: |
-      Configure the dataline. It has 3 value for each configuration
-    maxItems: 16
-    items:
-      items:
-        - description: format Default(0), I2S(1) or PDM(2)
-          enum: [0, 1, 2]
-        - description: dataline mask for 'rx'
-        - description: dataline mask for 'tx'
-
-  fsl,sai-mclk-direction-output:
-    description: SAI will output the SAI MCLK clock.
-    type: boolean
-
   fsl,shared-interrupt:
     description: Interrupt is shared with other modules.
     type: boolean
 
+  lsb-first:
+    description: |
+      Configures whether the LSB or the MSB is transmitted
+      first for the fifo data. If this property is absent,
+      the MSB is transmitted first as default, or the LSB
+      is transmitted first.
+    type: boolean
+
   "#sound-dai-cells":
     const: 0
     description: optional, some dts node didn't add it.
@@ -175,11 +175,11 @@ allOf:
 required:
   - compatible
   - reg
-  - interrupts
-  - dmas
-  - dma-names
   - clocks
   - clock-names
+  - dmas
+  - dma-names
+  - interrupts
 
 additionalProperties: false
 
-- 
2.35.1

