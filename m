Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD963749A
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 09:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CED16F2;
	Thu, 24 Nov 2022 09:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CED16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669280218;
	bh=ZHs9/GxjSFbvMQT8b/K0hUFR5tDi7PfT/GtGQiZE4HI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=purZHl4TRV5xF58GV2Xf/hUbySH1CSSw8Aa1bAqL0w8NEvvCHHXbCIM/qX8wfrlBD
	 hR2NjBpnv2eU+hiJTY1dsSwcSEtGWrus7wY/V9QrqL+3CABBl69rdmU6Sx1ZO4h7Dc
	 H5nVzOVki3Sv5h7E5YACMjobPkBbfwObxKU6TqVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC7EF80149;
	Thu, 24 Nov 2022 09:56:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E85CF80431; Thu, 24 Nov 2022 09:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_MSPIKE_H2, RDNS_NONE, SPF_HELO_PASS,
 T_SCC_BODY_TEXT_LINE, 
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C235F8049E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 09:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C235F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="c9YszU9h"
X-UUID: 79ec29ffe0a04ef1b3784846e65cc590-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ViGNiKiDlpdTwQms22X0e/YbhcaMRLoQ4ODpbxaV73U=; 
 b=c9YszU9huKp+SyvUw8kjCHgS2Lsb02TS8Peq257WeYi+i6yf5Mph7VqEabURiLNRmiu1w4HFLqWBGnL6ahRopPYzn6njB48NZN4NBnZUyCkUAGx4pNiN1CpefOa4sdsghYtdS4pJEx0vs4jJnUo7inVSlcgr2fd+AJiV+EnigG4=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:5d14ae8f-31e1-46c9-a318-7adf258747d3, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:95
X-CID-INFO: VERSION:1.1.14, REQID:5d14ae8f-31e1-46c9-a318-7adf258747d3, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0, CLOUDID:c8c4b52f-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:221124165445AUVM93DU,BulkQuantity:0,Recheck:0,SF:38|28|16|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 79ec29ffe0a04ef1b3784846e65cc590-20221124
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1815254158; Thu, 24 Nov 2022 16:54:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 16:54:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 24 Nov 2022 16:54:40 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
 <angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Date: Thu, 24 Nov 2022 16:54:36 +0800
Message-ID: <20221124085436.24900-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
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

Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
DAPM events to hdmi-codec when userspace control the DPAM pin.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index d8c93d66b4e6..f4960b0c8298 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -965,7 +965,7 @@ mt8186_mt6366_da7219_max98357_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_LINE("HDMI1", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index e59d92e2afa3..c61e9bb419d4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1033,7 +1033,7 @@ mt8186_mt6366_rt1019_rt5682s_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_LINE("HDMI1", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.18.0

