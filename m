Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530493AA3C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 02:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54CEBE76;
	Wed, 24 Jul 2024 02:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54CEBE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721782378;
	bh=Ye/Uc2To1T0RkQ3SymcAf5UTBKbZVCr7TrpZJsXjvQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R2HPBlxfVg7U/cPhfmVsvJV1iQ5BZ8RneHNHFUYZkEJgk22OgDM7+90ilcODTbuVc
	 f7dGrgIICqTQnb85GxZYU6LrJ35Q1DE9eICgKyYBO+0uAW6+BSLyN5EASLGZEtdQb5
	 tXIDAOxxjd4G6qVNds4AzqC+l86qwWy5acLlM/Ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDABDF805C0; Wed, 24 Jul 2024 02:52:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC89F805AE;
	Wed, 24 Jul 2024 02:52:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD2F4F801F5; Wed, 24 Jul 2024 02:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54A23F800C9
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 02:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A23F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=XxC/R8fu;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VzxMX2nU
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B3D5A114012D;
	Tue, 23 Jul 2024 20:44:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 23 Jul 2024 20:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1721781890; x=
	1721868290; bh=vNBWihlvNfIQ2dxVTaX54UXFf+AZdOglks4OXNVTmIo=; b=X
	xC/R8fu5MsxT0Mn7UAI/b+dbAfZC4CLXgYWiPHR58UOrLpK9ytF6EhV+1JgFw4DH
	wNTm+TTzM8V2yNeB92pddKbyt4+I+mVQoVbxRiP1FrmrO41SObaIwN0DNJRshrYZ
	kS+vWt4rjY4mSUTdl+RrlphcFSnL39255bpIzYftO7XbzEqQge28KzngD0T21HEC
	irarGmIvOKZHap0rp4vGnaltgFZFUMCQVw1a/6J3PH2yDPouOAmaX339MdO1Wt6v
	BatUcLSwLP6/oWqYv6FZ3i6e37c8B37zuB7TsnuxrPtrMJrF8R5huoRArMTEpGRt
	fsgYBn7dhGhQJ4Z8Fl1Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721781890; x=1721868290; bh=vNBWihlvNfIQ2dxVTaX54UXFf+AZ
	dOglks4OXNVTmIo=; b=VzxMX2nUhEkSxmGpCY8Q6wYR1+87o/SO9ZljoNuuUTqp
	HIDSg8ZvHPNuKva7tnIc2l5DBCo9RmdZqwp+Ppgid22s1FhxnAxKnV78tptuae84
	NOFnSDtcdsb0w7loPdss5CGVslgDqAUvs0f0Sa15/uJwBTMCKLwNl9esXjYyRgNJ
	O787I41EVN+1BoJo4j0OkuXyIRJ96zrYZ98fZ0JMZxcwIjxQdH3xz7IXv3wSJMEv
	M2a9/dg3URCf43jcHlH0f02qlBX26ghq1MrzpNnWMz5KhuTrGwdBh336lhjgOYSW
	AFECcNmgCPAsSPQUhkyShIEkiaQBsDUmIuVHhgGZFQ==
X-ME-Sender: <xms:gk6gZklOCVBBj2_-QdkJZSWPG1MI4PockI3NJyU1ZrKNhUD2aMNUMg>
    <xme:gk6gZj0HjjEOe4h2DiWpunDGKZjrMXyKHQwJ5RLRp3mWVbGnEBm2xuGxjmbyIwpHZ
    r_Gtw0VSiOA3txhTo0>
X-ME-Received: 
 <xmr:gk6gZio7lj0GL3xNPR8OIQX348qYQnbPZAGuuY-j7baxv5AWeEbbgGlGhtxyIDCpCTZUfZhE9hvhruxWvxdyoDKyIDCBMCkcFWU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddriedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeei
    leejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:gk6gZglZum2eMwHNSpn1xrOEUPnuf5SahZm_nvecd42ehLIeXijBZQ>
    <xmx:gk6gZi3D5UKFLSnGyJLI7K8sM35ipJRp22H1lFjm1DsezZ_AVx-ayQ>
    <xmx:gk6gZnskkV11enjYYG2H_GugmrCivgeV8JgFRJHeEsp-XhIVuo4E8A>
    <xmx:gk6gZuWblPvBZ46pprZQkG6cljHGyP0YMo59N6Scs9sruBLiNMu1NA>
    <xmx:gk6gZsrXeumzAFzEEWjKpF3Ny2PC2X_dRTqmeFElO5c1bUI7HJQzxFhr>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 20:44:48 -0400 (EDT)
Date: Wed, 24 Jul 2024 09:44:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@proton.me>
Cc: clemens@ladisch.de, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-lib: restore process context workqueue to
 prevent deadlock
