Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E320163882
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0661710;
	Wed, 19 Feb 2020 01:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0661710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071929;
	bh=NjJ/qL1mfmnU/PuXjPAClDQO5Yz1dun3/pnFT0rG9yo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SbMTvbKYPqhUlXGvGq/03nRAbll9Dfv/kFo/2w5opbtqmfx0ddxV210H5zywJDB29
	 bfugpffs4RPHzLSKBMrZdzS3o8uUCm07TRGtbFbJBX4j5nOv+zESyLryhVPNh0qwTO
	 IK36d0MgRu/sJg3FIC++hxA/k4MJXXJJ6rc19vv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE92F80377;
	Wed, 19 Feb 2020 01:11:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18AACF80377; Wed, 19 Feb 2020 01:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 949CCF80368
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 949CCF80368
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 135011FB;
 Tue, 18 Feb 2020 16:11:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BD653F68F;
 Tue, 18 Feb 2020 16:11:01 -0800 (PST)
Date: Wed, 19 Feb 2020 00:11:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Intel: Account for compress streams when
 servicing IRQs" to the asoc tree
In-Reply-To: <20200218143924.10565-4-cezary.rojewski@intel.com>
Message-Id: <applied-20200218143924.10565-4-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>
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

   ASoC: SOF: Intel: Account for compress streams when servicing IRQs

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

From 4a9ce6e4d9fb9c4acc44f647a68e59ea50ff1caf Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:18 +0100
Subject: [PATCH] ASoC: SOF: Intel: Account for compress streams when servicing
 IRQs

Update stream irq handler definition to correctly set hdac_stream
current position when servicing stream interrupts for compress streams.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/hdaudio.h          |  2 ++
 sound/soc/sof/intel/hda-stream.c | 25 +++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index d4299e146d95..affedc2801c4 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -513,6 +513,7 @@ struct hdac_stream {
 	struct snd_pcm_substream *substream;	/* assigned substream,
 						 * set in PCM open
 						 */
+	struct snd_compr_stream *cstream;
 	unsigned int format_val;	/* format value to be set in the
 					 * controller and the codec
 					 */
@@ -527,6 +528,7 @@ struct hdac_stream {
 	bool locked:1;
 	bool stripe:1;			/* apply stripe control */
 
+	u64 curr_pos;
 	/* timestamp */
 	unsigned long start_wallclk;	/* start + minimum wallclk */
 	unsigned long period_wallclk;	/* wallclk for period */
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c0ab9bb2a797..7daa913dbde0 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -571,6 +571,22 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static void
+hda_dsp_set_bytes_transferred(struct hdac_stream *hstream, u64 buffer_size)
+{
+	u64 prev_pos, pos, num_bytes;
+
+	div64_u64_rem(hstream->curr_pos, buffer_size, &prev_pos);
+	pos = snd_hdac_stream_get_pos_posbuf(hstream);
+
+	if (pos < prev_pos)
+		num_bytes = (buffer_size - prev_pos) +  pos;
+	else
+		num_bytes = pos - prev_pos;
+
+	hstream->curr_pos += num_bytes;
+}
+
 static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 {
 	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
@@ -588,14 +604,19 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 			snd_hdac_stream_writeb(s, SD_STS, sd_status);
 
 			active = true;
-			if (!s->substream ||
+			if ((!s->substream && !s->cstream) ||
 			    !s->running ||
 			    (sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
 				continue;
 
 			/* Inform ALSA only in case not do that with IPC */
-			if (sof_hda->no_ipc_position)
+			if (s->substream && sof_hda->no_ipc_position) {
 				snd_sof_pcm_period_elapsed(s->substream);
+			} else if (s->cstream) {
+				hda_dsp_set_bytes_transferred(s,
+					s->cstream->runtime->buffer_size);
+				snd_compr_fragment_elapsed(s->cstream);
+			}
 		}
 	}
 
-- 
2.20.1

