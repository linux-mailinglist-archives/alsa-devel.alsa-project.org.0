Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0711BA05
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 181F616A4;
	Wed, 11 Dec 2019 18:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 181F616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084844;
	bh=S8A3UifiEBXtKJbdMDYooXQQUcbW3nPzDdwJ87nUuQ4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uoEzZ7btaOkbFm2aR+183jyQHaEVGYp+go14uDHpeC7XTM3miIb8rFwSN2r1ghm/2
	 caaxCBcZsZUAWjR7mAzn/+TG8HvT5P6FBeaKMurKxepwqaz7e7AmMAjrpc/6UsOI5D
	 a+nsKbKYzvulUqCuCxX2gXOgXZ74uNAPUqwnFSVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E40B1F80470;
	Wed, 11 Dec 2019 17:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84FB1F80447; Wed, 11 Dec 2019 17:54:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E0859F80429
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0859F80429
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4C530E;
 Wed, 11 Dec 2019 08:54:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49CD33F52E;
 Wed, 11 Dec 2019 08:54:40 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-8-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-8-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: Drop superfluous ioctl PCM ops"
	to the asoc tree
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

   ASoC: intel: Drop superfluous ioctl PCM ops

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

From aa4708d97e74d161502c9a5bc07532b34e727370 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:50 +0100
Subject: [PATCH] ASoC: intel: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210145406.21419-8-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 1 -
 sound/soc/intel/baytrail/sst-baytrail-pcm.c  | 1 -
 sound/soc/intel/haswell/sst-haswell-pcm.c    | 1 -
 sound/soc/intel/skylake/skl-pcm.c            | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 47e3d1943d7e..607c8f50c3f3 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -705,7 +705,6 @@ static const struct snd_soc_component_driver sst_soc_platform_drv  = {
 	.probe		= sst_soc_probe,
 	.remove		= sst_soc_remove,
 	.open		= sst_soc_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.trigger	= sst_soc_trigger,
 	.pointer	= sst_soc_pointer,
 	.compr_ops	= &sst_platform_compr_ops,
diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
index 1d780fcc448c..775c3b0b209e 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
@@ -373,7 +373,6 @@ static const struct snd_soc_component_driver byt_dai_component = {
 	.probe		= sst_byt_pcm_probe,
 	.open		= sst_byt_pcm_open,
 	.close		= sst_byt_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= sst_byt_pcm_hw_params,
 	.hw_free	= sst_byt_pcm_hw_free,
 	.trigger	= sst_byt_pcm_trigger,
diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index a3a5bba2fbd9..31fb38067f8f 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -1117,7 +1117,6 @@ static const struct snd_soc_component_driver hsw_dai_component = {
 	.hw_free	= hsw_pcm_hw_free,
 	.trigger	= hsw_pcm_trigger,
 	.pointer	= hsw_pcm_pointer,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pcm_construct	= hsw_pcm_new,
 	.controls	= hsw_volume_controls,
 	.num_controls	= ARRAY_SIZE(hsw_volume_controls),
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 8b9abb79a69e..bec5cee19566 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1477,7 +1477,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.probe		= skl_platform_soc_probe,
 	.remove		= skl_platform_soc_remove,
 	.open		= skl_platform_soc_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.trigger	= skl_platform_soc_trigger,
 	.pointer	= skl_platform_soc_pointer,
 	.get_time_info	= skl_platform_soc_get_time_info,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
