Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECF65EF01
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 15:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A83311170;
	Thu,  5 Jan 2023 15:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A83311170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672929782;
	bh=5s1KtwU1cLN7GL/X0OTK7kb5+a4WTKerZI29eSw9LMo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sZMA+SLqmIX6vU2Za0B0V0oeRIIZM+ggUCML1JuXOJjgEt7vY8gVLjCJYHvO8+iyJ
	 lHG0fAxnz3HhQryCDiDAfw5fT+wduCZfRwYfjArc3yTPkljQS46teMOnhAWhb5fyqu
	 OTlPon3rWK9KCbprEt56DqDow1wrEx5UtvXqqPiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6E6F8022B;
	Thu,  5 Jan 2023 15:42:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55962F8022B; Thu,  5 Jan 2023 15:42:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA39F8022B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 15:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA39F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=xQKP2ZUz
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0835E85248;
 Thu,  5 Jan 2023 15:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1672929720;
 bh=P+0Qo4nN3rJriPnghe4osYRl64VJHMO2uLo+zGykihY=;
 h=From:To:Cc:Subject:Date:From;
 b=xQKP2ZUzr1dKjnQVQBshOI+e3BJCLgZaoQCaRuJLOjiqP0CsNoY318VqU3z9guiNb
 U0hYFpxTsyvyh/orYPWwo8QRFUAxzmNdW7e66VdPEoMhHga7yVXJdQbT9lw4SoUfPB
 flPn9IWUyFMhv4zCW67dw4QxAJMevtENvAItv4s0p2y8ue3t9x/bYSXY0wbrnxxnR7
 JxL4LT64cAMDfohdlE4HD9SdyQxqmA6cv3g2NQs2Ua6j0bP1g48Jv5b8R1pJtCIA5X
 k4fyjNdvfotxDaVZ4rvDUhXcfdFMosBUofHA5+dS70q7ahceoe4RlMY0p+Qn1OI/sK
 3jP+VjYsrH0Mg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Simplify the VFxxx dmas
 binding
Date: Thu,  5 Jan 2023 15:41:44 +0100
Message-Id: <20230105144145.165010-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Paul Elder <paul.elder@ideasonboard.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Get rid of the vf610 sai special case, instead update the vfxxx.dtsi
DT to use the same DMA channel ordering as all the other devices. The
sai DMA channel ordering has not been aligned with other IP DMA channel
ordering in the vfxxx.dtsi anyway.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Tim Harvey <tharvey@gateworks.com>
Cc: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 .../devicetree/bindings/sound/fsl,sai.yaml    | 38 ++++---------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 7e56337d8edc1..088c26b001cc0 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -76,10 +76,14 @@ properties:
         minItems: 4
 
   dmas:
-    maxItems: 2
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
 
   dma-names:
-    maxItems: 2
+    items:
+      - const: rx
+      - const: tx
 
   interrupts:
     items:
@@ -142,31 +146,6 @@ properties:
 
 allOf:
   - $ref: dai-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: fsl,vf610-sai
-    then:
-      properties:
-        dmas:
-          items:
-            - description: DMA controller phandle and request line for TX
-            - description: DMA controller phandle and request line for RX
-        dma-names:
-          items:
-            - const: tx
-            - const: rx
-    else:
-      properties:
-        dmas:
-          items:
-            - description: DMA controller phandle and request line for RX
-            - description: DMA controller phandle and request line for TX
-        dma-names:
-          items:
-            - const: rx
-            - const: tx
   - if:
       required:
         - fsl,sai-asynchronous
@@ -199,9 +178,8 @@ examples:
                  <&clks VF610_CLK_SAI2>,
                  <&clks 0>, <&clks 0>;
         clock-names = "bus", "mclk1", "mclk2", "mclk3";
-        dma-names = "tx", "rx";
-        dmas = <&edma0 0 21>,
-               <&edma0 0 20>;
+        dma-names = "rx", "tx";
+        dmas = <&edma0 0 20>, <&edma0 0 21>;
         big-endian;
         lsb-first;
     };
-- 
2.39.0

