Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53855202F8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 11:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB2916C3;
	Thu, 16 May 2019 11:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB2916C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558000689;
	bh=1UnJjsOeG9IAIYBpnDrn3Z6RXZxc6YrgtdRS1R+3mo4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDQHiaiKwtlJE3O9jIH/pbrscch8kiEnA8ufTFqYEK4AKBpnqqJ32evrSGjKrOdu/
	 zjYb9XW56wLsxdNwVb6R7HG9spmQYVTqu9Z/jdlvU20AXGKDW+XFNmv+Duq1Appw2v
	 DuAMC6CIFe0pSIOu7t8MHJC0F9/L3xyfnEcBrD4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEA3F8972E;
	Thu, 16 May 2019 11:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2265EF896F4; Thu, 16 May 2019 11:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 352C2F89693
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 11:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352C2F89693
X-UUID: dfa5a6af645942e08f7abe5c5f025c4d-20190516
X-UUID: dfa5a6af645942e08f7abe5c5f025c4d-20190516
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <shunli.wang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 909225833; Thu, 16 May 2019 17:54:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 17:54:41 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 16 May 2019 17:54:41 +0800
From: Shunli Wang <shunli.wang@mediatek.com>
To: <broonie@kernel.org>
Date: Thu, 16 May 2019 17:54:38 +0800
Message-ID: <20190516095438.15759-3-shunli.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190516095438.15759-1-shunli.wang@mediatek.com>
References: <20190516095438.15759-1-shunli.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 11A8A87934E7C3E10636C30DCB1C79EBC7390FEB32D6BA32F6D0052A6D1C937F2000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, shunli.wang@mediatek.com,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: Mediatek: MT8183: set data align
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

This patch sets register and bit information about
data align for every memory interface.

Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 1bc0fafe5e29..ab2bce1d9b3d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -437,7 +437,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = DL1_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL1_HD_SFT,
+		.hd_align_mshift = DL1_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -456,7 +458,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = DL2_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL2_HD_SFT,
+		.hd_align_mshift = DL2_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -475,7 +479,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = DL3_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = DL3_HD_SFT,
+		.hd_align_mshift = DL3_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -494,7 +500,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = VUL2_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = VUL2_HD_SFT,
+		.hd_align_mshift = VUL2_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -513,7 +521,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = AWB_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = AWB_HD_SFT,
+		.hd_align_mshift = AWB_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -532,7 +542,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = AWB2_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = AWB2_HD_SFT,
+		.hd_align_mshift = AWB2_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -551,7 +563,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = VUL12_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = VUL12_HD_SFT,
+		.hd_align_mshift = VUL12_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -570,7 +584,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = AFE_DAC_CON0,
 		.enable_shift = MOD_DAI_ON_SFT,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = MOD_DAI_HD_SFT,
+		.hd_align_mshift = MOD_DAI_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
@@ -589,7 +605,9 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.enable_reg = -1,	/* control in tdm for sync start */
 		.enable_shift = -1,
 		.hd_reg = AFE_MEMIF_HD_MODE,
+		.hd_align_reg = AFE_MEMIF_HDALIGN,
 		.hd_shift = HDMI_HD_SFT,
+		.hd_align_mshift = HDMI_HD_ALIGN_MASK_SFT,
 		.agent_disable_reg = -1,
 		.agent_disable_shift = -1,
 		.msb_reg = -1,
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
