Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B34DAA46
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 07:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F7F1743;
	Wed, 16 Mar 2022 07:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F7F1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647410625;
	bh=VjEyeGew/RCh9cMjfMCyB78I5M9+zETDwaCFbrMWj1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kqqf3uv70OGdS+h2IBGhvPod8jlbTtHrPJ3yqDqS6bObUtqBdOqv+ECi05MmaNY5s
	 DaJGb76Z5NesMmPWdBvrKTioBcjK0VP9HVA5/Fdl9efRD0m4Yk1RH+QfM8fijl3UPY
	 RGSBPO8FNleyfPJztYVIL9HOc+SUW59vZQ9zMot4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64128F8019D;
	Wed, 16 Mar 2022 07:02:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B045F804D9; Wed, 16 Mar 2022 07:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40834F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 07:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40834F80095
X-UUID: a2319d33ea654768866183ade374bfc4-20220316
X-UUID: a2319d33ea654768866183ade374bfc4-20220316
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1031803154; Wed, 16 Mar 2022 14:01:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 14:01:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 14:01:46 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8195: rename card controls
Date: Wed, 16 Mar 2022 14:01:37 +0800
Message-ID: <20220316060139.6211-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220316060139.6211-1-trevor.wu@mediatek.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

In order to be able to reuse the same configurations in user space,
rename the controls to generic names.

"Headphone Jack" -> "Headphone"
"Speakers" -> "Ext Spk"
"Left Speaker" -> "Left Spk"
"Right Speaker" -> "Right SPk"

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 544e99c83f3f..5ad6363e1bc9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -64,7 +64,7 @@ struct sof_conn_stream {
 #define SOF_DMA_UL5 "SOF_DMA_UL5"
 
 static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -73,14 +73,14 @@ static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 };
 
 static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
 static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 	/* headset */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
 	{ "IN1P", NULL, "Headset Mic" },
 	/* SOF Uplink */
 	{SOF_DMA_UL4, NULL, "O034"},
@@ -95,30 +95,30 @@ static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 };
 
 static const struct snd_soc_dapm_widget mt8195_dual_speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Speaker", NULL),
-	SND_SOC_DAPM_SPK("Right Speaker", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static const struct snd_kcontrol_new mt8195_dual_speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Speaker"),
-	SOC_DAPM_PIN_SWITCH("Right Speaker"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
 static const struct snd_soc_dapm_widget mt8195_speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_SPK("Ext Spk", NULL),
 };
 
 static const struct snd_kcontrol_new mt8195_speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Ext Spk"),
 };
 
 static const struct snd_soc_dapm_route mt8195_rt1011_routes[] = {
-	{ "Left Speaker", NULL, "Left SPO" },
-	{ "Right Speaker", NULL, "Right SPO" },
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
 };
 
 static const struct snd_soc_dapm_route mt8195_rt1019_routes[] = {
-	{ "Speakers", NULL, "Speaker" },
+	{ "Ext Spk", NULL, "Speaker" },
 };
 
 #define CKSYS_AUD_TOP_CFG 0x032c
-- 
2.18.0

