Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A019823E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 19:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE9E166F;
	Mon, 30 Mar 2020 19:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE9E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585589087;
	bh=ABzpVIYCD9770CMezZ8YgdtVcrOX3AIXCYVnkknagfg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BvNmv6kPtI3lJrnIsDVoj2VqQi3TC6nl7gELCoC0/ByDc+qk4ek7w6S+YujdPoJl8
	 GCAitYdrJ5H7mYf4CT8cwCzcoZrKzdUtVSbWeAixNXuKW9sUdv6oviXSzTOZQxoC/C
	 ++NBhtHF9Nq6ZaqBL9OMXLxJp9wa8geazl0n/hqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BAA1F80145;
	Mon, 30 Mar 2020 19:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 291D3F80148; Mon, 30 Mar 2020 19:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A0A53F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A53F8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E14F101E;
 Mon, 30 Mar 2020 10:22:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A443F68F;
 Mon, 30 Mar 2020 10:22:56 -0700 (PDT)
Date: Mon, 30 Mar 2020 18:22:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: soc-dai: fix DAI startup/shutdown sequence" to the
 asoc tree
In-Reply-To: <20200330160602.10180-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200330160602.10180-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 =?utf-8?q?Amad?= =?utf-8?q?eusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

   ASoC: soc-dai: fix DAI startup/shutdown sequence

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

From 1ba616bd1a6d5ebdb31ceaa9265b2a2bb670155b Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 30 Mar 2020 11:06:02 -0500
Subject: [PATCH] ASoC: soc-dai: fix DAI startup/shutdown sequence
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The addition of a single flag to track the DAI status prevents the DAI
startup sequence from being called on capture if the DAI is already
used for playback.

Fix by extending the existing code with one flag per direction.

Fixes: b56be800f1292 ("ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once")
Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20200330160602.10180-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h | 2 +-
 sound/soc/soc-dai.c     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 78bac995db15..d4825b82c7a3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -351,7 +351,7 @@ struct snd_soc_dai {
 
 	/* bit field */
 	unsigned int probed:1;
-	unsigned int started:1;
+	unsigned int started[SNDRV_PCM_STREAM_LAST + 1];
 };
 
 static inline struct snd_soc_pcm_stream *
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 19142f6e533c..8f3cad8db89a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -295,12 +295,12 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 {
 	int ret = 0;
 
-	if (!dai->started &&
+	if (!dai->started[substream->stream] &&
 	    dai->driver->ops->startup)
 		ret = dai->driver->ops->startup(substream, dai);
 
 	if (ret == 0)
-		dai->started = 1;
+		dai->started[substream->stream] = 1;
 
 	return ret;
 }
@@ -308,11 +308,11 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream)
 {
-	if (dai->started &&
+	if (dai->started[substream->stream] &&
 	    dai->driver->ops->shutdown)
 		dai->driver->ops->shutdown(substream, dai);
 
-	dai->started = 0;
+	dai->started[substream->stream] = 0;
 }
 
 int snd_soc_dai_prepare(struct snd_soc_dai *dai,
-- 
2.20.1

