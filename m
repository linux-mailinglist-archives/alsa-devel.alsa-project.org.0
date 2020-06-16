Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E351FB1E0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 15:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D4E1682;
	Tue, 16 Jun 2020 15:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D4E1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592313625;
	bh=nA5tJ/41+QYWEhfTT52g5iX/TZ7Dogg8oF6zssdzoRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mu9DT7GazSl7ObyUsVFN4qsnwuyIZZYF2pRodNxO0T8HP5CF8Gl1JZiSHqenCuYKy
	 Iev4UoLSoTaoDPlyX7Ls1shrYzDQVsij4qpoLDqCNdksIIDfmhd6a3B3ZFWArVP5TQ
	 r7NvWt3V6+thEqRrPmWUgYsVxov1Cer82+b3d7Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 027F9F8028F;
	Tue, 16 Jun 2020 15:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A909EF80232; Tue, 16 Jun 2020 15:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD27F80217
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 15:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD27F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="xNNtGWea"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7UYzsunQvXfkk8rWvceY/CKzKZJH+UfoPAGbZzm4SQA=; b=xNNtGWeaQAV/GL6QUj+mbbM/Cu
 YLmaPxBi3r5JNhmS/VssapzvQ3uF5jAktVNnDTpSpY63TFb0AgdYiF4ihuraABXDvH8usAzKzDQlE
 LbNWqtZOWBl9COg5jiyb6WIOGokuNYoIkiLdmMv2C8vpkdjaBocDY+lP2neZAw5o7IU8vES7VuhM0
 VsWDJHrfYNXAGY6qJuUF82B9ODggBOrIXZL11NYP7xU8SsbtEZP4DMDhInb2MO32Of337n0leGfpf
 /Fns0PN846xA8d7rnEfu/JWMXPBuS++ku6hypj/N6m/fkoisMVMiefaEnFA+dPLQT7PE6zlw31Q6L
 dM0XeI8g==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlBTD-000MY4-9P; Tue, 16 Jun 2020 14:17:43 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jlBTD-0001G6-27; Tue, 16 Jun 2020 14:17:43 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
Date: Tue, 16 Jun 2020 14:17:43 +0100
Message-Id: <20200616131743.4793-3-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006161409060.30751@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
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

Distorted audio appears occasionally, affecting either playback
or capture and requiring the affected substream to be closed by
all applications and re-opened.

The best way I have found to reproduce the bug is to use dmix in
combination with Chromium, which opens the audio device multiple
times in threads. Anecdotally, the problems appear to have increased
with faster CPUs.

Since applying this patch I have not had problems, where previously
they would occur several times a day.

This patch addresses the following issues:

* Check for progress using the counter from the hardware, not after
  it has been truncated to the buffer.

  There appears to be a possible bug if a whole ringbuffer advances
  between interrupts, it goes unnoticed.

* Remove chip->last_period:

  It's trivial to derive from pipe->last_counter, and inside pipe
  is where it more logically belongs. This has less scope for bugs
  as it is not wrapped to the buffer length.

* Remove the accessing of pipe->dma_counter twice in the interrupt
  handler:

  The value will be changing between accesses. It doesn't look like
  this could cause a bug in practice, assuming the value only goes up.
  Except perhaps if another thread were able to reset it to 0 on the
  second access because chip->lock is not held.

  This may improve the performance of the interrupt handler;
  dma_counter is volatile so access is slow.

The resulting interrupt handling resembles more closely the pattern in
the kernel "Writing an ALSA driver" documentation.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio.c | 80 +++++++++++++++++++++------------
 sound/pci/echoaudio/echoaudio.h |  1 -
 2 files changed, 52 insertions(+), 29 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 8cf08988959f..12217649fb44 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2,6 +2,7 @@
 /*
  *  ALSA driver for Echoaudio soundcards.
  *  Copyright (C) 2003-2004 Giuliano Pochini <pochini@shiny.it>
+ *  Copyright (C) 2020 Mark Hills <mark@xwax.org>
  */
 
 #include <linux/module.h>
