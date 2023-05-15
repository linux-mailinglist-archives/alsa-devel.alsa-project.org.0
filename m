Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760D70234F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 07:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99027852;
	Mon, 15 May 2023 07:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99027852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684128545;
	bh=f3jzTXC6zD1otpPJmKWQ3ixbGHTSeJSFWBQZ/zz1w4E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tLB8NspHtAP0wMEvSrR/9+JfLiqZsxetCXpJ2mqtg8jtt+Z1QKXAhRweotrKg6VUG
	 4EpUqB3WTp59385s0X1Le5C5oubnrGO0/d+0M/85wG9W04kwwV6TZx13SNx2PZvXkd
	 kyuZGsNY6YZJbmTa1x46kUSALlrBa2rxSATkVzTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88A7AF8056F; Mon, 15 May 2023 07:27:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB66F80564;
	Mon, 15 May 2023 07:27:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2451F80272; Mon, 15 May 2023 07:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47341F8025A;
	Mon, 15 May 2023 07:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47341F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=IQSM/pSr
X-UUID: efe4fd10f2e011edb20a276fd37b9834-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0Ksvdp8PTKxSr2UBQg5vm1z3nVvtS8V+ddsrIGxDdTY=;
	b=IQSM/pSre75BeSvmRdXPb1PiucCb/9DwfARAC2wb2PcUBUyH/Ln33fH3P+6+hsviFPbn83u/CUh+WdDkFq5tkZ9ZZsT4cLfS+4wXrO5fslXLDT0aaw9dS9HJWGIxtVeJfiU5NgdvTqolwa8NUL1HrSnUSf3x6w/8GCTegLGhAsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:03ed807a-b656-4e22-acdc-1c59aee33a80,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.24,REQID:03ed807a-b656-4e22-acdc-1c59aee33a80,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:178d4d4,CLOUDID:2f21d7c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:2305151325441VNR2GU5,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: efe4fd10f2e011edb20a276fd37b9834-20230515
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630727526; Mon, 15 May 2023 13:25:42 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 13:25:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 13:25:42 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: SOF: mediatek: add adsp debug dump
Date: Mon, 15 May 2023 13:25:40 +0800
Message-ID: <20230515052540.9037-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230515052540.9037-1-trevor.wu@mediatek.com>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Message-ID-Hash: W7S7NZRJ6AWDA33KCPJH22JYFZYBXGQC
X-Message-ID-Hash: W7S7NZRJ6AWDA33KCPJH22JYFZYBXGQC
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7S7NZRJ6AWDA33KCPJH22JYFZYBXGQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mt8188 and mt8186 .dbg_dump callback to print some information when
DSP panic occurs.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 22 ++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 3a9c81418c1f..bb59952885f6 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -24,6 +24,7 @@
 #include "../../sof-of-dev.h"
 #include "../../sof-audio.h"
 #include "../adsp_helper.h"
+#include "../mtk-adsp-common.h"
 #include "mt8186.h"
 #include "mt8186-clk.h"
 
@@ -473,6 +474,26 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	return pos;
 }
 
+static void mt8186_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	u32 dbg_pc, dbg_data, dbg_inst, dbg_ls0stat, dbg_status, faultinfo;
+
+	/* dump debug registers */
+	dbg_pc = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGPC);
+	dbg_data = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGDATA);
+	dbg_inst = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGINST);
+	dbg_ls0stat = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGLS0STAT);
+	dbg_status = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGSTATUS);
+	faultinfo = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAULTINFO);
+
+	dev_info(sdev->dev, "adsp dump : pc %#x, data %#x, dbg_inst %#x,",
+		 dbg_pc, dbg_data, dbg_inst);
+	dev_info(sdev->dev, "ls0stat %#x, status %#x, faultinfo %#x",
+		 dbg_ls0stat, dbg_status, faultinfo);
+
+	mtk_adsp_dump(sdev, flags);
+}
+
 static struct snd_soc_dai_driver mt8186_dai[] = {
 {
 	.name = "SOF_DL1",
@@ -555,6 +576,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.num_drv	= ARRAY_SIZE(mt8186_dai),
 
 	/* Debug information */
+	.dbg_dump = mt8186_adsp_dump,
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* PM */
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 5b521c60b4e3..91323f492a1e 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -38,6 +38,11 @@ struct snd_sof_dev;
 #define DSP_MBOX3_IRQ_EN		BIT(3)
 #define DSP_MBOX4_IRQ_EN		BIT(4)
 #define DSP_PDEBUGPC			0x013C
+#define DSP_PDEBUGDATA			0x0140
+#define DSP_PDEBUGINST			0x0144
+#define DSP_PDEBUGLS0STAT		0x0148
+#define DSP_PDEBUGSTATUS		0x014C
+#define DSP_PFAULTINFO			0x0150
 #define ADSP_CK_EN			0x1000
 #define CORE_CLK_EN			BIT(0)
 #define COREDBG_EN			BIT(1)
-- 
2.18.0

