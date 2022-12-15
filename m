Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B564D65D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 07:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C7616E3;
	Thu, 15 Dec 2022 07:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C7616E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671084746;
	bh=Om2I4mAA9zzyGxYbl/jKpm4txNZ/k6waFNXDRSsTHFg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=W+wiK4GYYkpUO+Flb5ZTHfC2lGS+bY9lYJnsNVyRGoc+tQMD9ADO4S0D/cc3FPU9k
	 M7kdN/AnUEOwCSoUtP0UbXQk92i2Mr5vl1yw2ih6Jb4BjDwGp6kvvT6K+4MwnSZjJt
	 AhTaa7z95qenptBtRnlRADqi1LRgC+cJwHJ/1uso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E12F801D5;
	Thu, 15 Dec 2022 07:11:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E09F804ED; Thu, 15 Dec 2022 07:11:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E893F804CB;
 Thu, 15 Dec 2022 07:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E893F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=pzWs8r94
X-UUID: 902477fd707542469273d357e6f800f1-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mzkH0/QhnNUKthB0EOesphpVmgsLNcxmI7NqMZkJnhE=; 
 b=pzWs8r94mRD5UUOhx3C5NTXdpT+8Y1Q6/+HZvyMYcObi0HfOmjL9uPlsho4yrFmpA47fJBKpwWZqxTYUhC/R2AYjoRfT+iUicpj7cX3ndsdMRIF3X6jt3x9EPCsucmA0RTpd31Vb/a3fTNPUUyiDkRheuRy8LxDQvUYhdGmZV8M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:b4938af0-d4a3-41d7-b2cf-d12514b1edb8, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:dcaaed0, CLOUDID:2ef6a6b4-d2e2-434d-b6d3-aeae88dfcc78,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 902477fd707542469273d357e6f800f1-20221215
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 842347800; Thu, 15 Dec 2022 14:10:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 14:10:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 14:10:48 +0800
From: YC Hung <yc.hung@mediatek.com>
To: 
Subject: [PATCH] ASoC: SOF: mediatek: mt8195: remove a redundant comparison of
 sram
Date: Thu, 15 Dec 2022 14:10:46 +0800
Message-ID: <20221215061046.16934-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Chunxu Li <chunxu.li@mediatek.com>, linux-kernel@vger.kernel.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, YC Hung <yc.hung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DSP SRAM is not used for audio shared buffer between host and DSP so
TOTAL_SIZE_SHARED_SRAM_FROM_TAIL is zero. Remove the definition and
redundant comparison to fix coverity "unsigned compared against 0".

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 5 -----
 sound/soc/sof/mediatek/mt8195/mt8195.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 3c81e84fcecf..7c831e18483c 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -215,11 +215,6 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 
 	adsp->pa_sram = (phys_addr_t)mmio->start;
 	adsp->sramsize = resource_size(mmio);
-	if (adsp->sramsize < TOTAL_SIZE_SHARED_SRAM_FROM_TAIL) {
-		dev_err(dev, "adsp SRAM(%#x) is not enough for share\n",
-			adsp->sramsize);
-		return -EINVAL;
-	}
 
 	dev_dbg(dev, "sram pbase=%pa,%#x\n", &adsp->pa_sram, adsp->sramsize);
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
index 7ffd523f936c..b4229170049f 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.h
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -139,8 +139,6 @@ struct snd_sof_dev;
 #define DSP_MBOX1_BAR	6
 #define DSP_MBOX2_BAR	7
 
-#define TOTAL_SIZE_SHARED_SRAM_FROM_TAIL  0x0
-
 #define SIZE_SHARED_DRAM_DL 0x40000 /*Shared buffer for Downlink*/
 #define SIZE_SHARED_DRAM_UL 0x40000 /*Shared buffer for Uplink*/
 
-- 
2.18.0

