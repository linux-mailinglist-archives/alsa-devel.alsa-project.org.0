Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A532CA31
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135E61833;
	Tue, 28 May 2019 17:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135E61833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056713;
	bh=prMdwU+nTo9JNs1rTZS+EZveSuTm9IIKRPx/nD1W0Mg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SjWkqU43o0bZWxYtm1QuK+r16unXrneAZgso3mu8PxpAnntWBaaHnOVtL5aDXtLe1
	 1wwfYTfrwD5By6TiHQy+xEFWFoZsDc5x0XbI5XkWe50z0UsniW/NXcJGCMAmINXTcK
	 MMxPlxTMT5pZABB9Q2LImoHWYZOIph9EGphnOGso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 444EAF89779;
	Tue, 28 May 2019 17:07:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FDBF8973B; Tue, 28 May 2019 17:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74179F8972C
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74179F8972C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CCRFwBFO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Rki0UZFFmtUxI2iGStEEPCzujBJ+J+4pRUdatOB/H8w=; b=CCRFwBFOQsSk
 CfNEx3SUCqx1T7mfxxvPMLkOqa6DaXcvk303ouMD8uQoh8E6PfVw3DkbNU005AI54ujCMfcFnGJ1J
 eeu7Wg8V0tLcxLCKb4SZez5k9jzLN5LNEum+taNFlMdksSYpuXxiVVdtTOxdu7biiqNw9G3wC3gl7
 1uqS4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgv-0002pE-0K; Tue, 28 May 2019 15:07:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4845A440049; Tue, 28 May 2019 16:07:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Libin Yang <libin.yang@intel.com>
In-Reply-To: <20190524190925.5931-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150704.4845A440049@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:07:04 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pcm: clear hw_params_upon_resume
	flag correctly" to the asoc tree
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

   ASoC: SOF: pcm: clear hw_params_upon_resume flag correctly

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

From 04ea642ff62a2b2da3d5844283991a41328f49b1 Mon Sep 17 00:00:00 2001
From: Libin Yang <libin.yang@intel.com>
Date: Fri, 24 May 2019 14:09:20 -0500
Subject: [PATCH] ASoC: SOF: pcm: clear hw_params_upon_resume flag correctly

sof_pcm_hw_params() can only be called once to setup the FW hw_params.
So after calling sof_pcm_hw_params(), hw_params_upon_resume flag must
be cleared to avoid multiple invoking sof_pcm_hw_params() by prepare.

For example, after resume, there is an xrun happened, prepare() will
be called. As the hw_params_upon_resume flag is not cleared,
sof_pcm_hw_params() will be called and this will cause IPC timeout.

This patch fixes such issues.

Fixes: 868bd00f495 ("ASoC: SOF: Add PCM operations support")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 649968841dad..d6dc9a7df0f4 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -214,6 +214,9 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
 		  sof_pcm_period_elapsed_work);
 
+	/* clear hw_params_upon_resume flag */
+	spcm->hw_params_upon_resume[substream->stream] = 0;
+
 	return ret;
 }
 
@@ -429,9 +432,6 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	dev_dbg(sdev->dev, "pcm: open stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
-	/* clear hw_params_upon_resume flag */
-	spcm->hw_params_upon_resume[substream->stream] = 0;
-
 	caps = &spcm->pcm.caps[substream->stream];
 
 	ret = pm_runtime_get_sync(sdev->dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
