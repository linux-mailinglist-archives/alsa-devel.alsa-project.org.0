Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A1597BAC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 04:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0DA1652;
	Thu, 18 Aug 2022 04:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0DA1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660791157;
	bh=i9GarXQ/zPqt2xvgneZMlc63+5Z9MRvCrXO9KGB17Kw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfMLH3W9Dlqtr7VW85CkulsD3+C2C6i9RrXPYPMRN9LYWZ75Bera8mvE26+z2WC+d
	 0rMh45+Rrfjs6zitSaV+YQnc3iYSYUwMotiTj7UI3o6MJgrLoEjx8HVaM0nqVtxR6t
	 5rfI3RRIsyOJriM50QXMa/VbswgL3Kv78pmj7ytU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 375EFF8049E;
	Thu, 18 Aug 2022 04:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A27F800B5; Thu, 18 Aug 2022 04:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB9C4F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 04:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB9C4F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="SJky7Y+a"
X-UUID: 3d51c5fb22c04763b47114aa2d9e4e9e-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EALpKughYJVN4eL+rE5tR0CgISez0fYXKza8J2Flgug=; 
 b=SJky7Y+aUlPnfctT+069EZMYV3H5G1PvsFnFbp+Hiu8u5+44qF5Xd57WfaX0x3ou3boZ9kyZox/DlHg4kRx/hjvpgssstexN7Ljwmeb3oWBEwbkKqKgjj9for6QwIrk+9UpwpMaYU87jRMeuke3Pv0OQqXJ401v74YgkU3uDFOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:54ffb1f6-ca34-4dc5-b658-6a3564ea092f, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:e2f6fd9c-da39-4e3b-a854-56c7d2111b46,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d51c5fb22c04763b47114aa2d9e4e9e-20220818
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 868690680; Thu, 18 Aug 2022 10:51:22 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 10:51:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 18 Aug 2022 10:51:19 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND 1/3] ASoC: mediatek: mt8186: support DSP downlink
Date: Thu, 18 Aug 2022 10:51:11 +0800
Message-ID: <20220818025113.17144-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818025113.17144-1-chunxu.li@mediatek.com>
References: <20220818025113.17144-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

1. add DSP downlink link widget
2. add DSP to I2S route path

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  3 +++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index eb729ab00f5a..d7e94e6a19c7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -1359,6 +1359,9 @@ static const struct snd_soc_dapm_widget mt8186_memif_widgets[] = {
 	SND_SOC_DAPM_MUX("UL5_IN_MUX", SND_SOC_NOPM, 0, 0,
 			 &ul5_in_mux_control),
 
+	SND_SOC_DAPM_MIXER("DSP_DL1_VIRT", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("DSP_DL2_VIRT", SND_SOC_NOPM, 0, 0, NULL, 0),
+
 	SND_SOC_DAPM_INPUT("UL1_VIRTUAL_INPUT"),
 	SND_SOC_DAPM_INPUT("UL2_VIRTUAL_INPUT"),
 	SND_SOC_DAPM_INPUT("UL3_VIRTUAL_INPUT"),
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index d7a227169548..e553a555d168 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -658,9 +658,15 @@ static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
 	{"I2S1_CH1", "DL1_CH1 Switch", "DL1"},
 	{"I2S1_CH2", "DL1_CH2 Switch", "DL1"},
 
+	{"I2S1_CH1", "DL1_CH1 Switch", "DSP_DL1_VIRT"},
+	{"I2S1_CH2", "DL1_CH2 Switch", "DSP_DL1_VIRT"},
+
 	{"I2S1_CH1", "DL2_CH1 Switch", "DL2"},
 	{"I2S1_CH2", "DL2_CH2 Switch", "DL2"},
 
+	{"I2S1_CH1", "DL2_CH1 Switch", "DSP_DL2_VIRT"},
+	{"I2S1_CH2", "DL2_CH2 Switch", "DSP_DL2_VIRT"},
+
 	{"I2S1_CH1", "DL3_CH1 Switch", "DL3"},
 	{"I2S1_CH2", "DL3_CH2 Switch", "DL3"},
 
@@ -728,9 +734,15 @@ static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
 	{"I2S3_CH1", "DL1_CH1 Switch", "DL1"},
 	{"I2S3_CH2", "DL1_CH2 Switch", "DL1"},
 
+	{"I2S3_CH1", "DL1_CH1 Switch", "DSP_DL1_VIRT"},
+	{"I2S3_CH2", "DL1_CH2 Switch", "DSP_DL1_VIRT"},
+
 	{"I2S3_CH1", "DL2_CH1 Switch", "DL2"},
 	{"I2S3_CH2", "DL2_CH2 Switch", "DL2"},
 
+	{"I2S3_CH1", "DL2_CH1 Switch", "DSP_DL2_VIRT"},
+	{"I2S3_CH2", "DL2_CH2 Switch", "DSP_DL2_VIRT"},
+
 	{"I2S3_CH1", "DL3_CH1 Switch", "DL3"},
 	{"I2S3_CH2", "DL3_CH2 Switch", "DL3"},
 
-- 
2.25.1

