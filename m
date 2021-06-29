Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17623B6C41
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 03:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B534168C;
	Tue, 29 Jun 2021 03:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B534168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624931373;
	bh=ivLgCaOSCPbM+G52ny6KIYgGJejiIabQGvzj8Tl1tCc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J7pKubuKu5c0sL/XLTKi0HG3P6tzS8OKXEX8beEZVr/ZxnWhhNczviFEePleJlV5x
	 S9Nqcejq8qejaSTv0XZL1Qr3hG6iyi1wP/IRHmg5yFZTO6xh0A060Sr/B6+O8TLvxX
	 oBCwJ0fNBuIIZrHE5Rkenn+cyObtu2mt5pRLXeA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DF9F8025D;
	Tue, 29 Jun 2021 03:48:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FD9F80259; Tue, 29 Jun 2021 03:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0951BF800EE
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 03:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0951BF800EE
X-UUID: 84474fcaed974a57a226c3aa63e2374a-20210629
X-UUID: 84474fcaed974a57a226c3aa63e2374a-20210629
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 640803979; Tue, 29 Jun 2021 09:47:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 09:47:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 09:47:49 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/8] ASoC: mediatek: Add support for MT8195 SoC
Date: Tue, 29 Jun 2021 09:47:28 +0800
Message-ID: <20210629014736.31153-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, aaronyu@google.com,
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

This series of patches adds support for Mediatek AFE of MT8195 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  - fixed some problems related to dt-bindings
  - add some missing properties to dt-bindings
  - add depency declaration on dt-bindings
  - fixed some warnings found by kernel test robot

Trevor Wu (8):
  ASoC: mediatek: mt8195: update mediatek common driver
  ASoC: mediatek: mt8195: support etdm in platform driver
  ASoC: mediatek: mt8195: support adda in platform driver
  ASoC: mediatek: mt8195: support pcm in platform driver
  ASoC: mediatek: mt8195: add platform driver
  dt-bindings: mediatek: mt8195: add audio afe document
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |  136 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   39 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   10 +-
 sound/soc/mediatek/mt8195/Makefile            |   14 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  899 +++++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  201 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  200 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3264 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  929 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   | 2666 ++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |  393 ++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  977 +++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2793 ++++++++++++++
 16 files changed, 12562 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h

-- 
2.18.0

