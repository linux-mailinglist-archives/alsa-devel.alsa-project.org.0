Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A266663B90
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C94EDBB6;
	Tue, 10 Jan 2023 09:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C94EDBB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673340335;
	bh=UKHqD4wgS7u6gCEaUMYSspFgvO7u+gd0DsYlDyblh1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ESa6xKeKoyW2jDc2e61K26O7VhMcHRYDuIqdQVBm7bhfHQzTTKh9vlwGxJgWr+eZW
	 BTHYmGAbnCqfWK+xH1Xgw5yz7FPDJYaBSzAuqhsvwF2N35WYradSiFAcZv+lu7hP7G
	 XL/3u6VG+o/769Hs4m3BuYgfSbgyFr4zYgNNPDgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C78ACF80578;
	Tue, 10 Jan 2023 09:43:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 228A3F80568; Tue, 10 Jan 2023 09:43:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B36EF80563;
 Tue, 10 Jan 2023 09:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B36EF80563
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=J9MbmLML
X-UUID: 52be8810eca7441faf70ecfa49b33d19-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Yt/1rVdKqsCac3uXMYG6HnpQCTqHWocqbiuBN4kIjIY=; 
 b=J9MbmLMLe629K81IkJ6Nng6LSqAYxJ+ArdxxbtOsHcFGevXiKzk+XCX9FdhFrWjHnkwDxMcMe14e3WjoHoxlhevr7kL6gvEgz/8KwdH/U3WJrWhV0nyigYtxq0H/ZsVokzfFEUvBT2yVcXCd/tiViYd8q1KOjrqVqNUia+BsPmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:1333e0b4-20bc-4748-90d2-4a1d84e108b8, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:543e81c, CLOUDID:bd2e61f5-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 52be8810eca7441faf70ecfa49b33d19-20230110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 650736675; Tue, 10 Jan 2023 16:43:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 16:43:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 16:43:13 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, Chunxu Li
 <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
 <yc.hung@mediatek.com>, Wan Jiabing <wanjiabing@vivo.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 2/3] ASoC: SOF: mediatek: Support mt8188 platform
Date: Tue, 10 Jan 2023 16:43:11 +0800
Message-ID: <20230110084312.12953-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230110084312.12953-1-tinghan.shen@mediatek.com>
References: <20230110084312.12953-1-tinghan.shen@mediatek.com>
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
 sound/soc/sof/mediatek/mt8186/mt8186.h | 10 +++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

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
index 98b2965e5ba6..5b521c60b4e3 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -52,7 +52,15 @@ struct snd_sof_dev;
 #define ADSP_PRID			0x0
 #define ADSP_ALTVEC_C0			0x04
 #define ADSP_ALTVECSEL			0x0C
-#define ADSP_ALTVECSEL_C0		BIT(1)
+#define MT8188_ADSP_ALTVECSEL_C0	BIT(0)
+#define MT8186_ADSP_ALTVECSEL_C0	BIT(1)
+
+/*
+ * On MT8188, BIT(1) is not evaluated and on MT8186 BIT(0) is not evaluated:
+ * We can simplify the driver by safely setting both bits regardless of the SoC.
+ */
+#define ADSP_ALTVECSEL_C0		(MT8188_ADSP_ALTVECSEL_C0 | \
+					 MT8186_ADSP_ALTVECSEL_C0)
 
 /* dsp bus */
 #define ADSP_SRAM_POOL_CON		0x190
-- 
2.18.0

