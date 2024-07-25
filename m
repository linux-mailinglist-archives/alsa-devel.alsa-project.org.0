Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E593C2DB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 15:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA32F53;
	Thu, 25 Jul 2024 15:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA32F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721913702;
	bh=27UdjVY2T9kftaELLseaAoaA4TD8YZeRfanOV32l7I0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjyl69tfuNvTE602Mfy9WPUbUtTwsGDofJ+gj2K/VaUzWcCUHb2bV9wAhRBSilt+G
	 0JqpsbgUqjiIioIL6sHqz3r6H364CYM2Kmag0eq/GDr5Ejizj09HZRKmMW7mCEhafh
	 UeGk30ETRKzof1CLtvQ/y4MwQ5Jcr2bQb8KktaPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2ACF805AE; Thu, 25 Jul 2024 15:21:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF17F805AF;
	Thu, 25 Jul 2024 15:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FBC4F8026D; Thu, 25 Jul 2024 15:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30893F800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 15:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30893F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oUd2QNDt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SCp6G7Eq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=oUd2QNDt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SCp6G7Eq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FA471FC24;
	Thu, 25 Jul 2024 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721912825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x7a2eLlH3iIWOinS6JEA7tMaX+0WlcTQWISwluY5v5U=;
	b=oUd2QNDtyhsQ3bE2a/AeXhL7YygsZVTa8e7uZ4oGeucZyLPU93E6qpdGMpnms41r6AHiAI
	L4M7Prp9JhVQuI7ZOcq4vaiRNKQEYbUxQM4d5gt/D52cC0H2QivekzVC4bqDVQgyaUkzAC
	bGuWh1c7DEW4I6O8Yn8goQsp5Y6k31g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721912825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x7a2eLlH3iIWOinS6JEA7tMaX+0WlcTQWISwluY5v5U=;
	b=SCp6G7Eq6DJVRxI6M3JoMYXXwQI5pP0r1nwln+zkmD4qugxDH/d6P00SvZq4MXl1lUJEKL
	1dp4w/20ll4/4+Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oUd2QNDt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SCp6G7Eq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721912825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x7a2eLlH3iIWOinS6JEA7tMaX+0WlcTQWISwluY5v5U=;
	b=oUd2QNDtyhsQ3bE2a/AeXhL7YygsZVTa8e7uZ4oGeucZyLPU93E6qpdGMpnms41r6AHiAI
	L4M7Prp9JhVQuI7ZOcq4vaiRNKQEYbUxQM4d5gt/D52cC0H2QivekzVC4bqDVQgyaUkzAC
	bGuWh1c7DEW4I6O8Yn8goQsp5Y6k31g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721912825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x7a2eLlH3iIWOinS6JEA7tMaX+0WlcTQWISwluY5v5U=;
	b=SCp6G7Eq6DJVRxI6M3JoMYXXwQI5pP0r1nwln+zkmD4qugxDH/d6P00SvZq4MXl1lUJEKL
	1dp4w/20ll4/4+Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68FBC13874;
	Thu, 25 Jul 2024 13:07:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zDuHGPlNomaCegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jul 2024 13:07:05 +0000
Date: Thu, 25 Jul 2024 15:07:40 +0200
Message-ID: <87r0bhipr7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "edmund.raile" <edmund.raile@proton.me>
Cc: alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	o-takashi@sakamocchi.jp,
	gustavoars@kernel.org,
	clemens@ladisch.de,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
In-Reply-To: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.31 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 9FA471FC24
X-Rspamd-Action: no action
Message-ID-Hash: JZVQYF3SAHL3L2GCGVLFCYJGVDILREFA
X-Message-ID-Hash: JZVQYF3SAHL3L2GCGVLFCYJGVDILREFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZVQYF3SAHL3L2GCGVLFCYJGVDILREFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 00:24:29 +0200,
edmund.raile wrote:
> 
> Bisection revealed that the bitcrushing distortion with RME FireFace 800
> was caused by 1d717123bb1a7555
> ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
> 
> Reverting this commit yields restoration of clear audio output.
> I will send in a patch reverting this commit for now, soonTM.
> 
> #regzbot introduced: 1d717123bb1a7555

While it's OK to have a quick revert, it'd be worth to investigate
further what broke there; the change is rather trivial, so it might be
something in the macro expansion or a use of flex array stuff.


thanks,

Takashi
