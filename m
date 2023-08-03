Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3376DFBE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 07:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999EC1E4;
	Thu,  3 Aug 2023 07:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999EC1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691040444;
	bh=LIh2J8K5S0Ys+f0FcuyiFAhTtnqRA3pxvtacFB09XYE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sRCt0DZxnoIz4VrLzIMn9Kpii4ZOchsf1NA3x+ym0vRRbMLtpIVmift4wiszEkfxP
	 X9yb7IEkaThaWeSTQVObLnWDG+D/bMnd1WzBlzHtRFaHehgPF6ZxICmhuZLGgnoyAD
	 cWpgweyCS0UfXjqgG7g3Sqz62TRVZdaEPXgkdgGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7DFFF80548; Thu,  3 Aug 2023 07:26:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ECB3F80425;
	Thu,  3 Aug 2023 07:26:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 085FDF80520; Thu,  3 Aug 2023 07:26:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E1ABCF80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 07:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1ABCF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=iFrgPV1r
X-UUID: 414ff8aa31be11ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DjApbBKUywopMY8yXQx/U/psYA0RxGGdamGb0o4t9RM=;
	b=iFrgPV1rQm8Af5ip9J1a5eSvzFRdN8bCOww+284XqHijygyrUZJHLS1aN5+7UIF01GKk31fxY8o35H+yLfyUxwGYSzJ9xsoy2n6NQJ13xj0con+Dy6iFXUDStjgsIbyLhNIhbuhYpPMs0YOUHVA2/00CxOpfszxN4MU18ROMnSM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:ced6312d-2d41-4f86-879f-588d8a5b0955,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:ced6312d-2d41-4f86-879f-588d8a5b0955,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b3cbd6a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230803132610T9EIB3X3,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 414ff8aa31be11ee9cb5633481061a41-20230803
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 684881788; Thu, 03 Aug 2023 13:26:10 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 13:26:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 13:26:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] ASoC: mt8188-mt6359: add SOF support
Date: Thu, 3 Aug 2023 13:26:04 +0800
Message-ID: <20230803052607.25843-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: FLHSPR7M4S5ZFKZDB662ELQCTTOHIC4R
X-Message-ID-Hash: FLHSPR7M4S5ZFKZDB662ELQCTTOHIC4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLHSPR7M4S5ZFKZDB662ELQCTTOHIC4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series introduces dynamic pinctrl and adds support for the SOF on
the mt8188-mt6359 machine driver.

Changes since v1:
  - minor changes to incorporate the suggestions from the reviewer.

Trevor Wu (3):
  ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
  ASoC: mediatek: common: revise SOF common code
  ASoC: mediatek: mt8188-mt6359: add SOF support

 .../soc/mediatek/common/mtk-dsp-sof-common.c  | 106 ++++++--
 .../soc/mediatek/common/mtk-dsp-sof-common.h  |   8 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 239 +++++++++++++++++-
 3 files changed, 325 insertions(+), 28 deletions(-)

-- 
2.18.0

