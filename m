Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3032229DE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037F0852;
	Thu, 16 Jul 2020 19:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037F0852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594920490;
	bh=ou1A2+0xTwJE8GabY+ZfqQ2dp5JLIp9vaD5jBYsHzxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFEiVw6rmgCvgldXXggoFNWO1O/ZTQYY0/JvhTpskxj0YEEzQ3pJhuOzOnlygUvrM
	 VDRWaekaXtJbsO8ns8973jNDe89e4qXEApDwUu1XUpg+5j4wuMbMfEvj0tuIIV4olq
	 5A1goqf9CSw9SpZ9V2S5zSL6Dv9J9zRXcAIucdKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42305F8033F;
	Thu, 16 Jul 2020 19:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3B6F80339; Thu, 16 Jul 2020 19:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AE002F80336
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE002F80336
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; d="scan'208";a="52107245"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 02:19:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3469A40B55ED;
 Fri, 17 Jul 2020 02:19:47 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jens Axboe <axboe@kernel.dk>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Mark Brown <broonie@kernel.org>, Niklas <niklas.soderlund@ragnatech.se>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH 13/20] arm64: dts: renesas: r8a774e1: Add USB-DMAC and HSUSB
 device nodes
Date: Thu, 16 Jul 2020 18:18:28 +0100
Message-Id: <1594919915-5225-14-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-ide@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
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

Add usb dmac and hsusb device nodes to the RZ/G2H SoC dtsi.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 40 ++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 431eea1f3b97..c2797f496e9a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -838,10 +838,48 @@
 		};
 
 		hsusb: usb@e6590000 {
+			compatible = "renesas,usbhs-r8a774e1",
+				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
+			       <&usb_dmac1 0>, <&usb_dmac1 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <11>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
+		};
 
-			/* placeholder */
+		usb_dmac0: dma-controller@e65a0000 {
+			compatible = "renesas,r8a774e1-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65a0000 0 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 330>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 330>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
+		};
+
+		usb_dmac1: dma-controller@e65b0000 {
+			compatible = "renesas,r8a774e1-usb-dmac",
+				     "renesas,usb-dmac";
+			reg = <0 0xe65b0000 0 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1";
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			#dma-cells = <1>;
+			dma-channels = <2>;
 		};
 
 		usb3_phy0: usb-phy@e65ee000 {
-- 
2.17.1

