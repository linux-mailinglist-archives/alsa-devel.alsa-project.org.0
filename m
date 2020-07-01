Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA26210B0B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 14:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642F342;
	Wed,  1 Jul 2020 14:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642F342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593606603;
	bh=kP8uWaEB3VJAlh0u+aJCpRCLuMhg06u9xvjanTBUx+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/a1Y/1X9oNUsfSk3iGyb931MzJkhglUQ8N+qdpD6FUMn4Id7ibMUuez1WlPnCcU1
	 KuJTtf0vxdIW6hmKOKFoP5/EmWUanwtsVFzcigt/TDVQwfYOg+nlxL/qdAMsHB/v2t
	 8HtG0z1FnWPeWXA8Rmj9aqsXynY+E5/vH/v41F2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02CD2F802DB;
	Wed,  1 Jul 2020 14:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4A1F802D2; Wed,  1 Jul 2020 14:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC62AF80229
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 14:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC62AF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="n2rW9K0i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E/CWv6nrcEMXhygJPwpRtRJqJoLaTLZMKsrYK5+oHO4=; b=n2rW9K0ikMjQw5l+w0M+lnfx0P
 mflfLA5mbjDk+jvYciuaFvoijYqjVuIbjYCnPue9okzfNtIy4Uuu6C6F9KTceIawShg6jbPmEx0n/
 VcV4fBvCA1lHHWBNrsV3lC+E2ytMB8uxgxkUphPhcWTQXWRW4pp9ZyI0MhUrtW11b9fvXQNYHRaNS
 uhuNpkpWXiIgl+D/9ikv3WlBKxtiBoDE6iZbMoXaGrsYxdDKyWLkeE39XIwh0spxgj7WQ7diOUDZo
 o+/in7VySBF8uwp9WVoFESJOyxR9VehzjqOEdES5hcFyZg5LmXNrMUOpWWcqMZVqYTzspeaEv13mG
 mya3/Gjg==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jqbpj-0009kQ-P4; Wed, 01 Jul 2020 13:27:23 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jqbpj-0004eC-Gr; Wed, 01 Jul 2020 13:27:23 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/4] echoaudio: Address bugs in the interrupt handling
Date: Wed,  1 Jul 2020 13:27:23 +0100
Message-Id: <20200701122723.17814-4-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2007011319580.23012@tamla.localdomain>
References: <2007011319580.23012@tamla.localdomain>
Cc: alsa-devel@alsa-project.org
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

Distorted audio appears occasionally, affecting either playback or
capture and requiring the affected substream to be closed by all
applications and re-opened.

The best way I have found to reproduce the bug is to use dmix in
combination with Chromium, which opens the audio device multiple times
in threads. Anecdotally, the problems appear to have increased with
faster CPUs. I ruled out 32-bit counter wrapping; it often happens
much earlier.

Since applying this patch I have not had problems, where previously
they would occur several times a day.

The patch targets the following issues:

* Check for progress using the counter from the hardware, not after it
  has been truncated to the buffer.

  This is a clean way to address a possible bug where if a whole
  ringbuffer advances between interrupts, it goes unnoticed.

* Move last_period state from chip to pipe

  This more logically belongs as part of pipe, and code is reasier to
  read if it is "counter position last time a period elapsed".

  Now the code has no references to period count. A period is just
  when the regular counter crosses a threshold. This increases
  readability and reduces scope for bugs.

* Treat period notification and buffer advance independently:

  This helps to clarify what is the responsibility of the interrupt
  handler, and what is pcm_pointer().

  Removing shared state between these operations means race conditions
  are fixed without introducing locks. Synchronisation is only around
  the read of pipe->dma_counter. There may be cache line contention
  around "struct audiopipe" but I did not have cause to profile this.

Pay attention to be robust where dma_counter wrapping is not a
multiple of period_size or buffer_size.

This is a revised patch based on feedback from Takashi and Giuliano.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio.c | 85 +++++++++++++++++++++++----------
 sound/pci/echoaudio/echoaudio.h |  8 +++-
 2 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 19002d785d8d..347e96038908 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2,6 +2,7 @@
 /*
  *  ALSA driver for Echoaudio soundcards.
  *  Copyright (C) 2003-2004 Giuliano Pochini <pochini@shiny.it>
+ *  Copyright (C) 2020 Mark Hills <mark@xwax.org>
  */
 
 #include <linux/module.h>
