Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25424B91
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 11:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8F9167C;
	Tue, 21 May 2019 11:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8F9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558431109;
	bh=M4/JOWnAr+Liyha8kEkP4l/+m6Z94Ilqs+AEi4groVw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuzaSCSMUZ7Xon6anJI61IB8rBCSRlRtqzel7iqXbxsPsqUALsm8by3TKS6eZoJzi
	 VI7XvceRQxGnnd7FIaIskYZDmKUAoKVj1EUpv5xekehZbjFWemeaj8dngMqHjrVXO1
	 uFbg64HuS587Isot4DX+N0A8RLxfyPBj0KYJK8wU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6853FF89709;
	Tue, 21 May 2019 11:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D660AF89709; Tue, 21 May 2019 11:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F4BF89670
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 11:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F4BF89670
X-UUID: 98199c601f3d4034a56e420de8c2d9f8-20190521
X-UUID: 98199c601f3d4034a56e420de8c2d9f8-20190521
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1389120104; Tue, 21 May 2019 17:29:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 May 2019 17:29:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 May 2019 17:29:45 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Tue, 21 May 2019 17:29:38 +0800
Message-ID: <1558430978-2440-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1558430978-2440-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1558430978-2440-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C76EBAEA3122E841A0369E5B7172AF726DD2C9290DC0A9F32B76B8DF20415E4B2000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 garlic.tseng@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: Mediatek: MT8183: fix compile error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

mtk_regmap_update_bits() has been changed to take a shift and warn
when reg >= 0 but shift < 0.So the hd_align_mshift must not have shift.
Change it from XXX_HD_ALIGN_MASK_SFT to XXX_HD_ALIGN_MASK.

Fixes: cf61f5b01531 ("ASoC: Mediatek: MT8183: set data align")

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
Hi,
	This patch is base on for-5.3 branch.
	And tested pass on kukui board locally.
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index ab2bce1..56c3732 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -439,7 +439,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL1_HD_SFT,
-		.hd_align_mshift = DL1_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = DL1_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -460,7 +460,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL2_HD_SFT,
-		.hd_align_mshift = DL2_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = DL2_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -481,7 +481,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL3_HD_SFT,
-		.hd_align_mshift = DL3_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = DL3_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -502,7 +502,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = VUL2_HD_SFT,
-		.hd_align_mshift = VUL2_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = VUL2_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -523,7 +523,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = AWB_HD_SFT,
-		.hd_align_mshift = AWB_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = AWB_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -544,7 +544,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = AWB2_HD_SFT,
-		.hd_align_mshift = AWB2_ALIGN_MASK_SFT,
+		.hd_align_mshift = AWB2_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -565,7 +565,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = VUL12_HD_SFT,
-		.hd_align_mshift = VUL12_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = VUL12_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -586,7 +586,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = MOD_DAI_HD_SFT,
-		.hd_align_mshift = MOD_DAI_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = MOD_DAI_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -607,7 +607,7 @@ static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 		.hd_reg = AFE_MEMIF_HD_MODE,
 		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = HDMI_HD_SFT,
-		.hd_align_mshift = HDMI_HD_ALIGN_MASK_SFT,
+		.hd_align_mshift = HDMI_HD_ALIGN_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
-- 
1.8.1.1.dirty

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
