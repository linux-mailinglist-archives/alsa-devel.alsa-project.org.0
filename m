Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BAC791973
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:09:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15ACC206;
	Mon,  4 Sep 2023 16:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15ACC206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693836572;
	bh=3HrT+EdGizMxL+VeaEA5Aqqwcf8Oslj2c/9/2LibAqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QqHV6ixGLosxgW5lDZS64DG3+AagFpereZoxi2sF1r5CgSxXGtMkU0BW68q6ZJ3uK
	 ehl7z99gdlstURQN68DMgjnxAMsZN0MHjOEnBb6jVKODKqL6mF0998g8gNRlmgvyAd
	 sQ0fF5mrgEnO+r89PRGWEDntxCBhvRjgOQBIK0WE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA6A7F80552; Mon,  4 Sep 2023 16:08:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4923FF80431;
	Mon,  4 Sep 2023 16:08:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C622DF8047D; Mon,  4 Sep 2023 16:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B420FF80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B420FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MrVmBVJE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=33G/3lZs
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03C471F38C;
	Mon,  4 Sep 2023 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693836496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5r04qVqTrOT2KJTqTw8pN2+2R0Bk1SAzGCxmHII/9E=;
	b=MrVmBVJEOPyfdtD7KdbhdFS/fssl93Ysfncpd73zI54VymUaQE4NO/WSjLZSTubRrwCDdf
	VXWlsodUJmmYImHhnyvWMSM/wFEI8mLeJdUz/xRC5pms9sR1Kjc6qm3sEu6/UknX2bKJ4E
	LPtsMwG56NhdqnK2nfmtW2lM9Cj6CkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693836496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5r04qVqTrOT2KJTqTw8pN2+2R0Bk1SAzGCxmHII/9E=;
	b=33G/3lZs1AP62zGxlniLVD2fPOGlxy9T/jeePvy2fhws4fhqZtd3S157lwWY6C2yC8ZyTv
	czLv0YeHmwuzSrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCF8C13425;
	Mon,  4 Sep 2023 14:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mSnVMM/k9WR5IwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 04 Sep 2023 14:08:15 +0000
Date: Mon, 04 Sep 2023 16:08:15 +0200
Message-ID: <87ledmjak0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix a potential memory leak in
 scarlett2_init_notify()
In-Reply-To: <a0387d53-a08f-5e0c-c3a5-681ab5545150@wanadoo.fr>
References: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
	<871qffmj2d.wl-tiwai@suse.de>
	<8cde2320-517f-3a38-8c3f-f807791c6c52@wanadoo.fr>
	<87sf7vkybk.wl-tiwai@suse.de>
	<a0387d53-a08f-5e0c-c3a5-681ab5545150@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SN3BSTVPPXTB4A36CMIIEAU75W5W57T
X-Message-ID-Hash: 2SN3BSTVPPXTB4A36CMIIEAU75W5W57T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SN3BSTVPPXTB4A36CMIIEAU75W5W57T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 21:42:55 +0200,
Christophe JAILLET wrote:
> 
> Le 03/09/2023 à 18:37, Takashi Iwai a écrit :
> > On Sun, 03 Sep 2023 17:04:47 +0200,
> ...
> 
> > Indeed.  The fix would be rather a oneliner like below, though:
> 
> Looks much better than mine :)
> 
> I let you send the patch, it is your solution.
> 
> 
> 
> Just for my understanding, how is snd_ump_ops used, especially .open?
> I've not been able to figure out where it was called.

It's called via rawmidi open (the snd_ump_endpoint is a sort of child
class of snd_rawmidi).

> In alloc_midi_urbs(), if usb_alloc_coherent() fails, then
> ctx->urb->transfer_buffer could be anything because usb_fill_xxx_urb()
> is not called.
> So there could be an edge case where your fix could still be incomplete.

Each URB is allocated in the loop via usb_alloc_urb(), and it does
zero-initialize the object, hence the buffer is supposed to be NULL
until it's set up via usb_fill_xxx().


thanks,

Takashi

> For the start_input_streams() caller, this is fine, because the
> corresponding memory is kzalloc()'ed in start_input_streams() at some
> point, but I've not been able to check for snd_usb_midi_v2_open().
> 
> CJ
> 
> > 
> > --- a/sound/usb/midi2.c
> > +++ b/sound/usb/midi2.c
> > @@ -265,7 +265,7 @@ static void free_midi_urbs(struct snd_usb_midi2_endpoint *ep)
> >     	if (!ep)
> >   		return;
> > -	for (i = 0; i < ep->num_urbs; ++i) {
> > +	for (i = 0; i < NUM_URBS; ++i) {
> >   		ctx = &ep->urbs[i];
> >   		if (!ctx->urb)
> >   			break;
> > 
> > That was the intended behavior of free_midi_urbs().
> > 
> > 
> > Takashi
> > 
> 
