Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725C4617AE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 15:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B103193A;
	Mon, 29 Nov 2021 15:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B103193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638195209;
	bh=wAEimkdZ2K/GLtMizE4pJVK+zWXZ6ydtQjXXEEzkr8E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M+xeqg87mj9cHEbHdJCUfzavujuDN3NqZTRa6wRSR1BCCs/xoHKQeeqaLfulCP6tP
	 nYPH3fGT0rnx30qehO1oz7mWdVXeVmE3q9O0KLPeJoiJPxToeUTBak60loIMmEdv+n
	 8D4iLOJI61fJZTJUyLZC1eV7/sWIM31FUf6UqeaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 582DCF804EB;
	Mon, 29 Nov 2021 15:11:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DAF6F804EC; Mon, 29 Nov 2021 15:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF68CF80246
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 15:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF68CF80246
X-UUID: 4aaf70748b254020abaf5ee72c134a93-20211129
X-UUID: 4aaf70748b254020abaf5ee72c134a93-20211129
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2061602169; Mon, 29 Nov 2021 22:11:08 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 22:11:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Update MT8195 machine driver
Date: Mon, 29 Nov 2021 22:10:53 +0800
Message-ID: <20211129141057.12422-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

This series of patches adds support for RT5682s headset codec in mt8195
machine drivers, and SOF support on card mt8195-mt6359-rt1019-rt5682 is
also included.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  - remove patch3 and patch4 in v1
  - add SOF support on card mt8195-mt6359-rt1012-rt5682
  - add new propertes to dt-bindings for mt8195-mt6359-rt1019-rt5682

Trevor Wu (4):
  ASoC: mediatek: mt8195: add headset codec rt5682s support
  dt-bindings: mediatek: mt8195: add model property
  ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682
  dt-bindings: mediatek: mt8195: add adsp and dai-link property

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   4 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |  14 +
 sound/soc/mediatek/Kconfig                    |   2 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      |  29 +-
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 347 +++++++++++++++++-
 5 files changed, 370 insertions(+), 26 deletions(-)

-- 
2.18.0

