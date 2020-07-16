Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1FA2229F7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C041669;
	Thu, 16 Jul 2020 19:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C041669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594920692;
	bh=2/3pHeTWJfb5o/VNF2b2G36cpa+I8J5P8URSVK0mcPc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3GyS4vvjE0RSMaCnQXUL8l7AtcTixgdPHBYGkZoq923WKNDKHz9aYKY/z9Bb/lxc
	 fHxcILXmBsOOQfyQuTVQGHfmKKI6tZyeQ0sOcFG9KwF1kVsBy+8kdHIe9kPqop3ZxN
	 dRFUBLEG847Po5lGmMvxB7SNGLWpee7WGU+HPIcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 099F6F8027B;
	Thu, 16 Jul 2020 19:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F4FCF8036C; Thu, 16 Jul 2020 19:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 30A03F8034C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A03F8034C
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; d="scan'208";a="52319184"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2020 02:20:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id E209540B5640;
 Fri, 17 Jul 2020 02:20:19 +0900 (JST)
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
Subject: [PATCH 19/20] media: rcar-vin: Enable support for R8A774E1
Date: Thu, 16 Jul 2020 18:18:34 +0100
Message-Id: <1594919915-5225-20-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the SoC specific information for RZ/G2H (R8A774E1) SoC. Also add
the routing information between CSI2 and VIN (which is similar to
R-Car H3 except it lacks CSI41).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27..4fb76d1df308 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -944,6 +944,42 @@ static const struct rvin_info rcar_info_gen2 = {
 	.max_height = 2048,
 };
 
+static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
+	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
+	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
+	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
+	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
+	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
+	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
+	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
+	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
+	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
+	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
+	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
+	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
+	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
+	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
+	{ /* Sentinel */ }
+};
+
+static const struct rvin_info rcar_info_r8a774e1 = {
+	.model = RCAR_GEN3,
+	.use_mc = true,
+	.max_width = 4096,
+	.max_height = 4096,
+	.routes = rcar_info_r8a774e1_routes,
+};
+
 static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
 	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
 	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
@@ -1220,6 +1256,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a774c0",
 		.data = &rcar_info_r8a77990,
 	},
+	{
+		.compatible = "renesas,vin-r8a774e1",
+		.data = &rcar_info_r8a774e1,
+	},
 	{
 		.compatible = "renesas,vin-r8a7778",
 		.data = &rcar_info_m1,
-- 
2.17.1

