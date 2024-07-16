Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A8933A11
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C134AE8E;
	Wed, 17 Jul 2024 11:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C134AE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721209055;
	bh=0IzSqzjHm9x5m187QXF1kulFH3ei6LhKoz2o7u+RAwQ=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=duntEn+BKuA2y26ID52kUoIv+0RKZdE0wdpxbtyc3eYiyoAV9VMrNuz6izr/ZDrgf
	 5abHRw3NE07FZpqsoZmUJ4vc01xyy9HU17KQhjr49P+RmwtljigDKlW0NpeqocJ0lB
	 xup1Y6HWR2OABL+S0Pyyn6+bQT87DqKGOuuC4xJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12AE5F806D5; Wed, 17 Jul 2024 11:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B559F806D1;
	Wed, 17 Jul 2024 11:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D5F7F8026D; Tue, 16 Jul 2024 16:51:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DC353F801C0
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 16:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC353F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=nYjZo258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721141491; x=1721400691;
	bh=0IzSqzjHm9x5m187QXF1kulFH3ei6LhKoz2o7u+RAwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nYjZo258xx8plk+L8sIJ7RmHHIqEeQkd7MyGPeqSCvVcAFI/pSe2lJ0O2TbHHQwQz
	 AGQOVMBokP3KKUVBFF0xBK3QE2NO9t8bq6cecYiSoL0EeQwJXHTumaSMtlJOuaLBPT
	 c8Oc9EXifS73a6rEUzH2suZrAHav3ZjSctZZJR5bPEmRNxiPAYAccj3qsuhm/cWub7
	 3lB4tb8GQI7xVv0+f2AK6dR/mArBeyxpQ48dF2U2v7c3Wj5RsIamUUqjqT63aULstP
	 dgFuueNl+GNY5/jSJf+0keXBIiaguPx5VEsdGO7hdoPBmnjHXpg7dzvT5iP3hsS2hT
	 XHULwPgMw7ZyQ==
Date: Tue, 16 Jul 2024 14:51:24 +0000
To: stable@vger.kernel.org, alsa-devel@alsa-project.org
From: "edmund.raile" <edmund.raile@proton.me>
Cc: regressions@lists.linux.dev, o-takashi@sakamocchi.jp, tiwai@suse.de,
 clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: [REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with
 Fireface 800
Message-ID: <kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: 7a57af81588e3f78a241bcd640e29c0bac2516e8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XWMJSDMIOVGD55LGUXR3TGFUUEURNXKO
X-Message-ID-Hash: XWMJSDMIOVGD55LGUXR3TGFUUEURNXKO
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:35:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWMJSDMIOVGD55LGUXR3TGFUUEURNXKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On kernels since 5.14.0, ALSA playback to the FireWire RME Fireface 800
audio interface results in a deadlock involving snd_pcm_period_elapsed(),
freezing the system.

On kernels 5.0.0 to 5.13.19 the interface works just fine, as it does with
the RME driver.

Distributions tested:
Ubuntu
Manjaro
Arch
Fedora

FireWire chipsets tested:
LSI FW643
TI XIO2213B

Platforms tested:
Intel i5 4570 on AsRock H97 Pro4
Intel i5 12600K on MSI MS-7D25

The behavior was also observed on the RME forum:
https://forum.rme-audio.de/viewtopic.php?pid=3D190472#p190472

Shortened traces of 6.10.0-rc7 (Arch linux-mainline):

RIP: 0010:tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./a=
rch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-=
non-atomic.h:142 kernel/softirq.c:851)=20
 <NMI>
? watchdog_hardlockup_check.cold (kernel/watchdog.c:200)=20
? __perf_event_overflow (kernel/events/core.c:9737 (discriminator 2))=20
? handle_pmi_common (arch/x86/events/intel/core.c:3061 (discriminator 1))=
=20
? intel_pmu_handle_irq (./arch/x86/include/asm/paravirt.h:192 arch/x86/even=
ts/intel/core.c:2428 arch/x86/events/intel/core.c:3127)=20
? perf_event_nmi_handler (arch/x86/events/core.c:1744 arch/x86/events/core.=
c:1730)=20
? nmi_handle (arch/x86/kernel/nmi.c:151)=20
? default_do_nmi (arch/x86/kernel/nmi.c:352 (discriminator 61))=20
? exc_nmi (arch/x86/kernel/nmi.c:546)=20
? end_repeat_nmi (arch/x86/entry/entry_64.S:1408)=20
? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/=
include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atom=
ic.h:142 kernel/softirq.c:851)=20
? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/=
include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atom=
ic.h:142 kernel/softirq.c:851)=20
? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/=
include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atom=
ic.h:142 kernel/softirq.c:851)=20
 </NMI>
 <TASK>
