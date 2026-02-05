Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIhEH964hGnG4wMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 16:35:58 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05766F4ACD
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 16:35:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D96B601D3;
	Thu,  5 Feb 2026 16:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D96B601D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770305757;
	bh=dRc+JLQGih210Q0+nbXjpV+4Pn1T9oY6M4gWBoCnGm8=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=H1ASH2TvzgMY8QKg64K79HNZGigmLJAC7IXPrX3kgBCgztz2JYInqY0D0qe64gt7g
	 f8SKapu3N8G1vFSqFmDh7uKuzuDZmOIwMDYjxITAfplbe8lZ1GGanAeWvMMUhnBWUt
	 96Z6tmDmKLA7MeQb5c0HxFceySn0JL68mAmkECxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD45F805F0; Thu,  5 Feb 2026 16:35:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E080F805E5;
	Thu,  5 Feb 2026 16:35:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84237F8051E; Thu,  5 Feb 2026 16:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C207F8016E
	for <alsa-devel@alsa-project.org>; Thu,  5 Feb 2026 16:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C207F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=kaCGKDEf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Cc:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=Dw+c2RJZ8mrYjNeYPuJsnMqGbfA1432i+UK694t+3jQ=; b=kaCGK
	DEfbCtT9ju2jxWTGGPv8LWF6UjumErWdPTYeLuiLn0m4alxIN3tIk4bnkYskN0tRyq3rGbvCUmgCp
	TyMgZ4dtJ13JNEICuI/6ANujroxXuFGQUN/eog54sLPD50Ln35y8j2tCGheSSHrS4KUzlxX5C50jG
	vMnVNsIK633c=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net
 ([82.36.99.19] helo=stax)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1vo1N0-00000000Eyx-3mEJ
	for alsa-devel@alsa-project.org;
	Thu, 05 Feb 2026 15:34:14 +0000
Received: from localhost (stax.localdomain [local])
	by stax.localdomain (OpenSMTPD) with ESMTPA id 940d7208
	for <alsa-devel@alsa-project.org>;
	Thu, 5 Feb 2026 15:34:14 +0000 (UTC)
Date: Thu, 5 Feb 2026 15:34:14 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: Re: Can't resample into ALSA plugin
In-Reply-To: <b7b70838-2452-8481-e9ae-f9001ddaf74e@xwax.org>
Message-ID: <3ef6ee0a-ed02-0283-0e0e-d38eb02fcb63@xwax.org>
References: <b7b70838-2452-8481-e9ae-f9001ddaf74e@xwax.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID-Hash: H4BLYCTT7GHTFWWHMR6HIV7MY7JWKW2W
X-Message-ID-Hash: H4BLYCTT7GHTFWWHMR6HIV7MY7JWKW2W
X-MailFrom: mark@xwax.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4BLYCTT7GHTFWWHMR6HIV7MY7JWKW2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[xwax.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,xwax.org:s=swing];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,xwax.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xwax.org:mid,xwax.org:dkim,alsa-project.org:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark@xwax.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05766F4ACD
X-Rspamd-Action: no action

On Sun, 11 Jan 2026, Mark Hills wrote:

> I've written an ALSA plugin (ioplug) of the form below.
>
> My plugin offers only S16, 48000Hz.
>
> I expected a "plug" device would take the application's request and
> resample to 48000Hz, but instead it fails:
>
>   $ aplay -D plug:mytest cd-audio.wav
>   Playing WAVE 'cd-audio.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
>   aplay: set_params:1456: Unable to install hw params:
>   ACCESS:  RW_INTERLEAVED
>   FORMAT:  S16_LE
>   SUBFORMAT:  STD
[...]
>
> Modify the plugin 48000Hz to be 44100Hz and negotiation passes, so it
> suggests the rate is the problem (not some other parameter like period
> size)

Following up my own mail to help the others looking at these archives:

The root cause seems to be my plugin not offering 
SND_PCM_ACCESS_MMAP_INTERLEAVED, which I assume is required by the "plug" 
to do rate resampling and feed into it.

I couldn't find this in any documentation, searching or AI chat, and the 
ALSA code for negotiating the plug is non-trivial so perhaps someone has 
an explanation or rationale if it could fall into this for some other 
reason.

Here's the culprit code:

> SND_PCM_PLUGIN_DEFINE_FUNC(mytest)
> {
>       struct state *s;
>       snd_pcm_ioplug_t *io;
>       unsigned access = SND_PCM_ACCESS_RW_INTERLEAVED;
[...]
>       snd_pcm_ioplug_set_param_list(io, SND_PCM_IOPLUG_HW_ACCESS, 1, &access);

Many thanks,

-- 
Mark
