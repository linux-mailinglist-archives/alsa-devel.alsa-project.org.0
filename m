Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51290D4DA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F45851;
	Tue, 18 Jun 2024 16:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F45851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720858;
	bh=sKWjat2X5yPXn7jlcAdYmOWGsDtEENMMgW5iFrljRmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CYgLyTzlME7RMDFCPtgsOWzDAE8DsV55m//m4gdARlMC+JM7AphMh6tNCoPV8YDRv
	 9UhjrapGyD8Sg2+s6Spa1nPgZ3vsqeGHc794OUTtdDGYSQY9BaIDwzEhC+D8lLZk/f
	 haxk2hwhj3s/AV2HcQkAfmfljzfI6PixEK5zrOJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30CC6F804F2; Tue, 18 Jun 2024 16:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA00F80587;
	Tue, 18 Jun 2024 16:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B5BF8023A; Tue, 18 Jun 2024 16:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22E68F800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E68F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yW78bFGr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F0s09LQj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yW78bFGr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F0s09LQj
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CB8D1F74A;
	Tue, 18 Jun 2024 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718720818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SF97UA2nDWP6UOLgZba7YSw3MTN8iQvTaEbBzqC6MY=;
	b=yW78bFGrUc5Y47Nn5Q05UMCm53oTQcKEEW9FMtZTBxxAEwl4ftmopEMWp6MZIPOu3K0oRp
	SbhcFYPjS59vT9dEyBkv3HgM3Bz0b59cPDOWGEg3JkWqVQJShoEo5TIN9nzklM2WuEH61S
	0+H1mo9jikNG6vFaz3cuZO6qNzYmoaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718720818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SF97UA2nDWP6UOLgZba7YSw3MTN8iQvTaEbBzqC6MY=;
	b=F0s09LQjVc0KzS9oUxzOiK6b7hic9QDzumrC8thdKEH7qcqfJ8fANLl995b1CGAz8uuasA
	Z/pmRzT1qneod3BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718720818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SF97UA2nDWP6UOLgZba7YSw3MTN8iQvTaEbBzqC6MY=;
	b=yW78bFGrUc5Y47Nn5Q05UMCm53oTQcKEEW9FMtZTBxxAEwl4ftmopEMWp6MZIPOu3K0oRp
	SbhcFYPjS59vT9dEyBkv3HgM3Bz0b59cPDOWGEg3JkWqVQJShoEo5TIN9nzklM2WuEH61S
	0+H1mo9jikNG6vFaz3cuZO6qNzYmoaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718720818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SF97UA2nDWP6UOLgZba7YSw3MTN8iQvTaEbBzqC6MY=;
	b=F0s09LQjVc0KzS9oUxzOiK6b7hic9QDzumrC8thdKEH7qcqfJ8fANLl995b1CGAz8uuasA
	Z/pmRzT1qneod3BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33DCA13AA0;
	Tue, 18 Jun 2024 14:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vTsIDDKZcWbtdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Jun 2024 14:26:58 +0000
Date: Tue, 18 Jun 2024 16:27:24 +0200
Message-ID: <87iky65nsj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2] ALSA: hda: cs35l56: Perform firmware download in the
 background
In-Reply-To: <20240618130011.62860-1-simont@opensource.cirrus.com>
References: <20240618130011.62860-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-2.96)[99.83%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: RYI66IFYUYNKAPYG5R2WMPIKMEEZRVIN
X-Message-ID-Hash: RYI66IFYUYNKAPYG5R2WMPIKMEEZRVIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYI66IFYUYNKAPYG5R2WMPIKMEEZRVIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jun 2024 15:00:11 +0200,
Simon Trimmer wrote:
> 
> It is possible that during system boot when there multiple devices
> attempting simultaneous initialization on a slow control bus the
> download of firmware and tuning data may take a user perceivable amount
> of time (a slow I2C bus with 4 amps this work could take over 2
> seconds).
> 
> Adopt a pattern used in the ASoC driver and perform this activity in a
> background thread so that interactive performance is not impaired. The
> system_long_wq is a parallel workqueue and driver instances will perform
> their firmware downloads in parallel to make best use of available bus
> bandwidth.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Thanks, applied now to for-next branch.


Takashi
