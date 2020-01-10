Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC9136E3C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066AD166F;
	Fri, 10 Jan 2020 14:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066AD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663571;
	bh=YmmyY04DagA71NfxAgk9ip86t2s+yUh/3ViFN4MWtPQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GLF63tIRlUjotGRBY1tXb8C1LY7mAUaUa4mwxxQk8wwjDuIPIC/1GAIkD3+n/UDkY
	 P2nyycWQWwNdt6sF80GMsGgletncNqV/LpC784c0DSjdapYqyHiAF/fuQWwNTNw+2g
	 9KOTcGFWA2J5Tx1hMhn+iVbDNi13IYPFXPmTAsWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C339F80161;
	Fri, 10 Jan 2020 14:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F79F80130; Fri, 10 Jan 2020 14:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A36DF8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A36DF8010B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58DA21FB;
 Fri, 10 Jan 2020 05:37:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4C583F534;
 Fri, 10 Jan 2020 05:37:38 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhewrq9j.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87zhewrq9j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm/soc-compress: use
	snd_soc_dapm_stream_stop() for SND_SOC_DAPM_STREAM_STOP" to
	the asoc tree
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

   ASoC: soc-pcm/soc-compress: use snd_soc_dapm_stream_stop() for SND_SOC_DAPM_STREAM_STOP

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

From b0edff42360ab4f772cc581a60a14089ef2e1718 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:36:56 +0900
Subject: [PATCH] ASoC: soc-pcm/soc-compress: use snd_soc_dapm_stream_stop()
 for SND_SOC_DAPM_STREAM_STOP

dpcm_fe_dai_shutdown() / soc_compr_free_fe() didn't care pmdown_time.
We already have snd_soc_dapm_stream_stop() for it.
Let's use common method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87zhewrq9j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-compress.c | 2 +-
 sound/soc/soc-pcm.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 392a1c5b15d3..223cd045719e 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -299,7 +299,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	for_each_dpcm_be(fe, stream, dpcm)
 		dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_STOP);
+	snd_soc_dapm_stream_stop(fe, stream);
 
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dfff2ddb469a..74d340d1c9f7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1966,7 +1966,7 @@ static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 	soc_pcm_close(substream);
 
 	/* run the stream event for each BE */
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_STOP);
+	snd_soc_dapm_stream_stop(fe, stream);
 
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
