Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C0A1E50
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F297A16E2;
	Thu, 29 Aug 2019 17:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F297A16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091133;
	bh=331X2JnA853m4lhwifGKR9RGTciyDu6i/UjEwF+0qKs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aOvsuo5oH/m1B+f5GRt8176m+JJ4sIVRATdVKrMa3j+smffYqOKafhbfP73Hx7T+U
	 6SBaQKzmQ03GSmlIJWepgAP3H6P+wSClIrqcJK1Y6u417eNNQ+Ccm/NMICTAsEorrL
	 /H8F4/DWxpDcR1vmcw/nQ80Ty4TNz3iB5WGXCd5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B29F8979F;
	Wed, 28 Aug 2019 15:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB930F89795; Wed, 28 Aug 2019 15:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B00AF89708
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 15:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B00AF89708
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RVaihFrt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=13ObEEl8VDMyos+NUV/AyV+AlKXI7DoGx7jehiBz3sw=; b=RVaihFrtxfws
 UF3WPPFenHMjvftPZ6kFSMxbF1DwiRlczS41BkgWicHWBvfDFnBEJrIgwSaHFrMZIHM+EOhQ/upXP
 qJSkc5/sNcncNRjxTP16W1IOq74EW9B1d1/d4G9P4upUR3Urw+Gqgr1CnSQ17m8lEjjXfx35eUn8m
 GaJfo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2xl5-0004Gl-Km; Wed, 28 Aug 2019 13:13:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 108A02742C8E; Wed, 28 Aug 2019 14:13:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1566621445-26989-4-git-send-email-jiaxin.yu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190828131307.108A02742C8E@ypsilon.sirena.org.uk>
Date: Wed, 28 Aug 2019 14:13:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: fix tdm out data is
	valid on rising edge" to the asoc tree
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

   ASoC: mediatek: mt8183: fix tdm out data is valid on rising edge

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 2c650fd5a53beace2e7507f478562f0dd1885b89 Mon Sep 17 00:00:00 2001
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Sat, 24 Aug 2019 12:37:25 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: fix tdm out data is valid on rising
 edge

This patch correct tdm out bck inverse register to AUDIO_TOP_CON3[3].

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/r/1566621445-26989-4-git-send-email-jiaxin.yu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c | 4 +++-
 sound/soc/mediatek/mt8183/mt8183-reg.h     | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
index d34cabdbf889..0d69cf440407 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
@@ -505,7 +505,9 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 
 	/* set tdm */
 	if (tdm_priv->bck_invert)
-		tdm_con |= 1 << BCK_INVERSE_SFT;
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON3,
+				   BCK_INVERSE_MASK_SFT,
+				   0x1 << BCK_INVERSE_SFT);
 
 	if (tdm_priv->lck_invert)
 		tdm_con |= 1 << LRCK_INVERSE_SFT;
diff --git a/sound/soc/mediatek/mt8183/mt8183-reg.h b/sound/soc/mediatek/mt8183/mt8183-reg.h
index e0482f2826da..e544a09e1913 100644
--- a/sound/soc/mediatek/mt8183/mt8183-reg.h
+++ b/sound/soc/mediatek/mt8183/mt8183-reg.h
@@ -413,6 +413,11 @@
 #define AFE_MAX_REGISTER AFE_GENERAL2_ASRC_2CH_CON13
 #define AFE_IRQ_STATUS_BITS 0x1fff
 
+/* AUDIO_TOP_CON3 */
+#define BCK_INVERSE_SFT                              3
+#define BCK_INVERSE_MASK                             0x1
+#define BCK_INVERSE_MASK_SFT                         (0x1 << 3)
+
 /* AFE_DAC_CON0 */
 #define AWB2_ON_SFT                                   29
 #define AWB2_ON_MASK                                  0x1
@@ -1596,9 +1601,6 @@
 #define TDM_EN_SFT                                    0
 #define TDM_EN_MASK                                   0x1
 #define TDM_EN_MASK_SFT                               (0x1 << 0)
-#define BCK_INVERSE_SFT                               1
-#define BCK_INVERSE_MASK                              0x1
-#define BCK_INVERSE_MASK_SFT                          (0x1 << 1)
 #define LRCK_INVERSE_SFT                              2
 #define LRCK_INVERSE_MASK                             0x1
 #define LRCK_INVERSE_MASK_SFT                         (0x1 << 2)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
