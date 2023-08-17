Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F0782799
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329B6827;
	Mon, 21 Aug 2023 13:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329B6827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616315;
	bh=nUIlb+BS39rSSziPw8aBTaaa0gSArwwvojEo4gz1Inc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zl9JLcW7e4Ag5uz2Okp6qzOzYKyk6QI+NDVF460oJEFlJIxfqWdqosiK1pjq7ipxL
	 2Teh4mNQYOYjLnT8sYxFqI0jP0tXKnFF43bUo95C9BY9KYzCATGV47zfYw2uaO1USY
	 pfy2x9EnYAsZdv59Tj/tJiYx6Lv7FCbd97ZHqRDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A372F80272; Mon, 21 Aug 2023 13:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F344F8014C;
	Mon, 21 Aug 2023 13:11:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5118BF801EB; Thu, 17 Aug 2023 12:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2A2BF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 12:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A2BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=aWMPfZMT
X-UUID: c2badbd43ce611ee9cb5633481061a41-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=J7C/JbBcdP4UPQpMsHZoKtgXXL6KW320QsNuaBg+Lvs=;
	b=aWMPfZMTtpS1Snzc7oqYpMrpOPi34NbMsII2FOA+u2NL8OKeJZa/n44CW4kul0jPtLzfZnqV/NBDD03B2DqJr/5kXsT0aCShg0XaSIZN3jpKynKeV0AnUkQ2biiNPSAXmq5D+is0ZBQun8aEu3v+oQGc5LtCuINTZJZP/M9BFSA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:321c027c-5418-4e8c-bbcf-9042a5ba4c24,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:321c027c-5418-4e8c-bbcf-9042a5ba4c24,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:0314f7c1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:230817181352S4OS5CUW,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: c2badbd43ce611ee9cb5633481061a41-20230817
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1808962401; Thu, 17 Aug 2023 18:13:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 18:13:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 18:13:49 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v4 0/6] ASoC: mediatek: Add support for MT7986 SoC
Date: Thu, 17 Aug 2023 18:13:32 +0800
Message-ID: <20230817101338.18782-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5BMA2EDE3EPGLLBYWNOOLQR46MX5GVA7
X-Message-ID-Hash: 5BMA2EDE3EPGLLBYWNOOLQR46MX5GVA7
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BMA2EDE3EPGLLBYWNOOLQR46MX5GVA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Changes in v4:
 - fix typo of authors and copyright
 - refine with bitfield helper for readability [2/6] 
 - refine with human readable error message [3/6]
 - use "mt7986-wm8960-sound" as compatible string [4/6] [5/6]
 - refine properties based on reviewer's suggestions [5/6]
 - remove assigned-clocks and assigned-clocks-parents [6/6]
 - constrain clocks per variants [6/6]

Changes in v3:
 - merge clk api to mt7986-afe-pcm.c, remove [2/7] in v2
 - refine based on reviewer's suggestions [1/6] [2/6]
 - fix the comment format, move in clk api, and simplify based on reviewer's suggestions [3/6] 
 - remove redundant prefix in dt-binding [6/6]

Changes in v2:
 - v1 title: [PATCH 0/7] ASoC: mediatek: Add support for MT79xx SoC
 - add missing maintainers
 - rename mt79xx to mt7986 in all files
 - use clk bulk api in mt7986-afe-clk.c [2/7]
 - refine mt79xx-afe-pcm.c based on reviewer's suggestions [4/7]
 - refine dt-binding files based on reviewer's suggestions [6/7] [7/7]
 - transpose [3/7] and [4/7] in v1 to fix test build errors

Maso Huang (6):
  ASoC: mediatek: mt7986: add common header
  ASoC: mediatek: mt7986: support etdm in platform driver
  ASoC: mediatek: mt7986: add platform driver
  ASoC: mediatek: mt7986: add machine driver with wm8960
  ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
  ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document

 .../bindings/sound/mediatek,mt7986-afe.yaml   | 160 +++++
 .../sound/mediatek,mt7986-wm8960.yaml         |  67 ++
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/mt7986/Makefile            |   9 +
 sound/soc/mediatek/mt7986/mt7986-afe-common.h |  49 ++
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c    | 622 ++++++++++++++++++
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c   | 411 ++++++++++++
 sound/soc/mediatek/mt7986/mt7986-reg.h        | 196 ++++++
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     | 196 ++++++
 10 files changed, 1731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
 create mode 100644 sound/soc/mediatek/mt7986/Makefile
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c

-- 
2.18.0

