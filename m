Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAC933F3C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 17:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7FD7E64;
	Wed, 17 Jul 2024 17:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7FD7E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721228774;
	bh=KeDoAzW8i/Y3i7936SAkuWjEJbGb5eMjfD7AyUyRwaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AP9zpgkYxxIJMeySv6VQc7Zy8IFdAkeKenGEe3yeNjxA1gJhkmoB6R8gCVpaHxGzQ
	 i7+5Iw37EpFw/ELx5irrVK3tE0FJkO+uNQQyOThKhKITh9UkOMhwkwxPLsUYYSnYRK
	 tWbOBRgg/8LSJfMmZNrzLC7KMDS/O5oefphStzg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D91F805AB; Wed, 17 Jul 2024 17:05:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAAAF805AD;
	Wed, 17 Jul 2024 17:05:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2DCF8013D; Wed, 17 Jul 2024 16:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1F8EF8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2024 16:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F8EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=IbOnACKM;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aKP6NZ6d
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8E7EA1140104;
	Wed, 17 Jul 2024 10:46:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute8.internal (MEProxy); Wed, 17 Jul 2024 10:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1721227615; x=
	1721314015; bh=+pZLwcB7gksypKkwJE3+v8wQrFaE800JDIYphZSBSZc=; b=I
	bOnACKMfLvaQqDiNEosPsP9tYlgeQ8SQLiayt9EAh3XFxtzUMPqUlnuwybvXJFK7
	lQgiMHIIdmTEKd5P2WgbuCkzgt2m2YBmQ8Gjpd4iyM6kjz54RJMsyOlCp3jS/WGN
	77+lr7+SGFSKDlbTLqx35rbpl4/+GMr9ih/OgRAh+5BL+HEutVfja3dCbeyTnCdu
	BpzGuVW5VynUY26m77TNfEQKW/a0JdQ2a7kUmpoH4Y8DXfvkZ6zt6wJz4By3hnhA
	WyqnFAVUYJCtMehlMFoonjyjdJHVHEPcXQvxvoduIgs/75a881KGq9dHLvy+vwc0
	ZQ9JjTlj5kyKWQ/nUc7ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721227615; x=1721314015; bh=+pZLwcB7gksypKkwJE3+v8wQrFaE
	800JDIYphZSBSZc=; b=aKP6NZ6dCsDrN3q611VymOYRqkF1Jl8DEDgcjyHXMbgv
	5rysWDWq0fmNXwabdZblOy9WfgdEX53D+HijOKDviEsWxm9f1tjTQYNUaKDAm3Tm
	W9GC56TU9I2bMfLwwVxz587AvmV1EAEUhzMA0D2O3ONS87GClQNpVparbKwc+tPg
	8raEdF+hUIr40AS+jY11tYaqFj6yLHvPcBEqPegouSREMeUfMZocNB5+q2bSmrAR
	hN8U01pfzUMNqO6upiOn7GubO5Q8mqQfSY7+q8RKMQMnf+EP2PHpPS0N5lJmMq5n
	S02giDERDZsM3LGxC/fneDSC01f5chCLg6j0IeZh/A==
X-ME-Sender: <xms:XdmXZmEZXyVz07_0tVWtQ7OmDqouv1YhkSYIiC7Ss-JoTSQL5rZ-MA>
    <xme:XdmXZnUQrSUZ2DrpASue3hZkeyr8qrlYcum24L6KMghG_vliByWqqTrB2mq6-3-9q
    kGH4mgxmp36eCAQ7J8>
X-ME-Received: 
 <xmr:XdmXZgJ4tSBKx5Q3dh7nCHN_lNofBPE-14esdiJhRIP1IcSfpYdWGey5HySnb_nkKaZYi5TJUI_EQnW45PwiwekAKpkviL3wgIRy>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrgeeigdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
    shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephfelfeegve
    elheekteefleejgefflefhtdejveevfeejgeeggeduudeiudehuefhnecuffhomhgrihhn
    pehrmhgvqdgruhguihhordguvgdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgr
    mhhotggthhhirdhjph
X-ME-Proxy: <xmx:XdmXZgFR0ZlH5ocs3dot08jt-3EeezYcAhfXkmpdqzB80lXFAgo0yg>
    <xmx:XdmXZsUnFlTyTv8PWOdet8Db4cbOpupmMvwUnHvTbihB1SzdYmB-lg>
    <xmx:XdmXZjOJrLWPbnuT1zZkio5Y3ShD7ALnyPTEXC-0NpHbN_NEhc7oQg>
    <xmx:XdmXZj3OW4Vnp-ba2J0iPBcEJJz_ddXul78dVNvGwFfklznfi7DLrg>
    <xmx:X9mXZvGhfzLbzxP1MviTF63G065GQhgxw4Z5VJSU-bl0XRJOMM8puhfk>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jul 2024 10:46:51 -0400 (EDT)
