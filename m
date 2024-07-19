Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B135E9378E5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 16:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7C3E76;
	Fri, 19 Jul 2024 16:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7C3E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721397974;
	bh=4n2ooGJZvBn5tbK4qkLZ/UCzladiicUSER+5K/p4Cb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OFE+/dot3VEztbLtnArJzBRYAUMw7aS7UWCoVMltUJfohzhvxo0ZdL1a9kIwA4lcv
	 no8w/Xy2iwjiwf9u09AUCza7jnV3zEveAszls1hbirtQ6QnqB3G/5qv9ppjIC1rA+6
	 juPlmOVHY721UArJ0EFti7CYvsf/r6LW7ANV5yI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D998F805BE; Fri, 19 Jul 2024 16:05:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3748F80518;
	Fri, 19 Jul 2024 16:05:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DEB1F8013D; Fri, 19 Jul 2024 15:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E92EF8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 15:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E92EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zr71O+Hn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UvhPRg3v;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Zr71O+Hn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UvhPRg3v
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAEF71F7B0;
	Fri, 19 Jul 2024 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721397175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNaP2pC2cpA0gMhQ2FQt5XGmmAF1/jlO2fh02lWF4vU=;
	b=Zr71O+HnB+XI5t5o1dAQ5Bbx9sMY0qj6C2iIkC4UVfltaY407kwbes0FSWNUfLQN+/lS+C
	2wsKD4zi2JDCQXp6O35rt/m9h+PQ6e+17c9ApKwQ1TU7jeWOo+KZbjCFoAYQ693gcjPnlS
	Zu7mW5dy4qc0I0Y1EM/0Nl3Nrr8HtJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721397175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNaP2pC2cpA0gMhQ2FQt5XGmmAF1/jlO2fh02lWF4vU=;
	b=UvhPRg3vFPDPkX5XMd3st34MUa0lxmFsxxFY3qhzvq4jDMYuI/aBPsOmFZcbR59T+WNbwu
	bY57fVwagYV6q9CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721397175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNaP2pC2cpA0gMhQ2FQt5XGmmAF1/jlO2fh02lWF4vU=;
	b=Zr71O+HnB+XI5t5o1dAQ5Bbx9sMY0qj6C2iIkC4UVfltaY407kwbes0FSWNUfLQN+/lS+C
	2wsKD4zi2JDCQXp6O35rt/m9h+PQ6e+17c9ApKwQ1TU7jeWOo+KZbjCFoAYQ693gcjPnlS
	Zu7mW5dy4qc0I0Y1EM/0Nl3Nrr8HtJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721397175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNaP2pC2cpA0gMhQ2FQt5XGmmAF1/jlO2fh02lWF4vU=;
	b=UvhPRg3vFPDPkX5XMd3st34MUa0lxmFsxxFY3qhzvq4jDMYuI/aBPsOmFZcbR59T+WNbwu
	bY57fVwagYV6q9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 883901396E;
	Fri, 19 Jul 2024 13:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eu6wH7dvmmZLGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 13:52:55 +0000
Date: Fri, 19 Jul 2024 15:53:28 +0200
Message-ID: <87o76tsd2f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sergei Steshenko <steshenko_sergei@list.ru>
Cc: Xinhui Zhou <zxinhui2001@gmail.com>,
	alsa-user@lists.sourceforge.net,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [Alsa-user] Help on specifying 'chmap' in asound.conf
In-Reply-To: <748e1318-bc21-4280-9d1b-efd661403cdc@list.ru>
References: <mailman.0.1673946668.16556.alsa-user@lists.sourceforge.net>
	<0c99f6e0-c2f8-bc30-be10-314708382345@sc-riebe.de>
	<c21f506a-255e-5885-7dde-f9716187536e@sc-riebe.de>
	<CABsjGHLPYa26noDK3LDR_9EDxjXRZ9E5cEDAAyYnCEiuCPYWTg@mail.gmail.com>
	<87le21z5wp.wl-tiwai@suse.de>
	<748e1318-bc21-4280-9d1b-efd661403cdc@list.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[list.ru];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,list.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.sourceforge.net,alsa-project.org,suse.com,perex.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: UE3SSSSUCCYN6LEQQPYVNUXIZU5WMCPZ
X-Message-ID-Hash: UE3SSSSUCCYN6LEQQPYVNUXIZU5WMCPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UE3SSSSUCCYN6LEQQPYVNUXIZU5WMCPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Jul 2024 14:31:04 +0200,
Sergei Steshenko wrote:
> 
> For that matter, which ALSA source files do the parsing ? From my
> old/distant memories, ALSA is silent about mistakes made by user when
> the user provides various configuration files. So, there must be a way
> to resolve the issue of silent ignoring of user mistakes.

The parsing of a config is performed at each PCM plugin code.  In
particular case for chmap, pcm_hw.c, pcm_null.c and pcm_route.c call
_snd_pcm_parse_config_chmaps() helper and deal with the parsed data.

And, in most cases, alsa-lib rather complains (even verbosely) if
something goes wrong in the config file.  But the interpretation of
each config leaf is done in each PCM plugin code, and some might just
ignore the errors.  But that's not a general case.

> A possible temporary solution would be to "trace" (e.g. by inserting
> diagnostic print statements) parsing of provided by user configuration
> files, and to implement this one has to know where to insert the
> diagnostic print statements, and that's why I'm asking the question.

I understand that debugging the config stuff is sometimes messy,
yeah.  Some more verbose debug output would be helpful, indeed.


Takashi

> 
> --Sergei.
> 
> On 7/16/24 18:57, Takashi Iwai wrote:
> > On Tue, 16 Jul 2024 08:09:21 +0200,
> > Xinhui Zhou wrote:
> >> Dear all,
> >> 
> >>     I am having a question regarding how to specify 'champ' for a
> >> plugin.  I do not see any examples of this. I tried many ways to
> >> specify but failed.
> >> 
> >>    As indicated by the link below,   I can specify the MAP as a string
> >> array.   Can someone provide one example on how exactly this    [chmap
> >> MAP]  can be specified?
> >> 
> >> "
> >> pcm.name {
> >>          type cras
> >>      [chmap MAP]     # Provide channel maps; MAP is a string array
> >> }
> >> "
> >> https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html
> >> 
> >> 
> >> I can something like these, but none of these work for me.
> >> 
> >> chmap LFE
> >> chmap "LFE"
> >> chmap FR,FL,LFE
> >> champ "FR,FL,LFE"
> > You need to define a composite array, e.g. pass like
> >      chmap [ "FL,FR" ]
> > instead.
> > 
> > For multiple configurations, you can put more items such as
> >      chmap [ "FC" "FL,FR" "FL,FR,FC,LFE" ]
> > 
> > 
> > HTH,
> > 
> > Takashi
> > 
> > 
> > _______________________________________________
> > Alsa-user mailing list
> > Alsa-user@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/alsa-user
