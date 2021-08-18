Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D03F01BB
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 12:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64DA1682;
	Wed, 18 Aug 2021 12:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64DA1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629282832;
	bh=Tlt5/isT0BEAt4jGTvXMXIgep+FtvmRRi1JIprmQaXo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V9o23bq2BaG2+6azg/mlrxp1+PnNNrJU+EptUbfTnwLJO2MhA5aJcr+PG8s/6R4A1
	 7lxy6fUhMskrB61ezwVpjuCAL1Revh8aB3F/ZNS2PZm36jpTaIMcHgQncN62iVfbrX
	 sJSi/HdH6YG6HxA/dYQc1JYrPTPQJKMwGWLYaEQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12227F8028D;
	Wed, 18 Aug 2021 12:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0CB8F8028D; Wed, 18 Aug 2021 12:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43318F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 12:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43318F80169
X-UUID: d6b23e4ec1794ed392210f166d0c1cb4-20210818
X-UUID: d6b23e4ec1794ed392210f166d0c1cb4-20210818
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1659944535; Wed, 18 Aug 2021 18:32:20 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 18:32:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 18:32:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v4 00/11] ASoC: mediatek: Add support for MT8195 SoC
Date: Wed, 18 Aug 2021 18:32:04 +0800
Message-ID: <20210818103215.9186-1-trevor.wu@mediatek.com>
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

Changes since v3:
  - fixed warnings found by kernel test robot
  - removed unused critical section
  - corrected the lock protected sections on etdm driver
  - added DPTX and HDMITX audio support

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

Trevor Wu (11):
  ASoC: mediatek: mt8195: update mediatek common driver
  ASoC: mediatek: mt8195: support audsys clock control
  ASoC: mediatek: mt8195: support etdm in platform driver
  ASoC: mediatek: mt8195: support adda in platform driver
  ASoC: mediatek: mt8195: support pcm in platform driver
  ASoC: mediatek: mt8195: add platform driver
  dt-bindings: mediatek: mt8195: add audio afe document
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and
    rt5682
  ASoC: mediatek: mt8195: add DPTX audio support
  ASoC: mediatek: mt8195: add HDMITX audio support
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |  184 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   47 +
 sound/soc/mediatek/Kconfig                    |   24 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   10 +-
 sound/soc/mediatek/mt8195/Makefile            |   15 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  441 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  109 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3281 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c |  214 ++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |   15 +
 .../soc/mediatek/mt8195/mt8195-audsys-clkid.h |   93 +
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  830 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   | 2639 +++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |  389 ++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 1093 ++++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2796 ++++++++++++++
 19 files changed, 12356 insertions(+), 5 deletions(-)
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

