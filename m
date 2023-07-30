Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10964768716
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 20:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A7F84D;
	Sun, 30 Jul 2023 20:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A7F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690740727;
	bh=RHYPyUr6d2I4aCfpzs9hErLd1Pqz+fTS2xI/1muWTVU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ls25aJ67yx/eYQbf6fBNKc47s3suJWrpN0EYIeEA6NiGkaRq5NeEBv2F/CwznfzvO
	 NA+wCtX5+6vHNEK6KDvgTBKM1BWqq/b9S5aLkBFY1lAw89o3ETxvxrGZfkZk9ugdH2
	 ZyAAaQBFTi6xFdj6QqR+7pF2rgP9PtjVpH3iEFIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3A9FF80571; Sun, 30 Jul 2023 20:10:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9378BF80579;
	Sun, 30 Jul 2023 20:10:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4696F8016D; Sun, 30 Jul 2023 20:08:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC65BF80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 20:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC65BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=K4DX7c3m
X-UUID: 091c3b542f0411ee9cb5633481061a41-20230731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=o5kGfhLmlrtKS7cC4Khfr9xNCiQ6ZJrY8LYyZM/NxME=;
	b=K4DX7c3mv/zN85/j2lmKCTmbQiNPK5J1slwfzBJC3+zmS4/fSQGuMxw9WdX+JWhARXv5sbgB0RN37Mj0Ah0NvEfson/5EoHjlbO57vH4MpvT6Z21bCZfGrK9v/ESD1f9qeib0xGwm2E2JfekDbj0LSvoUJadmGDSH9DlkJjL2Zw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:593ec220-921f-418c-9461-31e94d195dbf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:46e79c42-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 091c3b542f0411ee9cb5633481061a41-20230731
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1768640190; Mon, 31 Jul 2023 02:08:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 31 Jul 2023 02:08:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 31 Jul 2023 02:08:05 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
	<Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<allen-kh.cheng@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [v3 0/3] ASoC: mediatek:mt8186: fix both the speaker and hdmi
Date: Mon, 31 Jul 2023 02:08:00 +0800
Message-ID: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: JIFUGMWR7C5EASBNPN3HZVXVCIWY5FB4
X-Message-ID-Hash: JIFUGMWR7C5EASBNPN3HZVXVCIWY5FB4
X-MailFrom: jiaxin.yu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIFUGMWR7C5EASBNPN3HZVXVCIWY5FB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The speaker and hdmi of mt8186 platform are shared the same port of I2S,
when connect the external display, use build-in speakers to play audio,
they both playback at the same time. So we want to manage the playback
device through DAPM events.

Jiaxin Yu (3):
  ASoC: hdmi-codec: Add event handler for hdmi TX
  ASoC: mediatek: mt8186: correct the HDMI widgets
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c           | 81 +++++++++++++++++--
 include/sound/hdmi-codec.h                    |  6 ++
 sound/soc/codecs/hdmi-codec.c                 | 32 +++++++-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  2 +-
 5 files changed, 113 insertions(+), 10 deletions(-)

-- 
2.25.1

