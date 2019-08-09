Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70887A4D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55AF486E;
	Fri,  9 Aug 2019 14:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55AF486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354307;
	bh=AnTo1WElnlHx05TT/EFJN6X/6EQ+kFOhazKzJ1DPR0k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vn84bsPle22TBuuWADDKn5+HFE1vtrnpNv0m3W8B7CiprHcWNWzRzmAGYMe36lscp
	 7e5WGWPgQLfBrJxRl6M9qcXZvIgd5diLAfFFXb8dEq6yiLcP5PbaEpvL8SfTlasaQD
	 ywWDIAUfWZo9KHrSl36hEy6+vg7MxiePrH2EFygs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75142F80659;
	Fri,  9 Aug 2019 14:32:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D0BF805F6; Fri,  9 Aug 2019 14:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5542F805E2
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5542F805E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="O18c1zr3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KkMWdWdaZPGt8q4/51AC+gNMwtToOnoRdH8VMCOgM9g=; b=O18c1zr3Vr1e
 BraQLZz7D3x4DwmSGP0bu0tuanXkRWnksVm1bAyMpDE4gydDcGA77mL1l0v+UbBgCrTfMatTh0H7j
 d86REthYs9NGJrb/ZSN3hhlvcZXMIoJcpx44MJo3CL/uTXNlaKWsndN9aF56690R6YSnZJi7Y24xV
 vua5Q=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43l-00061B-Ag; Fri, 09 Aug 2019 12:31:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AA2A0274303D; Fri,  9 Aug 2019 13:31:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190809080234.23332-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123152.AA2A0274303D@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:52 +0100 (BST)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: mt6351: remove unused variable
	'mt_lineout_control'" to the asoc tree
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

   ASoC: mt6351: remove unused variable 'mt_lineout_control'

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

From bc8d9f737fc01cce913f1cc215b7e66f01697e52 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 9 Aug 2019 16:02:34 +0800
Subject: [PATCH] ASoC: mt6351: remove unused variable 'mt_lineout_control'

sound/soc/codecs/mt6351.c:1070:38: warning:
 mt_lineout_control defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190809080234.23332-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6351.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c
index 4b3ce01c5a93..5c0536eb1044 100644
--- a/sound/soc/codecs/mt6351.c
+++ b/sound/soc/codecs/mt6351.c
@@ -1066,11 +1066,6 @@ static int mt_mic_bias_2_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-/* DAPM Kcontrols */
-static const struct snd_kcontrol_new mt_lineout_control =
-	SOC_DAPM_SINGLE("Switch", MT6351_AUDDEC_ANA_CON3,
-			RG_AUDLOLPWRUP_VAUDP32_BIT, 1, 0);
-
 /* DAPM Widgets */
 static const struct snd_soc_dapm_widget mt6351_dapm_widgets[] = {
 	/* Digital Clock */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
