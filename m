Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7079A70234C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 07:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421FA208;
	Mon, 15 May 2023 07:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421FA208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684128490;
	bh=ooa0tFZOrOauYUbskeEtfGJJDL3Z5hi7d0GolGqjVK0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j/rJtE5vvSuTbgrPyBHasVnNYO5d2ltqGen/whLfcNFdF1bSFTipmNLsUlgXsSsP8
	 hcghxMnbEKQFbGp4if76tf1Gs2ebNVP2fVC4+ZKQjhUwl8xpbinueVNjf0Ws1sfR8I
	 aDnTyUFnn+MAhIpp+cID1qNVclMzAmqHGNJeInWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6B38F8025A; Mon, 15 May 2023 07:27:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E4EF8025A;
	Mon, 15 May 2023 07:27:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58882F802E8; Mon, 15 May 2023 07:26:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54092F80272;
	Mon, 15 May 2023 07:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54092F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=X9qGVwD8
X-UUID: efb70004f2e011edb20a276fd37b9834-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oWjWdFK+UzXUxIC1PHVEcLcVfmOLCn7lAe5Vf/6IX2c=;
	b=X9qGVwD8xM3qd00EuogpOox0yuFdzKGMEzf1M2F4QUJRHji4E4tj8dyIEiSqDjPoWueHMHKyN0j+0GhVub3YrcAU+3u+k5LEDOeBWPCmold0Qtp8yKR7mZ39qAEa7Uyb8ROrm2ZcXQwcNc8w+iSrVyIznqD6Gb0MlBSQKbJoYgs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:ff97226c-de39-49bb-b7be-fffd7399568d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:f8bd2a3b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: efb70004f2e011edb20a276fd37b9834-20230515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1304088002; Mon, 15 May 2023 13:25:42 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 13:25:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 13:25:41 +0800
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
Subject: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Date: Mon, 15 May 2023 13:25:39 +0800
Message-ID: <20230515052540.9037-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230515052540.9037-1-trevor.wu@mediatek.com>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Message-ID-Hash: 4LRIANOBPH3X5UTLQJJTHDLWI5PJPZLL
X-Message-ID-Hash: 4LRIANOBPH3X5UTLQJJTHDLWI5PJPZLL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LRIANOBPH3X5UTLQJJTHDLWI5PJPZLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mt8188 dai driver and specify of_machine to support mt8188 audio.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 61 +++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 419913c8474d..3a9c81418c1f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -594,7 +594,65 @@ static const struct sof_dev_desc sof_of_mt8186_desc = {
 	.ops = &sof_mt8186_ops,
 };
 
+/*
+ * DL2, DL3, UL4, UL5 are registered as SOF FE, so creating the corresponding
+ * SOF BE to complete the pipeline.
+ */
+static struct snd_soc_dai_driver mt8188_dai[] = {
+{
+	.name = "SOF_DL2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_DL3",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL4",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL5",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+};
+
+/* mt8188 ops */
+static struct snd_sof_dsp_ops sof_mt8188_ops;
+
+static int sof_mt8188_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_ops));
+
+	sof_mt8188_ops.drv = mt8188_dai;
+	sof_mt8186_ops.num_drv = ARRAY_SIZE(mt8188_dai);
+
+	return 0;
+}
+
+static struct snd_sof_of_mach sof_mt8188_machs[] = {
+	{
+		.compatible = "mediatek,mt8188",
+		.sof_tplg_filename = "sof-mt8188.tplg",
+	},
+	{}
+};
+
 static const struct sof_dev_desc sof_of_mt8188_desc = {
+	.of_machines = sof_mt8188_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
@@ -607,7 +665,8 @@ static const struct sof_dev_desc sof_of_mt8188_desc = {
 		[SOF_IPC] = "sof-mt8188.ri",
 	},
 	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
-	.ops = &sof_mt8186_ops,
+	.ops = &sof_mt8188_ops,
+	.ops_init = sof_mt8188_ops_init,
 };
 
 static const struct of_device_id sof_of_mt8186_ids[] = {
-- 
2.18.0

