Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111764B4A4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 12:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C948318D5;
	Tue, 13 Dec 2022 12:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C948318D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670932668;
	bh=Z40V6qYbjgmWwgSyOY5Byr4d5zU2FGyLZIJeEadktBE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EpaHSGoU81e1IkPZUQZfRaV8mXTw5t4i4znjHLlj5ZkPBgFhWmCRlW0Jz6t9ydpOe
	 UzWgrMA/UOAr1r82W9UW0ImnaQxV3M/4xJgOCFaBorPHAfm+HoMFs9na78xYPl9ZJT
	 CrFh0n0zZ9xlQPR7YJ0J77WiCWvfcBC6rhtHDcqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24903F80073;
	Tue, 13 Dec 2022 12:56:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDCEEF80431; Tue, 13 Dec 2022 12:56:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3ACBF8007C;
 Tue, 13 Dec 2022 12:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3ACBF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=AC/eYJJD
X-UUID: 404d105a61444cb8b4346359e0895279-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GXGUYTA+wgaQLy7LF8FJNG0zt/E6jYH6kYl06M/+yds=; 
 b=AC/eYJJDigDIITMsbmTCyjznVHwcZnorNha/dXVI48K6qv4lPxoj2zOcGno0cQnn1A9T56Av35538Fp9YNpKmvXZKK66Yw/yFyqUBQPIJ/+C1SD4PJymbgiagnROZiv/632mfpHEplf3OENmrV1vDFZgsLxne4vJdi6ptnarrkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:abc06d65-2bb9-4782-8d78-95c2886f06bf, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:dcaaed0, CLOUDID:05736317-b863-49f8-8228-cbdfeedd1fa4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 404d105a61444cb8b4346359e0895279-20221213
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 489273608; Tue, 13 Dec 2022 19:56:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 13 Dec 2022 19:56:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Dec 2022 19:56:31 +0800
From: YC Hung <yc.hung@mediatek.com>
To: 
Subject: [PATCH] ASoC: SOF: mediatek: initialize panic_info to zero
Date: Tue, 13 Dec 2022 19:56:17 +0800
Message-ID: <20221213115617.25086-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chao Song <chao.song@intel.com>, Mark
 Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, YC Hung <yc.hung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Coverity spotted that panic_info is not initialized to zero in
mtk_adsp_dump. Using uninitialized value panic_info.linenum when
calling snd_sof_get_status. Fix this coverity by initializing
panic_info struct as zero.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/mtk-adsp-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.c b/sound/soc/sof/mediatek/mtk-adsp-common.c
index 1e0769c668a7..de8dbe27cd0d 100644
--- a/sound/soc/sof/mediatek/mtk-adsp-common.c
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.c
@@ -60,7 +60,7 @@ void mtk_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	struct sof_ipc_dsp_oops_xtensa xoops;
-	struct sof_ipc_panic_info panic_info;
+	struct sof_ipc_panic_info panic_info = {};
 	u32 stack[MTK_ADSP_STACK_DUMP_SIZE];
 	u32 status;
 
-- 
2.18.0

