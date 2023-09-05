Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A779205F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 07:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6089C825;
	Tue,  5 Sep 2023 07:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6089C825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693892453;
	bh=CXAviy/4XzWlCa583nxJ1P+IU+YSStaZrLImgznhBjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cCj+W1rB1G2bvTjjQrvx7CBvMTfGjSKk3df7jP1xBRnY9hRux8LhPAhJ4BiCeMwUj
	 Tq4//MyhShVpasmF6pONKML1J996QAA3O4aasy7TD2uTsB/TZ12h3PqxhY5iAD/u9p
	 mgbGOstHUxGjPSs4bG0RfHF1pvkjhYJiW0PIDkO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC61F80537; Tue,  5 Sep 2023 07:40:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00433F80236;
	Tue,  5 Sep 2023 07:40:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BFFF8047D; Tue,  5 Sep 2023 07:39:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF027F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 07:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF027F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GJ5gLQGo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=505Djafo
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 439861F74D;
	Tue,  5 Sep 2023 05:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693892382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Dxo+OTaBq3eaJaf69uSWntTxeRXuDZqHqC6jWUmxEs=;
	b=GJ5gLQGo/c4xD63vbFDV9o2v5C9POygISqIBxNv6pobO6k+mq1jQqbRenMs1h1kOsnA08q
	PwIFdACl4qo1XJZNVfdodzmGCZ4rCwI3zlYs0d55/2uK+k44sQWjdRJxDwP2aVZc/VCHQQ
	Hg+8l3cSvhBMfKGDLBygyd876yDoSNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693892382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Dxo+OTaBq3eaJaf69uSWntTxeRXuDZqHqC6jWUmxEs=;
	b=505Djafo3RJfsC+Yl1bcf8IS+MmCYBcc6dVF+fvsHqfm9b8KMqPO/GXe40XEY3ALkw+Rcu
	I/6L5oi/tV+gXkDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 197D0134B2;
	Tue,  5 Sep 2023 05:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2s5uBR6/9mRvNQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 05 Sep 2023 05:39:42 +0000
Date: Tue, 05 Sep 2023 07:39:41 +0200
Message-ID: <87edjdi3fm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix a potential memory leak in
 scarlett2_init_notify()
In-Reply-To: <87ledmjak0.wl-tiwai@suse.de>
References: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
	<871qffmj2d.wl-tiwai@suse.de>
	<8cde2320-517f-3a38-8c3f-f807791c6c52@wanadoo.fr>
	<87sf7vkybk.wl-tiwai@suse.de>
	<a0387d53-a08f-5e0c-c3a5-681ab5545150@wanadoo.fr>
	<87ledmjak0.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DARPA3BYURHT4674EQQKYSQC4HEVSTQD
X-Message-ID-Hash: DARPA3BYURHT4674EQQKYSQC4HEVSTQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DARPA3BYURHT4674EQQKYSQC4HEVSTQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 16:08:15 +0200,
Takashi Iwai wrote:
> 
> On Sun, 03 Sep 2023 21:42:55 +0200,
> Christophe JAILLET wrote:
> > 
> > Le 03/09/2023 à 18:37, Takashi Iwai a écrit :
> > > On Sun, 03 Sep 2023 17:04:47 +0200,
> > ...
> > For the start_input_streams() caller, this is fine, because the
> > corresponding memory is kzalloc()'ed in start_input_streams() at some
> > point, but I've not been able to check for snd_usb_midi_v2_open().

Oh I overlooked that point.  Yes, it's a missing call, although the
memory leaks as free_midi_urbs() is called also at the destructor,
free_midi2_endpoint(), too.  But it's definitely better to call at the
error path, too.  Will fix it up together and submit the proper fix
patch.


thanks,

Takashi



> > 
> > CJ
> > 
> > > 
> > > --- a/sound/usb/midi2.c
> > > +++ b/sound/usb/midi2.c
> > > @@ -265,7 +265,7 @@ static void free_midi_urbs(struct snd_usb_midi2_endpoint *ep)
> > >     	if (!ep)
> > >   		return;
> > > -	for (i = 0; i < ep->num_urbs; ++i) {
> > > +	for (i = 0; i < NUM_URBS; ++i) {
> > >   		ctx = &ep->urbs[i];
> > >   		if (!ctx->urb)
> > >   			break;
> > > 
> > > That was the intended behavior of free_midi_urbs().
> > > 
> > > 
> > > Takashi
> > > 
> > 
> 
