Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862AE22F8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:59:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8689D166B;
	Wed, 23 Oct 2019 20:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8689D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857172;
	bh=uwuFtWkLAh8cK4UBUJWH9eu+lrjR4TeRMXGOEqyXKxA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RC1snVwtVAC5hIwCTuN0+sOi09xKEBxU/9RzejLKM4zQJPwLEOTCQ6soKgZt+0FKC
	 VRg+oBJoMep4ptpsBTQ/DjFBh9LvaPYFqNlMK+EjkLbW1zxxZ8zNodaF2I1FeIDJ/Y
	 4FYfTj8djAdabBWUb8VGv+Lf71HLq5wTqfkS1Dss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C0CF805FB;
	Wed, 23 Oct 2019 20:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEEE9F8060F; Wed, 23 Oct 2019 20:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63663F80321
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63663F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xwt1CAtX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WQGDAKr45MEulB+E7PCsiloXFNDl2mCDaRGOB2sHXXw=; b=xwt1CAtXQcc6
 lMqSOcxYVemjDgTSupU1WeBLodGDLTjwav2qc2QVF6tfPUT/PgjEXNe7wzXEW3Pp3yv+twuBcRdEe
 71340WXdg2NWgibDrgf5Kp2vrIpMXzWxIuxcWmJe3EBLFNuLLrRclPcaFXP+QVzcRWZddALzkeqIB
 H1xk4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLni-0001As-Ii; Wed, 23 Oct 2019 18:56:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F3323274329D; Wed, 23 Oct 2019 19:56:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191022192844.21022-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185605.F3323274329D@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:05 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda-loader: improve error
	handling" to the asoc tree
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

   ASoC: SOF: Intel: hda-loader: improve error handling

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 76dc6a2b312d15c91ff4b4d171e98cdc73ba3745 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 22 Oct 2019 14:28:43 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-loader: improve error handling

If a ROM timeout is detected, we still stop the DMA but will return
the initial error should the DMA stop also fail.

Likewise the cleanup is handled regardless of the status, but we
return the initial error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191022192844.21022-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 65c2af3fcaab..7956dbf5be88 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -253,10 +253,16 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_BASEFW_TIMEOUT_US);
 
+	/*
+	 * even in case of errors we still need to stop the DMAs,
+	 * but we return the initial error should the DMA stop also fail
+	 */
+
 	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
-		return ret;
+		if (!status)
+			status = ret;
 	}
 
 	return status;
@@ -341,13 +347,15 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	/*
 	 * Perform codeloader stream cleanup.
 	 * This should be done even if firmware loading fails.
+	 * If the cleanup also fails, we return the initial error
 	 */
 	ret1 = cl_cleanup(sdev, &sdev->dmab, stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
 		/* set return value to indicate cleanup failure */
-		ret = ret1;
+		if (!ret)
+			ret = ret1;
 	}
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
