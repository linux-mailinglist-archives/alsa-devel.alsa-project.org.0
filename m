Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABE9B781E
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2024 10:58:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C752EB6;
	Thu, 31 Oct 2024 10:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C752EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730368736;
	bh=vbWV+eliRt3yVRaYStFBLW3GbD73q1ZT4K6Wao0NwD0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oZ/rk//jVNf8V7b4y1x8jL4JWWuj95828Wan2QZwKzKlyv3Wqz3SCm/Oj6TDtcElg
	 d86LgDgj7ld0GEyI/ft0rMoz6Es/pgHxKKr7YdHzmJK9lv6iJvsgsUVpTdWMKAgMED
	 2uzzKFng3rj/FZHBcYdF7oRIpi4DrAQGdPHvVZoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E1E3F8059F; Thu, 31 Oct 2024 10:58:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49693F805AC;
	Thu, 31 Oct 2024 10:58:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD43F80269; Thu, 31 Oct 2024 10:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42A6BF8014C
	for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2024 10:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A6BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1Da4Ws/k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4UWzBB0E;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1Da4Ws/k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4UWzBB0E
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B29A21E1C;
	Thu, 31 Oct 2024 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730368706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psCjUsX29Y9/2LGHQTYJ9aeLZy7RlRwRT0JqgKMP/a0=;
	b=1Da4Ws/kqCf70hK33Ij1xfGPEtdm4byvpx43ymBcbBDmyh7mTAWnB38jw5i7AAEhdZt9wP
	xi6wXBUEmPzHxmRymeZEqAz8hR9LQs6K5t3vCetIqqda1Te2WUnyoaKDarcx7Ug38V0LrZ
	JLIHXwaW7B5AvArO2GlTVjQ4xrvtULM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730368706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psCjUsX29Y9/2LGHQTYJ9aeLZy7RlRwRT0JqgKMP/a0=;
	b=4UWzBB0Ei4oHfSDTCg6LvwfYXX+z+hn4mkRSSIUSXndCvXUFtiT1zKLtan10Ea8smIywaA
	a6AXNMXvD33vqqDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730368706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psCjUsX29Y9/2LGHQTYJ9aeLZy7RlRwRT0JqgKMP/a0=;
	b=1Da4Ws/kqCf70hK33Ij1xfGPEtdm4byvpx43ymBcbBDmyh7mTAWnB38jw5i7AAEhdZt9wP
	xi6wXBUEmPzHxmRymeZEqAz8hR9LQs6K5t3vCetIqqda1Te2WUnyoaKDarcx7Ug38V0LrZ
	JLIHXwaW7B5AvArO2GlTVjQ4xrvtULM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730368706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psCjUsX29Y9/2LGHQTYJ9aeLZy7RlRwRT0JqgKMP/a0=;
	b=4UWzBB0Ei4oHfSDTCg6LvwfYXX+z+hn4mkRSSIUSXndCvXUFtiT1zKLtan10Ea8smIywaA
	a6AXNMXvD33vqqDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3245613A53;
	Thu, 31 Oct 2024 09:58:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ke8FC8JUI2fGMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Oct 2024 09:58:26 +0000
Date: Thu, 31 Oct 2024 10:59:30 +0100
Message-ID: <87ed3wwq2l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Giedrius =?ISO-8859-2?Q?Trainavi=E8ius?= <giedrius@blokas.io>
Cc: alsa-devel@alsa-project.org
Subject: Re: Direct MIDI event delivery to ALSA sequencer's hardware port
 without any connections/subscriptions fails with -ENODEV.
In-Reply-To: 
 <CAMONXLt_G5AsdGcYtXi005-K=o4=+4H8-JqVZHXMJpbSBdoQtA@mail.gmail.com>
References: 
 <173036094280.7932.15651402625270790788@mailman-web.alsa-project.org>
	<87ttcswsoe.wl-tiwai@suse.de>
	<CAMONXLt_G5AsdGcYtXi005-K=o4=+4H8-JqVZHXMJpbSBdoQtA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,bootlin.com:url]
Message-ID-Hash: XZ3SO343CLPANDPCIULGTL6J7EDLXIJ7
X-Message-ID-Hash: XZ3SO343CLPANDPCIULGTL6J7EDLXIJ7
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZ3SO343CLPANDPCIULGTL6J7EDLXIJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Oct 2024 10:52:23 +0100,
Giedrius Trainavičius wrote:
> 
> 
> Hi Takashi,
> 
> So the pattern instead should be to subscribe own simple port to the
> destination port(s) and then send the events using 'snd_seq_ev_set_subs'?

Yes.  The destination can be explicitly specified, too, but the
subscription should have been established.

> I see aseqsend appeared in ALSA-utils as well, it would also be impacted by
> the same access pattern if trying to send to an unsubscribed hardware port.

True.  As mentioned, the behavior depends on the client, and the tool
was designed to be simplistic, as it seems.


Takashi

> Thank you!
> Giedrius.
> 
> On Thu, Oct 31, 2024 at 11:02 AM Takashi Iwai <tiwai@suse.de> wrote:
> 
>     On Thu, 31 Oct 2024 08:49:02 +0100,
>     giedrius@blokas.io wrote:
>     >
>     > Hello,
>     >
>     > I had written an `aseqsend` utility to send MIDI events from hex strings
>     to ALSA sequencer ports, similar to the -S arg of `amidi`, but I just
>     noticed that while sending events directly to application ALSA Sequencer
>     ports works just fine, trying to send to a hardware MIDI port fails with
>     -19 (-ENODEV).
>     >
>     > Here's the aseqsend utility code, the highlighted line is the one
>     returning -ENODEV:
>     >
>     > https://github.com/BlokasLabs/aseqsend/blob/main/aseqsend.c#L173
>     >
>     > Here's some sample commands showcasing the problem (I've added a printf
>     with drain result just after the indicated line above locally):
>     >
>     > https://paste.debian.net/hidden/9690d660/
>     >
>     > It shows that in case there's no active subscriptions to the port, the
>     event delivery fails, with no data ever reaching the hardware device. As
>     long as there's at least one subscription to the port, it works ok. I've
>     reproduced this on 5.15.36-rt41-v7+ and 6.6.58-v8-16k (running on
>     Raspberry Pi, based on https://github.com/raspberrypi/linux)
>     >
>     > I've traced the -ENODEV to be returned at this location: 
>     https://elixir.bootlin.com/linux/v6.6.58/source/sound/core/seq/seq_midi.c#L134
>     >
>     > Whenever there's a subscription, the 'substream' is not NULL.
>     >
>     > But what I would naturally expect is for the events to get delivered to
>     the hardware port when using direct addressing, regardless of its
>     subscription status, the same way how it's possible to send events to
>     application aseq ports:
>     >
>     > -- Terminal 1 --
>     > patch@patchbox:~ $ aseqdump
>     > Waiting for data at port 128:0. Press Ctrl+C to end.
>     > Source  Event                  Ch  Data
>     > 129:0   Note on                 0, note 64, velocity 48
>     >
>     > -- Terminal 2 --
>     > patch@patchbox:~/work/aseqsend $ ./aseqsend 128:0 90 40 30
>     > drain: 0
>     >
>     >
>     > Is this a bug in ALSA Sequencer, or is my expectation of being able to
>     write directly to a hardware ALSA sequencer port incorrect?
>    
>     The behavior depends on the sequencer client, but in the case of the
>     normal MIDI clients, the subscription is mandatory for delivering
>     events properly.  It corresponds to open/close the device.
> 
>     HTH,
>    
>     Takashi
> 
