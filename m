Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B702706680
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A1A1F6;
	Wed, 17 May 2023 13:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A1A1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322350;
	bh=37cCEFHVjT+D0FuT4zmC5b8IYY0OdoxsBXq5zmi5OBg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kyG6pYbMCnNecr2ZO/uyVUsNj2DZqzeHC8oo9vmvR3zuTxumv9rDFH5/D4qWVAfxR
	 X1cCZnPJwPBYSCBSNTAhPncLPOvcfQoSNTiexXKt9VDT/F38rYMcRAkH84GkxTtT6P
	 GVaWr+yI6q6egbz97UPQA+gOj5WmbQicT3n9VzAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C27F805F7; Wed, 17 May 2023 13:16:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04592F805F6;
	Wed, 17 May 2023 13:16:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DDA3F8056F; Wed, 17 May 2023 13:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B72E6F80551
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72E6F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=eW2hEbUj
X-UUID: 2613b2c2f4a411ed9cb5633481061a41-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jF5GZyRGb/IcLuhzuqGakVFZy8gHEbuq61zX8J4vkh4=;
	b=eW2hEbUjarZg20ZE9XYymgsHfi/Rv4/bwBcqG0LtyezuJZQtqClJSSB0xIdl8vJwy3yUvMm//vr3YBpKaN/RhdUEI/9u1JY6WUHkogixkcdpcwYhQapzlS42MLjlfAmtP2WQ4oWRn+jV9quH/0imHYc9jABACIe2wIeJG8TNgek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:8f9fe578-8947-453b-bcd0-fc1cf8224d78,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:8f9fe578-8947-453b-bcd0-fc1cf8224d78,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:df19793b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230517191537PTNBPR4Q,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2613b2c2f4a411ed9cb5633481061a41-20230517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1436285328; Wed, 17 May 2023 19:15:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/5] ASoC: mt8188: add new board support
Date: Wed, 17 May 2023 19:15:29 +0800
Message-ID: <20230517111534.32630-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 7KR25RBHATZI7YXPNJHWCKJ7AYWINY75
X-Message-ID-Hash: 7KR25RBHATZI7YXPNJHWCKJ7AYWINY75
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KR25RBHATZI7YXPNJHWCKJ7AYWINY75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the series, we extend the capability of mt8188-mt6359 driver.

The following changes are included.
1. Divide ADDA BE dai into two dais for SOF.
2. Register hdmi/dp jack pins.
3. dai_fmt can be configured from device tree.
4. Add some I2S codecs support.

In addition, new compatible string "mediatek,mt8188-nau8825" is
included for a new board support.

Trevor Wu (5):
  ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
  ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
  ASoC: mediatek: common: soundcard driver add dai_fmt support
  ASoC: mediatek: mt8188-mt6359: support new board with nau88255
  ASoC: dt-bindings: mediatek,mt8188-mt6359: update properties

 .../sound/mediatek,mt8188-mt6359.yaml         |  27 +-
 sound/soc/mediatek/Kconfig                    |   4 +
 .../mediatek/common/mtk-soundcard-driver.c    |  49 ++-
 sound/soc/mediatek/mt8188/mt8188-afe-common.h |   3 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  76 ++--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 326 +++++++++++++++++-
 6 files changed, 431 insertions(+), 54 deletions(-)

-- 
2.18.0

