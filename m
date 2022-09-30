Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759455F0E48
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 16:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED0A1697;
	Fri, 30 Sep 2022 16:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED0A1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664549957;
	bh=sOmti45Mfv7L4gaO/iezcv5gEZjucvff+f5X641D6+E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gxOuRMQbNT5JPchhRkDlzUySHsvZSVk8xAuOKNgZv9PU7vrsAiYYxmucJWUDDLRbt
	 +HP9hyO3G23Uv7ZIZ+VbPQgiwfWWgKiyo9d4TfdB0AMcmPYzboVT/tZCh9a0akqTFu
	 Jgov/nyGRBVqCQ0zG/WcWOJm2wNc2gA2fztRhKUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C27F80553;
	Fri, 30 Sep 2022 16:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 016E6F800AA; Fri, 30 Sep 2022 16:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 931CAF800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 931CAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="WmCgYS++"
X-UUID: fa54f4adcc2044eb94333815e52daad3-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Tt1QECZtZefC/UTgm9or5z8I2XvrYjCa1pogvR3ApGI=; 
 b=WmCgYS++tKCJToXgaNdJowkmdLx9g0cwHObJVfEFc0nh0ND//7Tg0fabRQEkvFUYoiqryTxrn+GndNwVItCzcjUlYOft8T0j5HKaNEsiUGsAUb3al5YDVk54LiUN+Mtb04y5rqCzT5dW86XJDT1kiwEppMXPHzetFyoAMdY0i1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:01b0eccf-3fb7-4f7f-ab50-76c625654ce0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:01b0eccf-3fb7-4f7f-ab50-76c625654ce0, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:2c35a6a3-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:22093022570969LZE2DI,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: fa54f4adcc2044eb94333815e52daad3-20220930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1511614647; Fri, 30 Sep 2022 22:57:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH 00/12] ASoC: mediatek: Add support for MT8188 SoC
Date: Fri, 30 Sep 2022 22:56:49 +0800
Message-ID: <20220930145701.18790-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org
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

This series of patches adds support for Mediatek AFE of MT8188 SoC.
Patches are based on broonie tree "for-next" branch.

Trevor Wu (12):
  ASoC: mediatek: common: add SMC ops ID
  ASoC: mediatek: mt8188: add common header
  ASoC: mediatek: mt8188: support audsys clock
  ASoC: mediatek: mt8188: support adda in platform driver
  ASoC: mediatek: mt8188: support etdm in platform driver
  ASoC: mediatek: mt8188: support pcmif in platform driver
  ASoC: mediatek: mt8188: support audio clock control
  ASoC: mediatek: mt8188: add platform driver
  ASoC: mediatek: mt8188: add control for timing select
  dt-bindings: mediatek: mt8188: add audio afe document
  ASoC: mediatek: mt8188: add machine driver with mt6359
  dt-bindings: mediatek: mt8188: add mt8188-mt6359 document

 .../bindings/sound/mt8188-afe-pcm.yaml        |  202 +
 .../bindings/sound/mt8188-mt6359.yaml         |   70 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-base-afe.h      |   16 +
 sound/soc/mediatek/mt8188/Makefile            |   15 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    |  656 ++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  114 +
 sound/soc/mediatek/mt8188/mt8188-afe-common.h |  151 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 3451 +++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  206 +
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |   15 +
 .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |   83 +
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  639 +++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c   | 2598 +++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c    |  362 ++
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  810 ++++
 sound/soc/mediatek/mt8188/mt8188-reg.h        | 3300 ++++++++++++++++
 18 files changed, 12712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
 create mode 100644 sound/soc/mediatek/mt8188/Makefile
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-mt6359.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-reg.h

-- 
2.18.0

