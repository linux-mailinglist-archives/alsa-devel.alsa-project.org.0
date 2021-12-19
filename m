Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073E47A1AF
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Dec 2021 19:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58EE1820;
	Sun, 19 Dec 2021 19:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58EE1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639937529;
	bh=z2WxefjNnH11O+8bNjTb/HvFwedZNrxzg2kHdWkkeZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u5CZfO9S5+m3qRmkwC6BPlz8YvtqU0Gicoo08IFHceqCDM6XxfaARkF8qTLAYb1L5
	 EgwkN4SG8a3c6UskG0FMRUo+7hvIRD0IAl9Mi6BsoFndSIPHF/YIbUVEWd9UJp0zb3
	 Ht7QmvRamL0IDZ4v0TrQFjGJ/RIvYioA9UShuwKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D4CEF804D0;
	Sun, 19 Dec 2021 19:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB2EFF8012A; Sun, 19 Dec 2021 19:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4D696F8012A
 for <alsa-devel@alsa-project.org>; Sun, 19 Dec 2021 19:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D696F8012A
X-IronPort-AV: E=Sophos;i="5.88,218,1635174000"; d="scan'208";a="104455498"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 20 Dec 2021 03:10:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D5F940CAB3F;
 Mon, 20 Dec 2021 03:10:48 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/2] sound/soc: Use platform_get_irq() to fetch IRQ's
Date: Sun, 19 Dec 2021 18:10:37 +0000
Message-Id: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
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

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: I have just build tested the patches.

Cheers,
Prabhakar

Lad Prabhakar (2):
  ASoC: xlnx: Use platform_get_irq() to get the interrupt
  ASoC: bcm: Use platform_get_irq() to get the interrupt

 sound/soc/bcm/bcm63xx-i2s.h          |  1 -
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 12 +++++-------
 sound/soc/xilinx/xlnx_spdif.c        | 10 +++-------
 3 files changed, 8 insertions(+), 15 deletions(-)

-- 
2.17.1

