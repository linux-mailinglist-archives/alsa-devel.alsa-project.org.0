Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A8938F87
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916087F4;
	Mon, 22 Jul 2024 15:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916087F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653230;
	bh=xO1ybirnwHc/5PYbnp8br6AI3nTAS/ZKlIeSt8WCIZk=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kx+J8/x015AeH3r+gfHUNfFsjrMObN/3200yoVHA3S8p/1yPr9VjBWM3H5yoYLg0F
	 AKvp7hLSjrKbwWlDVs1+n4mVzCJhhwinO8Ev606tk/VOxHUmaUnA99UqqXKNV06VvU
	 I9vNZDr/1QlLTbMi8on1tz12xHWB461h0kLV2khA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6804F80600; Mon, 22 Jul 2024 14:59:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 489DFF805FC;
	Mon, 22 Jul 2024 14:59:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 616D5F8026D; Thu, 18 Jul 2024 13:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch
 [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6721F8007E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 13:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6721F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=YoDfyPfB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721303818; x=1721563018;
	bh=0IgroBuJlaGzNroVwV8aEok8gKxHNerwJQw2E/oX80E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YoDfyPfBqD0sUU5Uk00Xy4E8TgUjWcOGrjWalEaYZHesMTsEKxvUqKrJGUbwUcQjd
	 pKLEvLtS0853RsSakHwHkT8hbyAZ7yzjz2i8s83h+j2OS5wLQxJH+uUzuOLHGwWRiR
	 TQY2Fmor4Qq9zY7nRYlIX4SNhT4nliVD+BO+B1Y5GwoYyv6WVq3jO7D5KrX+BbIPhz
	 Wi1gOxrVyfVpktqpyEU6j9nb2HEw1OBS3CZzDvB7O4+RPNlxH3mUZJFRs35hWYKpwk
	 HTzKPPBXMomh1AdApZybDZt6Yho3721FT+Zxnuf3QFr+q/lS8wKyC7UzdT4ErVGk5p
	 rI4brd9Udt+UQ==
Date: Thu, 18 Jul 2024 11:56:54 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@proton.me>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Edmund Raile <edmund.raile@proton.me>
Subject: [PATCH] ALSA: firewire-lib: restore process context workqueue to
 prevent deadlock
Message-ID: <20240718115637.12816-1-edmund.raile@proton.me>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: 5f36b356ef27217606fffea2ecf7f96514ee86eb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TVSFEFOE74PAXGUI4RJD4SQEBWNWMJ35
X-Message-ID-Hash: TVSFEFOE74PAXGUI4RJD4SQEBWNWMJ35
X-Mailman-Approved-At: Mon, 22 Jul 2024 12:59:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVSFEFOE74PAXGUI4RJD4SQEBWNWMJ35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit b5b519965c4c ("ALSA: firewire-lib: operate for period elapse event
in process context") removed the process context workqueue from
amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
its overhead.

With RME Fireface 800, this lead to a regression since Kernels 5.14.0,
causing a deadlock with eventual system freeze under ALSA operation:

? tasklet_unlock_spin_wait
 </NMI>
 <TASK>
ohci_flush_iso_completions firewire_ohci
amdtp_domain_stream_pcm_pointer snd_firewire_lib
snd_pcm_update_hw_ptr0 snd_pcm
snd_pcm_status64 snd_pcm

? native_queued_spin_lock_slowpath
 </NMI>
 <IRQ>
_raw_spin_lock_irqsave
snd_pcm_period_elapsed snd_pcm
process_rx_packets snd_firewire_lib
irq_target_callback snd_firewire_lib
handle_it_packet firewire_ohci
context_tasklet firewire_ohci

Restore the work queue to prevent deadlock between ALSA substream
process context spin_lock of snd_pcm_stream_lock_irq() in snd_pcm_status64(=
)
and OHCI 1394 IT softIRQ context spin_lock of snd_pcm_stream_lock_irqsave()
in snd_pcm_period_elapsed().

to reproduce the issue:
direct ALSA playback to the device:
  mpv --audio-device=3Dalsa/sysdefault:CARD=3DFireface800 Spor-Ignition.fla=
c
Time to occurrence: 2s to 30m
Likelihood increased by:
  - high CPU load
    stress --cpu $(nproc)
  - switching between applications via workspaces
    tested with i915 in Xfce
PulsaAudio / PipeWire conceal the issue as they run PCM substream
without period wakeup mode, issuing less hardIRQs.

Closes: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynl=
jztxqwg76hzeo4simnl@jn3eo7pe642q/T/#u
Fixes: 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event i=
n process context")
Signed-off-by: Edmund Raile <edmund.raile@proton.me>
---
This is the follow-up patch to the 5.14.0 regression I reported:
https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg7=
6hzeo4simnl@jn3eo7pe642q/T/#u
("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with Fir=
eface 800")

Takashi Sakamoto explained the issue in his response to the regression:
A. In the process context
    * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
               snd_pcm_status64()
    * (lock B) Then attempt to enter tasklet

B. In the softIRQ context
    * (lock B) Enter tasklet
    * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsave(=
) in
               snd_pcm_period_elapsed()

This leads me to believe this isn't just an issue limited to the RME Firefa=
ce

driver (snd_fireface), though I can not test the other devices.
 sound/firewire/amdtp-stream.c | 32 +++++++++++++++++++++-----------
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index d35d0a420ee0..77b99a2117f4 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -77,6 +77,8 @@
 // overrun. Actual device can skip more, then this module stops the packet=
 streaming.
 #define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES=095
=20
+static void pcm_period_work(struct work_struct *work);
+
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
  * @s: the AMDTP stream to initialize
@@ -105,6 +107,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw=
_unit *unit,
 =09s->flags =3D flags;
 =09s->context =3D ERR_PTR(-1);
 =09mutex_init(&s->mutex);
+=09INIT_WORK(&s->period_work, pcm_period_work);
 =09s->packet_index =3D 0;
=20
 =09init_waitqueue_head(&s->ready_wait);
@@ -347,6 +350,7 @@ EXPORT_SYMBOL(amdtp_stream_get_max_payload);
  */
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 {
+=09cancel_work_sync(&s->period_work);
 =09s->pcm_buffer_pointer =3D 0;
 =09s->pcm_period_pointer =3D 0;
 }
@@ -611,19 +615,21 @@ static void update_pcm_pointers(struct amdtp_stream *=
s,
 =09=09// The program in user process should periodically check the status =
of intermediate
 =09=09// buffer associated to PCM substream to process PCM frames in the b=
uffer, instead
 =09=09// of receiving notification of period elapsed by poll wait.
-=09=09if (!pcm->runtime->no_period_wakeup) {
-=09=09=09if (in_softirq()) {
-=09=09=09=09// In software IRQ context for 1394 OHCI.
-=09=09=09=09snd_pcm_period_elapsed(pcm);
-=09=09=09} else {
-=09=09=09=09// In process context of ALSA PCM application under acquired l=
ock of
-=09=09=09=09// PCM substream.
-=09=09=09=09snd_pcm_period_elapsed_under_stream_lock(pcm);
-=09=09=09}
-=09=09}
+=09=09if (!pcm->runtime->no_period_wakeup)
+=09=09=09queue_work(system_highpri_wq, &s->period_work);
 =09}
 }
=20
+static void pcm_period_work(struct work_struct *work)
+{
+=09struct amdtp_stream *s =3D container_of(work, struct amdtp_stream,
+=09=09=09=09=09      period_work);
+=09struct snd_pcm_substream *pcm =3D READ_ONCE(s->pcm);
+=09
+=09if (pcm)
+=09=09snd_pcm_period_elapsed(pcm);
+}
+
 static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *para=
ms,
 =09=09=09bool sched_irq)
 {
@@ -1854,7 +1860,10 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct=
 amdtp_domain *d,
 =09if (irq_target && amdtp_stream_running(irq_target)) {
 =09=09// In software IRQ context, the call causes dead-lock to disable the=
 tasklet
 =09=09// synchronously.
-=09=09if (!in_softirq())
+=09=09// workqueue serves to prevent deadlock between process context spin=
lock
+=09=09// of snd_pcm_stream_lock_irq() in snd_pcm_status64() and softIRQ sp=
inlock
+=09=09// of snd_pcm_stream_lock_irqsave() in snd_pcm_period_elapsed()
+=09=09if ((!in_softirq()) && (current_work() !=3D &s->period_work))
 =09=09=09fw_iso_context_flush_completions(irq_target->context);
 =09}
=20
@@ -1910,6 +1919,7 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 =09=09return;
 =09}
=20
+=09cancel_work_sync(&s->period_work);
 =09fw_iso_context_stop(s->context);
 =09fw_iso_context_destroy(s->context);
 =09s->context =3D ERR_PTR(-1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a1ed2e80f91a..775db3fc4959 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -191,6 +191,7 @@ struct amdtp_stream {
=20
 =09/* For a PCM substream processing. */
 =09struct snd_pcm_substream *pcm;
+=09struct work_struct period_work;
 =09snd_pcm_uframes_t pcm_buffer_pointer;
 =09unsigned int pcm_period_pointer;
 =09unsigned int pcm_frame_multiplier;
--=20
2.45.2