Message-ID: <20240724004446.GA21424@workstation.local>
Mail-Followup-To: Edmund Raile <edmund.raile@proton.me>, clemens@ladisch.de,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240718115637.12816-1-edmund.raile@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718115637.12816-1-edmund.raile@proton.me>
Message-ID-Hash: 27BDYXV47DOMKC5HX4SG5LAXNSYPS7MJ
X-Message-ID-Hash: 27BDYXV47DOMKC5HX4SG5LAXNSYPS7MJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27BDYXV47DOMKC5HX4SG5LAXNSYPS7MJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Thank you for your posting the patch, however I have some nitpickings
(and some requests to you).

On Thu, Jul 18, 2024 at 11:56:54AM +0000, Edmund Raile wrote:
> Commit b5b519965c4c ("ALSA: firewire-lib: operate for period elapse event
> in process context") removed the process context workqueue from
> amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
> its overhead.
> 
> With RME Fireface 800, this lead to a regression since Kernels 5.14.0,
> causing a deadlock with eventual system freeze under ALSA operation:
> 
> ? tasklet_unlock_spin_wait
>  </NMI>
>  <TASK>
> ohci_flush_iso_completions firewire_ohci
> amdtp_domain_stream_pcm_pointer snd_firewire_lib
> snd_pcm_update_hw_ptr0 snd_pcm
> snd_pcm_status64 snd_pcm
> 
> ? native_queued_spin_lock_slowpath
>  </NMI>
>  <IRQ>
> _raw_spin_lock_irqsave
> snd_pcm_period_elapsed snd_pcm
> process_rx_packets snd_firewire_lib
> irq_target_callback snd_firewire_lib
> handle_it_packet firewire_ohci
> context_tasklet firewire_ohci
> 
> Restore the work queue to prevent deadlock between ALSA substream
> process context spin_lock of snd_pcm_stream_lock_irq() in snd_pcm_status64()
> and OHCI 1394 IT softIRQ context spin_lock of snd_pcm_stream_lock_irqsave()
> in snd_pcm_period_elapsed().
> 
> to reproduce the issue:
> direct ALSA playback to the device:
>   mpv --audio-device=alsa/sysdefault:CARD=Fireface800 Spor-Ignition.flac
> Time to occurrence: 2s to 30m
> Likelihood increased by:
>   - high CPU load
>     stress --cpu $(nproc)
>   - switching between applications via workspaces
>     tested with i915 in Xfce
> PulsaAudio / PipeWire conceal the issue as they run PCM substream
> without period wakeup mode, issuing less hardIRQs.
> 
> Closes: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q/T/#u
> Fixes: 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event in process context")
> Signed-off-by: Edmund Raile <edmund.raile@proton.me>
> ---
> This is the follow-up patch to the 5.14.0 regression I reported:
> https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q/T/#u
> ("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with Fireface 800")
> 
> Takashi Sakamoto explained the issue in his response to the regression:
> A. In the process context
>     * (lock A) Acquiring spin_lock by snd_pcm_stream_lock_irq() in
>                snd_pcm_status64()
>     * (lock B) Then attempt to enter tasklet
> 
> B. In the softIRQ context
>     * (lock B) Enter tasklet
>     * (lock A) Attempt to acquire spin_lock by snd_pcm_stream_lock_irqsave() in
>                snd_pcm_period_elapsed()
> 
> This leads me to believe this isn't just an issue limited to the RME Fireface

We are in the merge window to Linux kernel 6.11[1]. I prefer reviewing a
small and trivial patches in the weeks, thus I would like to postpone
applying this kind of patches after releasing -rc1 even if they look
good.

In Linux kernel development, we have the process to apply patches into
released kernels to fix bugs and regressions. As of today, the developers
pay some of their efforts to maintain the following kernels[2]:

* 6.10
* 6.9.10 
* 6.6.41
* 6.1.100
* 5.15.163
* 5.10.222
* 5.4.280
* 4.19.318

It is cleared that the issued changes were applied to v5.14 kernel, thus we
should lead the developers to find the posted patches and apply them to
future releases of each version. The process[3] have come into existence
enough before the regression report procedure[4]. I would like you to read
some documentation about the process and add more care for stable kernel
maintainers.

Well, the issued commits are (older at first):

* 7ba5ca32fe6
* b5b519965c4

As long as I can see, these commits can be reverted per each, with a
slight handy-changes. In the case, it is preferable to make a patchset
including these two revert patches. I would like to request it to you,
instead of the all-in-one patch, so that developers easily find the issued
commits (and work to apply these patches into kernels maintained
publicly/locally).

At last, I prefer that the whole patch comment is written by the
posters, instead of referring to comments by the others. I know that the
description about AB/BA deadlock is a bit hard to write, but it is enough
and satisfied for you to write what you understand about the issue. I'd
accept it.

[1] https://lore.kernel.org/lkml/CAHk-=wjV_O2g_K19McjGKrxFxMFDqex+fyGcKc3uac1ft_O2gg@mail.gmail.com/
[2] https://kernel.org/
[3] https://docs.kernel.org/process/stable-kernel-rules.html
[4] https://docs.kernel.org/process/handling-regressions.html


Thanks

Takashi Sakamoto
