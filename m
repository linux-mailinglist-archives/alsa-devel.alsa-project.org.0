Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D669A89815
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Apr 2025 11:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08E9968459;
	Tue, 15 Apr 2025 11:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08E9968459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744709828;
	bh=OkBY9Xw36Y9PiWZASQI7OEVXsr5oy1CxNdHlImDBKWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atmpaXGGfjK0hZxTPDDRHjJX85J7NvOW5isRqC3b3FgVUUwZAUh0WqZqI5wlD/Nr7
	 Xo5dGRNkpMY9cZGxGurDaz0/BXQGPSsTtH0n+b1isMGKE24p9PMJMLla0Ad74bVqZi
	 GszDQbQpvtm14W8Hzj2EVhYyVPmTzC0Gme6ksXKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01F7F805C5; Tue, 15 Apr 2025 11:36:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4458F805CA;
	Tue, 15 Apr 2025 11:36:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DFA3F80224; Tue, 15 Apr 2025 11:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6313F80075
	for <alsa-devel@alsa-project.org>; Tue, 15 Apr 2025 11:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6313F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=A9qg7Mk8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ATuZmOmB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=A9qg7Mk8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ATuZmOmB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 834821F387;
	Tue, 15 Apr 2025 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744709779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVWxvGLRV9VNGPT4ZAnK3VIqNpYbLx9ZyJXBsbNj58M=;
	b=A9qg7Mk8qn0TkrpCvsIQdG38xPkIEB4fC6zshsSS/GlIt4HHP/JEDwH0klvexSvvXKl6nn
	Ae9kNvKClyn8SU2DtIK3x6tVQHFdCNx/73Zr5W8TQPJAk+Ih0UWJi5WZBrgqbAw8OK3Ybw
	pN/KFhLhesZGBp+AMB6rr4Ute4IymHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744709779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVWxvGLRV9VNGPT4ZAnK3VIqNpYbLx9ZyJXBsbNj58M=;
	b=ATuZmOmBINRqBWrZl/o6yk+Vn7vnz5wd2WTYxdmLe/dohXvmTn5169pfkNisWNQZSKGqoa
	lcNg73yQUMUqM0AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744709779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVWxvGLRV9VNGPT4ZAnK3VIqNpYbLx9ZyJXBsbNj58M=;
	b=A9qg7Mk8qn0TkrpCvsIQdG38xPkIEB4fC6zshsSS/GlIt4HHP/JEDwH0klvexSvvXKl6nn
	Ae9kNvKClyn8SU2DtIK3x6tVQHFdCNx/73Zr5W8TQPJAk+Ih0UWJi5WZBrgqbAw8OK3Ybw
	pN/KFhLhesZGBp+AMB6rr4Ute4IymHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744709779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVWxvGLRV9VNGPT4ZAnK3VIqNpYbLx9ZyJXBsbNj58M=;
	b=ATuZmOmBINRqBWrZl/o6yk+Vn7vnz5wd2WTYxdmLe/dohXvmTn5169pfkNisWNQZSKGqoa
	lcNg73yQUMUqM0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68210139A1;
	Tue, 15 Apr 2025 09:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zxkoGJMo/mctWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 09:36:19 +0000
Date: Tue, 15 Apr 2025 11:36:19 +0200
Message-ID: <87ikn5vka4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: ALSA 1.2.14 release
In-Reply-To: <e88ab80d-c77e-4f2b-8c51-8b1507b46612@perex.cz>
References: <833d909b-1689-4e3e-b6fb-0595364549a5@perex.cz>
	<e88ab80d-c77e-4f2b-8c51-8b1507b46612@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: PKFMEKGG6K57FISUWSICUFWQU5THFMGL
X-Message-ID-Hash: PKFMEKGG6K57FISUWSICUFWQU5THFMGL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKFMEKGG6K57FISUWSICUFWQU5THFMGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Apr 2025 19:12:43 +0200,
Jaroslav Kysela wrote:
> 
> 
> Hello all,
> 
> 	new ALSA userspace packages were released. You may download them from
> the ALSA website http://www.alsa-project.org or directly:
> 
> 	HTTP: https://www.alsa-project.org/files/pub
> 	FTP:  ftp://ftp.alsa-project.org/pub
> 
> Released packages:
> 
> 	alsa-lib
> 	alsa-utils
> 	alsa-ucm-conf
>         alsa-tools
>         pyalsa
> 
> Full list of changes:
> 
> 	https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14
> 
> The fingerprint of the public signing key is:
> 
> 	F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91
> 
> 				Have fun,
> 					Jaroslav

Are the latest commits for alsa-tools and alsa-python missing on
github?  The tarballs look fine and I could build.


thanks,

Takashi
