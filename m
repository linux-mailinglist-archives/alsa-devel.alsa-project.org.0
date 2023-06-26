Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6714673E0D3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64961DEF;
	Mon, 26 Jun 2023 15:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64961DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687786715;
	bh=iSIGucjInYxKHhhepSg5bgCdNEU+30EmUDUSwXh6BGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f67AKHhXNkr5RARZc/MOYrSKIPONrvqbRFGfmJ4D0CrWEiW8J5+TOMpC00CsEkMZq
	 ShkYS92kmLLnG+PZVFvKPIoyJHfVHAO8CIbGqOstpudLSAPlWBYlqmjWxpMlvWtxbv
	 LlZ8VmWeA3YkKRiL3yGKnZMHZhcBB0ild9pbwp3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4534F80212; Mon, 26 Jun 2023 15:37:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB17F80212;
	Mon, 26 Jun 2023 15:37:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39560F80246; Mon, 26 Jun 2023 15:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A465F80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A465F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Y3YnlDle;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QeZ8uo/1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A912221867;
	Mon, 26 Jun 2023 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687786657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jUBjTAufjEln2vbph+DCrSwWVeakUOgT748UPyQBH7M=;
	b=Y3YnlDlewui2Sb35svlBgg7ORuRA3ZV7JeBHNwi5NMNYO9HUhl3hCvL3UN0fyHsU3Vr8YE
	KA4SHIzscegqf3Rj5oHx8jRluTevvWccvWTxoiAYI/XlylKkrJs+2Y5zxoKVe+j10dPneM
	0HDFSkY6im9coOSsbsKHnz48ZHlIsac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687786657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jUBjTAufjEln2vbph+DCrSwWVeakUOgT748UPyQBH7M=;
	b=QeZ8uo/1BufTlRiSiyzrtNc7gPHInwJdTcNbeccLQoCtWnqlp/J5dA0bH2BWeFT3BEgzdR
	nSaq7Tw9qHpXz4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D7E413483;
	Mon, 26 Jun 2023 13:37:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id X+K4HaGUmWTzawAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 26 Jun 2023 13:37:37 +0000
Date: Mon, 26 Jun 2023 15:37:36 +0200
Message-ID: <87bkh2uyxr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Tuo Li <islituo@gmail.com>,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	baijiaju1990@outlook.com
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
In-Reply-To: <fb9db138-82a3-678c-bb94-035f923b3e16@perex.cz>
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
	<877crqwvi1.wl-tiwai@suse.de>
	<CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
	<871qhywucj.wl-tiwai@suse.de>
	<4d0931bf-b356-6969-5aaf-b663d7f2b21a@perex.cz>
	<87wmzqv64o.wl-tiwai@suse.de>
	<45445f57-0a73-59e6-6f3d-3983ce93a324@perex.cz>
	<87ttuuv5m6.wl-tiwai@suse.de>
	<87jzvquzyr.wl-tiwai@suse.de>
	<fb9db138-82a3-678c-bb94-035f923b3e16@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MW7K7SSAG4S6YUKLDDFCRTML2THNBX2W
X-Message-ID-Hash: MW7K7SSAG4S6YUKLDDFCRTML2THNBX2W
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MW7K7SSAG4S6YUKLDDFCRTML2THNBX2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 15:32:40 +0200,
Jaroslav Kysela wrote:
> 
> On 26. 06. 23 15:15, Takashi Iwai wrote:
> > On Mon, 26 Jun 2023 13:13:21 +0200,
> > Takashi Iwai wrote:
> >> 
> >> On Mon, 26 Jun 2023 13:09:00 +0200,
> >> Jaroslav Kysela wrote:
> >>> 
> >>> On 26. 06. 23 13:02, Takashi Iwai wrote:
> >>>> On Mon, 26 Jun 2023 09:56:47 +0200,
> >>>> Jaroslav Kysela wrote:
> >>>>> 
> >>>>> On 26. 06. 23 9:33, Takashi Iwai wrote:
> >>>>>> On Mon, 26 Jun 2023 09:31:18 +0200,
> >>>>>> Tuo Li wrote:
> >>>>>>> 
> >>>>>>> 
> >>>>>>> Hello,
> >>>>>>> 
> >>>>>>> Thank you for your reply!
> >>>>>> 
> >>>>>> FWIW, the simplest fix would be something like below, just extending
> >>>>>> the mutex coverage.  But it'll serialize the all calls, so it might
> >>>>>> influence on the performance, while it's the safest way.
> >>>>> 
> >>>>> It may be better to update total_pcm_alloc_bytes before
> >>>>> snd_dma_alloc_dir_pages() call and decrease this value when allocation
> >>>>> fails to allow parallel allocations. Then the mutex can be held only
> >>>>> for the total_pcm_alloc_bytes variable update.
> >>>> 
> >>>> Yes, it'd work.  But a tricky part is that the actual allocation size
> >>>> can be bigger, and we need to correct the total_pcm_alloc_bytes after
> >>>> the allocation result.  So the end result would be a patch like below,
> >>>> which is a bit more complex than the previous simpler approach.  But
> >>>> it might be OK.
> >>> 
> >>> The patch looks good, but it may be better to move the "post" variable
> >>> updates to an inline function (mutex lock - update - mutex unlock) for
> >>> a better readability.
> >> 
> >> Sounds like a good idea.  Let me cook later.
> > 
> > ... and here it is.
> > 
> > If that looks OK, I'll submit a proper fix patch.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > --- a/sound/core/pcm_memory.c
> > +++ b/sound/core/pcm_memory.c
> > @@ -31,15 +31,41 @@ static unsigned long max_alloc_per_card = 32UL * 1024UL * 1024UL;
> >   module_param(max_alloc_per_card, ulong, 0644);
> >   MODULE_PARM_DESC(max_alloc_per_card, "Max total allocation bytes per card.");
> >   +static void __update_allocated_size(struct snd_card *card,
> > ssize_t bytes)
> 
> Missing inline ? May be also used for
> 
> > +static void update_allocated_size(struct snd_card *card, ssize_t bytes)
> > +static void decrease_allocated_size(struct snd_card *card, size_t bytes)

I left the optimizations to compilers.  Usually they do inline if it
makes sense, and it's often a more sensible choice.


thanks,

Takashi
