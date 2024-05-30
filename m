Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3828D524C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 21:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17CA1AE8;
	Thu, 30 May 2024 21:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17CA1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717097274;
	bh=uttupo2uCX3V8mU84I5z79+ShyBU13duzigOC/5paUo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8v3R8qlH16/Ti1mEUnxF9G/DLtjAvwEr02lflq3L0Vih3djx7c1PtEg29NcKm3dJ
	 OPmdhK03YJL8bdgY8JkyCSNQ9VGbjFMSAXSbFsVyg/DxliRRt+xQppSjDajrvrXBDE
	 RGsP1L6xYuf6Athgma+q3TF4vCXvA3BorJUi6fEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C364DF805A9; Thu, 30 May 2024 21:27:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E1BF8047C;
	Thu, 30 May 2024 21:27:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 711C9F80149; Thu, 30 May 2024 21:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF086F800AC
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 21:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF086F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NOzpoXTi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JvQ6b+o3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NOzpoXTi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JvQ6b+o3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4DB9218EB;
	Thu, 30 May 2024 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1717097229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgZeMTdyTEhXqAfbChj2hIK7Sso12/EwuQ86CCtCs3U=;
	b=NOzpoXTidvWUZBXB0T4MAOtfynAYXgMWyeYZ2dKp1RPi8TLWXDOj8+sSeP6/FOk3SiqsDN
	gqhuhgoB6SIEJfbwCofnYxo3MlioNQbvdvDjvbY46q/U+34zIiZENZza5RIq09YjJXBqh5
	WcVv9QQ7u7/uoV5+s12tpmXwlf+DDIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717097229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgZeMTdyTEhXqAfbChj2hIK7Sso12/EwuQ86CCtCs3U=;
	b=JvQ6b+o3Sv7f4k7BQpDFQX3Nr4gkY548reGYf0jJh7booMAp61nbyX22kI0e+swjsP+GWy
	J9svqqLnkylMmhBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1717097229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgZeMTdyTEhXqAfbChj2hIK7Sso12/EwuQ86CCtCs3U=;
	b=NOzpoXTidvWUZBXB0T4MAOtfynAYXgMWyeYZ2dKp1RPi8TLWXDOj8+sSeP6/FOk3SiqsDN
	gqhuhgoB6SIEJfbwCofnYxo3MlioNQbvdvDjvbY46q/U+34zIiZENZza5RIq09YjJXBqh5
	WcVv9QQ7u7/uoV5+s12tpmXwlf+DDIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717097229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgZeMTdyTEhXqAfbChj2hIK7Sso12/EwuQ86CCtCs3U=;
	b=JvQ6b+o3Sv7f4k7BQpDFQX3Nr4gkY548reGYf0jJh7booMAp61nbyX22kI0e+swjsP+GWy
	J9svqqLnkylMmhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F15D13A42;
	Thu, 30 May 2024 19:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dy4RJQ3TWGZ2OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 May 2024 19:27:09 +0000
Date: Thu, 30 May 2024 21:27:31 +0200
Message-ID: <871q5j2j8c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.10-rc1
In-Reply-To: <742f0e8936b9a37840105c7169a63f0a.broonie@kernel.org>
References: <742f0e8936b9a37840105c7169a63f0a.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.94%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
Message-ID-Hash: J37RVYDMMD45OQ6AX7JEE2BY7WITLH4A
X-Message-ID-Hash: J37RVYDMMD45OQ6AX7JEE2BY7WITLH4A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J37RVYDMMD45OQ6AX7JEE2BY7WITLH4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 30 May 2024 17:51:32 +0200,
Mark Brown wrote:
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.10-rc1
> 
> for you to fetch changes up to c85578e730135d47271ca874e4436dd87e87f252:
> 
>   ASoC: SOF: ipc4-topology: Fix nhlt configuration blob (2024-05-30 14:33:14 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.10
> 
> Several serieses of fixes that have come in since the merge window,
> mostly for Intel systems.  The biggest thing is some updates from Peter
> which fix support for a series of Intel laptops which have been found to
> use 16 bit rather than 32 bit DMIC configuration blobs in their firmware
> descriptions.  We also have a bunch of fixes for module annotations, and
> some smaller single patch fixes.

Thanks, pulled now.


Takashi
