Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87465E6A6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 09:18:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3646DFF;
	Thu,  5 Jan 2023 09:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3646DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672906712;
	bh=hLKiG2wTuOC7g1ehnKFJJTr+6jZfq77W2nAL7uySnco=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a5fhU3g19r6/GL6K8tuxcTmdM3iRbhKhuR3u+6iGfacdqT4PkJTZ/ObM/t2C5AA5X
	 7nb/87ETH/2yVty26Kbz9rCA81yCcNZMDv5/fmJXfi8pLkga7b5uYzmAwnaqV5/SQp
	 psReh1kolwls5Z4h7MmSA4QkA/CXWWc7X7W53XzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80CC6F80543;
	Thu,  5 Jan 2023 09:16:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82196F8051A; Thu,  5 Jan 2023 09:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3624BF8047B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 09:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3624BF8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=CfWFI6+j
X-UUID: 3c05992554904fe988204a220d1c6c18-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i+IuxvMnobEvIOSPfxLzitjAj/zyGghsWarqDqoyqPc=; 
 b=CfWFI6+j3IcgWidk9sr+/9GwVtpS+8b5en8/ik/0f9hX4u79UWAvdxe4Lu3VMQ1sYztIDbLKMxFSJzTMrRlmCamvAQqzihdFrPGxne+lcey5nRsRxUSbxxBye6k5XxM/I7XvMD08R3FsTEjVQXZ4UuDW9iws/SipRAWuNRV4CxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:bc7be8ac-b213-4252-b480-3689e78e0949, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.17, REQID:bc7be8ac-b213-4252-b480-3689e78e0949, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:543e81c, CLOUDID:5aede2f4-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:230105161617U6UEJH62,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 3c05992554904fe988204a220d1c6c18-20230105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 766158198; Thu, 05 Jan 2023 16:16:16 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 16:16:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 16:16:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH v5 09/13] ASoC: mediatek: mt8188: add control for timing select
Date: Thu, 5 Jan 2023 16:16:02 +0800
Message-ID: <20230105081606.6582-10-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105081606.6582-1-trevor.wu@mediatek.com>
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add mixer control for irq and memif timing selection.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 506 +++++++++++++++++++++
 1 file changed, 506 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 6bef980846fa..57a31330e5f4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -1394,6 +1394,510 @@ static const struct snd_soc_dapm_route mt8188_memif_routes[] = {
 	{"O041", "I169 Switch", "I169"},
 };
 
