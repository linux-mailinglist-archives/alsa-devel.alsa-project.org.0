Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23E1AA100
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 14:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215E11671;
	Wed, 15 Apr 2020 14:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215E11671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586954318;
	bh=AvCoq+ZNYuYT4wKGBtVZSAxZ6mbek3CIqjG584ycEkw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qu0LNmKaa5Z1zBHxt4bdkDfol2lLIMdg5NPch5GzwKCb/tDoxwK96faX4inXRgK89
	 Wp/54ltymYlUlvD59J62wCtPS+RG06ZeGO0LTC/ZoS9B0F2D9JKX9Hhmag4H2xZHQ3
	 8L6+qDyWY+iVduv1YEFWxkRYjdBJgFAFOLGfT4Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C6DF8026A;
	Wed, 15 Apr 2020 14:36:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C08F8025F; Wed, 15 Apr 2020 14:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C19F800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 14:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C19F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bdd94AVl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA2B520737;
 Wed, 15 Apr 2020 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586954089;
 bh=AvCoq+ZNYuYT4wKGBtVZSAxZ6mbek3CIqjG584ycEkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bdd94AVlFtiR+pdTp2Pja6K/zR02AuhVsH3ppjXabwiXxUM1cmlajv+RPMMuqliuN
 NbOLal6j6Q3ybmbccmXCjn6OOZImKPYW8qKaM/kDXbAtXc/4vYMFYPnPAagSe4Nj5d
 8aO3hvbSBKIvpQfobTHLoSX2UErITaJRtF7y4HN8=
Date: Wed, 15 Apr 2020 13:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: Intel: skl_hda_generic: remove rtd->codec_dai" to the
 asoc tree
In-Reply-To: <20200415032647.11209-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200415032647.11209-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, Stephen Rothwell <sfr@canb.auug.org.au>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: Intel: skl_hda_generic: remove rtd->codec_dai

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

From 46b7e2ff8cb67f9f23bdfec0d8d08d803eb1146e Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 14 Apr 2020 22:26:47 -0500
Subject: [PATCH] ASoC: Intel: skl_hda_generic: remove rtd->codec_dai

Use macro and solve compilation issues

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200415032647.11209-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 64197b010e7d..35f222ed9912 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -175,7 +175,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd =
 		list_first_entry(&card->rtd_list,
 				 struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_hda_priv *hda_pvt;
 
 	if (!codec_dai)
-- 
2.20.1

