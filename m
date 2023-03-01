Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBE6A6B55
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:04:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19E651E8;
	Wed,  1 Mar 2023 12:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19E651E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677668651;
	bh=pBALsHODXBivH3xqKdlCHLJcE3QW2TJipYNZeqpkysg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QGoejcBdFkqXOAPOiQfTZwznLg1OVuIxVSRdKYOOyvvawwK4vA3A+C4xNoA0NVHnk
	 qHSs2wYNAhknoqjd1rEkUBXJZ3kDyKhAv6AHvGNDug3Iqvf4wnvjB0J9qQVNqQcown
	 YTXp21re/wkQvJ34+pltot+9NrneGI9Qm0IzgBiQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA022F8051B;
	Wed,  1 Mar 2023 12:02:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD67F804B1; Wed,  1 Mar 2023 12:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58CAEF800DF
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CAEF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Zm+OPMeL
X-UUID: 7f5ade8eb82011eda06fc9ecc4dadd91-20230301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hEfAOvZJXLtdoX37aHyT09q7nlqO9HPu0KdVdJ5LDDc=;
	b=Zm+OPMeLf5MzQ5BuPcFdPCddPFkY1CYUugR67Rj5OyMJhkEdlx0kRa9rgot4uJ7dnbqbHD79dNO3kmyrcMGJc68o+7a0EVAO34UrDRZP5ECQLEwHtu4TPcxsR2vAwxJ7t4UwYcFhgE6rdpeqki20M6T2yF5gMNSQ4Wq65gwu1qY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:49b1b3a6-f03a-416f-9541-c0e64fc07ed3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.20,REQID:49b1b3a6-f03a-416f-9541-c0e64fc07ed3,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:25b5999,CLOUDID:8009deb1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:2303011902059S38TP4B,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 7f5ade8eb82011eda06fc9ecc4dadd91-20230301
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1883867757; Wed, 01 Mar 2023 19:02:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 19:02:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 19:02:02 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/2] ASoC: mediatek: add missing initialization
Date: Wed, 1 Mar 2023 19:01:58 +0800
Message-ID: <20230301110200.26177-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: INZVQZAFE4M6WN5FYWSNSKX2IAX7S3E6
X-Message-ID-Hash: INZVQZAFE4M6WN5FYWSNSKX2IAX7S3E6
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, angelogioacchino.delregno@collabora.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INZVQZAFE4M6WN5FYWSNSKX2IAX7S3E6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix dts parsing problem in mt8188 and mt8195 etdm dai drivers.

Changes since v1:
  - split the patch into two commits and add Fixes tag.

Trevor Wu (2):
  ASoC: mediatek: mt8188: add missing initialization
  ASoC: mediatek: mt8195: add missing initialization

 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 3 +++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.18.0