+static const char * const mt8188_afe_1x_en_sel_text[] = {
+	"a1sys_a2sys", "a3sys", "a4sys",
+};
+
+static const unsigned int mt8188_afe_1x_en_sel_values[] = {
+	0, 1, 2,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dl2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 18, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 20, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 22, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl7_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 24, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 26, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 28, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl11_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 30, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul1_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 0, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 2, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 4, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 6, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 8, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 10, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 12, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul9_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 14, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 16, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq1_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 0, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 2, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 4, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq4_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 6, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq5_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 8, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 10, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq7_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 12, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 14, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq9_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 16, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 18, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq11_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 20, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq12_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 22, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq13_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 24, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq14_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 26, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq15_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 28, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq16_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 30, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+
+static const char * const mt8188_afe_fs_timing_sel_text[] = {
+	"asys",
+	"etdmout1_1x_en",
+	"etdmout2_1x_en",
+	"etdmout3_1x_en",
+	"etdmin1_1x_en",
+	"etdmin2_1x_en",
+	"etdmin1_nx_en",
+	"etdmin2_nx_en",
+};
+
+static const unsigned int mt8188_afe_fs_timing_sel_values[] = {
+	0,
+	MT8188_ETDM_OUT1_1X_EN,
+	MT8188_ETDM_OUT2_1X_EN,
+	MT8188_ETDM_OUT3_1X_EN,
+	MT8188_ETDM_IN1_1X_EN,
+	MT8188_ETDM_IN2_1X_EN,
+	MT8188_ETDM_IN1_NX_EN,
+	MT8188_ETDM_IN2_NX_EN,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dl2_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl3_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl6_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl8_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl11_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul9_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul10_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+
+static int mt8188_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	if (val == memif_priv->asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	memif_priv->asys_timing_sel = val;
+
+	return ret;
+}
+
+static int mt8188_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	unsigned int id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (val == afe_priv->irq_priv[id].asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	afe_priv->irq_priv[id].asys_timing_sel = val;
+
+	return ret;
+}
+
+static int mt8188_memif_fs_timing_sel_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	ucontrol->value.enumerated.item[0] =
+		snd_soc_enum_val_to_item(e, memif_priv->fs_timing);
+
+	return 0;
+}
+
+static int mt8188_memif_fs_timing_sel_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int prev_item = 0;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	prev_item = snd_soc_enum_val_to_item(e, memif_priv->fs_timing);
+
+	if (item[0] == prev_item)
+		return 0;
+
+	memif_priv->fs_timing = snd_soc_enum_item_to_val(e, item[0]);
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new mt8188_memif_controls[] = {
+	MT8188_SOC_ENUM_EXT("dl2_1x_en_sel",
+			    dl2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL2),
+	MT8188_SOC_ENUM_EXT("dl3_1x_en_sel",
+			    dl3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL3),
+	MT8188_SOC_ENUM_EXT("dl6_1x_en_sel",
+			    dl6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL6),
+	MT8188_SOC_ENUM_EXT("dl7_1x_en_sel",
+			    dl7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL7),
+	MT8188_SOC_ENUM_EXT("dl8_1x_en_sel",
+			    dl8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL8),
+	MT8188_SOC_ENUM_EXT("dl10_1x_en_sel",
+			    dl10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL10),
+	MT8188_SOC_ENUM_EXT("dl11_1x_en_sel",
+			    dl11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL11),
+	MT8188_SOC_ENUM_EXT("ul1_1x_en_sel",
+			    ul1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL1),
+	MT8188_SOC_ENUM_EXT("ul2_1x_en_sel",
+			    ul2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL2),
+	MT8188_SOC_ENUM_EXT("ul3_1x_en_sel",
+			    ul3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL3),
+	MT8188_SOC_ENUM_EXT("ul4_1x_en_sel",
+			    ul4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL4),
+	MT8188_SOC_ENUM_EXT("ul5_1x_en_sel",
+			    ul5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL5),
+	MT8188_SOC_ENUM_EXT("ul6_1x_en_sel",
+			    ul6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL6),
+	MT8188_SOC_ENUM_EXT("ul8_1x_en_sel",
+			    ul8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL8),
+	MT8188_SOC_ENUM_EXT("ul9_1x_en_sel",
+			    ul9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL9),
+	MT8188_SOC_ENUM_EXT("ul10_1x_en_sel",
+			    ul10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL10),
+	MT8188_SOC_ENUM_EXT("asys_irq1_1x_en_sel",
+			    asys_irq1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_13),
+	MT8188_SOC_ENUM_EXT("asys_irq2_1x_en_sel",
+			    asys_irq2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_14),
+	MT8188_SOC_ENUM_EXT("asys_irq3_1x_en_sel",
+			    asys_irq3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_15),
+	MT8188_SOC_ENUM_EXT("asys_irq4_1x_en_sel",
+			    asys_irq4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_16),
+	MT8188_SOC_ENUM_EXT("asys_irq5_1x_en_sel",
+			    asys_irq5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_17),
+	MT8188_SOC_ENUM_EXT("asys_irq6_1x_en_sel",
+			    asys_irq6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_18),
+	MT8188_SOC_ENUM_EXT("asys_irq7_1x_en_sel",
+			    asys_irq7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_19),
+	MT8188_SOC_ENUM_EXT("asys_irq8_1x_en_sel",
+			    asys_irq8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_20),
+	MT8188_SOC_ENUM_EXT("asys_irq9_1x_en_sel",
+			    asys_irq9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_21),
+	MT8188_SOC_ENUM_EXT("asys_irq10_1x_en_sel",
+			    asys_irq10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_22),
+	MT8188_SOC_ENUM_EXT("asys_irq11_1x_en_sel",
+			    asys_irq11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_23),
+	MT8188_SOC_ENUM_EXT("asys_irq12_1x_en_sel",
+			    asys_irq12_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_24),
+	MT8188_SOC_ENUM_EXT("asys_irq13_1x_en_sel",
+			    asys_irq13_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_25),
+	MT8188_SOC_ENUM_EXT("asys_irq14_1x_en_sel",
+			    asys_irq14_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_26),
+	MT8188_SOC_ENUM_EXT("asys_irq15_1x_en_sel",
+			    asys_irq15_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_27),
+	MT8188_SOC_ENUM_EXT("asys_irq16_1x_en_sel",
+			    asys_irq16_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_28),
+	MT8188_SOC_ENUM_EXT("dl2_fs_timing_sel",
+			    dl2_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL2),
+	MT8188_SOC_ENUM_EXT("dl3_fs_timing_sel",
+			    dl3_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL3),
+	MT8188_SOC_ENUM_EXT("dl6_fs_timing_sel",
+			    dl6_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL6),
+	MT8188_SOC_ENUM_EXT("dl8_fs_timing_sel",
+			    dl8_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL8),
+	MT8188_SOC_ENUM_EXT("dl11_fs_timing_sel",
+			    dl11_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL11),
+	MT8188_SOC_ENUM_EXT("ul2_fs_timing_sel",
+			    ul2_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL2),
+	MT8188_SOC_ENUM_EXT("ul4_fs_timing_sel",
+			    ul4_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL4),
+	MT8188_SOC_ENUM_EXT("ul5_fs_timing_sel",
+			    ul5_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL5),
+	MT8188_SOC_ENUM_EXT("ul9_fs_timing_sel",
+			    ul9_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL9),
+	MT8188_SOC_ENUM_EXT("ul10_fs_timing_sel",
+			    ul10_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL10),
+};
+
 static const struct snd_soc_component_driver mt8188_afe_pcm_dai_component = {
 	.name = "mt8188-afe-pcm-dai",
 };
@@ -2583,6 +3087,8 @@ static int mt8188_dai_memif_register(struct mtk_base_afe *afe)
 	dai->num_dapm_widgets = ARRAY_SIZE(mt8188_memif_widgets);
 	dai->dapm_routes = mt8188_memif_routes;
 	dai->num_dapm_routes = ARRAY_SIZE(mt8188_memif_routes);
+	dai->controls = mt8188_memif_controls;
+	dai->num_controls = ARRAY_SIZE(mt8188_memif_controls);
 
 	return init_memif_priv_data(afe);
 }
-- 
2.18.0

