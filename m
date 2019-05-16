Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17A2034C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 12:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8A416D8;
	Thu, 16 May 2019 12:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8A416D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558001927;
	bh=kW1mNl2nsrmOOXwmvo+pAX7/FleeF75PBMBn/nEOXpI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oLG1AQAXq50h5Bmejy+4IeUYiP5L7A/f4edcoqK0vdWeZUOzNp+v2hgyNbkvRqpWb
	 l1bqi9yNimwLMJXXTzuh2nelVrnxHEzeLFlqyd7tM6hkfQ/PEILNI8oYOZReCPeXji
	 tAaD/NIG9gCSZPvOR+K4ijBlwZnhp/AzuYQWnjOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF1BF89721;
	Thu, 16 May 2019 12:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84B1EF80C18; Thu, 16 May 2019 12:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1B76F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 12:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1B76F80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sFgg2F+o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PNhKLqkoHsis9JaC7dp5LY6ZI+vEatGr2GBZw+NxQYg=; b=sFgg2F+okHmg
 p+F9eloVMSD5uHh0MwOnuoI9cTHcXTn43KMBLJVt4jufVB4oRhlMNWcW24g+9i6KwDsNSEcHQzoH4
 xiKjwbJruM0KGwk0YdcG5zV9M16h6RJZw9B8DanBeENiVqWqlNRnOnSOpVqI2nHgcClKUf79As8X7
 5/mH4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRDRs-00062A-Fl; Thu, 16 May 2019 10:17:16 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 0A1FB1126D45; Thu, 16 May 2019 11:17:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shunli Wang <shunli.wang@mediatek.com>
In-Reply-To: <20190516095438.15759-3-shunli.wang@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516101716.0A1FB1126D45@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 11:17:16 +0100 (BST)
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: Mediatek: MT8183: set data align" to
	the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Mediatek: MT8183: set data align

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From cf61f5b01531a2b64b875894fa97aa891d39e871 Mon Sep 17 00:00:00 2001
From: Shunli Wang <shunli.wang@mediatek.com>
Date: Thu, 16 May 2019 17:54:38 +0800
Subject: [PATCH] ASoC: Mediatek: MT8183: set data align

This patch sets register and bit information about
data align for every memory interface.

Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
