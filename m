Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188FB6FFA0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16E51780;
	Mon, 22 Jul 2019 14:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16E51780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798526;
	bh=pm2a3GBNfsdsfbbzZdEJnk3QcGh+W7KO8vQS3NSzVnM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DfiRw3zM1GABspRIH4QF2q9e6geTQGU9SC/c6YWu9Q8aj7yo3oaN+sUPaBaIfLruC
	 sq64bZumfr2GWQcoeBcfBjooZ8chTL2ab/eJtMoZUMN76jAhRhHrmomA+qhB1UlDYt
	 SYG8wrtlSFhAnKiakrkmja90vkqrRF7vBH+BrH18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8A6F805A0;
	Mon, 22 Jul 2019 14:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F6E7F804AB; Mon, 22 Jul 2019 14:22:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0CA7F8045F
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CA7F8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Y/WT8Ba/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=in/fb71KsYP0yhArf9+lukEEvcKQEGa+C9EhYLToAho=; b=Y/WT8Ba/Ki7f
 MANer7/MDVvj7bGQDjxZbDK1aj+SOjUfaexGtzGDuu3GrBBNs092b2gXWzqvkr9FhTm+6XGVnBO5i
 loXp9M8lUWPz9qXnjlBXLlHEEE/6xTuQgbGK2C+9k8a4jbbpwtGS0ipNuT+ag4NIqqceeQDVc9ox3
 0x9eM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKR-0007cC-2W; Mon, 22 Jul 2019 12:22:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 488132740463; Mon, 22 Jul 2019 13:22:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190719063249.18806-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122206.488132740463@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:06 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1308: add silence detection and
	manual PDB control" to the asoc tree
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

   ASoC: rt1308: add silence detection and manual PDB control

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

From 607b9c8a850e505b02659f1552da123965e00270 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Fri, 19 Jul 2019 14:32:49 +0800
Subject: [PATCH] ASoC: rt1308: add silence detection and manual PDB control

We enable the silence detection function in initial settings.
PDB control changes to manual mode, hence the driver could
fully control the AMP output on/off.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190719063249.18806-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 19d255e01827..cf3d72f99705 100755
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -40,10 +40,10 @@ static const struct reg_sequence init_list[] = {
 	{ RT1308_VREF,			0x18100000 },
 	{ RT1308_IV_SENSE,		0x87010000 },
 	{ RT1308_DUMMY_REG,		0x00000200 },
-	{ RT1308_SIL_DET,		0x61c30000 },
+	{ RT1308_SIL_DET,		0xe1c30000 },
 	{ RT1308_DC_CAL_2,		0x00ffff00 },
 	{ RT1308_CLK_DET,		0x01000000 },
-	{ RT1308_POWER_STATUS,		0x00800000 },
+	{ RT1308_POWER_STATUS,		0x08800000 },
 	{ RT1308_DAC_SET,		0xafaf0700 },
 
 };
@@ -308,12 +308,13 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		msleep(30);
 		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
-			RT1308_POW_PDB_REG_BIT, RT1308_POW_PDB_REG_BIT);
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT,
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT);
 		msleep(40);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
-			RT1308_POW_PDB_REG_BIT, 0);
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT, 0);
 		usleep_range(150000, 200000);
 		break;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
