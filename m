Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F103571917D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 05:51:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274EC3E8;
	Thu,  1 Jun 2023 05:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274EC3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685591461;
	bh=03mfTVfpkQ+SCSsvz0ly0U5mh8Gd/VbPJYk9E4tbXzk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SGrTBzNvQB4VUO12p5V8CQQt2WxRV7n1vW//BY6QX22DiDW2qFcAqlsaCBChKAoJO
	 ZQMr0HroNbf4nsrhUmgRlvVMvw1UzS1HK4y0AFCw+jKQa1FnX+qDUKnldO83NzjFks
	 yPb6b0+VYLzWLfo21/0MKO5dandbNcV9RXsds3b8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1DAF80551; Thu,  1 Jun 2023 05:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FB4AF800C1;
	Thu,  1 Jun 2023 05:50:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6965F8016B; Thu,  1 Jun 2023 05:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F39FF800C1;
	Thu,  1 Jun 2023 05:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F39FF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=eqM0clQL
X-UUID: 573a886c002f11ee9cb5633481061a41-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AZL/4U3dA33LvS8NGPtfm3QUWpx91cAARIW+EUNlpMc=;
	b=eqM0clQLpLZYDXLrZ/zaSBrKBlfymeufKJIlRwkQZq7jL8igxqH6tjKbE59xPo58hG+NFuOJ8JbSTEVAwziOzeVPBToBDSO722qq4Uk4/MNrabNYRx8D1hzQZ2IwRuHF8mx57MiWbDrvkRu7r2+Fx+1SeVT0CKpu4lvGlxBg7PM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:491095e7-a6a6-41d0-b7eb-ca3d30baaf35,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:884aa96d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 573a886c002f11ee9cb5633481061a41-20230601
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1764586940; Thu, 01 Jun 2023 11:49:42 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:49:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:49:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] ASoC: SOF: add mt8188 audio support
Date: Thu, 1 Jun 2023 11:49:38 +0800
Message-ID: <20230601034939.15802-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Message-ID-Hash: Z2HNRGGWIUIR6AHSOBBAKVJ66XZAVUDS
X-Message-ID-Hash: Z2HNRGGWIUIR6AHSOBBAKVJ66XZAVUDS
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2HNRGGWIUIR6AHSOBBAKVJ66XZAVUDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds mt8188 audio support and dbg_dump callback for
mt8186 and mt8188.

Changes since v2:
  - resend the correct patch for adsp debug dump

Changes since v1:
  - fix typo
  - adopt reviewer's suggestion

Trevor Wu (1):
  ASoC: SOF: mediatek: add adsp debug dump

 sound/soc/sof/mediatek/mt8186/mt8186.c | 22 ++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  5 +++++
 2 files changed, 27 insertions(+)

-- 
2.18.0

