Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B425E6AD5FE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 05:11:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255281337;
	Tue,  7 Mar 2023 05:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255281337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678162313;
	bh=OjsG0/kSfg540/+04E6WH/aHjGAWYag8E6gvkTtvuLM=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=EWmkt/tcuW7jZKwl3d1czKLv2gCEzETm92Ayp7hNnPdcO8UmP1mGqgAJm/e6gppjA
	 Mkc9eUZwJyMaFQEgt8F4cF4SeqT37fduqJlvqIz00ilETEVh1TBI9ZVbvUbCIqq3Rn
	 A7fJVE/XQTpzjSn2C4qtdXEInqiTBo/zplqU+rKU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CBCFF80534;
	Tue,  7 Mar 2023 05:10:17 +0100 (CET)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/4] ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
Date: Tue, 7 Mar 2023 12:09:36 +0800
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6GDFLUF5AIMBV36QHCLJNITMLFIYLBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167816221641.26.9511007487586736945@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B489FF80527; Tue,  7 Mar 2023 05:10:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC07DF804FE
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 05:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC07DF804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Vk5hcB+8
X-UUID: e37f317cbc9d11ed945fc101203acc17-20230307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=930esi92rt5qlOQCRXhLgNnk29G6f6McGsLWj8Z35LM=;
	b=Vk5hcB+8/zfR+tmCfdTQOsnI+fzj2VXNWsLhzqAK7wRXq9S/KHNz9KrfNnHEE9ptPM2q1R80toslQ2iU8KgWL4hqSYJxoJ4zzh9EU+vl83YYSpf40TBFkxv1v0RPAC2S8zzDfyIZfpC8+ZrOmyWydp6VpRI7mpxyQHuFejrdcA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:c5ab0a65-97ad-428a-bb3d-de2204c49c1c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:2e70faf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: e37f317cbc9d11ed945fc101203acc17-20230307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2020605513; Tue, 07 Mar 2023 12:09:43 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 12:09:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 12:09:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/4] ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
Date: Tue, 7 Mar 2023 12:09:36 +0800
Message-ID: <20230307040938.7484-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: I6GDFLUF5AIMBV36QHCLJNITMLFIYLBN
X-Message-ID-Hash: I6GDFLUF5AIMBV36QHCLJNITMLFIYLBN
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6GDFLUF5AIMBV36QHCLJNITMLFIYLBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Coverity shows using uninitialized value monitor. When regmap_read
returns an error, monitor keeps the value left from earlier
computation. To prevent from the unexpected result in the case, assign
0 to monitor.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 4682748d82be..ceca882ecff7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -158,7 +158,7 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
 	int mtkaif_calibration_num_phase;
 	bool mtkaif_calibration_ok;
-	unsigned int monitor;
+	unsigned int monitor = 0;
 	int counter;
 	int phase;
 	int i;
-- 
2.18.0

