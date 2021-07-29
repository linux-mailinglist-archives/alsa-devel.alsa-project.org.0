Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E665C3DAA0B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 19:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80FAB17CD;
	Thu, 29 Jul 2021 19:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80FAB17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627579495;
	bh=XxrveWvgSChyj6KV8NJM9McYRqwS69zisxy/NSJl0t4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f02DMoiCGtB+4DtpZC8Gp2DVAzu8fmYhJORJgXpJKRsWCQWiI5x50Yc6QaWg8krkJ
	 woLDQM3RHwGZt77lfpjVRks4O964wizk+XKfeXm5b8ksD3f55BJ8rIroumW4bvJIo1
	 54Cm1LgOZJACxAJyPHjbptbazKKbavv+tYB05XTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054BDF80276;
	Thu, 29 Jul 2021 19:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2AFF80276; Thu, 29 Jul 2021 19:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=AC_FROM_MANY_DOTS,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C1B8F800EB
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 19:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C1B8F800EB
X-IronPort-AV: E=Sophos;i="5.84,279,1620658800"; d="scan'208";a="89179387"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Jul 2021 02:23:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B76AA40083F2;
 Fri, 30 Jul 2021 02:23:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/3] Add RZ/G2L Sound support
Date: Thu, 29 Jul 2021 18:23:08 +0100
Message-Id: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Biju Das <biju.das@bp.renesas.com>
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

This patch series aims to add ASoC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A ASoC driver.

v2->v3:
 * Fixed the dependency on KCONFIG
 * Merged the binding patch with dma feature added
 * Updated dt binding example with encoded #dma-cells value.
 * Improved Error handling in probe function
 * Removed the passing legacy channel configuration parameters from dmaengine_slave_config function
 * started using dma_request_chan instead of deprecated dma_request_slave_channel
 * Removed SoC dtsi and config patches from this series. Will send it later.
v1->v2:
 * Rebased to latest rc kernel

Biju Das (3):
  ASoC: dt-bindings: Document RZ/G2L bindings
  sound: soc: sh: Add RZ/G2L SSIF-2 driver
  sound: sh: rz-ssi: Add SSI DMAC support

 .../bindings/sound/renesas,rz-ssi.yaml        |  100 ++
 sound/soc/sh/Kconfig                          |    9 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1062 +++++++++++++++++
 4 files changed, 1175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/sh/rz-ssi.c

-- 
2.17.1

