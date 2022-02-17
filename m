Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7564BA190
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:43:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3232F17C5;
	Thu, 17 Feb 2022 14:42:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3232F17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645105412;
	bh=bjKuFsQB8g4v7o3j+D3xoWEEDFYVPF24YXX38ZfXZ0c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YpznxO9iYCjgroTalQMdLy9mahvCPsE8n0t8ERmV8qJNHtc6QljacUA0ZGT+JGHvU
	 snT7umft/CPdxiSj4d/WVBk2g8XDu8HNbW3soRT1I7fHMRra17vdUIKoJUTehPadaA
	 4EGiIMNkl8rFiPe2vTR9A45y4WzNVLHMf5LVTLsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A11F804CB;
	Thu, 17 Feb 2022 14:42:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E618FF80249; Thu, 17 Feb 2022 14:42:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E38B5F80118
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38B5F80118
X-UUID: acd22bd0101c4bcaad834a947bda5d4f-20220217
X-UUID: acd22bd0101c4bcaad834a947bda5d4f-20220217
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1542140637; Thu, 17 Feb 2022 21:42:12 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 21:42:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 21:42:10 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:08 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [v2 00/17] ASoC: mediatek: Add support for MT8186 SoC
Date: Thu, 17 Feb 2022 21:41:48 +0800
Message-ID: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

This series of patches adds support for Mediatek AFE of MT8186 Soc.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  [v2 01/17]
    - add a new ID to the existing mt6358 codec driver
  [v2 03/17]
    - modify log level in DAPM events
    - use standard numeric control with name ending in Switch
    - return 1 when the value changed in mixer control's .get callback
  [v2 05/17]
    - ending in Switch to the standard on/off controls
    - change to "HW Gain 1 Volume" and "HW Gain 2 Volume"
  [v2 09/17]
    - return an error in the default case rather than just picking one of
      the behaviours when do .set_fmt
    - use the new defines that are _PROVIDER_MASK, _DAIFMT_CBP_CFP and
      _DAIFMT_CBC_CFC
  [v2 10/17]
  [v2 11/17]
    - the clock and gpio are aplit out into separate  patches

  The source file's GPL comment use c++ style, and the header fils's GPL
  comment use c style. We have added "Switch" after the names of all the
  controls that just are simple on/off.

Jiaxin Yu (17):
  ASoC: mediatek: mt6366: add codec driver
  ASoC: mediatek: mt8186: support audsys clock control
  ASoC: mediatek: mt8186: support adda in platform driver
  ASoC: mediatek: mt8186: support hostless in platform driver
  ASoC: mediatek: mt8186: support hw gain in platform driver
  ASoC: mediatek: mt8186: support i2s in platform driver
  ASoC: mediatek: mt8186: support pcm in platform driver
  ASoC: mediatek: mt8186: support src in platform driver
  ASoC: mediatek: mt8186: support tdm in platform driver
  ASoC: mediatek: mt8186: support audio clock control in platform driver
  ASoC: mediatek: mt8186: support gpio control in platform driver
  ASoC: mediatek: mt8186: add platform driver
  dt-bindings: mediatek: mt8186: add audio afe document
  ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and
    max98357
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357
    document
  ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and
    rt5682s
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s
    document

 .../bindings/sound/mt8186-afe-pcm.yaml        |  175 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |   47 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   47 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    1 +
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   21 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  210 +
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3029 +++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c |  150 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |   15 +
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  891 +++++
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c |  295 ++
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  |  245 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 1371 +++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |  432 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c    |  758 ++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  713 ++++
 .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
 .../soc/mediatek/mt8186/mt8186-misc-control.c | 1728 +++++++++
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  910 +++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  894 +++++
 sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433 +++++++++++++++++
 30 files changed, 16986 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
 create mode 100644 sound/soc/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-src.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-misc-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h

-- 
2.18.0

