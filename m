Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76923941132
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 13:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4574186E;
	Tue, 30 Jul 2024 13:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4574186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722340379;
	bh=ENhVlm5z1c38Bwm5WCm4jIh1h1RFWVBTij5tZ5reNl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CA7g2GwApp5MlSmu2ofNJncxc84lgaJW2yrTALInilx/5VW9GVDGntdOXsQnrVnJg
	 Rdcf+tLVFCyZrjbaTvMnBSS4GltHdwbgX9ePetdsd57OUTLhBh/lcfET23iAYzLInF
	 IgPvI3iAJcwIyWBLlLA0iQ1kgs5Yz2MlwyMejcVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CD1FF805A1; Tue, 30 Jul 2024 13:52:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1CB2F805B2;
	Tue, 30 Jul 2024 13:52:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97E9F802DB; Tue, 30 Jul 2024 13:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CBF0F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 13:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBF0F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=o2VykogO;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=sbVxb0nD
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4292E11406BD;
	Tue, 30 Jul 2024 07:46:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 30 Jul 2024 07:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1722339973; x=
	1722426373; bh=iefsEGpHVlqq7CDg5X+Pi4Watsk5tFu1X0BI8hP/BOU=; b=o
	2VykogOxTw0K6YszGtXFavrSwCSnNJ0fcfQFLb8c1J62eX/B615C+XzsLPA11GNL
	paVvvle7JbWzZx68wMti66apiovwHONz2pHLYzHX5YT6Md/N2/yIx9f0WhNWB5UW
	KdHd9BKOsT5aboAGaC07r694nifQnF4/ojI3ELhm4kYXcM5Y0HAYmo+q0cZuLI8B
	qlF5CCdKgTki4SCuTCGX101ZCzOGYolol6L3TGo2WiV/jSv8pKB23qHrxNdjKMBJ
	0eUxVSTGwjXVv7NMhE6DBTNl7xV0wE0UKZWAuLw/b6Zusom4mdWuidI2tTpNnQS+
	snkxqYyi6vmq/QO0bFThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722339973; x=1722426373; bh=iefsEGpHVlqq7CDg5X+Pi4Watsk5
	tFu1X0BI8hP/BOU=; b=sbVxb0nDK7Sa+vve3/VEOxNinI0/8LrsT6hqOl+8xA3C
	borTp1s3GIqIgsSAUV90VDAq+HvQXv5th/dpxj5e9McXryDztVMpdmNqYafNObl0
	UBeGa2rq9I92fmsf+Bhs3ferVdWAPRl7G+HwZotoFCPFOnedzmVK+IExLEk/v0g1
	fBnuAAjRiUgonaIgTlvfmG0hFziHaN70ma0vFo5i4GiEaPL4oXSaUF67Q0XrdsWt
	4+GDIOhCtTj8Ad6LoEqKY2b7accrvez7dtqsDkiqCdS82F3Xqq+JKlVdaPkObvor
	L2iLD24DN75GZzXGr++O5GL6a+OTx8+pu1lt8rfOxA==
X-ME-Sender: <xms:hNKoZkQx8Q-dXLvW15F4_qi8B7lwCXb1eJqPW-CLk295tUHcN5G6Yg>
    <xme:hNKoZhwumybvAUplegvwEgurplphzQmME_sBbS2jlIGUBpWB1AodgDF3Tb3IfSBzl
    N8D51BC7WE1KSPc8sY>
