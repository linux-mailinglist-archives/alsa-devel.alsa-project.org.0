Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB792EB65
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2024 17:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FD284A;
	Thu, 11 Jul 2024 17:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FD284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720710915;
	bh=SEzHIeud5+2Wu2lMQ10+bgEptyOD0Sc6lkgV8JTggNk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rTnniGCueraHzj/HLIvWSJ9xa+H3q/5e6DYDoy30p5aUBvmiNuCK+2WIN8ZiuGIBE
	 KXVjRjgHf3EsJvzir+9b0C08uQKHlHNLnVuv1TFd8tSbtX3BdihRV66AsSUpXcepA0
	 9BGqbpB7q8Vxi9hVuqofO6hDL4T2NFYPfXtw+JmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B8BEF804FC; Thu, 11 Jul 2024 17:14:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 967E9F805AE;
	Thu, 11 Jul 2024 17:14:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88094F801F5; Thu, 11 Jul 2024 17:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 788F3F800FE
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 17:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788F3F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g32JDN12;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Nnx5AIFt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=g32JDN12;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Nnx5AIFt
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 80BAC21A49;
	Thu, 11 Jul 2024 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720710777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vg0J+yLdHjgydpicBhLBqhe57Anq4zVTkcxJTLh4Ygw=;
	b=g32JDN12k1c+MNcm8EfbfFYng4iLkLim47uhndehEwbAWzLavWIQlkDkF15S327pN65JAJ
	RWFXwGJG9FWWDUZYrEM2x6KS2zghuxmNkeiCL5QRUIOrjcgjztAzWTZcSrm/fvBMc7DFPg
	RUaohFbGYlKuU4hI9//jrZ91sNnMSes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720710777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vg0J+yLdHjgydpicBhLBqhe57Anq4zVTkcxJTLh4Ygw=;
	b=Nnx5AIFtuFLJKQv7rzIbNQKFVQkpYGkkLVe9HmHX0DmprFhTjbIFMTFnRdgjct6h7R41Cf
	+5ic7i7e3vTZKsDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g32JDN12;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nnx5AIFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720710777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vg0J+yLdHjgydpicBhLBqhe57Anq4zVTkcxJTLh4Ygw=;
	b=g32JDN12k1c+MNcm8EfbfFYng4iLkLim47uhndehEwbAWzLavWIQlkDkF15S327pN65JAJ
	RWFXwGJG9FWWDUZYrEM2x6KS2zghuxmNkeiCL5QRUIOrjcgjztAzWTZcSrm/fvBMc7DFPg
	RUaohFbGYlKuU4hI9//jrZ91sNnMSes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720710777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vg0J+yLdHjgydpicBhLBqhe57Anq4zVTkcxJTLh4Ygw=;
	b=Nnx5AIFtuFLJKQv7rzIbNQKFVQkpYGkkLVe9HmHX0DmprFhTjbIFMTFnRdgjct6h7R41Cf
	+5ic7i7e3vTZKsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E320139E0;
	Thu, 11 Jul 2024 15:12:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s9OuFXn2j2YJHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Jul 2024 15:12:57 +0000
Date: Thu, 11 Jul 2024 17:13:29 +0200
Message-ID: <87ttgwt10m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.10-rc7
In-Reply-To: <b612cf49c9449f240cfb709d876b7d0c.broonie@kernel.org>
References: <b612cf49c9449f240cfb709d876b7d0c.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 80BAC21A49
Message-ID-Hash: DHF62GFPFFSGINBKTRSFGFN3CZSZF3TK
X-Message-ID-Hash: DHF62GFPFFSGINBKTRSFGFN3CZSZF3TK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHF62GFPFFSGINBKTRSFGFN3CZSZF3TK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Jul 2024 16:46:50 +0200,
Mark Brown wrote:
> 
> The following changes since commit 68f97fe330e01450ace63da0ce5cab676fc97f9a:
> 
>   ASoC: rt5645: fix issue of random interrupt from push-button (2024-06-26 16:34:48 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.10-rc7
> 
> for you to fetch changes up to 680e126ec0400f6daecf0510c5bb97a55779ff03:
> 
>   firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw files (2024-07-08 15:55:11 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.10
> 
> A few fairly small fixes for ASoC, there's a relatively large set of
> hardening changes for the cs_dsp firmware file parsing and a couple of
> other small device specific fixes.

Pulled now.  Thanks.


Takashi
