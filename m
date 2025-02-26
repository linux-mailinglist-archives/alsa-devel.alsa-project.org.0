Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDFA45BA7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 11:23:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC34602E0;
	Wed, 26 Feb 2025 11:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC34602E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740565404;
	bh=8h4ncFqKDFiAB0U04LUoPTJwbqP9bx5RgXzTe2beLpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qtP2wZJsJHXIDp1/ctDFgBcUFLR5jlLbdaw1eJIbfbHQTCeYsqCq155HTfFChXouS
	 b3Lacru1OxzwyEsXD4mZINmvijbt/rS88HGV5n3zeWHjr/mdRaRsXBFlNq/tHjo3VQ
	 P1yMBHJtDe79KqV9gXDqRKahdzfwti0LScnjr65A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D59C5F805C2; Wed, 26 Feb 2025 11:22:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14BF6F805B1;
	Wed, 26 Feb 2025 11:22:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA706F8016E; Wed, 26 Feb 2025 11:22:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F8E7F800E5
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 11:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F8E7F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=f1EoD+gb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/cq/aERQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=f1EoD+gb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/cq/aERQ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 169561F38F;
	Wed, 26 Feb 2025 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740565345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnCahMySlJ/GunXk5Zx9n+zChwkMjLLK8tByyilaSso=;
	b=f1EoD+gbZdeef3CRXFB+U17LDFNRxbf6wDxSQUMxkkFcjBUOoTSqK+0St65h2i++77GCjI
	pn/ouUUzBq2yWRyG/muGVLFP5/bsbtwcD/8kiDJ4SPMskaHkQk25yAmkZX0fkrPwzHpQ+q
	hBz92tyuNiZ94RYR/2W5vN3ujlTlolY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740565345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnCahMySlJ/GunXk5Zx9n+zChwkMjLLK8tByyilaSso=;
	b=/cq/aERQoI+TGeUUxXHGGuKgCp+WwumLfkl9yCyy47br8aaXxNuFZ4OY1R8i6UBrKcTZCc
	j6YoyopR5P8AFyBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f1EoD+gb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/cq/aERQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740565345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnCahMySlJ/GunXk5Zx9n+zChwkMjLLK8tByyilaSso=;
	b=f1EoD+gbZdeef3CRXFB+U17LDFNRxbf6wDxSQUMxkkFcjBUOoTSqK+0St65h2i++77GCjI
	pn/ouUUzBq2yWRyG/muGVLFP5/bsbtwcD/8kiDJ4SPMskaHkQk25yAmkZX0fkrPwzHpQ+q
	hBz92tyuNiZ94RYR/2W5vN3ujlTlolY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740565345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnCahMySlJ/GunXk5Zx9n+zChwkMjLLK8tByyilaSso=;
	b=/cq/aERQoI+TGeUUxXHGGuKgCp+WwumLfkl9yCyy47br8aaXxNuFZ4OY1R8i6UBrKcTZCc
	j6YoyopR5P8AFyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0821C1377F;
	Wed, 26 Feb 2025 10:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RotIAWHrvmf8bAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Feb 2025 10:22:25 +0000
Date: Wed, 26 Feb 2025 11:22:24 +0100
Message-ID: <87cyf557kv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lena <lena@nihil.gay>
Cc: alsa-devel@alsa-project.org
Subject: Re: ALSA USB quirk mixer driver question
In-Reply-To: <6f03b7d6-97d5-48a4-be6f-a1df481971fc@nihil.gay>
References: <6f03b7d6-97d5-48a4-be6f-a1df481971fc@nihil.gay>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 169561F38F
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: I7RP66O2VKHPHSS5CNELY6TUYPKR42O5
X-Message-ID-Hash: I7RP66O2VKHPHSS5CNELY6TUYPKR42O5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7RP66O2VKHPHSS5CNELY6TUYPKR42O5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Feb 2025 13:05:13 +0100,
Lena wrote:
> 
> Hi all!
> 
> I'm currently trying to develop an usb quirk mixer driver for a
> desktop USB audio interface.
> 
> The interface exposes the following:
> 
> - interface 0-2 are USB UAC compliant, bound to by snd-usb-audio, and
>   working flawlessly
> 
> - interface 3 is vendor specific, and we can ignore it (used for
>   firmware updates)
> 
> - interface 4 exposes a non-standard mixer with a HID interface exposing
>   2 interrupt endpoints, and is used by the vendor windows app.
> 
> I have studied the protocol with usbpcap and can successfully talk to
> the interface on the userspace, but i had a question regarding how to
> proceed in the kernel.
> 
> This is because, after creating a new entry in `sound/usb/mixer_quirks.c`
> with all the needed controls, userspace can interact with them, etc.
> 
> I can't figure out how to tell ALSA to
> bind to the correct interface for the mixer (and kick out usbhid).
> Looking at the other quirk mixer drivers it doesn't look (?) like any
> other quirk mixer driver is binding to a *different* interface, not
> even `sound/usb/mixer_scarlett.c`.

The HID device won't be bound with the sound driver, and the mixer
"quirks" found in USB-audio driver aren't for managing HID interfaces
but only about audio interfaces.  That said, what you'd need would be
to write rather a HID driver for the interface.  The plumbing of both
interfaces is done in the upper level, typically in user space.

HTH,

Takashi

> Generally, in a standalone USB driver you'd have tracking/teardown
> handled easily with a callback, but i'm having trouble with the
> dependencies here. (simply using `usb_sndintpipe()` or
> `usb_interrupt_msg()` triggers kernel oopses, so that's probably not it)
> 
> What i think i have to do is to use `usb_get_intf()`, then i have to
> somehow claim it (does `usb_driver_claim_interface()` work here?). But
> `usb_get_intf()` requires me to then release the interface with
> `usb_put_intf()`, and it doesn't look like there's anywhere for me to do
> that. (`snd_usb_mixer_elem_free()`? doesn't look like the order is
> correct)
> 
> `iface_ref_find()` would sorta do what i need, but i cannot use it here.
> 
> Could someone please point me in the right direction? I'm very stuck at
> the moment.
> 
> Thanks,
> 
> Lena
