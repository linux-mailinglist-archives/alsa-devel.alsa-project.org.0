Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CF222930
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1231670;
	Thu, 16 Jul 2020 19:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1231670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594920037;
	bh=M2KgI4VHnGhnRs+wKxQ3dWW3WcGtFe2tBtgv6ndbQSI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cd6QgA3BWYO/2Dgga9IfFuBdbrJiLP4zCQXwYbtD1d20m/tUqQlsSX1ADCeV4Xb9z
	 X4i9lLGQQOu0YKILaswaDdaH7UaD9RVWAPeWQBDQxreJXPtTF+axu8SJFrvc44MOab
	 7Oy78lDzgrM8BeqOyph9EWO9pWy9lPd7D9YYmQ0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB04F801EC;
	Thu, 16 Jul 2020 19:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E12F8020C; Thu, 16 Jul 2020 19:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 891D7F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891D7F8014E
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; d="scan'208";a="52107158"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 02:18:41 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 75C8B40B5142;
 Fri, 17 Jul 2020 02:18:36 +0900 (JST)
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
Subject: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on R8A774E1
Date: Thu, 16 Jul 2020 18:18:15 +0100
Message-Id: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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

Hi All,

This patch series adds support for the following peripherals on RZ/G2H SoC
 * PCIe
 * SATA
 * USB2
 * USB3
 * Audio
 * VIN
 * CSI

Cheers,
Prabhakar

Lad Prabhakar (20):
  dt-bindings: pci: rcar-pci: Add device tree support for r8a774e1
  arm64: dts: renesas: r8a774e1: Add PCIe device nodes
  dt-bindings: ata: renesas,rcar-sata: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add SATA controller node
  dt-bindings: phy: renesas,usb2-phy: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add USB2.0 phy and host (EHCI/OHCI)
    device nodes
  dt-bindings: usb: renesas,usb3-peri: Document r8a774e1 support
  dt-bindings: usb: usb-xhci: Document r8a774e1 support
  dt-bindings: phy: renesas,usb3-phy: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Add USB3.0 device nodes
  dt-bindings: usb: renesas,usbhs: Add r8a774e1 support
  dt-bindings: dma: renesas,usb-dmac: Add binding for r8a774e1
  arm64: dts: renesas: r8a774e1: Add USB-DMAC and HSUSB device nodes
  dt-bindings: sound: renesas,rsnd: Document r8a774e1 bindings
  arm64: dts: renesas: r8a774e1: Add audio support
  dt-bindings: media: renesas,csi2: Add R8A774E1 support
  dt-bindings: media: renesas,vin: Add R8A774E1 support
  media: rcar-csi2: Enable support for R8A774E1
  media: rcar-vin: Enable support for R8A774E1
  arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes

 .../bindings/ata/renesas,rcar-sata.yaml       |   1 +
 .../bindings/dma/renesas,usb-dmac.yaml        |   1 +
 .../bindings/media/renesas,csi2.yaml          |   1 +
 .../bindings/media/renesas,vin.yaml           |   1 +
 .../devicetree/bindings/pci/rcar-pci.txt      |   1 +
 .../bindings/phy/renesas,usb2-phy.yaml        |   1 +
 .../bindings/phy/renesas,usb3-phy.yaml        |   1 +
 .../bindings/sound/renesas,rsnd.txt           |   1 +
 .../bindings/usb/renesas,usb3-peri.yaml       |   1 +
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 .../devicetree/bindings/usb/usb-xhci.txt      |   1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 989 +++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-core.c   |  40 +
 drivers/media/platform/rcar-vin/rcar-csi2.c   |   4 +
 14 files changed, 1022 insertions(+), 22 deletions(-)

-- 
2.17.1

