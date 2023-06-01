Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45263719163
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 05:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F2C846;
	Thu,  1 Jun 2023 05:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F2C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685590542;
	bh=p5BNIn6Wy7iDwyuPgbNcxCM49+fgI+EMcFLHrrgVu00=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mTTnKIlCZajjtKLJhZShdTqPCmjn5BehQF9HYyT0B2DhgWfU2TLHAAf3Vh0xsnwo6
	 AKUS7/xq96lN+wKTZsQsudBPHxJRrrJyazmsDsVYv7OyZdWhGR74+y+hJwfBDcGVjc
	 ZNFJFoZU4VDf1az20J03aOfXyDv2pcTiVuo+jWJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77101F80553; Thu,  1 Jun 2023 05:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9828F80563;
	Thu,  1 Jun 2023 05:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D10B7F80149; Thu,  1 Jun 2023 05:33:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84F34F80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 05:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F34F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=O8ZeFTK9
X-UUID: 0e0f6862002d11ee9cb5633481061a41-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/dVEf+T1aWW4TNL1MVxg/4odK7RXTPb0ghml4vXo3Wo=;
	b=O8ZeFTK97s6FKOREnJolH29I7/WXDhRVzXe3h4giYBmeUw20Hfa5By0NDIn/qWGQTboFgoQ1b8k4d6KkG9vWcBhw8xKxMK+/TvH+20VYvyar8f0EDiSbh375JjrhYMknaXR/XYF2vxva6AUU33GSsYt2xA9wWq+YZhcTtKJ4Jz0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:35d30767-df5d-404a-a1c7-6515a34836be,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.25,REQID:35d30767-df5d-404a-a1c7-6515a34836be,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:d5b0ae3,CLOUDID:079c343d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:2306011133209ODVQYT1,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0e0f6862002d11ee9cb5633481061a41-20230601
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1183759673; Thu, 01 Jun 2023 11:33:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:33:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:33:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <dianders@chromium.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] ASoC: mediatek: fix use-after-free in driver remove
 path
Date: Thu, 1 Jun 2023 11:33:16 +0800
Message-ID: <20230601033318.10408-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 2FLMOAMGU5UU7OUDZTS76ICZNH2K6ZMM
X-Message-ID-Hash: 2FLMOAMGU5UU7OUDZTS76ICZNH2K6ZMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FLMOAMGU5UU7OUDZTS76ICZNH2K6ZMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These patches concern modifications made in mt8186[1]. The clock
unregistration mechanism used in mt8188 and mt8195 is similar with
mt8186, resulting in the same problem existing within the driver.
Therefore, the solution has also been applied to these two platforms.

[1] https://lore.kernel.org/all/20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid/

Changes since v1:
  - remove unnecessary cast

Trevor Wu (2):
  ASoC: mediatek: mt8188: fix use-after-free in driver remove path
  ASoC: mediatek: mt8195: fix use-after-free in driver remove path

 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    |  7 ---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  1 -
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  5 --
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |  1 -
 10 files changed, 48 insertions(+), 70 deletions(-)

-- 
2.18.0

