Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1594299C
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD75EE67;
	Wed, 31 Jul 2024 10:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD75EE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415896;
	bh=MAxeEGmgS9693J0PQhUIRbfqko2MsleF4u/sBRGsb4Y=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CCAXgaBYjzaxMFuWbDexmwt81QuLEHIdbonrICQb/2fmVx64l88eT0RWNfHyaXQFg
	 xXUhs2rWDnIhcSZXZ8JBy6HOARVVwOXqPKnyOde0oV2PnDblcHqpxIXlqRh+3Js2cp
	 ddjlIFQbz8awehkKia8o5LS3Evt3sqNeJAK1NJfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C04CF806A7; Wed, 31 Jul 2024 10:49:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1260F806BA;
	Wed, 31 Jul 2024 10:49:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CC20F80579; Sun, 28 Jul 2024 14:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03924F80269
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 14:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03924F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=svThna/8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722169588; x=1722428788;
	bh=74jrJoeOKYDJalJmIabOoA19hszvpDADNvzc31C/j48=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=svThna/84zGaTHZ4yVuXTMAPuIKprGMAJgK7BKsrz/2IJ3mtALCljNiP7PKoeeloi
	 9UZK7bQDnEYP7Dxy6bvH59KKLXVBUJkRVGmyGb+at+aSem6UZgzWEHL6xDkBKhbDLB
	 Fw/RczRop40p2PrH0pe1myvGS8NUKQ9J4b523FNjndbt6c4n318/c4Hpy+Ph5sWmmq
	 5ffzHo++EXN+j7+C1xr07rOYxCWzkxOilSJ9guvUci4RdebBwq6G2LmqP69+1DRSu3
	 bR37HpKHPxJ+cuuM3DDa8i82S0Emn4il8DmdF67z2h38/7ZqwoSIZBdhKvTO71HqrQ
	 D0Y68FqqhpLrQ==
Date: Sun, 28 Jul 2024 12:26:21 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, edmund.raile@protonmail.com,
 stable@vger.kernel.org
Subject: [PATCH v2 0/2] ALSA: firewire-lib: restore process context workqueue
 to prevent deadlock
Message-ID: <20240728122614.329544-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: 7405776f7170639ffa300581e17a2b4f23d866bf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S5LTA2X7LOVHTQM66N2TVPUPNGOGUDPM
X-Message-ID-Hash: S5LTA2X7LOVHTQM66N2TVPUPNGOGUDPM
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5LTA2X7LOVHTQM66N2TVPUPNGOGUDPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset serves to prevent a deadlock between
process context and softIRQ context:

A. In the process context
    * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
               snd_pcm_status64()
    * (lock B) Then attempt to enter tasklet

B. In the softIRQ context
    * (lock B) Enter tasklet
    * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsave(=
) in
               snd_pcm_period_elapsed()

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

The issue has been reported as a regression of kernel 5.14:
Link: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljz=
txqwg76hzeo4simnl@jn3eo7pe642q/T/#u
("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with
Fireface 800")

Commit 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event
in process context") removed the process context workqueue from
amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
its overhead.
Commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for period
update") belongs to the same patch series and removed
the now-unused workqueue entirely.

Though being observed on RME Fireface 800, this issue would affect all
Firewire audio interfaces using ohci amdtp + pcm streaming.

ALSA streaming, especially under intensive CPU load will reveal this issue
the soonest due to issuing more hardIRQs, with time to occurrence ranging
from 2 secons to 30 minutes after starting playback.

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

Backport note:
Also applies to and fixes on (tested):
6.10.2, 6.9.12, 6.6.43, 6.1.102, 5.15.164

Edmund Raile (2):
  ALSA: firewire-lib: restore workqueue for process context
  ALSA: firewire-lib: prevent deadlock between process and softIRQ
    context

 sound/firewire/amdtp-stream.c | 36 ++++++++++++++++++++++-------------
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 24 insertions(+), 13 deletions(-)

--=20
2.45.2


