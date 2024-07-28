Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5E94299F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:52:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8817C2C54;
	Wed, 31 Jul 2024 10:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8817C2C54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415923;
	bh=zYeI0RXOOsfL8/wFCi+vO2omAPFQKXW51I6FzL+Chhs=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eJTIsU+YoOFVUTreHmtTP3Jvcs7QtMi0fxrC/Qhn9RwzD2way8WJgEv79EE+vQHQ6
	 L5uFiiLw0WauPWcNMW4OiLNcuK+HhXG87u2m2nk8dCP/dIlhJZXR0yXHHexEWn07ht
	 XDIZTL1LhMUTzyDyY4gztuYycEvqyOjj/mqC/8y4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB95F806B6; Wed, 31 Jul 2024 10:49:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A51FF806DB;
	Wed, 31 Jul 2024 10:49:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD3A8F80448; Sun, 28 Jul 2024 14:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3A2DF8026A
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 14:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A2DF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=PNzFgFyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722169606; x=1722428806;
	bh=KBafj0W+hLUSbIhjE/xmSCOMhfBOVKrA7riUOgwT7ls=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PNzFgFyWb4p0LeN6x70PPWCBUc4WMARzJSh2GaQJphAhFKVNxAqFMS0HLNUXMMA50
	 6OcF86EhUGMNytJxoA7YUu1nEj0aJ0W9cTwGI4OXpOUy9jQIuWSogDD2ryNLiykApv
	 CJkMsLkt6bQWfj68IEIZvWtWoLO6exjhw+gH9D1iPWDEt7+dlc7jAwhBwM7Em+R7/U
	 EN1ea9PcF5ms7lIg6VyERaM4G9qCtc5jnUW7HKBHfwnb9X8XySsAeZFCVAqg2oZ4qP
	 +u44D1rBNlaNs0OBiNuaM+vtzl5OK4B2zwyu4O6Yv+lYP2WwM3fdyxLwFAtFpt0PIa
	 uAKcfJP1KesoA==
Date: Sun, 28 Jul 2024 12:26:39 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, edmund.raile@protonmail.com,
 stable@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: firewire-lib: prevent deadlock between process
 and softIRQ context
Message-ID: <20240728122614.329544-3-edmund.raile@protonmail.com>
In-Reply-To: <20240728122614.329544-1-edmund.raile@protonmail.com>
References: <20240728122614.329544-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: de55fd5e8a28ebd761c5c600cc8525dc8a590299
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2HWQ7IRNDDOCN5HGLTMJPAPKAO4DKKDP
X-Message-ID-Hash: 2HWQ7IRNDDOCN5HGLTMJPAPKAO4DKKDP
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HWQ7IRNDDOCN5HGLTMJPAPKAO4DKKDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event
in process context") removed the process context workqueue from
amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
its overhead.

With RME Fireface 800, this lead to a regression since Kernels 5.14.0,
causing a deadlock with eventual system freeze under ALSA operation:

A. In the process context
    * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
=09snd_pcm_status64()
    * (lock B) Then attempt to enter tasklet

B. In the softIRQ context
    * (lock B) Enter tasklet
    * (lock A) Attempt to acquire spin_lock by
=09snd_pcm_stream_lock_irqsave() in snd_pcm_period_elapsed()

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

Restore the process context work queue to prevent deadlock
between ALSA substream process context spin_lock of
snd_pcm_stream_lock_irq() in snd_pcm_status64()
and OHCI 1394 IT softIRQ context spin_lock of
snd_pcm_stream_lock_irqsave() in snd_pcm_period_elapsed().

Cc: stable@vger.kernel.org
Fixes: 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event i=
n process context")
Link: https://lore.kernel.org/r/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hze=
o4simnl@jn3eo7pe642q/
Reported-by: edmund.raile <edmund.raile@proton.me>
Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
---
 sound/firewire/amdtp-stream.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 31201d506a21..c037d7de1fdc 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -615,16 +615,9 @@ static void update_pcm_pointers(struct amdtp_stream *s=
,
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
+=09=09=09// wq used with amdtp_domain_stream_pcm_pointer() to prevent dead=
lock
+=09=09=09queue_work(system_highpri_wq, &s->period_work);
 =09}
 }
=20
@@ -1866,9 +1859,11 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct=
 amdtp_domain *d,
=20
 =09// Process isochronous packets queued till recent isochronous cycle to =
handle PCM frames.
 =09if (irq_target && amdtp_stream_running(irq_target)) {
-=09=09// In software IRQ context, the call causes dead-lock to disable the=
 tasklet
-=09=09// synchronously.
-=09=09if (!in_softirq())
+=09=09// use wq to prevent deadlock between process context spin_lock
+=09=09// of snd_pcm_stream_lock_irq() in snd_pcm_status64() and
+=09=09// softIRQ context spin_lock of snd_pcm_stream_lock_irqsave()
+=09=09// in snd_pcm_period_elapsed()
+=09=09if ((!in_softirq()) && (current_work() !=3D &s->period_work))
 =09=09=09fw_iso_context_flush_completions(irq_target->context);
 =09}
=20
--=20
2.45.2


