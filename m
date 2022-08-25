Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01855A093C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 08:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F496844;
	Thu, 25 Aug 2022 08:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F496844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661410562;
	bh=R6RgTjJuR0nZzpGCNS71HdAUB1TZ7/IG5M8CVDh2mVw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1KhmlaJWVZreg2vvaSX8EVvOpzGUa0hY/zZYlwEDLW4tq1Fl32f4saqyuWn5RWqc
	 AelT8VbZ32uxkA9bktNX3MhhxRcz+dQS8mHupDkE/cYzVB1spw2gZHJsSPd9U0ks4I
	 aNYiwClal95pSBkv006ZAIY3vLCrGMzLekMbL/+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5947F8052D;
	Thu, 25 Aug 2022 08:54:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 647B9F80526; Thu, 25 Aug 2022 08:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 024F0F800C8;
 Thu, 25 Aug 2022 08:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 024F0F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="KOKE8dPA"
X-UUID: a35dbd15b5e843d399e02cb2172ed511-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZMxdqidHeMKTU6uO8paqRwQ9GJO1Qr/k1wi7WnYBmfk=; 
 b=KOKE8dPAKny/qkebfiHgl8m9mqrJF8KFDVMrXDzP6ZrSTJ0HVnrbRSM11veVpIfqQXCadOIAV+deW7frCbBN635xTylhbewZG0JVMRtsKZYwuMNPwSo7bmLV6XQuLSQYGo6hiHEvTlDqVpJph13JVOLvCpVw3d4pOLNQM8gLnw8=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6b808bfc-73f0-411a-9ae1-02f2287dc14b, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10, REQID:6b808bfc-73f0-411a-9ae1-02f2287dc14b, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18, CLOUDID:22c10f20-1c20-48a5-82a0-25f9c331906d,
 C
 OID:728947958c42,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a35dbd15b5e843d399e02cb2172ed511-20220825
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1212544490; Thu, 25 Aug 2022 14:54:19 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 14:54:18 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 25 Aug 2022 14:54:17 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 3/3] ASoC: SOF: mediatek: Use generic implementation for
 .ipc_msg_data field
Date: Thu, 25 Aug 2022 14:54:11 +0800
Message-ID: <20220825065411.31279-4-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825065411.31279-1-chunxu.li@mediatek.com>
References: <20220825065411.31279-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Use generic sof_ipc_msg_data instead of specific implementation as
they do the same things

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 5fc206bb0da0..a1be5d74f40b 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -460,14 +460,6 @@ static int mt8186_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
-static int mt8186_ipc_msg_data(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
-			       void *p, size_t sz)
-{
-	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
-	return 0;
-}
-
 static struct snd_soc_dai_driver mt8186_dai[] = {
 {
 	.name = "SOF_DL1",
@@ -526,7 +518,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.send_msg		= mt8186_send_msg,
 	.get_mailbox_offset	= mt8186_get_mailbox_offset,
 	.get_window_offset	= mt8186_get_window_offset,
-	.ipc_msg_data		= mt8186_ipc_msg_data,
+	.ipc_msg_data		= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* misc */
-- 
2.25.1

