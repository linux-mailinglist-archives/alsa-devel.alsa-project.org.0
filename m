Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0716387E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E861C1690;
	Wed, 19 Feb 2020 01:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E861C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071863;
	bh=2gCZpwJegVGpiCaf9Vp9L9XkEDZ0za0ykCL0i+BBpHQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FefJ0b5BF0M5UGucgNMQhjoFSQbjmIqZxEUhK9ltePjZV3/wJSpZa8Kd5qknpjyA6
	 U51aDw08pODjiI8dfA3ipLlg5lidevEHMNFgHWwfvz0DiZPuaAcz8+L6iVCwU6oSOz
	 uREZs/YBg4+BlXo/A57v9RBHrcBzTir2N/yyGJlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC90FF80145;
	Wed, 19 Feb 2020 01:10:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED6F8F80367; Wed, 19 Feb 2020 01:10:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C58CF80361
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C58CF80361
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62AE01FB;
 Tue, 18 Feb 2020 16:10:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA3443F68F;
 Tue, 18 Feb 2020 16:10:47 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Intel: Expose SDnFMT helpers" to the asoc tree
In-Reply-To: <20200218143924.10565-7-cezary.rojewski@intel.com>
Message-Id: <applied-20200218143924.10565-7-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: Expose SDnFMT helpers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 49d7948ed174cc170041bf3d22e1f085fd8b87f0 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:21 +0100
Subject: [PATCH] ASoC: SOF: Intel: Expose SDnFMT helpers

Hda stream is setup in similar fashion for compress as it is for pcm
operations. To reuse existing code in compress path, expose SDnFMT
helper routines.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-7-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-pcm.c | 8 ++++----
 sound/soc/sof/intel/hda.h     | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 23872f6e708d..a46a6baa1c3f 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -27,7 +27,7 @@
 #define SDnFMT_BITS(x)	((x) << 4)
 #define SDnFMT_CHAN(x)	((x) << 0)
 
-static inline u32 get_mult_div(struct snd_sof_dev *sdev, int rate)
+u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate)
 {
 	switch (rate) {
 	case 8000:
@@ -61,7 +61,7 @@ static inline u32 get_mult_div(struct snd_sof_dev *sdev, int rate)
 	}
 };
 
-static inline u32 get_bits(struct snd_sof_dev *sdev, int sample_bits)
+u32 hda_dsp_get_bits(struct snd_sof_dev *sdev, int sample_bits)
 {
 	switch (sample_bits) {
 	case 8:
@@ -95,8 +95,8 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	u32 size, rate, bits;
 
 	size = params_buffer_bytes(params);
-	rate = get_mult_div(sdev, params_rate(params));
-	bits = get_bits(sdev, params_width(params));
+	rate = hda_dsp_get_mult_div(sdev, params_rate(params));
+	bits = hda_dsp_get_bits(sdev, params_width(params));
 
 	hstream->substream = substream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a46b66437a3d..2b5fde372790 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -502,6 +502,8 @@ void hda_dsp_d0i3_work(struct work_struct *work);
 /*
  * DSP PCM Operations.
  */
+u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate);
+u32 hda_dsp_get_bits(struct snd_sof_dev *sdev, int sample_bits);
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream);
 int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
-- 
2.20.1

