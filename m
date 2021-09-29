Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16241BFF5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 09:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421BB16A9;
	Wed, 29 Sep 2021 09:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421BB16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632900707;
	bh=wesy2u2fbC/4IkQIoSSic2W/abXM3FfdAVStLQ+SE0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uw2NQyAxaekdV1zC+jLtv25GqtHxmEeLxPeRFmh+ibl3QuMASi8avq2+adzz65l4O
	 7SaI670snIdI5OBHqIORlty0L3gg6vCdIffuJQ+WDssyBOJE4eZ1VIt6jJnzaJXsWY
	 jFfi+ujPgizXawpkyOM6eMpQ8cNJEBn7kDmRFYxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3564F80161;
	Wed, 29 Sep 2021 09:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 339F4F80272; Wed, 29 Sep 2021 09:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 277E7F80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 09:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277E7F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rcgIzJX9"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="kiPdcpIZ"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id A08FD224E5;
 Wed, 29 Sep 2021 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632900577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bdtYiCryRRGHaHkXGh/v14AoTQjvHpMwLH099JQ46M=;
 b=rcgIzJX9S6Dc88/PKJtw/mxvp01HmzXuJUmnxG9MYWGfSKtMzYyneXrbtEYIByX/rmoQqF
 gw/dRsd92+NDyFf41dMEKAonJ4KPJAFpJEIzwGTp8WdGzH7oz+QcVBjrAV9XTC6Ljy3RRR
 6iKybqjmyG9Zjk/YjREHryZfidI95Ds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632900577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bdtYiCryRRGHaHkXGh/v14AoTQjvHpMwLH099JQ46M=;
 b=kiPdcpIZR9NsjSyAlPvlCtOO4ZSSo/tpiZ54mD8BYf2KkiNiPO6C4g1gr+ozmqknFuf+zX
 NSf2QmbaepAGUuCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id 9086E25D52;
 Wed, 29 Sep 2021 07:29:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: hda: Reduce udelay() at SKL+ position reporting
Date: Wed, 29 Sep 2021 09:29:33 +0200
Message-Id: <20210929072934.6809-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929072934.6809-1-tiwai@suse.de>
References: <20210929072934.6809-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jens Axboe <axboe@kernel.dk>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The position reporting on Intel Skylake and later chips via
azx_get_pos_skl() contains a udelay(20) call for the capture streams.
A call for this alone doesn't sound too harmful.  However, as the
pointer PCM ops is one of the hottest path in the PCM operations --
especially for the timer-scheduled operations like PulseAudio -- such
a delay hogs CPU usage significantly in the total performance.

The code there was taken from the original code in ASoC SST Skylake
driver blindly.  The udelay() is a workaround for the case where the
reported position is behind the period boundary at the timing
triggered from interrupts; applications often expect that the full
data is available for the whole period when returned (and also that's
the definition of the ALSA PCM period).

OTOH, HD-audio (legacy) driver has already some workarounds for the
delayed position reporting due to its relatively large FIFO, such as
the BDL position adjustment and the delayed period-elapsed call in the
work.  That said, the udelay() is almost superfluous for HD-audio
driver unlike SST, and we can drop the udelay().

Though, the current code doesn't guarantee the full period readiness
as mentioned in the above, but rather it checks the wallclock and
detects the unexpected jump.  That's one missing piece, and the drop
of udelay() needs a bit more sanity checks for the delayed handling.

This patch implements those: the drop of udelay() call in
azx_get_pos_skl() and the more proper check of hwptr in
azx_position_ok().  The latter change is applied only for the case
where the stream is running in the normal mode without
no_period_wakeup flag.  When no_period_wakeup is set, it essentially
ignores the period handling and rather concentrates only on the
current position; which implies that we don't need to care about the
period boundary at all.

Fixes: f87e7f25893d ("ALSA: hda - Improved position reporting on SKL+")
Reported-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 47777439961c..9989ec4dc324 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -637,13 +637,17 @@ static int azx_position_check(struct azx *chip, struct azx_dev *azx_dev)
  * the update-IRQ timing.  The IRQ is issued before actually the
  * data is processed.  So, we need to process it afterwords in a
  * workqueue.
+ *
+ * Returns 1 if OK to proceed, 0 for delay handling, -1 for skipping update
  */
 static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 {
 	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	int stream = substream->stream;
 	u32 wallclk;
 	unsigned int pos;
+	snd_pcm_uframes_t hwptr, target;
 
 	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
 	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
@@ -680,6 +684,24 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 		/* NG - it's below the first next period boundary */
 		return chip->bdl_pos_adj ? 0 : -1;
 	azx_dev->core.start_wallclk += wallclk;
+
+	if (azx_dev->core.no_period_wakeup)
+		return 1; /* OK, no need to check period boundary */
+
+	if (runtime->hw_ptr_base != runtime->hw_ptr_interrupt)
+		return 1; /* OK, already in hwptr updating process */
+
+	/* check whether the period gets really elapsed */
+	pos = bytes_to_frames(runtime, pos);
+	hwptr = runtime->hw_ptr_base + pos;
+	if (hwptr < runtime->status->hw_ptr)
+		hwptr += runtime->buffer_size;
+	target = runtime->hw_ptr_interrupt + runtime->period_size;
+	if (hwptr < target) {
+		/* too early wakeup, process it later */
+		return chip->bdl_pos_adj ? 0 : -1;
+	}
+
 	return 1; /* OK, it's fine */
 }
 
@@ -874,11 +896,7 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	if (azx_dev->core.substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		return azx_skl_get_dpib_pos(chip, azx_dev);
 
-	/* For capture, we need to read posbuf, but it requires a delay
-	 * for the possible boundary overlap; the read of DPIB fetches the
-	 * actual posbuf
-	 */
-	udelay(20);
+	/* read of DPIB fetches the actual posbuf */
 	azx_skl_get_dpib_pos(chip, azx_dev);
 	return azx_get_pos_posbuf(chip, azx_dev);
 }
-- 
2.26.2