X-ME-Received: 
 <xmr:hNKoZh0isJzzVpeh444qXFIHCbnpSkJ4p5y5u28s-nUpZ7biiuHm-rT7p17UJMKeR31c8qDXOraBwSNDtGLBnafzoAIxD1_0_pJg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrjeeggdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeei
    leejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:hNKoZoAARNNZ70WX_IV9vHa-FfFD4ZUPGbKfL3LrpwgJVNsBinrJBA>
    <xmx:hNKoZtj6qr5Qmv2iIPOatqBAbTPD9H67ayhuyYb2dbOyhInEQGo-Tw>
    <xmx:hNKoZkp6MdyF5qBuOuhoxCratAgQo5blzw-_q_gxrStUXuK_xqjHgw>
    <xmx:hNKoZggfxY_15cINy0YsjrYL24R1hUf05N8Gfp7DyhjwjIvAtjtqKA>
    <xmx:hdKoZteGyL-kGhFZbULAT97asYih7oxixtXwX-16PcpTkS8SszcewKR->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jul 2024 07:46:11 -0400 (EDT)
Date: Tue, 30 Jul 2024 20:46:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ALSA: firewire-lib: restore process context
 workqueue to prevent deadlock
Message-ID: <20240730114609.GA139690@workstation.local>
Mail-Followup-To: Edmund Raile <edmund.raile@protonmail.com>,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
References: <20240729214149.752663-1-edmund.raile@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729214149.752663-1-edmund.raile@protonmail.com>
Message-ID-Hash: SDJ6PJWW3THR232V3HB5WYKEEGEB4I7W
X-Message-ID-Hash: SDJ6PJWW3THR232V3HB5WYKEEGEB4I7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDJ6PJWW3THR232V3HB5WYKEEGEB4I7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, Jul 29, 2024 at 09:42:02PM +0000, Edmund Raile wrote:
> This patchset serves to prevent an AB/BA deadlock:
> 
> thread 0:
>     * (lock A) acquire substream lock by
> 	snd_pcm_stream_lock_irq() in
> 	snd_pcm_status64()
>     * (lock B) wait for tasklet to finish by calling
>     	tasklet_unlock_spin_wait() in
> 	tasklet_disable_in_atomic() in
> 	ohci_flush_iso_completions() of ohci.c
> 
> thread 1:
>     * (lock B) enter tasklet
>     * (lock A) attempt to acquire substream lock,
>     	waiting for it to be released:
> 	snd_pcm_stream_lock_irqsave() in
>     	snd_pcm_period_elapsed() in
> 	update_pcm_pointers() in
> 	process_ctx_payloads() in
> 	process_rx_packets() of amdtp-stream.c
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
> The issue has been reported as a regression of kernel 5.14:
> Link: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q/T/#u
> ("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with
> Fireface 800")
> 
> Commit 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event
> in process context") removed the process context workqueue from
> amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
> its overhead.
> Commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for period
> update") belongs to the same patch series and removed
> the now-unused workqueue entirely.
> 
> Though being observed on RME Fireface 800, this issue would affect all
> Firewire audio interfaces using ohci amdtp + pcm streaming.
> 
> ALSA streaming, especially under intensive CPU load will reveal this issue
> the soonest due to issuing more hardIRQs, with time to occurrence ranging
> from 2 secons to 30 minutes after starting playback.
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
> Cc: stable@vger.kernel.org
> Backport note:
> Also applies to and fixes on (tested):
> 6.10.2, 6.9.12, 6.6.43, 6.1.102, 5.15.164
> 
> Edmund Raile (3):
>   Revert "ALSA: firewire-lib: obsolete workqueue for period update"
>   Revert "ALSA: firewire-lib: operate for period elapse event in process
>     context"
>   ALSA: firewire-lib: amdtp-stream work queue inline description
> 
>  sound/firewire/amdtp-stream.c | 38 ++++++++++++++++++++++-------------
>  sound/firewire/amdtp-stream.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)

In my opinion, the patch just to change code comment is not preferable
to apply stable and longterm kernels as fixes. It is acceptable to
revise revert commits with slight changes to optimize codes and comments
to current status, thus I would like you to amend the second and third
patches so that the patchset consists of two revert commits.

I'm sorry to make many requests to you, however it is a community for
software development to which we are involved. It has some implicit and
explicit conventions to which we could follow.


Thanks

Takashi Sakamoto
