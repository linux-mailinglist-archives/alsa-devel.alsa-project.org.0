Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E69E1C7C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 13:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293C414DE;
	Tue,  3 Dec 2024 13:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293C414DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733229858;
	bh=slmerlEFP6LYM///Q+S4TNdROXNbBBnBssWE/ctLGhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZsXat+6qLsvp5L14peiKmlst9iWw4RniDnZNAGX/bOfDGddHzw9YcqaKpxZc2vvyb
	 2dfXVNSIUVy0t2Dk5kGivNVx/YVPQ0gEHZ2kmdgc5qyrK8FTV+pc8/tzgD70qDWMtg
	 u7Q0EaANF5eIyBcK8WrP/gav7i1BkzZGG3EjVPEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164F8F805BF; Tue,  3 Dec 2024 13:43:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72AEDF805BD;
	Tue,  3 Dec 2024 13:43:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A599BF80272; Tue,  3 Dec 2024 13:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8233F80073
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 13:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8233F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wVq95SfE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ap1KqOah;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=wVq95SfE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ap1KqOah
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 479DF210F5;
	Tue,  3 Dec 2024 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733229820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0Gny7hcm9UP6assZpBds6IACLiMoSvRnFX1ptr3e2Q=;
	b=wVq95SfEXv/W4RC+Uar1EnmVI687tF8cSgeXkFERZP8wGYvsETN2vlOODTXq9D6QhfbbDT
	vyCaHLXLTk7qqkWZ4B1kR6bauzlADN5+KWJwW9Ww9lMFogTxf9EhjrpBylB3ffvsK2yuZO
	p3BArf7ZEpv9smL+w3g5kEIbhStyVNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733229820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0Gny7hcm9UP6assZpBds6IACLiMoSvRnFX1ptr3e2Q=;
	b=ap1KqOahyJ/L4EGkjdVapLDZ7JKRWndGMMn/Z3nvbzHWtUcuvwc8BewCy+JD9JaTMQGWxD
	4Qj8plO9omA9zgDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733229820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0Gny7hcm9UP6assZpBds6IACLiMoSvRnFX1ptr3e2Q=;
	b=wVq95SfEXv/W4RC+Uar1EnmVI687tF8cSgeXkFERZP8wGYvsETN2vlOODTXq9D6QhfbbDT
	vyCaHLXLTk7qqkWZ4B1kR6bauzlADN5+KWJwW9Ww9lMFogTxf9EhjrpBylB3ffvsK2yuZO
	p3BArf7ZEpv9smL+w3g5kEIbhStyVNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733229820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0Gny7hcm9UP6assZpBds6IACLiMoSvRnFX1ptr3e2Q=;
	b=ap1KqOahyJ/L4EGkjdVapLDZ7JKRWndGMMn/Z3nvbzHWtUcuvwc8BewCy+JD9JaTMQGWxD
	4Qj8plO9omA9zgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34EDE139C2;
	Tue,  3 Dec 2024 12:43:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JWlWDPz8Tme0EAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 12:43:40 +0000
Date: Tue, 03 Dec 2024 13:43:35 +0100
Message-ID: <87y10xx7go.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Filip Van Lunteren <filip.pinkfaun@outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: native DSD on PCI linux driver
In-Reply-To: <871pypymm0.wl-tiwai@suse.de>
References: 
 <AS4P189MB20372D46254D6425C820FC9C882F2@AS4P189MB2037.EURP189.PROD.OUTLOOK.COM>
	<871pypymm0.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: VOJC52PJDBGNSAXVLVDXN7XGCCUU4J47
X-Message-ID-Hash: VOJC52PJDBGNSAXVLVDXN7XGCCUU4J47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOJC52PJDBGNSAXVLVDXN7XGCCUU4J47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Dec 2024 13:31:03 +0100,
Takashi Iwai wrote:
> 
> On Tue, 26 Nov 2024 10:41:21 +0100,
> Filip Van Lunteren wrote:
> > 
> > 
> > Hello,
> > 
> > I am currently developing PCI audio output hardware and driver and want to
> > integrate native DSD playback. I am struggling to find documentation on this.
> > Is there DSD native support in ALSA? And how do I incorporate it? PCM is
> > already set up and works.
> 
> AFAIK, in the driver side, there is not much special; it assumes that
> DSD samples are passed over the standard PCM stream, and the driver
> uses special formats SNDRV_PCM_FORMAT_DSD_U8, *_U16 and *_U32 (with
> _LE and _BE suffix) for 8, 16 and 32bit, instead of the standard
> SNDRV_PCM_FORMAT_U8, *_S16, etc.  For those formats, the silence data
> is assumed to be 0x69, 0x6969, etc.

To be more exactly, the above statement is about PCM core.

Most of DSD stuff is found in USB audio driver, and if you need a DoP
support, the driver has to convert it manually.
(We may push it to PCM core, once when needed, but as currently it's 
required only by USB-audio, it's locally handled.)

Similarly, there is also bit-reversed transfer for some devices.

Both can be found in sound/usb/pcm.c.


HTH,

Takashi
