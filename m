Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DB584DF0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 11:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4515166D;
	Fri, 29 Jul 2022 11:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4515166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659086162;
	bh=s3cnNRXzWyZaL90y8gUVtgTYVvsYoUCYq/R1g+4esGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PoIKr/vmUiLGqLVkkUDGqZvryv5IMtzwEv1OALvOfR2R1+/4jkylHAoSn+0jXJKCw
	 5Ipnhc5f6NagdD4rj08WImxr8VnDPRv7RxZttRiXYAb+F3uuQ/c7HlJmJ5V0+5l/XT
	 I+0WpRkv667yipNHep4n+hEMUmtt3P44os5ScaAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40937F8053C;
	Fri, 29 Jul 2022 11:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 609DDF80519; Fri, 29 Jul 2022 11:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=NO_DNS_FOR_FROM,RDNS_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA29CF8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 11:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA29CF8015B
X-UUID: 0f870df2d4c945efbf983364a7dbb10c-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:cd1f570f-58bc-4530-aabf-b9b6f68cf8df, OB:0,
 LO
 B:10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:105
X-CID-INFO: VERSION:1.1.8, REQID:cd1f570f-58bc-4530-aabf-b9b6f68cf8df, OB:0,
 LOB:
 10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:105
X-CID-META: VersionHash:0f94e32, CLOUDID:4a6fafd0-841b-4e95-ad42-8f86e18f54fc,
 C
 OID:341361050d8b,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0f870df2d4c945efbf983364a7dbb10c-20220729
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1174836181; Fri, 29 Jul 2022 17:14:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Jul 2022 17:14:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Fri, 29 Jul 2022 17:14:14 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8186: support DSP downlink
Date: Fri, 29 Jul 2022 17:14:02 +0800
Message-ID: <20220729091404.7799-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729091404.7799-1-chunxu.li@mediatek.com>
References: <20220729091404.7799-1-chunxu.li@mediatek.com>
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
index ec79e2f2a54d..32778799d708 100644
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
2.18.0

