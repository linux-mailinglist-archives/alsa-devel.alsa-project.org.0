Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD297A257E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 20:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF2E93A;
	Fri, 15 Sep 2023 20:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF2E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694802081;
	bh=FfZRefhjF1FtuBFdivugCI92bsefiXRbQhzd/Qp0reo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FlKYUGCoADlba8WaeWLCjbvwLimsLgvzYRlublTw/3jPD63+D33Cdi4rfUKD/jZxc
	 NHQv/N9TVqCiEGw7gWnbqVhRwShe8mkQHagAJXG9bLumFjYyn6muDgGckrDUB9TyEO
	 EnHyyRr0KHlG0GVszB4FC6PVDT5B1mV55pvmgBcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2649CF80246; Fri, 15 Sep 2023 20:20:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FA1F80246;
	Fri, 15 Sep 2023 20:20:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18EE3F80425; Fri, 15 Sep 2023 20:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15053F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 20:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15053F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=eyKOZHZj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XI4pp0oduPn/A0YqvObMvK3fxrovFz787U1W3QhLrvU=; b=eyKOZHZj0O7U/Sq7UbMk8n7rCA
	zHk46uk/3tAqg/wV8BMsVl1j2+0uNV3opRer/5KGR/VCs2XHnr3IawXPi67yj13PaH6BqEUpFVVeD
	jB1UvvmnvzrXRopHuJM4LcJlSsk6/kxBXkaTmP1U/cejjXYJxYPgQhIz2QxrYuEtm2PE=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net
 ([82.36.99.19] helo=stax)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1qhDQM-0003f6-2T;
	Fri, 15 Sep 2023 19:20:14 +0100
Received: from localhost (stax.localdomain [local])
	by stax.localdomain (OpenSMTPD) with ESMTPA id fda34262;
	Fri, 15 Sep 2023 18:20:12 +0000 (UTC)
Date: Fri, 15 Sep 2023 19:20:12 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
cc: Ash Holland <ash@sorrel.sh>, alsa-devel@alsa-project.org,
    regressions@lists.linux.dev
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
In-Reply-To: <871qezux3d.wl-tiwai@suse.de>
Message-ID: <ba096915-4d9e-0cfa-2dfb-57cb476b3544@xwax.org>
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
 <87msy1ip6l.wl-tiwai@suse.de> <ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org>
 <874jjvuywk.wl-tiwai@suse.de> <871qezux3d.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID-Hash: IP3UE32H6VZECXMVDYSQSL32UJULJJEL
X-Message-ID-Hash: IP3UE32H6VZECXMVDYSQSL32UJULJJEL
X-MailFrom: mark@xwax.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IP3UE32H6VZECXMVDYSQSL32UJULJJEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023, Takashi Iwai wrote:

> On Fri, 15 Sep 2023 19:30:51 +0200, Takashi Iwai wrote:
> > 
> > On Fri, 15 Sep 2023 18:04:35 +0200, Mark Hills wrote:
[...]
> > > I upgraded from 6.1.0 to 6.5.3 and Reaper now crashes or hangs on startup 
> > > with the trace below in dmesg.
> > > 
> > > The newer kernel already includes a fix very similar to below, so I think 
> > > an issue remains.
> > > 
> > > I did not dig deeper than capturing information and finding this related 
> > > thread.
> > (snip)
> > > [   72.601440] BUG: kernel NULL pointer dereference, address: 0000000000000020
> > (snip)
> > > [   72.601455] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > (snip)
> > > [   72.601477] Call Trace:
> > > [   72.601478]  <TASK>
> > > [   72.601479]  ? __die+0x1b/0x60
> > > [   72.601482]  ? page_fault_oops+0x154/0x420
> > > [   72.601485]  ? mas_update_gap.part.0+0xac/0x1f0
> > > [   72.601488]  ? sched_clock_cpu+0xb/0x190
> > > [   72.601491]  ? __smp_call_single_queue+0x2f/0x50
> > > [   72.601493]  ? exc_page_fault+0x37a/0x560
> > > [   72.601495]  ? seq_open+0x4b/0x70
> > > [   72.601497]  ? asm_exc_page_fault+0x22/0x30
> > > [   72.601501]  ? snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > > [   72.601505]  snd_info_seq_show+0x21/0x40 [snd]
> > > [   72.601511]  seq_read_iter+0x105/0x4a0
> > > [   72.601514]  seq_read+0x9e/0xd0
> > > [   72.601516]  proc_reg_read+0x50/0xa0
> > > [   72.601518]  vfs_read+0xa4/0x300
> > > [   72.601521]  ? __do_sys_newfstatat+0x35/0x60
> > > [   72.601524]  ksys_read+0x5a/0xe0
> > > [   72.601526]  do_syscall_64+0x38/0x90
> > > [   72.601528]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > 
> > It must be a completely different bug.  It comes from the proc fs
> > read, not the read over sequencer device itself.
> 
> Does the change below fix the problem?

It does! At least it passes my initial test. Reaper starts up now.

> -- 8< --
> --- a/sound/core/rawmidi.c
> +++ b/sound/core/rawmidi.c
> @@ -1770,7 +1770,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
>  	if (IS_ENABLED(CONFIG_SND_UMP))
>  		snd_iprintf(buffer, "Type: %s\n",
>  			    rawmidi_is_ump(rmidi) ? "UMP" : "Legacy");
> -	if (rmidi->ops->proc_read)
> +	if (rmidi->ops && rmidi->ops->proc_read)
>  		rmidi->ops->proc_read(entry, buffer);
>  	mutex_lock(&rmidi->open_mutex);
>  	if (rmidi->info_flags & SNDRV_RAWMIDI_INFO_OUTPUT) {
> 
> 
> 

-- 
Mark
