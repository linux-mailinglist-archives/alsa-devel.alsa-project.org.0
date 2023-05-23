Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE2070D21A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 05:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E67E382A;
	Tue, 23 May 2023 05:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E67E382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684810903;
	bh=UgnHjES54GioaJQsgh/VGaWkyHjzJeBte9LWmtkfiUI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9uCfYPlNzlhoioTo75bJ4+2+HPiDidwWPrIGhz8ySlrHJYFT5JCW0dl3Ypm9rlWQ
	 Q8gHpPq1Rp7OlqEZYxtX2WzLYtof5YLZCz5GHmzq+p+4OxEnoORm7jvIO9Uy7/gXk7
	 qg0tLWEdgwl3pk42A1ivLtXoggovARDOJEr5l3I4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF3AEF805A0; Tue, 23 May 2023 05:00:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AD85F80563;
	Tue, 23 May 2023 05:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 860DBF8024E; Tue, 23 May 2023 04:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7331BF8016A;
	Tue, 23 May 2023 04:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7331BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=d/WY78kk
X-UUID: d95b1aa8f91511edb20a276fd37b9834-20230523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xAqn1KruCdx2EZzBuCbck+aI8EqCLgKQVJzvJgdn2lw=;
	b=d/WY78kkA65AiI4Iy0CDQp/B5VA0riMBjeY7xtxboQMVEbL6CgsgXRlyRUWgoe+4ZkU4W3bwUQy2s0owUHcL4+T6jXXP/QDWAOmL4EIihaNclTj7V7vWHcUa85fkennCXMC4+zxrJqultj2WccoMA/0sAtc3B57G63prjXzG9oo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:ee969c12-84b9-489e-96db-3a56f4be801c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.25,REQID:ee969c12-84b9-489e-96db-3a56f4be801c,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:d5b0ae3,CLOUDID:efa3b4c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:230523105937NXVLJJ9E,BulkQuantity:2,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d95b1aa8f91511edb20a276fd37b9834-20230523
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 226277113; Tue, 23 May 2023 10:59:35 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:59:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:59:34 +0800
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
Subject: [PATCH v2 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Date: Tue, 23 May 2023 10:59:32 +0800
Message-ID: <20230523025933.30494-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523025933.30494-1-trevor.wu@mediatek.com>
References: <20230523025933.30494-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
Message-ID-Hash: WWJZZB344VKEIFQAGZB2DO3377LM6XU4
X-Message-ID-Hash: WWJZZB344VKEIFQAGZB2DO3377LM6XU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWJZZB344VKEIFQAGZB2DO3377LM6XU4/>
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
index 419913c8474d..cc91c2928fb6 100644
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
+	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(sof_mt8188_ops));
+
+	sof_mt8188_ops.drv = mt8188_dai;
+	sof_mt8188_ops.num_drv = ARRAY_SIZE(mt8188_dai);
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

