Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6023CD5EC
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 15:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792441658;
	Mon, 19 Jul 2021 15:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792441658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626702148;
	bh=OUTfEwYPWD9IEWQtJkoOidhNqWOlHSv4dzLbCzhdo3Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UUdh+30ly205PwISIL23BTeXo4HCnDl2GBxwK9GoQhiABss3x6MzsdJHdQ8FCO+Pv
	 sN3T2+xqAhy9P5dUYvf+9UQTESN8W9ups3w9rmEBnEgl7O0F2+DirVtHjl0K94HBoY
	 e+e4cUC4Lnq1eU5t68u+vSNssc9pjV2OOs9G7znM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7187F804AB;
	Mon, 19 Jul 2021 15:41:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C529F802DF; Mon, 19 Jul 2021 15:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=AC_FROM_MANY_DOTS,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id E467DF80218
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 15:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E467DF80218
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; d="scan'208";a="88135498"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 19 Jul 2021 22:40:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.148])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0388F425839B;
 Mon, 19 Jul 2021 22:40:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/8] Add RZ/G2L Sound support
Date: Mon, 19 Jul 2021 14:40:32 +0100
Message-Id: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
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

Biju Das (8):
  ASoC: dt-bindings: Document RZ/G2L bindings
  sound: soc: sh: Add RZ/G2L SSIF-2 driver
  arm64: dts: renesas: r9a07g044: Add external audio clock nodes
  arm64: dts: renesas: r9a07g044: Add SSI support
  arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
  ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
  sound: sh: rz-ssi: Add SSI DMAC support
  arm64: dts: renesas: r9a07g044: Add SSI DMA support

 .../bindings/sound/renesas,rz-ssi.yaml        |  100 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  105 ++
 arch/arm64/configs/defconfig                  |    1 +
 sound/soc/sh/Kconfig                          |   10 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1078 +++++++++++++++++
 6 files changed, 1298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/sh/rz-ssi.c

-- 
2.17.1

