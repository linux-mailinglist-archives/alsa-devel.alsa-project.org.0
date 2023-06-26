Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7E73DE0E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8BF151A;
	Mon, 26 Jun 2023 13:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8BF151A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780105;
	bh=L/w/yKwH7VkN3xKyWRZSXKgCTmvFtWY6kWBrBMgXy2Q=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HRvIGQXZiw4+0maXWopyHhLoAGZ5NE1RToqYblQMQ5Sm0OvuKUYkf2DNjpwYjLBcc
	 0GMp+u94i2Idj9OKQ67dCgcn990FjXN+2Y9M2sLrLGuUMqPfMPoP1lfXtexy21U+ZC
	 wixmtOZBo1qnAKmktkq+3YxxFhz9OO3wMlrLsPDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED6FEF80619; Mon, 26 Jun 2023 13:43:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 354BEF80619;
	Mon, 26 Jun 2023 13:43:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8341F8051E; Mon, 26 Jun 2023 04:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A50DF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 04:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A50DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=SnoQq1dU
X-UUID: 19b1dee213ca11eeb20a276fd37b9834-20230626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Iwm0zG4h3gdP7jHydJXH0fWBg1eTZidbjOVJW6/TgdU=;
	b=SnoQq1dU0WmTTMLJIWRB6QFoCIsbegxc2VK7dDC3xJVMV8megKtP4Qh2CSxign9Bwv2yHi2RaesfwyONrlsIA3pAZXOnPlKR58C/0m6ZzuaRKQ/71klhZWowFY5SlBF+QY9R0Gz5auPnAxpuzOJyAImvhxrJ+jZZVM2xi8LUrko=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:41937417-b15c-444f-ac88-b8ba1722d666,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:9bd3a03f-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19b1dee213ca11eeb20a276fd37b9834-20230626
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881512161; Mon, 26 Jun 2023 10:35:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Jun 2023 10:35:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Jun 2023 10:35:21 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 0/7] ASoC: mediatek: Add support for MT7986 SoC
Date: Mon, 26 Jun 2023 10:34:54 +0800
Message-ID: <20230626023501.11120-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3D776BY6AWI2QAQD7HLARJOEJXGPILNM
X-Message-ID-Hash: 3D776BY6AWI2QAQD7HLARJOEJXGPILNM
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3D776BY6AWI2QAQD7HLARJOEJXGPILNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Changes in v2:
 - v1 title: [PATCH 0/7] ASoC: mediatek: Add support for MT79xx SoC
 - add missing maintainers
 - rename mt79xx to mt7986 in all files
 - use clk bulk api in mt7986-afe-clk.c [2/7]
 - refine mt7986-afe-pcm.c based on reviewer's suggestions [4/7]
 - refine dt-binding files based on reviewer's suggestions [6/7] [7/7]
 - transpose [3/7] and [4/7] in v1 to fix test build errors
 
This series of patches adds support for MediaTek AFE of MT7986 SoC.
Patches are based on broonie tree "for-next" branch.

Maso Huang (7):
  ASoC: mediatek: mt7986: add common header
  ASoC: mediatek: mt7986: support audio clock control
  ASoC: mediatek: mt7986: support etdm in platform driver
  ASoC: mediatek: mt7986: add platform driver
  ASoC: mediatek: mt7986: add machine driver with wm8960
  ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
  ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document

 .../bindings/sound/mediatek,mt7986-afe.yaml   |  89 +++
 .../sound/mediatek,mt7986-wm8960.yaml         |  53 ++
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/mt7986/Makefile            |  10 +
 sound/soc/mediatek/mt7986/mt7986-afe-clk.c    |  75 +++
 sound/soc/mediatek/mt7986/mt7986-afe-clk.h    |  18 +
 sound/soc/mediatek/mt7986/mt7986-afe-common.h |  51 ++
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c    | 598 ++++++++++++++++++
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c   | 421 ++++++++++++
 sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     | 184 ++++++
 12 files changed, 1726 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
 create mode 100644 sound/soc/mediatek/mt7986/Makefile
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c

-- 
2.18.0

