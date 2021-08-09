Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DF3E4341
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 11:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 588E71687;
	Mon,  9 Aug 2021 11:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 588E71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628502645;
	bh=oNAfHZp3iOHrZ+PIFiawR195zHnxBYBchkGMvHnUfh8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X5PBdxZZc8xdRjIA6rPU9IxXWMDp2CujlnISRYfWWGXFLz3KWLxPRwvnz3UPDrAme
	 9rq6HoPkkbUdFslmiO6o8NxWPPklB2T+3QFr9CE+WDy2jr57mIp/c/680DgPIez43W
	 mdF3yrAPHqvf1bZY+lNP5Gw1j1mzJcl+BVwNa6ME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8412F804B0;
	Mon,  9 Aug 2021 11:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40062F804DA; Mon,  9 Aug 2021 11:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD26CF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 11:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD26CF800FD
X-UUID: e53df2090f014ae68cb78cd6968e5252-20210809
X-UUID: e53df2090f014ae68cb78cd6968e5252-20210809
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 988102232; Mon, 09 Aug 2021 17:48:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:58 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/9] ASoC: mediatek: Add support for MT8195 SoC
Date: Mon, 9 Aug 2021 17:48:46 +0800
Message-ID: <20210809094855.7169-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, wenst@chromium.org, aaronyu@google.com,
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

Changes since v2:
  - added audio clock gate control
  - added 'mediatek' prefix to private dts properties
  - added consumed clocks to dt-bindins and adopted suggestions from Rob
  - refined clock usage and remove unused clock and control code
  - fixed typos

Changes since v1:
  - fixed some problems related to dt-bindings
  - added some missing properties to dt-bindings
  - added depency declaration on dt-bindings
  - fixed some warnings found by kernel test robot

Trevor Wu (9):
  ASoC: mediatek: mt8195: update mediatek common driver
  ASoC: mediatek: mt8195: support audsys clock control
  ASoC: mediatek: mt8195: support etdm in platform driver
  ASoC: mediatek: mt8195: support adda in platform driver
  ASoC: mediatek: mt8195: support pcm in platform driver
  ASoC: mediatek: mt8195: add platform driver
  dt-bindings: mediatek: mt8195: add audio afe document
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |  184 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   39 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   10 +-
 sound/soc/mediatek/mt8195/Makefile            |   15 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  499 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  113 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3283 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c |  217 ++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |   15 +
 .../soc/mediatek/mt8195/mt8195-audsys-clkid.h |   93 +
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  830 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   | 2652 +++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |  389 ++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  977 +++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2796 ++++++++++++++
 19 files changed, 12311 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h

-- 
2.18.0

