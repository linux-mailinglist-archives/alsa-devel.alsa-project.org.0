Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B01AF9765
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jul 2025 17:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690B060204;
	Fri,  4 Jul 2025 17:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690B060204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751644563;
	bh=ZuDqs2gRF/BTvZx6U91WzWuc+kqmiaxA1olVTLM6RfI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HDjwJX1zUypHRE/Jmt2pJ4d8R8Uhv4W26qSC20Ii+oLeeNId67YA7uxMlAsSEBoM3
	 +/wmYYQJS9A41aatkqSM10//PwMXllhH41pF14Em+xJ3Gh4gHNxIDGK6RCtTSAaUJM
	 sC1hqFWz/7hdXXS6XTbXBTvmm5m5UG6ggKYa3X9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2FAF805C2; Fri,  4 Jul 2025 17:55:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A437EF805C1;
	Fri,  4 Jul 2025 17:55:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D947F804E5; Fri,  4 Jul 2025 17:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FC84F800BF
	for <alsa-devel@alsa-project.org>; Fri,  4 Jul 2025 17:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC84F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XXmKjm9A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RVHhDQJg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=XXmKjm9A;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RVHhDQJg
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4552D211A8;
	Fri,  4 Jul 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751644521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=XXmKjm9A0vko4PetJH3gqgArfQN/ljbmAUu/wMHWBS1vpTrZhQ4nkEM0Yfa5Ii9+b6s+HJ
	AMXZiE0PpWLDZ8DvM84QYj0fc3QaQ/aQMCC0kZR3RAXxDIUzBYgRliVxH0svRQWXllBGNZ
	ob7nFQ2sk+HntHbpZ+nX976Sgf2TDUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751644521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=RVHhDQJgfGDuquot1X1BJOJYQAN6Uo+/rp7g6j/0zrkaM4zmyyuBhlpkrmIAX2pU0gyf/E
	nh57oYvo7BzEtxDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XXmKjm9A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RVHhDQJg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751644521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=XXmKjm9A0vko4PetJH3gqgArfQN/ljbmAUu/wMHWBS1vpTrZhQ4nkEM0Yfa5Ii9+b6s+HJ
	AMXZiE0PpWLDZ8DvM84QYj0fc3QaQ/aQMCC0kZR3RAXxDIUzBYgRliVxH0svRQWXllBGNZ
	ob7nFQ2sk+HntHbpZ+nX976Sgf2TDUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751644521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=RVHhDQJgfGDuquot1X1BJOJYQAN6Uo+/rp7g6j/0zrkaM4zmyyuBhlpkrmIAX2pU0gyf/E
	nh57oYvo7BzEtxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2180613757;
	Fri,  4 Jul 2025 15:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m63vBmn5Z2h0EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 15:55:21 +0000
Date: Fri, 04 Jul 2025 17:55:20 +0200
Message-ID: <87cyagne6v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc4
In-Reply-To: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
References: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4552D211A8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
Message-ID-Hash: M7IMQWF5CZHFWAUPR53R2CCDL6MFPCTA
X-Message-ID-Hash: M7IMQWF5CZHFWAUPR53R2CCDL6MFPCTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7IMQWF5CZHFWAUPR53R2CCDL6MFPCTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Jul 2025 17:06:42 +0200,
Mark Brown wrote:
> 
> The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:
> 
>   Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc4
> 
> for you to fetch changes up to 3b3312f28ee2d9c386602f8521e419cfc69f4823:
> 
>   ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> An update for the MAINTAINERS file, plus a number of small driver
> specific fixes and device quirks.

Pulled now.  Thanks.


Takashi
