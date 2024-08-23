Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D49295C57B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 08:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671606C1;
	Fri, 23 Aug 2024 08:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671606C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724394673;
	bh=ERZXqSa7U1grsRj2FpXE33O0oRrIwNOfJFpVNmEyUsc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4uBMO9xrgE83J5VFZsk701GYvlkb/xhJnEDo0UcV5kdNDtqV9P1W8hhq3Cjz+0Ct
	 uoEn7K4w8T05mpNuPp6ugJkk+KF+f5QUW53q4oXJcWOPQ1OYSaHIXe0chKQT81Mjqc
	 rvwaPIFPRZGB0m76n5oS/WusS/Mo9j8dcDF421Xs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 641A9F805B2; Fri, 23 Aug 2024 08:30:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0410AF805AC;
	Fri, 23 Aug 2024 08:30:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 657F7F80496; Fri, 23 Aug 2024 08:30:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B95FBF80107
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 08:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95FBF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hMfg0x/W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RxE2nqNa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hMfg0x/W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RxE2nqNa
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45D41202D0;
	Fri, 23 Aug 2024 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724394622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEhoqNPqPv1IGbBIjXPOYKC5GlwL9vYVyE7p16jnMrQ=;
	b=hMfg0x/WiX4G10jr1Nmn4WIyqkw88Tpy67+TtsykRUh2j9Y1UMrd4XEIVRbMiBd4QuG1yV
	zZyimWQscD18o9o2gA4ck/nwDU3taDd6Yz+Id/Khnq4yJEiYFeOX8lkI74IQ/+Mdls/yL3
	/SS0d5ElvqZD4f3hlofFW4Gnju5gx9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724394622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEhoqNPqPv1IGbBIjXPOYKC5GlwL9vYVyE7p16jnMrQ=;
	b=RxE2nqNaRPzwlfhFiAtVAu+STaDiNfDBTCYtWBuG9nFbEUsSTKBvc+yesN9QFjxtRLoKdE
	nEqynYP3p1PPanAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hMfg0x/W";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RxE2nqNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724394622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEhoqNPqPv1IGbBIjXPOYKC5GlwL9vYVyE7p16jnMrQ=;
	b=hMfg0x/WiX4G10jr1Nmn4WIyqkw88Tpy67+TtsykRUh2j9Y1UMrd4XEIVRbMiBd4QuG1yV
	zZyimWQscD18o9o2gA4ck/nwDU3taDd6Yz+Id/Khnq4yJEiYFeOX8lkI74IQ/+Mdls/yL3
	/SS0d5ElvqZD4f3hlofFW4Gnju5gx9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724394622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEhoqNPqPv1IGbBIjXPOYKC5GlwL9vYVyE7p16jnMrQ=;
	b=RxE2nqNaRPzwlfhFiAtVAu+STaDiNfDBTCYtWBuG9nFbEUsSTKBvc+yesN9QFjxtRLoKdE
	nEqynYP3p1PPanAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 224E21333E;
	Fri, 23 Aug 2024 06:30:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CY8aB34syGZOZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Aug 2024 06:30:22 +0000
Date: Fri, 23 Aug 2024 08:31:05 +0200
Message-ID: <878qwnn42e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.11-rc3
In-Reply-To: <9bc5cbb9307d2b9bb73ea897f34867f2.broonie@kernel.org>
References: <9bc5cbb9307d2b9bb73ea897f34867f2.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 45D41202D0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 6R3XNHCRPCNI552DWW5MUEZTQ6Z4IN6Z
X-Message-ID-Hash: 6R3XNHCRPCNI552DWW5MUEZTQ6Z4IN6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6R3XNHCRPCNI552DWW5MUEZTQ6Z4IN6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Aug 2024 00:47:29 +0200,
Mark Brown wrote:
> 
> The following changes since commit 72776774b55bb59b7b1b09117e915a5030110304:
> 
>   ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value (2024-08-08 20:34:56 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc3
> 
> for you to fetch changes up to bb4485562f5907708f1c218b5d70dce04165d1e1:
> 
>   ASoC: cs-amp-lib: Ignore empty UEFI calibration entries (2024-08-22 17:52:26 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.11
> 
> A relatively large collection of fixes here, all driver specific and
> none of them particularly major, plus one MAINTAINERS update.  There's
> been a bunch of work on module autoloading from several people.

Thanks, pulled now.


Takashi
