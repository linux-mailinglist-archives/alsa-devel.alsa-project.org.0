Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D2706738
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCDA1F2;
	Wed, 17 May 2023 13:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCDA1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684324486;
	bh=hi+lm4Sw5WVzf8S+ELUBF3Izi7KfVXOfkdjZGead9Ek=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DoMnoZ8bXKQxhCpGuku26qkX1Htqbg0vSNqjLZZYpinvYcWq8VI/Bx4ZOXSnvMTW8
	 n+HuuXlAuMvhEPkRoaMAMI8jmmBS2IMGW3X3s5bIsLZl9BpgnKM1tpRvJrnLT7bKnQ
	 j8Iz6o7uIaqXU3dEfOZeDW/u92r5U4o7+jp1usPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FC60F80588; Wed, 17 May 2023 13:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFFCF80580;
	Wed, 17 May 2023 13:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61A65F80548; Wed, 17 May 2023 13:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 827A3F80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827A3F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=BzM1EjTJ
X-UUID: 4811f816f4a911edb20a276fd37b9834-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y1HnJqsO/WkMHXAXN/S1iWJu5d9vaTn7O2ZE737u36k=;
	b=BzM1EjTJ2H5qet2sxuV2LbU6KnAkVA9vbFkAstrQRDT0y3+pl/RVm8ls2/pavwX2aAMofoWTq6yhSx3LaC5GEfk8mftkJ5Cg6yOmDcYQkN9vGVK4puwd/adbFs/k8p9Frgv9hxWozJOm+zp2HJ6is19LzfWwgMLd1ctcI27kA5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:fc5b2470-5bc7-4975-af56-e1dded8a8cf6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:e3ca1e6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 4811f816f4a911edb20a276fd37b9834-20230517
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262685316; Wed, 17 May 2023 19:52:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 0/4] ASoC: mt6359: kselftest fix and driver extension
Date: Wed, 17 May 2023 19:52:15 +0800
Message-ID: <20230517115219.532-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: HH6TVQ6LJGVFEJPWRSFLIZLFKWPHD7IC
X-Message-ID-Hash: HH6TVQ6LJGVFEJPWRSFLIZLFKWPHD7IC
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch series includes a kselftest fix and changes for extending
driver capability to support more use cases.

Trevor Wu (4):
  ASoC: mediatek: mt6359: add supply for MTKAIF
  ASoC: mediatek: mt6359: fix kselftest error of playback gain
  ASoC: mediatek: mt6359: add mtkaif gpio setting
  ASoC: mediatek: mt6359: update route for lineout mux

 sound/soc/codecs/mt6359.c | 152 ++++++++++++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 15 deletions(-)

-- 
2.18.0

