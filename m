Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F8F72CA46
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7566C0;
	Mon, 12 Jun 2023 17:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7566C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686584104;
	bh=4+nRoO97l3EPbLIT35Co8UlFP4D3AzNTprsn+WeIHAE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D0ezSZSx5GJ0CTLd3xZW+O6TIWhtaBqGXFGt3hl5MLva0nLc7IyW9K4wmlna4lq2v
	 RPPlqrz4TvEqQa1D1YQ8Lq4Aj2GqTa6jW/TfKGoPqplThkog2vQvOiAT6Vc1UpW+9p
	 31ZiwVo9lW1hK3l9dojYVUEx5FxMq35fNmGOdq94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6BC9F805FA; Mon, 12 Jun 2023 17:32:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A252AF805F6;
	Mon, 12 Jun 2023 17:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 925DCF800BA; Mon, 12 Jun 2023 12:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6D14F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D14F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=BkvTrXt7
X-UUID: 5a1f80c6090f11eeb20a276fd37b9834-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HWQ9wrT35b6pkEnZ34pjf2szFkbwSXUpw/iZR2OP2Sg=;
	b=BkvTrXt7qmssolIPIqsy99D/5EEBn1/gDglCxoFcMmSaxiXqkaQAFvt5RhdJ+KjU3Stfs+DqLSuzekLd65hfYiljRr1RBuTNjTZZtzKymv/ZEZ/OVDoRiNUj7vC3ON/etiwwaRv9N9WhPk6S+aaIKpB3LIGx/CJIzvwl/I67ghU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:a02e8225-0875-415c-8895-ac3693ae37df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:cb9a4e1,CLOUDID:2b945a3e-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5a1f80c6090f11eeb20a276fd37b9834-20230612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 577519842; Mon, 12 Jun 2023 18:53:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 18:53:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 18:53:22 +0800
From: Maso Hunag <maso.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
	<trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie
	<renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 0/7] ASoC: mediatek: Add support for MT79xx SoC
Date: Mon, 12 Jun 2023 18:52:43 +0800
Message-ID: <20230612105250.15441-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5GDTPQHCGPTKCPSURMWTTQ4SZOCQEYXM
X-Message-ID-Hash: 5GDTPQHCGPTKCPSURMWTTQ4SZOCQEYXM
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:31:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GDTPQHCGPTKCPSURMWTTQ4SZOCQEYXM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maso Huang <maso.huang@mediatek.com>

This series of patches adds support for MediaTek AFE of MT79xx SoC.
Patches are based on broonie tree "for-next" branch.

Maso Huang (7):
  ASoC: mediatek: mt79xx: add common header
  ASoC: mediatek: mt79xx: support audio clock control
  ASoC: mediatek: mt79xx: add platform driver
  ASoC: mediatek: mt79xx: support etdm in platform driver
  ASoC: mediatek: mt79xx: add machine driver with wm8960
  ASoC: dt-bindings: mediatek,mt79xx-wm8960: add mt79xx-wm8960 document
  ASoC: dt-bindings: mediatek,mt79xx-afe: add audio afe document

 .../bindings/sound/mediatek,mt79xx-afe.yaml   | 102 +++
 .../sound/mediatek,mt79xx-wm8960.yaml         |  53 ++
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/mt79xx/Makefile            |  10 +
 sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c    | 123 ++++
 sound/soc/mediatek/mt79xx/mt79xx-afe-clk.h    |  18 +
 sound/soc/mediatek/mt79xx/mt79xx-afe-common.h |  49 ++
 sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c    | 608 ++++++++++++++++++
 sound/soc/mediatek/mt79xx/mt79xx-dai-etdm.c   | 421 ++++++++++++
 sound/soc/mediatek/mt79xx/mt79xx-reg.h        | 206 ++++++
 sound/soc/mediatek/mt79xx/mt79xx-wm8960.c     | 185 ++++++
 12 files changed, 1796 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
 create mode 100644 sound/soc/mediatek/mt79xx/Makefile
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-afe-common.h
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-reg.h
 create mode 100644 sound/soc/mediatek/mt79xx/mt79xx-wm8960.c

-- 
2.18.0

