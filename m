Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAA65EF07
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 15:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0F91116F;
	Thu,  5 Jan 2023 15:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0F91116F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672929801;
	bh=XAEq1IpqhqrQT1Ek4NT/VJnD3LjWVY3ZPm6AowVk3FY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LdKmwpS/AuIW9Z5nwRx1ycyltwAZ8zjVsi9XsuIt6khuL4dKSXXHJK7hMbX79qK9p
	 EzYKQWFewn2GwyyMothMDERab0yhea4VqLN8udwI/pTrBJlSkcfjn6qZ5l3atSb2mx
	 Uhz+BuY5wRjNBIsnrRIcQIpXFxmbX29Omj3BHHTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6A7F8051A;
	Thu,  5 Jan 2023 15:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D42AF804AD; Thu,  5 Jan 2023 15:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5F0FF80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 15:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5F0FF80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=YzYtQEbq
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3EC728558F;
 Thu,  5 Jan 2023 15:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1672929721;
 bh=2NfDTdyL7tuqDMtAY9qdNesvPbrd0NfYG4zWugMDLC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YzYtQEbqZlWetYqbbXPog74ISfNJUFg0WiGTVLBwzdXagqC0FD1/QW6pHHJ24Gnvt
 7lsD6bnEWzCqJgt3CvlVMavkKhhtITLqRLrOqKq+WUWiIsAuvKV1KqITm2SwrWG1tV
 HzRjcq0QJX3Y31lsj9aJT1Og8b4BVbJQLzFHhOtEtvsS5/bGwtToitRGVKVszZVlRo
 9dj5sczIHajeT1wPdjkBcFTqE6NiKeZqgZ95fmU0/ERniXNtHASW08NfqGVF312zTH
 7dryUkNDQVHGEP6F80w98jSGTkevdoUUiJP8/aMXFd0zA+WQiM/7xoyN2cSPhnJpaD
 JW/8EPZ0CEcBQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: vfxxx: Swap SAI DMA order
Date: Thu,  5 Jan 2023 15:41:45 +0100
Message-Id: <20230105144145.165010-2-marex@denx.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105144145.165010-1-marex@denx.de>
References: <20230105144145.165010-1-marex@denx.de>
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

Swap the SAI dmas and dma-names to match the order documented in
Documentation/devicetree/bindings/sound/fsl,sai.yaml
No functional change.

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
 arch/arm/boot/dts/vfxxx.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index d53f9c9db8bfd..ff4479994b600 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -191,9 +191,8 @@ sai0: sai@4002f000 {
 					<&clks VF610_CLK_SAI0_DIV>,
 					<&clks 0>, <&clks 0>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dma-names = "tx", "rx";
-				dmas = <&edma0 0 17>,
-					<&edma0 0 16>;
+				dma-names = "rx", "tx";
+				dmas = <&edma0 0 16>, <&edma0 0 17>;
 				status = "disabled";
 			};
 
@@ -205,9 +204,8 @@ sai1: sai@40030000 {
 					<&clks VF610_CLK_SAI1_DIV>,
 					<&clks 0>, <&clks 0>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dma-names = "tx", "rx";
-				dmas = <&edma0 0 19>,
-					<&edma0 0 18>;
+				dma-names = "rx", "tx";
+				dmas = <&edma0 0 18>, <&edma0 0 19>;
 				status = "disabled";
 			};
 
@@ -219,9 +217,8 @@ sai2: sai@40031000 {
 					<&clks VF610_CLK_SAI2_DIV>,
 					<&clks 0>, <&clks 0>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dma-names = "tx", "rx";
-				dmas = <&edma0 0 21>,
-					<&edma0 0 20>;
+				dma-names = "rx", "tx";
+				dmas = <&edma0 0 20>, <&edma0 0 21>;
 				status = "disabled";
 			};
 
@@ -233,9 +230,8 @@ sai3: sai@40032000 {
 					<&clks VF610_CLK_SAI3_DIV>,
 					<&clks 0>, <&clks 0>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
-				dma-names = "tx", "rx";
-				dmas = <&edma0 1 9>,
-					<&edma0 1 8>;
+				dma-names = "rx", "tx";
+				dmas = <&edma0 1 8>, <&edma0 1 9>;
 				status = "disabled";
 			};
 
-- 
2.39.0

