Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2212A52F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74AD16CB;
	Wed, 25 Dec 2019 01:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74AD16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577232892;
	bh=1twDTuC69j6KrQ85uuJaI/oBVoPUOFx+oj8HPJjvxXo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WGPTxqpWbvBxtUNiPGwGetOm1JwA4QYtaO98we7NsIGqj0nu98eq+0qNkRL6LCakQ
	 4EYCyshDdrE9SkFWjy9Q2WLZFhAH9gD9lvWVfJ/otU7G3RTIvAHqg1JyRTgJkHqTch
	 ESazcgJjBYm6a67TZukTfzCreW8jziUq7EcsqOdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB641F802A0;
	Wed, 25 Dec 2019 01:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 704DBF80136; Wed, 25 Dec 2019 01:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CEDBF80148
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CEDBF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="L23xa+tK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eVUU8xDfxdxeV1ja1PKoWiKoHUgAAK/EI5466jc7YPU=; b=L23xa+tKxmIE
 hGTXV2bzkYsxwxfv2+Z62LCP8Gs2spYSDsPQnJSeEWaF4J4xdEl/56WEwEs+NVtrDkm7hInWVz6ds
 I3jkn7jmZVP4DRZvir5n5Bt8ZGcj1aKRyvofFrBrvYNvjpOSCUf4ww3hxOZ5twvKKF9FoG62GUv6k
 HNmVQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuEU-0007Kb-85; Wed, 25 Dec 2019 00:08:58 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A21EFD01A24; Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
In-Reply-To: <20191220171037.10689-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191220171037.10689-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Jairaj Arava <jairaj.arava@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Add iDisp4 DAI" to the
	asoc tree
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

   ASoC: SOF: Intel: hda: Add iDisp4 DAI

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From e68d6696575e1af3f92125e842f2853708f34589 Mon Sep 17 00:00:00 2001
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Date: Fri, 20 Dec 2019 11:10:36 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: Add iDisp4 DAI

TGL supports more than three iDisp DAI's.
Add support for iDisp4 CPU DAI.

Without this patch, we saw the below error on our TGL DUT:
   sof_rt5682 tgl_max98357a_rt5682: ASoC: CPU DAI iDisp4 Pin not registered

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191220171037.10689-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 2d9ac0035bd2..638812a41328 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -440,6 +440,10 @@ struct snd_soc_dai_driver skl_dai[] = {
 	.name = "iDisp3 Pin",
 	.ops = &hda_link_dai_ops,
 },
+{
+	.name = "iDisp4 Pin",
+	.ops = &hda_link_dai_ops,
+},
 {
 	.name = "Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
