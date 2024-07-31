Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B18942A9A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 11:35:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4DF2CFF;
	Wed, 31 Jul 2024 11:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4DF2CFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722418489;
	bh=9mCMWNgkxZous6sUqX0P3vU1EQR3viFSypj78b8UuPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uCfEPvgko8x+E5Hv+DbHfDbX4z3CozVfQWYIFAcq3ThUj/Eei+2FTFxj2tgWLNPdZ
	 3V7TRye28y4TqKHWLymbxwIwTeZl2QOYBtNxpsxkLWKv4F0rhhRQllGVY3e2163dK1
	 HTw6VqemudFPTpxSkZIvofl0XppCz03/Xcwo8P4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB633F805BA; Wed, 31 Jul 2024 11:34:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE44F805B0;
	Wed, 31 Jul 2024 11:34:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F7ADF802DB; Wed, 31 Jul 2024 11:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 647F3F8007E
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 11:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647F3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YSUiFIWS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N+yK7TXs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=YSUiFIWS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N+yK7TXs
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4672D21CE9;
	Wed, 31 Jul 2024 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722418445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5j1w50EBMewlbkSYygItxsuWzoUX4TDNDVjZAQ4wxE=;
	b=YSUiFIWSXVlZoiBZ+x95AbHjcD0Oh02fwu0CQl3RIhjcpDRCLpvGEyt4K6u99L87/0p2Tz
	i6NrS/qtd4TC6K6rCpGf9ImcM9cCtafQGVYwzaPXLjsbZ1z2TAlxanNdida/iwEInl6s1l
	Wj5qfnP37orMAs9sceeRNwYDJq5hKUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722418445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5j1w50EBMewlbkSYygItxsuWzoUX4TDNDVjZAQ4wxE=;
	b=N+yK7TXswUsqDEPXzk/u6FUGYUrXCuSJE4p1lINUKGZEwV4WWO9zub8C99hSF2B+uNnIjk
	4dYV3BYR3tzM8JDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722418445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5j1w50EBMewlbkSYygItxsuWzoUX4TDNDVjZAQ4wxE=;
	b=YSUiFIWSXVlZoiBZ+x95AbHjcD0Oh02fwu0CQl3RIhjcpDRCLpvGEyt4K6u99L87/0p2Tz
	i6NrS/qtd4TC6K6rCpGf9ImcM9cCtafQGVYwzaPXLjsbZ1z2TAlxanNdida/iwEInl6s1l
	Wj5qfnP37orMAs9sceeRNwYDJq5hKUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722418445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5j1w50EBMewlbkSYygItxsuWzoUX4TDNDVjZAQ4wxE=;
	b=N+yK7TXswUsqDEPXzk/u6FUGYUrXCuSJE4p1lINUKGZEwV4WWO9zub8C99hSF2B+uNnIjk
	4dYV3BYR3tzM8JDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E08A1368F;
	Wed, 31 Jul 2024 09:34:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jGbuCQ0FqmYHHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 09:34:05 +0000
Date: Wed, 31 Jul 2024 11:34:42 +0200
Message-ID: <87a5hxzyz1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH alsa-lib 2/4] seq: Add API helper functions for creating
 UMP Endpoint and Blocks
In-Reply-To: <1f1c9d4b-b3ca-44b6-acce-7e52cfaa2eb9@linux.intel.com>
References: <20240619152855.6809-1-tiwai@suse.de>
	<20240619152855.6809-3-tiwai@suse.de>
	<0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com>
	<87ikwlzzlt.wl-tiwai@suse.de>
	<1f1c9d4b-b3ca-44b6-acce-7e52cfaa2eb9@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: XKBYBCQ6ANUD4T4CLYQA54OHQ6I2QWNL
