Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C634B2356
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 11:39:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8AA17F1;
	Fri, 11 Feb 2022 11:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8AA17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644575990;
	bh=NM8YqUZIWCxkqHRtJjd4VOhEkRtgrzyFSFkp2vMmthM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GXyPjbGCbOFJdAkOOOFmfdv60biAC2/H7ulhjav8pYLlhGG3MmZrXDG9YNtOjPSU9
	 0xpOeQqbHvKBqOX1lzlQnHZGSDlW3BY7jA7YVh+uUEYkiUtFbQa5gd+BjAXsUziGAO
	 Clm3hzKGdcluYh5Q49fjuIC7myA4UDFScwtcbHlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE3EF80508;
	Fri, 11 Feb 2022 11:38:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED44EF80425; Fri, 11 Feb 2022 11:38:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 492E8F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 11:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492E8F8012C
X-UUID: 52936ecda16c4ff0a424fd5be5e3a990-20220211
X-UUID: 52936ecda16c4ff0a424fd5be5e3a990-20220211
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 713808520; Fri, 11 Feb 2022 18:38:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 18:38:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 18:38:22 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <perex@perex.cz>,
 <p.zabel@pengutronix.de>, <geert+renesas@glider.be>
Subject: [PATCH 00/15] ASoC: mediatek: Add support for MT8186 SoC
Date: Fri, 11 Feb 2022 18:38:03 +0800
Message-ID: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 zhangqilong3@huawei.com, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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

Jiaxin Yu (15):
  ASoC: mediatek: mt6366: add codec driver
  ASoC: mediatek: mt8186: support audsys clock control
  ASoC: mediatek: mt8186: support adda in platform driver
  ASoC: mediatek: mt8186: support hostless in platform driver
  ASoC: mediatek: mt8186: support hw gain in platform driver
  ASoC: mediatek: mt8186: support i2s in platform driver
  ASoC: mediatek: mt8186: support pcm in platform driver
  ASoC: mediatek: mt8186: support src in platform driver
  ASoC: mediatek: mt8186: support tdm in platform driver
  ASoC: mediatek: mt8186: add platform driver
  dt-bindings: mediatek: mt8186: add audio afe document
  ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and
    max98357
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357
    document
  ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and
    rt5682
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682
    document

 .../bindings/sound/mt8186-afe-pcm.yaml        |  175 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |   47 +
 .../sound/mt8186-mt6366-rt1019-rt5682.yaml    |   47 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   21 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  262 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  211 +
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3030 +++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c |  151 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |   15 +
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  897 +++++
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c |  296 ++
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  |  246 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 1352 +++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |  433 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c    |  758 ++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  723 ++++
 .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
 .../soc/mediatek/mt8186/mt8186-misc-control.c | 1729 +++++++++
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  903 +++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682.c      |  887 +++++
 sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433 +++++++++++++++++
 30 files changed, 16978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682.yaml
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
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h

-- 
2.18.0