@@ -590,7 +591,6 @@ static int init_engine(struct snd_pcm_substream *substream,
 	/* This stuff is used by the irq handler, so it must be
 	 * initialized before chip->substream
 	 */
-	chip->last_period[pipe_index] = 0;
 	pipe->last_counter = 0;
 	pipe->position = 0;
 	smp_wmb();
@@ -759,7 +759,6 @@ static int pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 				pipe = chip->substream[i]->runtime->private_data;
 				switch (pipe->state) {
 				case PIPE_STATE_STOPPED:
-					chip->last_period[i] = 0;
 					pipe->last_counter = 0;
 					pipe->position = 0;
 					*pipe->dma_counter = 0;
@@ -807,19 +806,8 @@ static snd_pcm_uframes_t pcm_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct audiopipe *pipe = runtime->private_data;
-	size_t cnt, bufsize, pos;
 
-	cnt = le32_to_cpu(*pipe->dma_counter);
-	pipe->position += cnt - pipe->last_counter;
-	pipe->last_counter = cnt;
-	bufsize = substream->runtime->buffer_size;
-	pos = bytes_to_frames(substream->runtime, pipe->position);
-
-	while (pos >= bufsize) {
-		pipe->position -= frames_to_bytes(substream->runtime, bufsize);
-		pos -= bufsize;
-	}
-	return pos;
+	return bytes_to_frames(runtime, pipe->position);
 }
 
 
@@ -1782,14 +1770,50 @@ static const struct snd_kcontrol_new snd_echo_channels_info = {
 
 
 /******************************************************************************
-	IRQ Handler
+	IRQ Handling
 ******************************************************************************/
 
+/* Update software pointer to match the hardware
+ *
+ * Return: 1 if we crossed a period threshold, otherwise 0
+ */
+static int snd_echo_poll_substream(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct audiopipe *pipe = runtime->private_data;
+	unsigned counter, step, period, last_period;
+	size_t buffer_bytes;
+
+	if (pipe->state != PIPE_STATE_STARTED)
+		return 0;
+
+	counter = le32_to_cpu(*pipe->dma_counter);
+
+	period = bytes_to_frames(runtime, counter)
+		/ runtime->period_size;
+	last_period = bytes_to_frames(runtime, pipe->last_counter)
+		/ runtime->period_size;
+
+	if (period == last_period)
+		return 0;  /* don't do any work yet */
+
+	step = counter - pipe->last_counter;
+	pipe->last_counter = counter;
+
+	pipe->position += step;  /* bytes */
+
+	buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
+
+	while (pipe->position >= buffer_bytes)
+		pipe->position -= buffer_bytes;
+
+	return 1;
+}
+
 static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
 {
 	struct echoaudio *chip = dev_id;
-	struct snd_pcm_substream *substream;
-	int period, ss, st;
+	int ss, st;
 
 	spin_lock(&chip->lock);
 	st = service_irq(chip);
@@ -1800,18 +1824,18 @@ static irqreturn_t snd_echo_interrupt(int irq, void *dev_id)
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
-		}
+		if (!substream)
+			continue;
+
+		if (!snd_echo_poll_substream(substream))
+			continue;
+
+		spin_unlock(&chip->lock);
+		snd_pcm_period_elapsed(substream);
+		spin_lock(&chip->lock);
 	}
 	spin_unlock(&chip->lock);
 
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 6fd283e4e676..7ff5d4de6880 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -332,7 +332,6 @@ struct audioformat {
 struct echoaudio {
 	spinlock_t lock;
 	struct snd_pcm_substream *substream[DSP_MAXPIPES];
-	int last_period[DSP_MAXPIPES];
 	struct mutex mode_mutex;
 	u16 num_digital_modes, digital_mode_list[6];
 	u16 num_clock_sources, clock_source_list[10];
-- 
2.17.5

