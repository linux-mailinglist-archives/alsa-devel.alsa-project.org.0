Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E4567C2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133961694;
	Wed, 26 Jun 2019 13:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133961694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561549039;
	bh=1l7u2ylZfL/RJ5ndJ0Ir1Epyf43oI79sl7wpHOH8ZmU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kpBhwn1ya4HvUldQCyOXueJstq+VNIjyvVocLJkOMZqGKT7l0pEe5CzheCAJslwAQ
	 kkXX1KsFpSINJd5dL+fswzwRgLlJ2L1L+tWGSNFUggHd+nRoyurM8MKHha9mrqY2kW
	 H7XrZOUFnnP4KaQDM7Q9Kqc23g9MRHgZMgPVUs8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65EC1F89743;
	Wed, 26 Jun 2019 13:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1891AF89730; Wed, 26 Jun 2019 13:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94074F896CB
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94074F896CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FxcQWdPM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KVT3HptzEAw2nCx6oohu1t8YhQ782ZH7OuAIVwdBjjQ=; b=FxcQWdPMJLmR
 HG8OKmxGe3Z2aEIdkfuilC/uUKHKDfEV/tDnYkpc5RwcEViSb8Vfhk3dRmPAjky8oycPZMM/0smN+
 XIWQByZxJlwjD5C5auPcdqxRA0tXW3CPVKUhaC4eNRH5v5JJLNyxb3HGXPBEq3HZR1uIrS/vuXloK
 0cL7Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AO-0007my-Ss; Wed, 26 Jun 2019 11:32:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 65B7144004C; Wed, 26 Jun 2019 12:32:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20190626104947.26547-1-codrin.ciubotariu@microchip.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113244.65B7144004C@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] Applied "ASoC: codecs: ad193x: Fix memory corruption
	on BE 64b systems" to the asoc tree
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

   ASoC: codecs: ad193x: Fix memory corruption on BE 64b systems

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From da7260cc8d1dc3564eb4f33550b0525541d71a47 Mon Sep 17 00:00:00 2001
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Date: Wed, 26 Jun 2019 13:49:46 +0300
Subject: [PATCH] ASoC: codecs: ad193x: Fix memory corruption on BE 64b systems

Since change_bit() requires unsigned long*, making this cast on an
unsigned int variable will change a wrong bit on BE platforms, causing
memory corruption. Replace this function with a simple XOR.

Fixes: 90f6e6803139 ("ASoC: codecs: ad193x: Fix frame polarity for DSP_A format")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad193x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 96d7cb2e4a56..16e2d334bbe0 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -241,10 +241,8 @@ static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	}
 
 	/* For DSP_*, LRCLK's polarity must be inverted */
-	if (fmt & SND_SOC_DAIFMT_DSP_A) {
-		change_bit(ffs(AD193X_DAC_LEFT_HIGH) - 1,
-			   (unsigned long *)&dac_fmt);
-	}
+	if (fmt & SND_SOC_DAIFMT_DSP_A)
+		dac_fmt ^= AD193X_DAC_LEFT_HIGH;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM: /* codec clk & frm master */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
