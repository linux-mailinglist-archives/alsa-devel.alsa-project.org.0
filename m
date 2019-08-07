Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4184D90
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A733852;
	Wed,  7 Aug 2019 15:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A733852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565185163;
	bh=9qK9mSR7Quki8vBR6g8QnmTLvkk2Z9Zdc7m/9vSmKXQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=m/RExyepGqYSyNrWd7KQFsKvTNHNP4qla0qICHAq0DStzaVWH8SxkHZUb0lj3qB/U
	 UhNo/fWDtauvPwcyaoQIwtgX8QAXO1VGXx1zrCHNVv1rtvreMa/VA3h2s6T9fSDe4i
	 6Qb1bynLZ7ETmqaL9urGasqaaDevldWcmkz8pWoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F9EF8067B;
	Wed,  7 Aug 2019 15:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B595EF8060E; Wed,  7 Aug 2019 15:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DA0CF805F6
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA0CF805F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Hygv1YMu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pgGQNf+Una7xrOCNKqY0Y1ub7RfYmjT+hxqX5zwzfgs=; b=Hygv1YMuNoBm
 HsxuDFAbjsN21CJihKI65qZ+pH5SpTbM4JROrdkvqttQig8rulFarY+R6wXrjM6Xwje7hxZtGxQDH
 RXk/M3GcZ5UbZbHUrh1Wh4xMdSK9/0cCZi6zAKp6Mh7WYoouUkStRIsthh49cCdsuNjFT5AoHW6ma
 npV78=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1i-0007g8-Mt; Wed, 07 Aug 2019 13:30:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3531D2742B9E; Wed,  7 Aug 2019 14:30:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190806221958.19180-1-ranjani.sridharan@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133050.3531D2742B9E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:50 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Initialize HDA
	controller after i915 init" to the asoc tree
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

   ASoC: SOF: Intel: hda: Initialize HDA controller after i915 init

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From cc352735d49c9c25fd711795bee35d3d001ddffa Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Tue, 6 Aug 2019 15:19:58 -0700
Subject: [PATCH] ASoC: SOF: Intel: hda: Initialize HDA controller after i915
 init

On some platforms, sound card registration fails when a HDMI
monitor is not connected. This is caused by a recent commit
that switched the order in which the HDA controller and the
i915 are initialized. Initializing the i915 before initializing
the HDA controller fixes the problem.

Fixes: be1b577d01787c ("ASoC: SOF: Intel: hda: fix the hda init chip"
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20190806221958.19180-1-ranjani.sridharan@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 136f98bf5d7e..82f61c4e74bd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -321,10 +321,23 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->ppcap)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* init i915 and HDMI codecs */
+	ret = hda_codec_i915_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: init i915 and HDMI codec failed\n");
+		return ret;
+	}
+#endif
+
+	/* Init HDA controller after i915 init */
 	ret = hda_dsp_ctrl_init_chip(sdev, true);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
 			ret);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		hda_codec_i915_exit(sdev);
+#endif
 		return ret;
 	}
 
@@ -332,13 +345,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	/* init i915 and HDMI codecs */
-	ret = hda_codec_i915_init(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: no HDMI audio devices found\n");
-		return ret;
-	}
-
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_info(bus->dev, "no hda codecs found!\n");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
