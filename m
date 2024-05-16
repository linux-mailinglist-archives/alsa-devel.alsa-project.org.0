Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A38C79ED
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 17:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE0B85D;
	Thu, 16 May 2024 17:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE0B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715875127;
	bh=V/NH146L7hIj0JHJ81pb0dj3R2FIvS7eqv0S8By9H3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I1oA9NOnQ5Jp9tDaYEI0IwepsM+Y3goHs0EnpNmH3mouK+5R6FxoLg564mDqL0R4i
	 uGPrGDklrLi97PAaacObbkh+tUQ3SoJhP2b7uT93dgjts6eVP2OrEyrMoHA8d5/u2u
	 r7L+9nkqHfQVc0qp9AAmja5QALgAs5Y9gaDO27fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7F81F8058C; Thu, 16 May 2024 17:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21181F8058C;
	Thu, 16 May 2024 17:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D1EDF8025F; Thu, 16 May 2024 17:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B269EF80072
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 17:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B269EF80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yvkGjKI+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yEL3sR0H;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yvkGjKI+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yEL3sR0H
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D114E34A44;
	Thu, 16 May 2024 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715868147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8dHN/8uJit7KYQ/wbXUaaaUK7rLV870M0qQi40wRk=;
	b=yvkGjKI+HlU66ZeEIDPc5u1ZN2WdFvqMcB9L2qwKmGMlUB95vzaZUWtRWe6SGky1NB+yi8
	YA5x0lc2LBVM6AaRHly4m8Wc1aOEKemxsCAWslvafYd9UwcOqTUgwWIk0Ws3wX1PIVBzqH
	A2YUsI1gbqsGFFDBeIE7kjqsj1p1hrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715868147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8dHN/8uJit7KYQ/wbXUaaaUK7rLV870M0qQi40wRk=;
	b=yEL3sR0HvJfrS+9bZ3N+OJ2/2Wmkd4V+1TX90j+VjtH5+iC/14dwnkUEXzNKVHZUmYS3DS
	fMe1AsRljprqdmAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yvkGjKI+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yEL3sR0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715868147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8dHN/8uJit7KYQ/wbXUaaaUK7rLV870M0qQi40wRk=;
	b=yvkGjKI+HlU66ZeEIDPc5u1ZN2WdFvqMcB9L2qwKmGMlUB95vzaZUWtRWe6SGky1NB+yi8
	YA5x0lc2LBVM6AaRHly4m8Wc1aOEKemxsCAWslvafYd9UwcOqTUgwWIk0Ws3wX1PIVBzqH
	A2YUsI1gbqsGFFDBeIE7kjqsj1p1hrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715868147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8dHN/8uJit7KYQ/wbXUaaaUK7rLV870M0qQi40wRk=;
	b=yEL3sR0HvJfrS+9bZ3N+OJ2/2Wmkd4V+1TX90j+VjtH5+iC/14dwnkUEXzNKVHZUmYS3DS
	fMe1AsRljprqdmAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8449713991;
	Thu, 16 May 2024 14:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ijkOH/MRRmZbaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 May 2024 14:02:27 +0000
Date: Thu, 16 May 2024 16:02:43 +0200
Message-ID: <87h6ex3ldo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Manuel Barrio Linares <mbarriolinares@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jeremie Knuesel <knuesel@gmail.com>,
	Lukasz Tyl <ltyl@hem-e.com>,
	Christos Skevis <xristos.thes@gmail.com>,
	Jussi Laako <jussi@sonarnerd.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix for sampling rates support for Mbox3
In-Reply-To: <20240516134003.39104-1-mbarriolinares@gmail.com>
References: <87ikze486g.wl-tiwai@suse.de>
	<20240516134003.39104-1-mbarriolinares@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,suse.com,gmail.com,hem-e.com,sonarnerd.net,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D114E34A44
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: A42RJBJML4ZZRB5YABA2XUN6JTPAK6EX
X-Message-ID-Hash: A42RJBJML4ZZRB5YABA2XUN6JTPAK6EX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A42RJBJML4ZZRB5YABA2XUN6JTPAK6EX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 May 2024 15:40:02 +0200,
Manuel Barrio Linares wrote:
> 
> Fixed wrong use of usb_sndctrlpipe to usb_rcvctrlpipe
> 
> Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>

Thanks, applied now with Fixes tag.


Takashi
