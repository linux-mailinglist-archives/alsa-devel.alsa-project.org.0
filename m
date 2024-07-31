Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5E9429C2
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D8F2E27;
	Wed, 31 Jul 2024 10:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D8F2E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416248;
	bh=8NDiRi+10y1SIiwdA08fsiT9dMy1pZL4V0pvzaA2upM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HPydrbjJKHWEMU7p7liNXIDtCtF8Csxr2obNXt3Y6VXsrrU/X46PQTfzlRcFUejG1
	 D/WPxqrdGugZgsVerJI0W2bo5rg1JLibouMa6MHA3vriY6SYkkLYlcFZiisL/orbt/
	 fffWvpC8a5SuwPRJIF+fYektn1/pEhi4nKI3cYlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F28A4F805E9; Wed, 31 Jul 2024 10:55:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4F8F805E3;
	Wed, 31 Jul 2024 10:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 133EFF80580; Wed, 31 Jul 2024 10:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFCC7F800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 10:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCC7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=vjwe8mSv;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=PJAcPdRB
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 413BF1146E77;
	Wed, 31 Jul 2024 04:55:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 31 Jul 2024 04:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1722416118; x=
	1722502518; bh=vMA1vQSN5FVF2YHU0BsfEBv1ul6npqCvlOna7cdXU68=; b=v
	jwe8mSv0zUGv4/spZMeApZen8UkYHRlA8UBwdkjwctoKNuN/887G4GFOX/uCMfEF
	+Y+C63ZPqGql4AaNDdwaPjvJb5Arv/tzF9imYrIjfLU7bIz8dlme8AIgQYyueVHT
	69VF3K4yoWfB290FHsBqWbYD+IOzMUMUs5Jyyz6vnCHGZevNrNCbyH/ug6abD0mo
	fxb8+PmOiXtORHWoUyXSBsTWa+svEO2HrKQ84PtqE6ey8wI5Zo9wveHVp6hpNvlX
	rxLzNqKHzMKWgLLE5yAAlAx+X3n8UlBZHcFwptK19NCnKDvk2Yx62ZnL3nEYPGNo
	t1UpBC1ie5z0kixF9mfGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722416118; x=1722502518; bh=vMA1vQSN5FVF2YHU0BsfEBv1ul6n
	pqCvlOna7cdXU68=; b=PJAcPdRBhmPdTUwxnWmSXdcRfVnUHmouVeGK3Q+CD6jw
	D/INn9D67J0Vd1DPVrW4/Fqfbq9j94yI9LpND4LwF2uCwXP7txH5m0i52XXWu4GQ
	u48Cp+0yjVWjp2k6DIDOE1hZ236LhZSCB3u72rlAUtloL8E3tRHbRfjnqsk6rkSe
	B+pFyCZ9QvOkQHhUKJOddWs02+mw/TdJC3WzDc+RIl15fBRec6wVNRrFvV/odqCB
	B+moTNe4XOrfvH1DtFwDgEezj3x75bEoqWdN3IO0ZDT3CSAA6hZoyMFx7kCw7luS
	jJ3c2NZ3tqynspQqmoJy1iXzYP2a9UcP5BtJtfgTlw==
X-ME-Sender: <xms:9vupZpugOml6e-n6jUR5ZHq4_nYeaAD3gFntlVAvBPyA_Rs0NSXEaw>
    <xme:9vupZifAGzu-ToorjKNDGV8UPhd9dMSE9x4yNmfvAGSmDWE9cG5yG7WkvL3gys-kb
    9Z-6NXDI96aFNGP6wA>
X-ME-Received: 
 <xmr:9vupZswyyAbUXCSf_qp-u_j3pWQFFtViodkXYEWyWBtpL5IhGpM6wAedqaCp-QN_BYOXrBbtdbZgR9ASwJRt8bJQDRqlb-YRsBZi>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrjeeigddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeei
    leejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:9vupZgNV1MHx1mQds3-bI0YN9YmPNq4w9Rhl0gA0mv4sUP-oNI59Dw>
    <xmx:9vupZp-o0IBuwb5l-8pOYovM59Ti7W0WCoj0Ev3gzd6mOYI8RANfhA>
    <xmx:9vupZgVC0SUJCRXaMgKgz-RutyMANAiagjNIUe7SRUtLl79pGGZttA>
    <xmx:9vupZqcro8ARq1ervbWOEsrXcZ9kUQ9e_gcJac_fOhT-hrTBLtODSA>
    <xmx:9vupZskm9tid2OVvRMc9J9gpR1yCioPVACDDTwQZpaB1ZVhmtYJ8Lb-X>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jul 2024 04:55:16 -0400 (EDT)
Date: Wed, 31 Jul 2024 17:55:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ALSA: firewire-lib: restore process context
 workqueue to prevent deadlock
Message-ID: <20240731085514.GA215770@workstation.local>
Mail-Followup-To: Edmund Raile <edmund.raile@protonmail.com>,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, stable@vger.kernel.org
References: <20240730195318.869840-1-edmund.raile@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730195318.869840-1-edmund.raile@protonmail.com>
Message-ID-Hash: WZ4ONVDQUEKLRUEI2NMBLEMBUNJIJCAT
X-Message-ID-Hash: WZ4ONVDQUEKLRUEI2NMBLEMBUNJIJCAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZ4ONVDQUEKLRUEI2NMBLEMBUNJIJCAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Jul 30, 2024 at 07:53:23PM +0000, Edmund Raile wrote:
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
> ("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock
> with Fireface 800")
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
> Edmund Raile (2):
>   Revert "ALSA: firewire-lib: obsolete workqueue for period update"
>   Revert "ALSA: firewire-lib: operate for period elapse event in process
>     context"
> 
>  sound/firewire/amdtp-stream.c | 38 ++++++++++++++++++++++-------------
>  sound/firewire/amdtp-stream.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)

They look good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

I appreciate your long effort to solve the issue.


Thanks

Takashi Sakamoto
