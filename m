Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8213AF0E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:19:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 625C4184E;
	Tue, 14 Jan 2020 17:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 625C4184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018758;
	bh=5jPphVgRXOf4Yfn7Av78uGAVBoDE40MvimxPncHy8/g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CKfusbftEtX2ePa15D91E9QjEE21/WxC4e6sbFr4z2IruvMFFNI8PA6R3P5oeIZMV
	 dICzJKGeC8KjFPbETkvGoumL8LCZ25A6YnCjNpMVMlhisrl10rQLdGic3vFFaatRBS
	 yOurCa4dSVeodoox47p6tALprVqBovn5OjJ2sG9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C97C8F80336;
	Tue, 14 Jan 2020 17:10:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46306F80307; Tue, 14 Jan 2020 17:09:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C105FF80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C105FF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jhis5j7s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DLfhgTleDdfDd14d9iuaR9ui0jhfqCEjxWlPKHjFxZ8=; b=jhis5j7syHKd
 tVjWPTXFH+5Qlu+aDWOCBBxV81DPszIrjNKp+8Z24Snu1FnIiV+UuvlqQmGDTS5BaFVzBVHgJ9tFA
 iGwnB3qmrob9kCciwhLSG6R8Oe7aGHshUNKaZMZMrmWyAC43t8gX2pDsuqWJS71K305M/qBM3rj/2
 t2dGY=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkf-0001W3-Fr; Tue, 14 Jan 2020 16:09:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2E0E5D02C7B; Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200113210428.27457-10-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200113210428.27457-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: kbl_rt5660: rename shadowed
	variable" to the asoc tree
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

   ASoC: Intel: kbl_rt5660: rename shadowed variable

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

From 74e7c6b0030c36a9e9e3c8da4d3b08160b5dda4d Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 13 Jan 2020 15:04:19 -0600
Subject: [PATCH] ASoC: Intel: kbl_rt5660: rename shadowed variable

Fix cppcheck warning:

[sound/soc/intel/boards/kbl_rt5660.c:282] ->
[sound/soc/intel/boards/kbl_rt5660.c:141]: (style) Local variable
'channels' shadows outer variable

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113210428.27457-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_rt5660.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 74fe1f3a5479..e23dea9ab79a 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -138,13 +138,13 @@ static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
+	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
-	channels->min = channels->max = DUAL_CHANNEL;
+	chan->min = chan->max = DUAL_CHANNEL;
 
 	/* set SSP0 to 24 bit */
 	snd_mask_none(fmt);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