@@ -590,7 +591,7 @@ static int init_engine(struct snd_pcm_substream *substream,
 	/* This stuff is used by the irq handler, so it must be
 	 * initialized before chip->substream
 	 */
-	chip->last_period[pipe_index] = 0;
+	pipe->last_period = 0;
 	pipe->last_counter = 0;
 	pipe->position = 0;
 	smp_wmb();
@@ -759,7 +760,7 @@ static int pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 				pipe = chip->substream[i]->runtime->private_data;
 				switch (pipe->state) {
 				case PIPE_STATE_STOPPED:
-					chip->last_period[i] = 0;
+					pipe->last_period = 0;
 					pipe->last_counter = 0;
 					pipe->position = 0;
 					*pipe->dma_counter = 0;
@@ -807,19 +808,26 @@ static snd_pcm_uframes_t pcm_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct audiopipe *pipe = runtime->private_data;
-	size_t cnt, bufsize, pos;
+	u32 counter, step;
 
-	cnt = le32_to_cpu(*pipe->dma_counter);
-	pipe->position += cnt - pipe->last_counter;
-	pipe->last_counter = cnt;
-	bufsize = substream->runtime->buffer_size;
-	pos = bytes_to_frames(substream->runtime, pipe->position);
+	/*
+	 * IRQ handling runs concurrently. Do not share tracking of
+	 * counter with it, which would race or require locking
+	 */
 
-	while (pos >= bufsize) {
-		pipe->position -= frames_to_bytes(substream->runtime, bufsize);
-		pos -= bufsize;
-	}
-	return pos;
+	counter = le32_to_cpu(*pipe->dma_counter);  /* presumed atomic */
+
+	step = counter - pipe->last_counter;  /* handles wrapping */
+	pipe->last_counter = counter;
+
+	/* counter doesn't neccessarily wrap on a multiple of
+	 * buffer_size, so can't derive the position; must
+	 * accumulate */
+
+	pipe->position += step;
+	pipe->position %= frames_to_bytes(runtime, runtime->buffer_size); /* wrap */
+
+	return bytes_to_frames(runtime, pipe->position);
 }
 
 
@@ -1782,14 +1790,43 @@ static const struct snd_kcontrol_new snd_echo_channels_info = {
 
 
 /******************************************************************************
-	IRQ Handler
+	IRQ Handling
 ******************************************************************************/
+/* Check if a period has elapsed since last interrupt
+ *
+ * Don't make any updates to state; PCM core handles this with the
+ * correct locks.
+ *
+ * \return true if a period has elapsed, otherwise false
+ */
+static bool period_has_elapsed(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct audiopipe *pipe = runtime->private_data;
+	u32 counter, step;
+	size_t period_bytes;
+
+	if (pipe->state != PIPE_STATE_STARTED)
+		return false;
+
+	period_bytes = frames_to_bytes(runtime, runtime->period_size);
+
+	counter = le32_to_cpu(*pipe->dma_counter);  /* presumed atomic */
+
+	step = counter - pipe->last_period;  /* handles wrapping */
+	step -= step % period_bytes;  /* acknowledge whole periods only */
+
+	if (step == 0)
+		return false;  /* haven't advanced a whole period yet */
+
+	pipe->last_period += step;  /* used exclusively by us */
+	return true;
+}
 
 static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
 {
 	struct echoaudio *chip = dev_id;
-	struct snd_pcm_substream *substream;
-	int period, ss, st;
+	int ss, st;
 
 	spin_lock(&chip->lock);
 	st = service_irq(chip);
@@ -1800,17 +1837,13 @@ static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
 	/* The hardware doesn't tell us which substream caused the irq,
 	thus we have to check all running substreams. */
 	for (ss = 0; ss < DSP_MAXPIPES; ss++) {
+		struct snd_pcm_substream *substream;
+
 		substream = chip->substream[ss];
-		if (substream && ((struct audiopipe *)substream->runtime->
-				private_data)->state == PIPE_STATE_STARTED) {
-			period = pcm_pointer(substream) /
-				substream->runtime->period_size;
-			if (period != chip->last_period[ss]) {
-				chip->last_period[ss] = period;
-				spin_unlock(&chip->lock);
-				snd_pcm_period_elapsed(substream);
-				spin_lock(&chip->lock);
-			}
+		if (substream && period_has_elapsed(substream)) {
+			spin_unlock(&chip->lock);
+			snd_pcm_period_elapsed(substream);
+			spin_lock(&chip->lock);
 		}
 	}
 	spin_unlock(&chip->lock);
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 6fd283e4e676..30c640931f1e 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -298,7 +298,12 @@ struct audiopipe {
 					 * the current dma position
 					 * (lower 32 bits only)
 					 */
-	u32 last_counter;		/* The last position, which is used
+	u32 last_period;                /* Counter position last time a
+					 * period elapsed
+					 */
+	u32 last_counter;		/* Used exclusively by pcm_pointer
+					 * under PCM core locks.
+					 * The last position, which is used
 					 * to compute...
 					 */
 	u32 position;			/* ...the number of bytes tranferred
@@ -332,7 +337,6 @@ struct audioformat {
 struct echoaudio {
 	spinlock_t lock;
 	struct snd_pcm_substream *substream[DSP_MAXPIPES];
-	int last_period[DSP_MAXPIPES];
 	struct mutex mode_mutex;
 	u16 num_digital_modes, digital_mode_list[6];
 	u16 num_clock_sources, clock_source_list[10];
-- 
2.17.5