Date: Wed, 17 Jul 2024 23:46:49 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "edmund.raile" <edmund.raile@proton.me>
Cc: stable@vger.kernel.org, alsa-devel@alsa-project.org,
	regressions@lists.linux.dev, tiwai@suse.de, clemens@ladisch.de,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock
 with Fireface 800
Message-ID: <20240717144649.GA317903@workstation.local>
Mail-Followup-To: "edmund.raile" <edmund.raile@proton.me>,
	stable@vger.kernel.org, alsa-devel@alsa-project.org,
	regressions@lists.linux.dev, tiwai@suse.de, clemens@ladisch.de,
	linux-sound@vger.kernel.org
References: <kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q>
Message-ID-Hash: HYUZCMDYIXR5377JP3NS67FRONNNRAEJ
X-Message-ID-Hash: HYUZCMDYIXR5377JP3NS67FRONNNRAEJ
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYUZCMDYIXR5377JP3NS67FRONNNRAEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Thanks for the regression report, and I'm sorry for your inconvenience.

On Tue, Jul 16, 2024 at 02:51:24PM +0000, edmund.raile wrote:
> On kernels since 5.14.0, ALSA playback to the FireWire RME Fireface 800
> audio interface results in a deadlock involving snd_pcm_period_elapsed(),
> freezing the system.
> 
> On kernels 5.0.0 to 5.13.19 the interface works just fine, as it does with
> the RME driver.
> 
> Distributions tested:
> Ubuntu
> Manjaro
> Arch
> Fedora
> 
> FireWire chipsets tested:
> LSI FW643
> TI XIO2213B
> 
> Platforms tested:
> Intel i5 4570 on AsRock H97 Pro4
> Intel i5 12600K on MSI MS-7D25
> 
> The behavior was also observed on the RME forum:
> https://forum.rme-audio.de/viewtopic.php?pid=190472#p190472
> 
> Shortened traces of 6.10.0-rc7 (Arch linux-mainline):
> 
> RIP: 0010:tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/softirq.c:851) 
>  <NMI>
> ? watchdog_hardlockup_check.cold (kernel/watchdog.c:200) 
> ? __perf_event_overflow (kernel/events/core.c:9737 (discriminator 2)) 
> ? handle_pmi_common (arch/x86/events/intel/core.c:3061 (discriminator 1)) 
> ? intel_pmu_handle_irq (./arch/x86/include/asm/paravirt.h:192 arch/x86/events/intel/core.c:2428 arch/x86/events/intel/core.c:3127) 
> ? perf_event_nmi_handler (arch/x86/events/core.c:1744 arch/x86/events/core.c:1730) 
> ? nmi_handle (arch/x86/kernel/nmi.c:151) 
> ? default_do_nmi (arch/x86/kernel/nmi.c:352 (discriminator 61)) 
> ? exc_nmi (arch/x86/kernel/nmi.c:546) 
> ? end_repeat_nmi (arch/x86/entry/entry_64.S:1408) 
> ? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/softirq.c:851) 
> ? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/softirq.c:851) 
> ? tasklet_unlock_spin_wait (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/softirq.c:851) 
>  </NMI>
>  <TASK>
> ohci_flush_iso_completions (./include/linux/interrupt.h:740 drivers/firewire/ohci.c:3530) firewire_ohci
> amdtp_domain_stream_pcm_pointer (sound/firewire/amdtp-stream.c:1858) snd_firewire_lib
> snd_pcm_update_hw_ptr0 (sound/core/pcm_lib.c:304) snd_pcm
> snd_pcm_status64 (sound/core/pcm_native.c:1034) snd_pcm
> snd_pcm_status_user64 (./include/linux/uaccess.h:191 sound/core/pcm_native.c:1096) snd_pcm
> snd_pcm_ioctl (sound/core/pcm_native.c:3401 (discriminator 1)) snd_pcm
> __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:907 fs/ioctl.c:893 fs/ioctl.c:893) 
> do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
> ? snd_pcm_status_user64 (sound/core/pcm_native.c:1096 (discriminator 1)) snd_pcm
> ? futex_wake (kernel/futex/waitwake.c:173) 
> ? do_futex (kernel/futex/syscalls.c:107 (discriminator 1)) 
> ? __x64_sys_futex (kernel/futex/syscalls.c:179 kernel/futex/syscalls.c:160 kernel/futex/syscalls.c:160) 
> ? syscall_exit_to_user_mode (kernel/entry/common.c:221) 
> ? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/common.c:98) 
> ? do_futex (kernel/futex/syscalls.c:107 (discriminator 1)) 
> ? __x64_sys_futex (kernel/futex/syscalls.c:179 kernel/futex/syscalls.c:160 kernel/futex/syscalls.c:160) 
> ? syscall_exit_to_user_mode (kernel/entry/common.c:221) 
> ? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/common.c:98) 
> ? syscall_exit_to_user_mode (kernel/entry/common.c:221) 
> ? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/common.c:98) 
> ? do_syscall_64 (./arch/x86/include/asm/cpufeature.h:178 arch/x86/entry/common.c:98) 
> ? __irq_exit_rcu (kernel/softirq.c:620 (discriminator 1) kernel/softirq.c:639 (discriminator 1)) 
> entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> 
> RIP: 0010:native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discriminator 3)) 
>  <NMI>
> ? watchdog_hardlockup_check.cold (kernel/watchdog.c:200) 
> ? __perf_event_overflow (kernel/events/core.c:9737 (discriminator 2)) 
> ? handle_pmi_common (arch/x86/events/intel/core.c:3061 (discriminator 1)) 
> ? intel_pmu_handle_irq (./arch/x86/include/asm/paravirt.h:192 arch/x86/events/intel/core.c:2428 arch/x86/events/intel/core.c:3127) 
> ? perf_event_nmi_handler (arch/x86/events/core.c:1744 arch/x86/events/core.c:1730) 
> ? nmi_handle (arch/x86/kernel/nmi.c:151) 
> ? default_do_nmi (arch/x86/kernel/nmi.c:352 (discriminator 61)) 
> ? exc_nmi (arch/x86/kernel/nmi.c:546) 
> ? end_repeat_nmi (arch/x86/entry/entry_64.S:1408) 
> ? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discriminator 3)) 
> ? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discriminator 3)) 
> ? native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:380 (discriminator 3)) 
>  </NMI>
>  <IRQ>
> _raw_spin_lock_irqsave (./arch/x86/include/asm/paravirt.h:584 ./arch/x86/include/asm/qspinlock.h:51 ./include/asm-generic/qspinlock.h:114 ./include/linux/spinlock.h:187 ./include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
> snd_pcm_period_elapsed (sound/core/pcm_lib.c:1905) snd_pcm
> process_rx_packets (sound/firewire/amdtp-stream.c:1164) snd_firewire_lib
> irq_target_callback (sound/firewire/amdtp-stream.c:1549) snd_firewire_lib
> handle_it_packet (drivers/firewire/ohci.c:2786 drivers/firewire/ohci.c:2974) firewire_ohci
> context_tasklet (drivers/firewire/ohci.c:1127) firewire_ohci
> tasklet_action_common.isra.0 (kernel/softirq.c:789) 
> handle_softirqs (kernel/softirq.c:554) 
> __irq_exit_rcu (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:637) 
> common_interrupt (arch/x86/kernel/irq.c:278 (discriminator 35)) 
>  </IRQ>
>  <TASK>
> asm_common_interrupt (./arch/x86/include/asm/idtentry.h:693) 
> 
> It can be induced by direct ALSA playback to the device:
> mpv --audio-device=alsa/sysdefault:CARD=Fireface800 Spor-Ignition.flac
> Time to occurrence ranges from two seconds to 30 minutes.
> 
> Loading the CPU appears to increase the likelihood:
> stress --cpu $(nproc)
> So does switching between applications via workspaces (only tested Xfce).
> 
> The regression has been traced to these two commits:
> 7ba5ca32fe6e8d2e153fb5602997336517b34743
> b5b519965c4c364ae65c49fe9f11d222dd70a9c2
> 
> I am currently testing a simple patch, in essence reverting both commits.
> Behaves well so far (stable), will likely send it in tomorrow.
> 
> #regzbot introduced: 7ba5ca32fe6e

As long as reading the call trace, the issue is indeed deadlock between
the process and softIRQ (tasklet) contexts against the group lock for ALSA
PCM substream and the tasklet for OHCI 1394 IT context.

A. In the process context
    * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
               snd_pcm_status64()
    * (lock B) Then attempt to enter tasklet

B. In the softIRQ context
    * (lock B) Enter tasklet
    * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsave() in
               snd_pcm_period_elapsed()

It is the same issue as you reported in test branch for bh workqueue[1].

I think the users rarely face the issue when working with either PipeWire
or PulseAudio, since these processes run with no period wakeup mode of
runtime for PCM substream (thus with less hardIRQ).

Anyway, it is one of solutions to revert both a commit b5b519965c4c ("ALSA:
firewire-lib: obsolete workqueue for period update") and a commit
7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event in
process context"). The returned workqueue is responsible for lock A, thus:

A. In the process context
    * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
               snd_pcm_status64()
    * (lock B) Then attempt to enter tasklet

B. In the softIRQ context
    * (lock B) Enter tasklet
    * schedule workqueue

C. another process context (workqueue)
    * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsave()
               in snd_pcm_period_elapsed()

The deadlock would not occur.

[1] https://github.com/allenpais/for-6.9-bh-conversions/issues/1


Regards

Takashi Sakamoto
