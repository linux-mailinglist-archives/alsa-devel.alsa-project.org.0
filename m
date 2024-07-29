Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D129429B4
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE20E2D53;
	Wed, 31 Jul 2024 10:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE20E2D53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416097;
	bh=7qJtw/UvlNXcAPicePSmEwYf5d2bgVGEcAntS/y13O8=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YEsYexd3+uP08JDmXpTeA8dv3NYUEbmyPR0pGfURKZnU6qAqlaJMglRn8U2MzQBjW
	 T0elDuEjwunWNe8D3G0jsXUru3meEPNRQPyWBHzWie3SYnJgSmrYGdGo+mTRjomMw2
	 z1jW/nKfyWv8Sln0I3W0xy1IiY37g5zZhldMFOg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4E0F89636; Wed, 31 Jul 2024 10:50:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76419F896AA;
	Wed, 31 Jul 2024 10:50:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72787F8057A; Mon, 29 Jul 2024 23:54:16 +0200 (CEST)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7F2EF80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 23:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7F2EF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=pIjcGNld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722289330; x=1722548530;
	bh=HEq22jk5NAJ4QPno+5COoC2Tm/I0lDMtAHj74ZnsIdE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pIjcGNld7NYClv7ZkFK1RuWiP9F1tpLvRoLP8rGTifQhaNbE2GBiEKfS0E9Jz6V3r
	 ZE/ufTRFm8PSvOFbj3yOq9mQl9/LsEqa9KxZp/YQuto/+FM3YQQ16vr6F0riraSr+h
	 NAzivbXI8mDlQUbyUH353eQpXGee2TEwDXDDdOKlil81qMa8S6moLYkV68FpFFTYrA
	 6rVNtlcx3J2DvFV1h7efmOZJLADUI76I2QLzr3j3eQyBg4TQZ2fw+/2+dzxQqGM41U
	 t0l9gXkouECBB9mLpiNuJS5r+p4SE33xepLyX0rGuNSn6JD9oKSilei51kWXrASaDD
	 /0+iXpQ1Phnlg==
Date: Mon, 29 Jul 2024 21:42:02 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 0/3] ALSA: firewire-lib: restore process context workqueue
 to prevent deadlock
Message-ID: <20240729214149.752663-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: e00f443d75923ea0f965957ed92a6031714d5273
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O7R5LG7O26VHSZ35OKLJ7QMOCE7KZ3Q4
X-Message-ID-Hash: O7R5LG7O26VHSZ35OKLJ7QMOCE7KZ3Q4
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:50:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7R5LG7O26VHSZ35OKLJ7QMOCE7KZ3Q4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset serves to prevent an AB/BA deadlock:

thread 0:
    * (lock A) acquire substream lock by
=09snd_pcm_stream_lock_irq() in
=09snd_pcm_status64()
    * (lock B) wait for tasklet to finish by calling
    =09tasklet_unlock_spin_wait() in
=09tasklet_disable_in_atomic() in
=09ohci_flush_iso_completions() of ohci.c

thread 1:
    * (lock B) enter tasklet
    * (lock A) attempt to acquire substream lock,
    =09waiting for it to be released:
=09snd_pcm_stream_lock_irqsave() in
    =09snd_pcm_period_elapsed() in
=09update_pcm_pointers() in
=09process_ctx_payloads() in
=09process_rx_packets() of amdtp-stream.c

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

Cc: stable@vger.kernel.org
Backport note:
Also applies to and fixes on (tested):
6.10.2, 6.9.12, 6.6.43, 6.1.102, 5.15.164

Edmund Raile (3):
  Revert "ALSA: firewire-lib: obsolete workqueue for period update"
  Revert "ALSA: firewire-lib: operate for period elapse event in process
    context"
  ALSA: firewire-lib: amdtp-stream work queue inline description

 sound/firewire/amdtp-stream.c | 38 ++++++++++++++++++++++-------------
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

--=20
2.45.2


