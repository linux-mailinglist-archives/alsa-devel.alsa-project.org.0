Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3525BF58
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 729951691;
	Thu,  3 Sep 2020 12:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 729951691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130111;
	bh=zUU+BwCS1hadZ3lnsdUfcFEROQ9zVY/8IIEjNSJCE1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFuW3hRQ5Qxy25VBcCVvNfQlvt67IYq57ND9F1RfV4Q+Fzsc2GlYiAaW3jC1dDnsc
	 2bjKZjo1Js+8UGrdlTMKOITucZCc5Wy1Bar9b+s6P8U5KX526YZmmu/LDoU7otCnq1
	 qwqLgVbSFyxdKmuA+r5xN+jif9nomGwzmRGdBRLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B040FF80322;
	Thu,  3 Sep 2020 12:42:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C187F802BC; Thu,  3 Sep 2020 12:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED37FF802C4
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED37FF802C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CE9EB15E;
 Thu,  3 Sep 2020 10:41:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ALSA: firewire: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:41:30 +0200
Message-Id: <20200903104131.21097-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104131.21097-1-tiwai@suse.de>
References: <20200903104131.21097-1-tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In FireWire driver, a tasklet is
still used for offloading the AMDTP PCM stream handling.  It can be
achieved gracefully with a work queued, too.

This patch replaces the tasklet usage in firewire-lib driver with a
simple work.  The conversion is fairly straightforward but for the
in_interrupt() checks that are replaced with the check using the
current_work().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/amdtp-stream-trace.h |  2 +-
 sound/firewire/amdtp-stream.c       | 25 +++++++++++++------------
 sound/firewire/amdtp-stream.h       |  2 +-
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 26e7cb555d3c..5386d548cada 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -49,7 +49,7 @@ TRACE_EVENT(amdtp_packet,
 		__entry->data_blocks = data_blocks;
 		__entry->data_block_counter = data_block_counter,
 		__entry->packet_index = s->packet_index;
-		__entry->irq = !!in_interrupt();
+		__entry->irq = (current_work() == &s->period_work);
 		__entry->index = index;
 	),
 	TP_printk(
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ee1c428b1fd3..4e2f2bb7879f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,7 +64,7 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
-static void pcm_period_tasklet(struct tasklet_struct *t);
+static void pcm_period_work(struct work_struct *work);
 
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
@@ -94,7 +94,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->flags = flags;
 	s->context = ERR_PTR(-1);
 	mutex_init(&s->mutex);
-	tasklet_setup(&s->period_tasklet, pcm_period_tasklet);
+	INIT_WORK(&s->period_work, pcm_period_work);
 	s->packet_index = 0;
 
 	init_waitqueue_head(&s->callback_wait);
@@ -203,7 +203,7 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 
 	// Linux driver for 1394 OHCI controller voluntarily flushes isoc
 	// context when total size of accumulated context header reaches
-	// PAGE_SIZE. This kicks tasklet for the isoc context and brings
+	// PAGE_SIZE. This kicks work for the isoc context and brings
 	// callback in the middle of scheduled interrupts.
 	// Although AMDTP streams in the same domain use the same events per
 	// IRQ, use the largest size of context header between IT/IR contexts.
@@ -333,7 +333,7 @@ EXPORT_SYMBOL(amdtp_stream_get_max_payload);
  */
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 {
-	tasklet_kill(&s->period_tasklet);
+	cancel_work_sync(&s->period_work);
 	s->pcm_buffer_pointer = 0;
 	s->pcm_period_pointer = 0;
 }
@@ -437,13 +437,14 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 	s->pcm_period_pointer += frames;
 	if (s->pcm_period_pointer >= pcm->runtime->period_size) {
 		s->pcm_period_pointer -= pcm->runtime->period_size;
-		tasklet_hi_schedule(&s->period_tasklet);
+		queue_work(system_highpri_wq, &s->period_work);
 	}
 }
 
-static void pcm_period_tasklet(struct tasklet_struct *t)
+static void pcm_period_work(struct work_struct *work)
 {
-	struct amdtp_stream *s = from_tasklet(s, t, period_tasklet);
+	struct amdtp_stream *s = container_of(work, struct amdtp_stream,
+					      period_work);
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 
 	if (pcm)
@@ -794,7 +795,7 @@ static void generate_pkt_descs(struct amdtp_stream *s, struct pkt_desc *descs,
 static inline void cancel_stream(struct amdtp_stream *s)
 {
 	s->packet_index = -1;
-	if (in_interrupt())
+	if (current_work() == &s->period_work)
 		amdtp_stream_pcm_abort(s);
 	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
 }
@@ -1184,7 +1185,7 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 
 	if (irq_target && amdtp_stream_running(irq_target)) {
 		// This function is called in software IRQ context of
-		// period_tasklet or process context.
+		// period_work or process context.
 		//
 		// When the software IRQ context was scheduled by software IRQ
 		// context of IT contexts, queued packets were already handled.
@@ -1195,9 +1196,9 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 		// immediately to keep better granularity of PCM pointer.
 		//
 		// Later, the process context will sometimes schedules software
-		// IRQ context of the period_tasklet. Then, no need to flush the
+		// IRQ context of the period_work. Then, no need to flush the
 		// queue by the same reason as described in the above
-		if (!in_interrupt()) {
+		if (current_work() != &s->period_work) {
 			// Queued packet should be processed without any kernel
 			// preemption to keep latency against bus cycle.
 			preempt_disable();
@@ -1263,7 +1264,7 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 		return;
 	}
 
-	tasklet_kill(&s->period_tasklet);
+	cancel_work_sync(&s->period_work);
 	fw_iso_context_stop(s->context);
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 703b710aaf7f..2ceb57d1d58e 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -163,7 +163,7 @@ struct amdtp_stream {
 
 	/* For a PCM substream processing. */
 	struct snd_pcm_substream *pcm;
-	struct tasklet_struct period_tasklet;
+	struct work_struct period_work;
 	snd_pcm_uframes_t pcm_buffer_pointer;
 	unsigned int pcm_period_pointer;
 
-- 
2.16.4