X-Message-ID-Hash: XKBYBCQ6ANUD4T4CLYQA54OHQ6I2QWNL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKBYBCQ6ANUD4T4CLYQA54OHQ6I2QWNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Jul 2024 11:29:41 +0200,
Amadeusz Sławiński wrote:
> 
> On 7/31/2024 11:21 AM, Takashi Iwai wrote:
> > On Wed, 31 Jul 2024 10:46:08 +0200,
> > Amadeusz Sławiński wrote:
> >> 
> >> On 6/19/2024 5:28 PM, Takashi Iwai wrote:
> >>> For making it easer for applications to create a virtual UMP Endpoint
> >>> and UMP blocks, add two API helper functions.
> >>> 
> >>> snd_seq_create_ump_endpoint() creates (unsurprisingly) a UMP Endpoint,
> >>> based on the given snd_ump_endpoint_info_t information.  The number of
> >>> (max) UMP groups belonging to this Endpoint has to be specified.
> >>> This function sets up the Endpoint info on the sequencer client, and
> >>> creates a MIDI 2.0 UMP port as well as UMP Group ports automatically.
> >>> The name of the sequencer client is updated from the Endpoint name,
> >>> too.
> >>> 
> >>> After creating a UMP Endpoint, create each UMP Block via
> >>> snd_seq_create_ump_block() function with a snd_ump_block_info_t info.
> >>> The associated groups for each block have to be specified there.
> >>> The port names and capability bits are updated accordingly after
> >>> setting each block information.
> >>> 
> >>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >>> ---
> >> 
> >> ...
> >> 
> >>> +			if (*blknames) {
> >>> +				strlcat(blknames, ", ", sizeof(blknames));
> >>> +				strlcat(blknames, (const char *)bp->name,
> >>> +					sizeof(blknames));
> >> 
> >> FYI, this seems to introduce build problems on systems that do not
> >> have strlcpy:
> >> 
> >> During build:
> >> seqmid.c: In function ‘update_group_ports’:
> >> seqmid.c:672:33: warning: implicit declaration of function
> >> ‘strlcat’; did you mean ‘strncat’?
> >> [-Wimplicit-function-declaration]
> >>    672 |                                 strlcat(blknames, ", ",
> >> sizeof(blknames));
> >>        |                                 ^~~~~~~
> >>        |                                 strncat
> >> 
> >> And then during linking:
> >> /usr/bin/ld: seq/.libs/libseq.a(seqmid.o): in function `update_group_ports':
> >> /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:672: undefined
> >> reference to `strlcat'
> >> /usr/bin/ld: /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:673:
> >> undefined reference to `strlcat'
> >> collect2: error: ld returned 1 exit status
> > 
> > Thanks, I'll modify it to avoid strlcat() like below.
> > 
> > 
> > Takashi
> > 
> > -- 8< --
> > Subject: [PATCH] seq: Avoid strlcat()
> > 
> > strlcat() isn't available in every system, so better to avoid it.
> > Rewrite the code without strlcat().
> > 
> > Fixes: 6167b8ce3e80 ("seq: Add API helper functions for creating UMP Endpoint and Blocks")
> > Link: https://lore.kernel.org/0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >   src/seq/seqmid.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/src/seq/seqmid.c b/src/seq/seqmid.c
> > index 08c62d5c24b8..b30db4075254 100644
> > --- a/src/seq/seqmid.c
> > +++ b/src/seq/seqmid.c
> > @@ -635,6 +635,7 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
> >   		char blknames[64];
> >   		char name[64];
> >   		unsigned int caps = 0;
> > +		int len;
> >     		blknames[0] = 0;
> >   		for (b = 0; b < ep->num_blocks; b++) {
> > @@ -668,14 +669,13 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
> >     			if (!*bp->name)
> >   				continue;
> > -			if (*blknames) {
> > -				strlcat(blknames, ", ", sizeof(blknames));
> > -				strlcat(blknames, (const char *)bp->name,
> > -					sizeof(blknames));
> > -			} else {
> > +			len = strlen(blknames);
> > +			if (len)
> > +				snprintf(blknames + len, sizeof(blknames) - len,
> > +					 ", %s", bp->name);
> > +			else
> >   				snd_strlcpy(blknames, (const char *)bp->name,
> >   					    sizeof(blknames));
> > -			}
> >   		}
> >     		if (!*blknames)
> 
> Builds now, but still gives warning:
> 
> seqmid.c: In function ‘update_group_ports’:
> seqmid.c:675:45: warning: ‘%s’ directive output may be truncated
> writing up to 127 bytes into a region of size 61
> [-Wformat-truncation=]
>   675 |                                          ", %s", bp->name);
>       |                                             ^~
> In file included from /usr/include/stdio.h:894,
>                  from ../../include/local.h:28,
>                  from seq_local.h:26,
>                  from seqmid.c:23:
> In function ‘snprintf’,
>     inlined from ‘update_group_ports’ at seqmid.c:674:5:
> /usr/include/x86_64-linux-gnu/bits/stdio2.h:71:10: note:
> ‘__builtin___snprintf_chk’ output between 3 and 130 bytes into a
> destination of size 63
>    71 |   return __builtin___snprintf_chk (__s, __n,
> __USE_FORTIFY_LEVEL - 1,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    72 |                                    __glibc_objsize (__s), __fmt,
>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    73 |                                    __va_arg_pack ());
>       |                                    ~~~~~~~~~~~~~~~~~

The compiler gives too much false positives.


Takashi
