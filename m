Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308E47A1B0
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Dec 2021 19:12:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B73401841;
	Sun, 19 Dec 2021 19:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B73401841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639937564;
	bh=VtfVJu0wUBRQQBHm8MCzsI3Vv2KoAF0d+pGFDJiINzw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLHKAhxuvFGaBs+XII8jnOs8kBAlwJfZeYqr0crtJvT6ki1/rKN0daHbxGG5e8UBr
	 5MLXRN2U1rFQZqDS7s8FhBLqLM7JspHLXZCWvYECtSUvOd2U/NRji1Qs8rzzzoXihJ
	 6bsiicQLp8MZiFoLfRmS7JPXaf6IhSHpKW25q+s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEABF804D1;
	Sun, 19 Dec 2021 19:11:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A4FF804D1; Sun, 19 Dec 2021 19:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 3A5C1F800B0
 for <alsa-devel@alsa-project.org>; Sun, 19 Dec 2021 19:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5C1F800B0
X-IronPort-AV: E=Sophos;i="5.88,218,1635174000"; d="scan'208";a="103991109"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 20 Dec 2021 03:10:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 52BD640CB08A;
 Mon, 20 Dec 2021 03:10:51 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] ASoC: xlnx: Use platform_get_irq() to get the interrupt
Date: Sun, 19 Dec 2021 18:10:38 +0000
Message-Id: <20211219181039.24812-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index e2ca087adee6..cba0e868a7d7 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -237,7 +237,6 @@ MODULE_DEVICE_TABLE(of, xlnx_spdif_of_match);
 static int xlnx_spdif_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *res;
 	struct snd_soc_dai_driver *dai_drv;
 	struct spdif_dev_data *ctx;
 
@@ -273,13 +272,10 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	if (ctx->mode) {
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-		if (!res) {
-			dev_err(dev, "No IRQ resource found\n");
-			ret = -ENODEV;
+		ret = platform_get_irq(pdev, 0);
+		if (ret < 0)
 			goto clk_err;
-		}
-		ret = devm_request_irq(dev, res->start,
+		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
 		if (ret) {
-- 
2.17.1

