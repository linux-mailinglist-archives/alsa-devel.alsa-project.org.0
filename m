Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47995932CF7
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 17:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE80D857;
	Tue, 16 Jul 2024 17:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE80D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721145579;
	bh=AQDEFhvHeh1FEb7w77gFyjjvFuGqxx5zXQKaYmqrXGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N8roWqgWi6ARd4noABqw2+5s0YqXh7CWGuYiCiwcJvu4BcRzXiYCrnpvm2NqLjBpl
	 nOgpRLyYi77Sa1ZnJi5Fi90Z9AHWlmoY3/HLyVQ4BU031aXUvIiyKps/S3OV0AiCrW
	 bvIihO/QzMfFILwJywHSFz0g2GmrjsfcYZ4ba4o0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0064AF805B5; Tue, 16 Jul 2024 17:59:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 503E6F805A0;
	Tue, 16 Jul 2024 17:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DDBF8026D; Tue, 16 Jul 2024 17:56:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5902FF8013D
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 17:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5902FF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UJxxWUdW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9tsE8Jo6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UJxxWUdW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9tsE8Jo6
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BCD21F8C2;
	Tue, 16 Jul 2024 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721145398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pra60VGlWBMHhPCQ5hxXZSDW6tGpkzVb4NLZA87S68c=;
	b=UJxxWUdWPhIWIj0sZmCgF1/p+n/wNPi1MxcOgsaVm/O6KexP8Rq62GWYaa0LTW8/KHUDqZ
	Ozmcv8eXdL4Cu7cM5a1STpQdthepjZaGrhg2FKgot2URTglSeTx84bbiHA8+cn1HOE7/OZ
	6Nq8HNL6SB+KVBhPEvZYQkw1iBcysiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721145398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pra60VGlWBMHhPCQ5hxXZSDW6tGpkzVb4NLZA87S68c=;
	b=9tsE8Jo6QvWH6GujPWHw6FZnwrRv2jaBl52PpPgQSqoz5B0+E7qfsqVW3ICrXCZ0TRubHK
	CGx7WAezJT01MUBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UJxxWUdW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9tsE8Jo6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721145398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pra60VGlWBMHhPCQ5hxXZSDW6tGpkzVb4NLZA87S68c=;
	b=UJxxWUdWPhIWIj0sZmCgF1/p+n/wNPi1MxcOgsaVm/O6KexP8Rq62GWYaa0LTW8/KHUDqZ
	Ozmcv8eXdL4Cu7cM5a1STpQdthepjZaGrhg2FKgot2URTglSeTx84bbiHA8+cn1HOE7/OZ
	6Nq8HNL6SB+KVBhPEvZYQkw1iBcysiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721145398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pra60VGlWBMHhPCQ5hxXZSDW6tGpkzVb4NLZA87S68c=;
	b=9tsE8Jo6QvWH6GujPWHw6FZnwrRv2jaBl52PpPgQSqoz5B0+E7qfsqVW3ICrXCZ0TRubHK
	CGx7WAezJT01MUBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D571C13795;
	Tue, 16 Jul 2024 15:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KGXaMjWYlmY7GwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jul 2024 15:56:37 +0000
Date: Tue, 16 Jul 2024 17:57:10 +0200
Message-ID: <87le21z5wp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xinhui Zhou <zxinhui2001@gmail.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-user@lists.sourceforge.net
Subject: Re: Help on specifying 'chmap' in asound.conf
In-Reply-To: 
 <CABsjGHLPYa26noDK3LDR_9EDxjXRZ9E5cEDAAyYnCEiuCPYWTg@mail.gmail.com>
References: <mailman.0.1673946668.16556.alsa-user@lists.sourceforge.net>
	<0c99f6e0-c2f8-bc30-be10-314708382345@sc-riebe.de>
	<c21f506a-255e-5885-7dde-f9716187536e@sc-riebe.de>
	<CABsjGHLPYa26noDK3LDR_9EDxjXRZ9E5cEDAAyYnCEiuCPYWTg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0BCD21F8C2
Message-ID-Hash: KKJA44QEE55LCACCTA4SVVZTGVGH7SGJ
X-Message-ID-Hash: KKJA44QEE55LCACCTA4SVVZTGVGH7SGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKJA44QEE55LCACCTA4SVVZTGVGH7SGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Jul 2024 08:09:21 +0200,
Xinhui Zhou wrote:
> 
> Dear all,
> 
>    I am having a question regarding how to specify 'champ' for a
> plugin.  I do not see any examples of this. I tried many ways to
> specify but failed.
> 
>   As indicated by the link below,   I can specify the MAP as a string
> array.   Can someone provide one example on how exactly this    [chmap
> MAP]  can be specified?
> 
> "
> pcm.name {
>         type cras
>     [chmap MAP]     # Provide channel maps; MAP is a string array
> }
> "
> https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html
> 
> 
> I can something like these, but none of these work for me.
> 
> chmap LFE
> chmap "LFE"
> chmap FR,FL,LFE
> champ "FR,FL,LFE"

You need to define a composite array, e.g. pass like
    chmap [ "FL,FR" ]
instead.

For multiple configurations, you can put more items such as
    chmap [ "FC" "FL,FR" "FL,FR,FC,LFE" ]


HTH,

Takashi
