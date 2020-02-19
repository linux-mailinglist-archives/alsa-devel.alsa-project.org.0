Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70491163854
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:15:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E5B16AC;
	Wed, 19 Feb 2020 01:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E5B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071324;
	bh=0L/oDglOh+VHZjyipPb4jyGKu5+Fff6/yb9zN5U99sM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qg6D07ZzhaQmBiJ2Zt/a6lZELI0jcALiVz6mLLRSiVA4VS6Pgu0fugAoVuxeqYb0H
	 QgmtXRpNtYiy1pCSRnMrCkUrkfSzudHXZaYwDJFbYnuZM5pI2o4MZb2dApss8UGPoj
	 BPAEPjnceJxyTvraIxRcI3alkYPOzmbHvAURXWcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AEC4F802C2;
	Wed, 19 Feb 2020 01:09:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D688F802BC; Wed, 19 Feb 2020 01:09:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 45C11F8029A
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C11F8029A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22EED1FB;
 Tue, 18 Feb 2020 16:09:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3203F68F;
 Tue, 18 Feb 2020 16:09:40 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ALSA: pcm.h: add for_each_pcm_streams()" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

   ALSA: pcm.h: add for_each_pcm_streams()

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

From 3193abd26b515ccac65e1c323533cb7f53d06176 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:19 +0900
Subject: [PATCH] ALSA: pcm.h: add for_each_pcm_streams()

ALSA code has SNDRV_PCM_STREAM_PLAYBACK/CAPTURE everywhere.
Having for_each_xxxx macro is useful.
This patch adds for_each_pcm_streams() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/874kvpbotq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/pcm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f657ff08f317..2628246b76fa 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -644,6 +644,11 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
 #define snd_pcm_group_for_each_entry(s, substream) \
 	list_for_each_entry(s, &substream->group->substreams, link_list)
 
+#define for_each_pcm_streams(stream)			\
+	for (stream  = SNDRV_PCM_STREAM_PLAYBACK;	\
+	     stream <= SNDRV_PCM_STREAM_LAST;		\
+	     stream++)
+
 /**
  * snd_pcm_running - Check whether the substream is in a running state
  * @substream: substream to check
-- 
2.20.1

