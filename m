Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B62956CB1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 16:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3031DEC1;
	Mon, 19 Aug 2024 16:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3031DEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724076469;
	bh=JjQrXq52ivA3bXvyL6iHny67CLCQUXQgAj4NnLRwNnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rA8YB3Ch4tdUbgDiwYG1XClh9iAq8LI2VuF0y4MzbHa3d0IOcu5AZquSKC2dfkcnk
	 GLWlUtWz3lb1nXz5ziP6KIb0uB3U4raqktDl76IVF2tpFyiJNoJ4oPGgutCgs0wu1N
	 Qq9CpNV4HMHsXintx91FVZfpTmiCVxb1nynzNx3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E482DF80580; Mon, 19 Aug 2024 16:07:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB2FF805B1;
	Mon, 19 Aug 2024 16:07:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA7A8F80494; Mon, 19 Aug 2024 16:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A1F3F80107
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 16:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A1F3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=k531YdWB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CffRlm4N;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0qelt+5J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FMwXPTiF
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B691421EFB;
	Mon, 19 Aug 2024 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724076335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hqg0KhQWd4wi8yzEWL33OI6ZQJuDjdv5rNkCZ7m87U=;
	b=k531YdWBwO0sAbDPea+CoeZpKctIXw5ak2UD1/VdQFzhCG7v9aO27hgEHrq+tfJzYVHzr/
	TJNrKPe2ecL51do4TrFVVeb0hSuM2PjpZBx7yBxYAz3IlOZ09Hag0O7KwRP6VIaROlSza6
	TRVYOCQfAtpWyLTmzTt9Eh6MFqq4+bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724076335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hqg0KhQWd4wi8yzEWL33OI6ZQJuDjdv5rNkCZ7m87U=;
	b=CffRlm4NWd5fY2+Nf+JTw5YxqexNJGtA4MO3FCsLQQINa0JjvC/QZ7ulVS4s/1xDSO3YUc
	fd28mU5hlplNyUAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724076333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hqg0KhQWd4wi8yzEWL33OI6ZQJuDjdv5rNkCZ7m87U=;
	b=0qelt+5JjbHgntX2+MKxTJ5lrrYE3WFgEIk4PmLZ3shyiIAZ/2ujnQ8PavtVotgLYjgObk
	rlXKfUZe1TsAwg62RO+kEgRHqdq7M+A4hNsI1WrmVXKUdlyed2c9Ko7IOc6BRNZIhYTzq1
	CjWpiQXHjLOMXgDP8d897pjg5kuKnJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724076333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hqg0KhQWd4wi8yzEWL33OI6ZQJuDjdv5rNkCZ7m87U=;
	b=FMwXPTiF8axbBQshj3QXAao5sEhOvDn/c57b65XJdmxkcE+1v4C0MK6IBhYBc+1s8+XN7r
	G5ahrVa4Z4mAdCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85EFE1397F;
	Mon, 19 Aug 2024 14:05:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMV1Hy1Rw2ZCAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Aug 2024 14:05:33 +0000
Date: Mon, 19 Aug 2024 16:06:15 +0200
Message-ID: <8734n0vc88.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Convert existing CS35L56 products to
 use autodetect fixup function
In-Reply-To: <20240819123736.111946-1-simont@opensource.cirrus.com>
References: <20240819123736.111946-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,cirrus.com:email,suse.de:mid]
Message-ID-Hash: RT6EB5QJYN4JLEANZJDCH22HQYCHA3CL
X-Message-ID-Hash: RT6EB5QJYN4JLEANZJDCH22HQYCHA3CL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RT6EB5QJYN4JLEANZJDCH22HQYCHA3CL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Aug 2024 14:37:36 +0200,
Simon Trimmer wrote:
> 
> The existing CS35L56 products can make use of the fixup function that
> works out the component binding details so we can remove the fixed
> configuration fixup functions.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Looks like a nice cleanup.
Applied to for-next branch now.  Thanks.


Takashi
