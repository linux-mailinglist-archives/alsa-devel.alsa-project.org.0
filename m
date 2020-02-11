Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A11593F9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0E7415F2;
	Tue, 11 Feb 2020 16:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0E7415F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436459;
	bh=Sx3yCCXwAYENAHVmYViLVB6MOlxrwBEFpWrhBci4fps=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ldiMWiYizyNWVeL8uQ54Avv+i5rJIA/eA2yPgoBm8+5zqdn39EOSgVD9fv6fhTQaz
	 4sGRH+l/4NKmcqFzDxNHz5HeOWRxQCgoh75LhmmtDb7DpIHFFHQo+rz3GmBdV1sucB
	 bb3/meKFaWP/2elwlgEnHjQlZv00LjvMaMq9ffWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC23F80292;
	Tue, 11 Feb 2020 16:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F2F9F802A2; Tue, 11 Feb 2020 16:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 19FEAF8028A
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19FEAF8028A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AC9FEC;
 Tue, 11 Feb 2020 07:48:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5B43F68E;
 Tue, 11 Feb 2020 07:48:34 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20200210151402.29634-1-peter.ujfalusi@ti.com>
Message-Id: <applied-20200210151402.29634-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ALSA: dmaengine_pcm: Consider DMA cache
	caused delay in pointer callback" to the asoc tree
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

   ALSA: dmaengine_pcm: Consider DMA cache caused delay in pointer callback

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From fa1f875c120fa44572c561d86022af2f6b0774c7 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 10 Feb 2020 17:14:02 +0200
Subject: [PATCH] ALSA: dmaengine_pcm: Consider DMA cache caused delay in
 pointer callback

Some DMA engines can have big FIFOs which adds to the latency.
The DMAengine framework can report the FIFO utilization in bytes. Use this
information for the delay reporting.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200210151402.29634-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 5749a8a49784..d8be7b488162 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -247,9 +247,14 @@ snd_pcm_uframes_t snd_dmaengine_pcm_pointer(struct snd_pcm_substream *substream)
 
 	status = dmaengine_tx_status(prtd->dma_chan, prtd->cookie, &state);
 	if (status == DMA_IN_PROGRESS || status == DMA_PAUSED) {
+		struct snd_pcm_runtime *runtime = substream->runtime;
+
 		buf_size = snd_pcm_lib_buffer_bytes(substream);
 		if (state.residue > 0 && state.residue <= buf_size)
 			pos = buf_size - state.residue;
+
+		runtime->delay = bytes_to_frames(runtime,
+						 state.in_flight_bytes);
 	}
 
 	return bytes_to_frames(substream->runtime, pos);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