ohci_flush_iso_completions (./include/linux/interrupt.h:740 drivers/firewir=
e/ohci.c:3530) firewire_ohci
amdtp_domain_stream_pcm_pointer (sound/firewire/amdtp-stream.c:1858) snd_fi=
rewire_lib
snd_pcm_update_hw_ptr0 (sound/core/pcm_lib.c:304) snd_pcm
snd_pcm_status64 (sound/core/pcm_native.c:1034) snd_pcm
snd_pcm_status_user64 (./include/linux/uaccess.h:191 sound/core/pcm_native.=
c:1096) snd_pcm
snd_pcm_ioctl (sound/core/pcm_native.c:3401 (discriminator 1)) snd_pcm
__x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:907 fs/ioctl.c:893 fs/ioctl.c:893=
)=20
do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/=
common.c:83 (discriminator 1))=20
? snd_pcm_status_user64 (sound/core/pcm_native.c:1096 (discriminator 1)) sn=
d_pcm
? futex_wake (kernel/futex/waitwake.c:173)=20
? do_futex (kernel/futex/syscalls.c:107 (discriminator 1))=20
? __x64_sys_futex (kernel/futex/syscalls.c:179 kernel/futex/syscalls.c:160 =
kernel/futex/syscalls.c:160)=20
? syscall_exit_to_user_mode (kernel/entry/common.c:221)=20
? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/com=
mon.c:98)=20
? do_futex (kernel/futex/syscalls.c:107 (discriminator 1))=20
? __x64_sys_futex (kernel/futex/syscalls.c:179 kernel/futex/syscalls.c:160 =
kernel/futex/syscalls.c:160)=20
? syscall_exit_to_user_mode (kernel/entry/common.c:221)=20
? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/com=
mon.c:98)=20
? syscall_exit_to_user_mode (kernel/entry/common.c:221)=20
? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/com=
mon.c:98)=20
? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/com=
mon.c:98)=20
? __irq_exit_rcu (kernel/softirq.c:620 (discriminator 1) kernel/softirq.c:6=
39 (discriminator 1))=20
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)=20

RIP: 0010:native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 =
(discriminator 3))=20
 <NMI>
? watchdog_hardlockup_check.cold (kernel/watchdog.c:200)=20
? __perf_event_overflow (kernel/events/core.c:9737 (discriminator 2))=20
? handle_pmi_common (arch/x86/events/intel/core.c:3061 (discriminator 1))=
=20
? intel_pmu_handle_irq (./arch/x86/include/asm/paravirt.h:192 arch/x86/even=
ts/intel/core.c:2428 arch/x86/events/intel/core.c:3127)=20
? perf_event_nmi_handler (arch/x86/events/core.c:1744 arch/x86/events/core.=
c:1730)=20
? nmi_handle (arch/x86/kernel/nmi.c:151)=20
? default_do_nmi (arch/x86/kernel/nmi.c:352 (discriminator 61))=20
? exc_nmi (arch/x86/kernel/nmi.c:546)=20
? end_repeat_nmi (arch/x86/entry/entry_64.S:1408)=20
? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discrim=
inator 3))=20
? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discrim=
inator 3))=20
? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discrim=
inator 3))=20
 </NMI>
 <IRQ>
_raw_spin_lock_irqsave (./arch/x86/include/asm/paravirt.h:584 ./arch/x86/in=
clude/asm/qspinlock.h:51 ./include/asm-generic/qspinlock.h:114 ./include/li=
nux/spinlock.h:187 ./include/linux/spinlock_api_smp.h:111 kernel/locking/sp=
inlock.c:162)=20
snd_pcm_period_elapsed (sound/core/pcm_lib.c:1905) snd_pcm
process_rx_packets (sound/firewire/amdtp-stream.c:1164) snd_firewire_lib
irq_target_callback (sound/firewire/amdtp-stream.c:1549) snd_firewire_lib
handle_it_packet (drivers/firewire/ohci.c:2786 drivers/firewire/ohci.c:2974=
) firewire_ohci
context_tasklet (drivers/firewire/ohci.c:1127) firewire_ohci
tasklet_action_common.isra.0 (kernel/softirq.c:789)=20
handle_softirqs (kernel/softirq.c:554)=20
__irq_exit_rcu (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:=
637)=20
common_interrupt (arch/x86/kernel/irq.c:278 (discriminator 35))=20
 </IRQ>
 <TASK>
asm_common_interrupt (./arch/x86/include/asm/idtentry.h:693)=20

It can be induced by direct ALSA playback to the device:
mpv --audio-device=3Dalsa/sysdefault:CARD=3DFireface800 Spor-Ignition.flac
Time to occurrence ranges from two seconds to 30 minutes.

Loading the CPU appears to increase the likelihood:
stress --cpu $(nproc)
So does switching between applications via workspaces (only tested Xfce).

The regression has been traced to these two commits:
7ba5ca32fe6e8d2e153fb5602997336517b34743
b5b519965c4c364ae65c49fe9f11d222dd70a9c2

I am currently testing a simple patch, in essence reverting both commits.
Behaves well so far (stable), will likely send it in tomorrow.

#regzbot introduced: 7ba5ca32fe6e

