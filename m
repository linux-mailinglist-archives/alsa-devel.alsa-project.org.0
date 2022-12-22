Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FA653C8A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 08:33:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C9A3368;
	Thu, 22 Dec 2022 08:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C9A3368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671694383;
	bh=atySqZd5yUDDbu5cvVYu7H06r0Z3kyev06WR8gSVc8M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZiCRcZIbFAKJep0uMPunmk58E4yMAbPlMSxTO3ebTKwWC9rxfwefTxhoQ7w9xkdTJ
	 yqYYA4F5oZW5uIjEOdSi/7HBEXWXcODyPF1xFKPr6RvtCyiVLa1EYBb4H1DdYooJYB
	 QfZokn1bnWfRG88j4Hq72fe5pmRba1/n00PliXBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6041FF8069E;
	Thu, 22 Dec 2022 08:23:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DBBCF80686; Thu, 22 Dec 2022 08:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18BA5F80679;
 Thu, 22 Dec 2022 08:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18BA5F80679
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=XTWknGrG
X-UUID: 49622567df244388a32a9f6fa5a40f9d-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lFz2Y/xxwkpdqewHbikoBaP7PZtSmri9F7IdaOcr4HM=; 
 b=XTWknGrGY6bbMOG3xa8TyJCsNStFEkPAdWbeXxIIpBQS0kIrGyubqL90yTWjt5LEvBH0HP35zWXb/311rXHMTIE3RqmhDnqqP8DK5bHchfEQ8j9rHWqMOtgY5d/DA/YfHJrMZklL/HoZaOLifRtYlKtzRAg0cKY248/4MiVvU5w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:2988d6c3-78cd-4a1f-8ee2-76b254b5e81b, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:dcaaed0, CLOUDID:ca6e7c52-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 49622567df244388a32a9f6fa5a40f9d-20221222
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 788890386; Thu, 22 Dec 2022 15:23:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Dec 2022 15:23:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Dec 2022 15:23:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Chunxu Li
 <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
 <yc.hung@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v1 2/3] ASoC: SOF: mediatek: Support mt8188 platform
Date: Thu, 22 Dec 2022 15:21:49 +0800
Message-ID: <20221222072150.10627-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221222072150.10627-1-tinghan.shen@mediatek.com>
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support of SOF on MediaTek MT8188 SoC.
MT8188 ADSP integrates with a single core Cadence HiFi-5 DSP.
The IPC communication between AP and DSP is based on shared DRAM and
mailbox interrupt.

The change in the mt8186.h is compatible on both mt8186 and
mt8188. The register controls booting the DSP core with the
default address or the user specified address. Both mt8186
and mt8188 should boot with the user specified boot in the driver.
The usage of the register is the same on both SoC, but the
control bit is different on mt8186 and mt8188, which is bit 1 on mt8186
and bit 0 on mt8188. Configure the redundant bit has noside effect
on both SoCs.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 17 +++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 79da25725987..af0dfc2fc4cc 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -625,8 +625,25 @@ static const struct sof_dev_desc sof_of_mt8186_desc = {
 	.ops = &sof_mt8186_ops,
 };
 
+static const struct sof_dev_desc sof_of_mt8188_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
+	.default_fw_path = {
+		[SOF_IPC] = "mediatek/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "mediatek/sof-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-mt8188.ri",
+	},
+	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
+	.ops = &sof_mt8186_ops,
+};
+
 static const struct of_device_id sof_of_mt8186_ids[] = {
 	{ .compatible = "mediatek,mt8186-dsp", .data = &sof_of_mt8186_desc},
+	{ .compatible = "mediatek,mt8188-dsp", .data = &sof_of_mt8188_desc},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 98b2965e5ba6..886d687449e3 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -52,7 +52,8 @@ struct snd_sof_dev;
 #define ADSP_PRID			0x0
 #define ADSP_ALTVEC_C0			0x04
 #define ADSP_ALTVECSEL			0x0C
-#define ADSP_ALTVECSEL_C0		BIT(1)
+/* BIT(1) for mt8186. BIT(0) for mt8188 */
+#define ADSP_ALTVECSEL_C0		(BIT(0) | BIT(1))
 
 /* dsp bus */
 #define ADSP_SRAM_POOL_CON		0x190
-- 
2.18.0

