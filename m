Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA80512F73
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 11:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D99C1679;
	Thu, 28 Apr 2022 11:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D99C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651138561;
	bh=RMQFBFytVIb7Pwep/wtFqYVrwe1OQo7X0kpYAnZb8Lw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z1N9xjDhwp4frxmksmNDEoAdbEa+3B+IxQdm8rw2bLXUX5ENA43YVyua1FS8utJIs
	 YyX8uA4zLZ/U9ZJ+Sd4FMMGuB7kUv6VuNU25ugmOz5+xZt9/2FypDwYTNo/gGTSlKi
	 ricH4clMxn5wS8xc9+qBfoYNbtp/nbI1BMTDG+bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C2EF80528;
	Thu, 28 Apr 2022 11:34:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF1DDF80526; Thu, 28 Apr 2022 11:34:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDA0F80311
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 11:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDA0F80311
X-UUID: c6a947dc302b4bff96d1dbef113731ef-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9429f5c0-1ad5-46a4-9008-2b5f881a6187, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:95
X-CID-INFO: VERSION:1.1.4, REQID:9429f5c0-1ad5-46a4-9008-2b5f881a6187, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:95
X-CID-META: VersionHash:faefae9, CLOUDID:cf64d0c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:e8c5b25192a3,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: c6a947dc302b4bff96d1dbef113731ef-20220428
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1592203814; Thu, 28 Apr 2022 17:33:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:33:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:33:56 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
Date: Thu, 28 Apr 2022 17:33:37 +0800
Message-ID: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

This series of patches adds support for Mediatek AFE of MT8186 Soc.
Patches are based on broonie tree "for-next" branch.

Changes since v3:
  - [v4 09/18]
    - remove DEBUG_COEFF debugging code
  - [v4 10/18]
    - simplify the logic of the code
  - [v4 13/18]
    - split out the MT6366 bits into mt8186-mt6366-commom.c
    - fix build error of "error: 'struct dev_pm_info' has no member named 'runtime_error'"
    - fix bug of adda dai driver
    - add route for pcm interface channel 2.
  - [v4 15/18]
  - [v4 17/18]
    - commonize the configuration of the codecs
    - move MT6366 common bits into mt8186-mt6366-common.c

Changes since v2:
  - add a new compatible string "mediatek,mt6366-sound"
  - modify the log level for simplicity
  - use dev_err_probe(...) instead of dev_err(...) in dev probe()
  - optimized the logic of some code
  - use BIT() and GENMASK() macros to descript the registers

  Thanks for AngeloGioacchino's careful reviews.

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

Jiaxin Yu (18):
  ASoC: mediatek: mt6366: support for mt6366 codec
  dt-bindings: mediatek: mt6358: add new compatible for using mt6366
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

 .../devicetree/bindings/sound/mt6358.txt      |    4 +-
 .../bindings/sound/mt8186-afe-pcm.yaml        |  175 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |   71 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   71 +
 sound/soc/codecs/mt6358.c                     |    1 +
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   22 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  651 ++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  106 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  244 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3005 +++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c |  150 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |   15 +
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  873 +++++
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c |  298 ++
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  |  236 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 1355 ++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |  423 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c    |  695 ++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  695 ++++
 .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
 .../soc/mediatek/mt8186/mt8186-misc-control.c |  294 ++
 .../mediatek/mt8186/mt8186-mt6366-common.c    |   59 +
 .../mediatek/mt8186/mt8186-mt6366-common.h    |   17 +
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 1003 ++++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  979 ++++++
 sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913 ++++++++++++++++
 32 files changed, 15028 insertions(+), 1 deletion(-)
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
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h

-- 
2.25.1

