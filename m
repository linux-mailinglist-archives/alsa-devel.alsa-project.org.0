Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5282598A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E4215E5;
	Tue, 21 May 2019 22:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E4215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558472038;
	bh=/tMNhF4l7j32GoPzqgddB3pt705yA62mGku3jJOrGkM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ynp67uT+x+X7to5PIZRbX2P2J0h0SfFbyaic/isZ1RqAeJ9irbqlB8WGx6Ug8b5/x
	 o/6UXJpIWAdxzxQaoIX4jK0yHXkPFFCdUB6swnqYxkVpwmiUYoYeVG46slIYwVFfuO
	 nxtLC9RPKfHCEzCSxDE71lRKqqguaEEoiN6YSkuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCAEF89747;
	Tue, 21 May 2019 22:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75DA6F89674; Tue, 21 May 2019 22:48:07 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9749DF89723
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9749DF89723
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="l3cyEXMO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=42Y/jMi8J34g9Jbshsvy984n6QU6ZwTEflPDyx0dg8Y=; b=l3cyEXMOmqnN
 bQbE+ZWI79SlSEaH59D13UjT53ELW5z4JC+WmIalx/9bMAmUNLVBnNq3bdaETLsGsFE5EfAFYw8J8
 jkYlbDdBAMGwwjR9kUtLMtOiKrB5NVPz1nzvxYuJLVunlpvByPagqQ4B0B9dhHxfM+WQogWvhvZLr
 OMma8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRE-0001yJ-DA; Tue, 21 May 2019 20:32:44 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3EB451126D18; Tue, 21 May 2019 21:32:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
In-Reply-To: <20190520194645.432-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203241.3EB451126D18@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:41 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: sof-rt5682: fix AMP quirk
	support" to the asoc tree
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

   ASoC: Intel: sof-rt5682: fix AMP quirk support

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

From df9366131a452296d040a7a496d93108f1fc240c Mon Sep 17 00:00:00 2001
From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Date: Mon, 20 May 2019 14:46:42 -0500
Subject: [PATCH] ASoC: Intel: sof-rt5682: fix AMP quirk support

The use of BIT/GENMASK was incorrect, fix.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 39ddefec4991..3343dbcd506f 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -29,9 +29,10 @@
 #define SOF_RT5682_MCLK_EN			BIT(3)
 #define SOF_RT5682_MCLK_24MHZ			BIT(4)
 #define SOF_SPEAKER_AMP_PRESENT		BIT(5)
-#define SOF_RT5682_SSP_AMP(quirk)		((quirk) & GENMASK(8, 6))
-#define SOF_RT5682_SSP_AMP_MASK			(GENMASK(8, 6))
 #define SOF_RT5682_SSP_AMP_SHIFT		6
+#define SOF_RT5682_SSP_AMP_MASK                 (GENMASK(8, 6))
+#define SOF_RT5682_SSP_AMP(quirk)	\
+	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
