Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4007156AF
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 09:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264FD3E7;
	Tue, 30 May 2023 09:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264FD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685431587;
	bh=Zltm2R2AxIrPPAvm4PeiHMU9xGUHkry2hMOCoJcufnc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z1tdi7Tp66ad93DPzXsd33AGgfZiu7kqiEL3r9eoy0jafretIR+h7VVkrT6DYG0z5
	 czpPIcJEXnkSZ4jCsKQwsvGjQh/6JK2DEMNpAUefGtMS9vQ+IXGpc0sfVti9vf+kBb
	 ALolMqKXZS6Yv1fM/xjWi1TC/HxG8tdpvQronr54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40819F80542; Tue, 30 May 2023 09:25:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBAF9F8026A;
	Tue, 30 May 2023 09:25:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72492F80510; Tue, 30 May 2023 09:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E57ECF80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 09:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E57ECF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Fr1i6xv/
X-UUID: 1f89d58cfebb11ed9cb5633481061a41-20230530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lcVgzDnwtNvgtRzgKZvBdGmZF84zux1HWIzZnSVuVT0=;
	b=Fr1i6xv/Jq2693VVauWvWzAW9GSq5gW2ywM+/UXEcYDab6V42T/M2k4R9PgYcxLmf8rKJ7uO6mT27w/H5oUTceb4E+HzC/ySlNgoIW8xjgmejNjtqtr3MOoaKf+8SMJ70DIQF34E8cpCbTAu2doUksvfc8XJSId/HGsOpxg9q40=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:92f5f90f-28d4-453a-8190-7419dceaddb3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.25,REQID:92f5f90f-28d4-453a-8190-7419dceaddb3,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:d5b0ae3,CLOUDID:49f0f93c-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:23053015251666P1DBLZ,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1f89d58cfebb11ed9cb5633481061a41-20230530
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 987928084; Tue, 30 May 2023 15:25:15 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 May 2023 15:25:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 May 2023 15:25:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <dianders@chromium.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mediatek: fix use-after-free in driver remove path
Date: Tue, 30 May 2023 15:25:12 +0800
Message-ID: <20230530072514.22001-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 7QNPYN5DIHVKURGHMMS4BIVX2JKOWNVO
X-Message-ID-Hash: 7QNPYN5DIHVKURGHMMS4BIVX2JKOWNVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QNPYN5DIHVKURGHMMS4BIVX2JKOWNVO/>
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

