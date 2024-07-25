Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7793C709
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 18:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A09AE76;
	Thu, 25 Jul 2024 18:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A09AE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721924187;
	bh=565gbfu+/opgTUIbyFq2qRe5OiRQ0l5htpk4sHunpWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nrP7OmexrsrtUWCio15Gd0X94pDnwgcc+uvLbsbeccYJNGqk14ntA4jSdaOLYKcld
	 AdRGSWgaE0+M3XMXegPeCtrFQWYdCfjIkkKxnPrV5YNm3er1Q8iSdNRt76liUmJUIB
	 UWkYcKsdxoR6yeDJsU6YoM4saG4NK/RgYwM51G/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42968F8007E; Thu, 25 Jul 2024 18:15:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1E0F805B1;
	Thu, 25 Jul 2024 18:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA702F800AE; Thu, 25 Jul 2024 18:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A562CF800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 18:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A562CF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HS+FWLds;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nm8IMWig;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HS+FWLds;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nm8IMWig
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93C6021A78;
	Thu, 25 Jul 2024 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721923490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CybuhkT7jmtGjAeAXQxofQwr7jTbGsi2NFLmXH3xl80=;
	b=HS+FWLdsA35DVPkKucNFZUbfVwGeOQOjelqKgGhOUm1SIwIqRjVrApQpexiE0R0ceZIcbO
	gTP2oqj2PLJkaioLIAg9uds5fWrKoWUSX3IGTL3wL2n3RwK6Yy/mVCr1o9+G089j0T4f/w
	ZaBlieiVuz7MjZf0cVywBjYtgc2g4T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721923490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CybuhkT7jmtGjAeAXQxofQwr7jTbGsi2NFLmXH3xl80=;
	b=nm8IMWigjrmjn4kLu8lSIiO3SDjgHBENYyuTkJoFGM0xDZ/YBrrUIQBErwQPEkydCU1DYw
	wa1CzQN/aSJuNuDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721923490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CybuhkT7jmtGjAeAXQxofQwr7jTbGsi2NFLmXH3xl80=;
	b=HS+FWLdsA35DVPkKucNFZUbfVwGeOQOjelqKgGhOUm1SIwIqRjVrApQpexiE0R0ceZIcbO
	gTP2oqj2PLJkaioLIAg9uds5fWrKoWUSX3IGTL3wL2n3RwK6Yy/mVCr1o9+G089j0T4f/w
	ZaBlieiVuz7MjZf0cVywBjYtgc2g4T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721923490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CybuhkT7jmtGjAeAXQxofQwr7jTbGsi2NFLmXH3xl80=;
	b=nm8IMWigjrmjn4kLu8lSIiO3SDjgHBENYyuTkJoFGM0xDZ/YBrrUIQBErwQPEkydCU1DYw
	wa1CzQN/aSJuNuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74F451368A;
	Thu, 25 Jul 2024 16:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y5BOG6J3omaeMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jul 2024 16:04:50 +0000
Date: Thu, 25 Jul 2024 18:05:25 +0200
Message-ID: <87bk2lihiy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.11-merge-window
In-Reply-To: <5a2e9c948bd527794d6e05160e201744.broonie@kernel.org>
References: <5a2e9c948bd527794d6e05160e201744.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: A7FOAWMCKVBOCVGSB7RSSM4KQVRHFNTX
X-Message-ID-Hash: A7FOAWMCKVBOCVGSB7RSSM4KQVRHFNTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7FOAWMCKVBOCVGSB7RSSM4KQVRHFNTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 17:54:44 +0200,
Mark Brown wrote:
> 
> The following changes since commit c51cba4755609ad97ba97713210c16f043c73224:
> 
>   Fix the unbalanced pm_runtime_enable in wcd937x-sdw (2024-07-12 17:38:18 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-merge-window
> 
> for you to fetch changes up to ab53dfdcdd1ec8df8729890aefa5b0e3c900afbb:
> 
>   ASoC: fsl-asoc-card: Dynamically allocate memory for snd_soc_dai_link_components (2024-07-25 14:20:30 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.11
> 
> A selection of routine fixes and quirks that came in since the merge
> window.  The fsl-asoc-card change is a fix for systems with multiple
> cards where updating templates in place leaks data from one card to
> another.

Thanks, pulled now.


Takashi
