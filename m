Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09697481AE2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 09:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801BA175B;
	Thu, 30 Dec 2021 09:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801BA175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640854141;
	bh=2A1YV+8uiStxiIcfczyLy1QDdkw3GlJk/IxagRlijmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/qHjj6HvtwS2j852yPm6XAHoLQ9JgV3YhHF5l1BW8sDQ4Brk+bSe6Un3Fi+v12PJ
	 KSmck9Xkp4EJuOqKLd3oJiP32Grk0GHrNYivCQX4Zdmyy0ToLVTo5BtvBOfSn/H849
	 tnNwPuevqI1txFx0FxZIbUtFBK8ZBCf51lBw9WEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB9ACF800C9;
	Thu, 30 Dec 2021 09:47:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4797AF80149; Thu, 30 Dec 2021 09:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BA8F800D3
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 09:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BA8F800D3
X-UUID: 6b8f2e3ef4594a449d334620498e0d0e-20211230
X-UUID: 6b8f2e3ef4594a449d334620498e0d0e-20211230
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2103254407; Thu, 30 Dec 2021 16:47:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 16:47:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 16:47:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8195: add playback support to PCM1_BE
 dai_link
Date: Thu, 30 Dec 2021 16:47:31 +0800
Message-ID: <20211230084731.31372-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211230084731.31372-1-trevor.wu@mediatek.com>
References: <20211230084731.31372-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PCM1_BE should be a dai_link for both playback and capture.
In the patch, the missing DPCM playback support is added.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c | 1 +
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index 8adbd46c4bc4..5443a29da7b1 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -1045,6 +1045,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(PCM1_BE),
 	},
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 20b351faeaff..29c2d3407cc7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1191,6 +1191,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(PCM1_BE),
 	},
-- 
2.18.0

