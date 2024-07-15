Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35338931727
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 16:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 654BBE9A;
	Mon, 15 Jul 2024 16:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 654BBE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721054877;
	bh=zfCTt8lghb3H9yst7G8J2NfWklQVuGOiALT3b4/j2PI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qCIgjMM7JFYbJMexoRzdDP/yNJQ1+ANpuoHvQVyRWXI579+Aa4l5pR312iSH61/R2
	 e5LMmbrbHaBdlyvl0NeaIU4mhZBWKmG5Ck7diQX9SYL3ZY+4VewoS+8uZdWiQJ7eFG
	 XE+PVIqf4SnD0zfL6z+O8+2ULjpj4SnvAiDXVsnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F4AF805AD; Mon, 15 Jul 2024 16:47:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2ABF80587;
	Mon, 15 Jul 2024 16:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 780D0F8026D; Mon, 15 Jul 2024 16:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6289DF800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 16:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6289DF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WYon193H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ElJJ5NBV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vUoM+TPU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TjIiicax
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F333F1F824;
	Mon, 15 Jul 2024 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721054836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMYHsb4JPaXBMphRvBiDbt57eaYUECrky+PkBFYHyFQ=;
	b=WYon193Hz/F1GTiT9iOByyGZn71duKA/7AbiJ7QXGbTAA5vkiU1tj0M5ZOnCAN8jjXN5Yx
	umxWg0fnaNZiMooCSY6o3dgqH27UpZTO/9FNSQ11HkAkji3Qum7Yp/yjBNRv13+z1j006/
	8NG0aQ7HF2LyULxZD5bs2xHfFVwvb5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721054836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMYHsb4JPaXBMphRvBiDbt57eaYUECrky+PkBFYHyFQ=;
	b=ElJJ5NBVt9KmsC/Noco+jK2o4vm+hvENU5IPECCSms6IiCY6i0oMreoiLvbC3PcPCQUwnM
	lHk7/+xEY+Ya4vCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vUoM+TPU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TjIiicax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721054835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMYHsb4JPaXBMphRvBiDbt57eaYUECrky+PkBFYHyFQ=;
	b=vUoM+TPUA/1yJMe5QQ2PUfOIRz1Xdd3FLlxnG334c0IYiDIAcv7zcbK7oeHQgTKNjbYUEg
	w/WCEUN08L4SQYibdJL5J/Qdu+f/SvMBk8595YxSfNJ8OQBNVfWx8pNyFW99lp9gRe5zbp
	GxicCOgxfXGICnFvuqAbrGCAcVrYs1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721054835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMYHsb4JPaXBMphRvBiDbt57eaYUECrky+PkBFYHyFQ=;
	b=TjIiicaxKBZRTH+X6R1vOs2N36QJ7JFefjlF9JVSzWKEUTj3SrBUawBUmTb+CXRFpcJZ+A
	Wu3R6Wk+F1Q7uECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6CA51395F;
	Mon, 15 Jul 2024 14:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YzXZM3I2lWZDbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jul 2024 14:47:14 +0000
Date: Mon, 15 Jul 2024 16:47:48 +0200
Message-ID: <87plrevhij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.11
In-Reply-To: <aff174bfa9bc48c5a6fe0de9cc508249.broonie@kernel.org>
References: <aff174bfa9bc48c5a6fe0de9cc508249.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: F333F1F824
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
Message-ID-Hash: Y3I2STUMYNV6WBMQKZYNKS3AOGOFW7FI
X-Message-ID-Hash: Y3I2STUMYNV6WBMQKZYNKS3AOGOFW7FI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3I2STUMYNV6WBMQKZYNKS3AOGOFW7FI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Jul 2024 16:14:20 +0200,
Mark Brown wrote:
> 
> The following changes since commit 680e126ec0400f6daecf0510c5bb97a55779ff03:
> 
>   firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw files (2024-07-08 15:55:11 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.11
> 
> for you to fetch changes up to c51cba4755609ad97ba97713210c16f043c73224:
> 
>   Fix the unbalanced pm_runtime_enable in wcd937x-sdw (2024-07-12 17:38:18 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for for v6.11
> 
> There are a lot of changes in here, though the big bulk of things is
> cleanups and simplifications of various kinds which are internally
> rather than externally visible.  A good chunk of those are DT schema
> conversions, but there's also a lot of changes in the code.
> 
> Highlights:
> 
>  - Syncing of features between simple-audio-card and the two
>    audio-graph cards so there is no reason to stick with an older
>    driver.
>  - Support for specifying the order of operations for components within
>    cards to allow quirking for unusual systems.
>  - New support for Asahi Kasei AK4619, Cirrus Logic CS530x, Everest
>    Semiconductors ES8311, NXP i.MX95 and LPC32xx, Qualcomm LPASS v2.5
>    and WCD937x, Realtek RT1318 and RT1320 and Texas Instruments PCM5242.

Pulled now.  Thanks.


Takashi
