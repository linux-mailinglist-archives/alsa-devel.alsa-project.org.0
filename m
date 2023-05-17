Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84271706735
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11837F4;
	Wed, 17 May 2023 13:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11837F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684324468;
	bh=MmqYqBFMlplQQEjCLLM6k0jF5DDQfGX4wkjcox2e6lg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d3h5SuCguLt1JhGa/Mdo3nMc9m7OMoKdKU7e5uXKRBqD9DX4c9zIYCaWHvSBJ+u6W
	 nknhtVRDcihq3n7sHL6cHXOsH4qnvfIAnVVeAggR1bVOCVsPnm5mrpCKfwlfdzdzGg
	 2wERQJ3UNJ3erLj83irfSGYGvbtamDN4fiu5lmeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6969BF80568; Wed, 17 May 2023 13:52:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5D68F80568;
	Wed, 17 May 2023 13:52:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3854AF80431; Wed, 17 May 2023 13:52:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 46AD1F8025A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AD1F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=ELnfav6L
X-UUID: 481362b4f4a911edb20a276fd37b9834-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hnp/57gXsk+TNT/fI9Yb95VTEke89vqAlK7MkECjAkM=;
	b=ELnfav6LkboVr2GTecY/zJ1/9cm8y8w5WYrkUG/rzgVv0trmI9Dr4/YMAAFPoRKaBlZ3k1BJQl3JMD7RoPJ5HbqbyzCLWDZ+cQ29eCeHKswJ3582Zi79B/wA3MpEZERZTN2TnzpBayjFRHxIE/9JGKtTxeMHsSMlwGU/naRvaE8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:39c008f1-94fb-46b9-868f-54b347aed779,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8c1c26c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 481362b4f4a911edb20a276fd37b9834-20230517
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 933927146; Wed, 17 May 2023 19:52:21 +0800
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
Subject: [RESEND 1/4] ASoC: mediatek: mt6359: add supply for MTKAIF
Date: Wed, 17 May 2023 19:52:16 +0800
Message-ID: <20230517115219.532-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517115219.532-1-trevor.wu@mediatek.com>
References: <20230517115219.532-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: YFRNABXKJ34BMGNCZ7JDZZ5TDE75GHSM
X-Message-ID-Hash: YFRNABXKJ34BMGNCZ7JDZZ5TDE75GHSM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFRNABXKJ34BMGNCZ7JDZZ5TDE75GHSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are three output data pins MISO0, MISO1 and MISO2 for mt6359.
UL_SRC should be enabled when MISO0 or MISO1 is used, and UL_SRC_34
should be enabled when MISO2 is used.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index cb487e63615c..d6a93da2644e 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2358,6 +2358,10 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 	{"MISO2_MUX", "UL2_CH1", "UL2_SRC_MUX"},
 	{"MISO2_MUX", "UL2_CH2", "UL2_SRC_MUX"},
 
+	{"MISO0_MUX", NULL, "UL_SRC"},
+	{"MISO1_MUX", NULL, "UL_SRC"},
+	{"MISO2_MUX", NULL, "UL_SRC_34"},
+
 	{"UL_SRC_MUX", "AMIC", "ADC_L"},
 	{"UL_SRC_MUX", "AMIC", "ADC_R"},
 	{"UL_SRC_MUX", "DMIC", "DMIC0_MUX"},
-- 
2.18.0

