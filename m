Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3403F96FE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488331672;
	Tue, 12 Nov 2019 18:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488331672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579288;
	bh=w+VsZhp6GNGZp1y2UaMobBnIBwa6SmP5SpbZt/prHqc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dmFrxn+mteklrjyZOWhvRj9GgfkAPfCpC6mxEKNvwa2jbzItaVSMielVyejHuVQqp
	 4udEJeutba/NK0FZW3TiDVnlUvxWgFfuhzJSeKrL+031O5BOJILxzH95YH841YialQ
	 BnnJuNR97qHnBz+w9kMrEhy/Xp/BLzsPH6IJXoh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 218A0F8063C;
	Tue, 12 Nov 2019 18:16:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50376F8060F; Tue, 12 Nov 2019 18:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB83F8048F
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB83F8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IfUo41wL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FUtFkoxgQBAaquAKaRTbs69kTgxBL4JbRYGYSfmsrLY=; b=IfUo41wLKwn1
 4ZgWkyHAv4+9OGzSRKjzpRCzIT0PVmuJmH5CXuxhb0TqC7Tksqv33G0ufjVE0cTnLCa3o3RdbFLQ1
 aETkTz9wTkBj4ZtlkppWtasOPzPrYENOmqQ1Mg6En11hKoT9k62TM6yrlNyiqmLYxhL9jq7B/8U8+
 3h0J8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm8-0008Io-1M; Tue, 12 Nov 2019 17:16:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6E84D2742A8B; Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191111223343.19986-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171619.6E84D2742A8B@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: add helper to check if we should
	enter d0i3 suspend" to the asoc tree
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

   ASoC: SOF: add helper to check if we should enter d0i3 suspend

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

From a77e5d573f847d2f984c38eb711351326bc55258 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Mon, 11 Nov 2019 16:33:42 -0600
Subject: [PATCH] ASoC: SOF: add helper to check if we should enter d0i3
 suspend

Add helper to check if the DSP should be put in D0i3. This function
returns true if a stream has ignored the SUSPEND trigger to keep the
pipelines running in the DSP.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191111223343.19986-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c     | 13 +++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 8661c2cca76b..805918d3bcc0 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -132,6 +132,19 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
+bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].suspend_ignored ||
+		    spcm->stream[SNDRV_PCM_STREAM_CAPTURE].suspend_ignored)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * FW Panic/fault handling.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6408ac88a3e5..c7c2c70ee4d0 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -553,6 +553,8 @@ struct snd_sof_pcm *snd_sof_find_spcm_dai(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
+bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev);
+
 struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_sof_dev *sdev,
 					   const char *name);
 struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_sof_dev *sdev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
