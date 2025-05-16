Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF6AB9C9E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 14:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6405F601B8;
	Fri, 16 May 2025 14:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6405F601B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747399940;
	bh=8++W/j25JW8gS+qeHHzZJZOpbAKuGZ6y0Pg9JqRvv1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UJggC5HU5eKIhCVfKtXF9+zgA3BgbKjhVS1BB/BKkvkbFucj7x+aEaA+Qxnf9w1z7
	 L2KgEXv8mcoz6OLuR4J5UY7wfTseP0IhFC0TBvubzmJ5pcPiKOfUtIMgJT3GoM0ZVw
	 NBc3vA0jjywDQFAnucuBYV71fKzruA84zWt9nzgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BDB6F804FC; Fri, 16 May 2025 14:51:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 338E6F80217;
	Fri, 16 May 2025 14:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9683DF80134; Fri, 16 May 2025 14:51:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 399F6F80038
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 14:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399F6F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xwPgHa8d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zuzeNtK7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xwPgHa8d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zuzeNtK7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D3D5219CD;
	Fri, 16 May 2025 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747399898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=xwPgHa8d48SKRAD2ZlvVlTkwKcFFfO/DNjpqBUTv82y8XwH9rUDO+jRodD1/773yyHBsT4
	U7/CymIorjcckUNYlOCrqjg5AGAy1t66whrTOGtDC3vdrp5JvepBzI+1thcHjk+Z8hckYh
	641TD759B2et6kHSeBkE1C8PMixhTM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747399898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=zuzeNtK7cTbE3ULFVBkpiUb5fRn1R9DueG42Z6fYD7yCPADq8RGlvbaSDB2o3x0FW/wbzw
	wWYn9lZhoVr6cMAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xwPgHa8d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zuzeNtK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747399898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=xwPgHa8d48SKRAD2ZlvVlTkwKcFFfO/DNjpqBUTv82y8XwH9rUDO+jRodD1/773yyHBsT4
	U7/CymIorjcckUNYlOCrqjg5AGAy1t66whrTOGtDC3vdrp5JvepBzI+1thcHjk+Z8hckYh
	641TD759B2et6kHSeBkE1C8PMixhTM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747399898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcnoJFECh3cpSzX6pznfYKEtVRvIoTCjSS4LIpNB5Ps=;
	b=zuzeNtK7cTbE3ULFVBkpiUb5fRn1R9DueG42Z6fYD7yCPADq8RGlvbaSDB2o3x0FW/wbzw
	wWYn9lZhoVr6cMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 441C013411;
	Fri, 16 May 2025 12:51:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G0g8D9o0J2hdLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 12:51:38 +0000
Date: Fri, 16 May 2025 14:51:37 +0200
Message-ID: <877c2glnvq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc6
In-Reply-To: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
References: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8D3D5219CD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: OPPHGJYM6ROJ344PPTJSZZ5T7TQPHTLW
X-Message-ID-Hash: OPPHGJYM6ROJ344PPTJSZZ5T7TQPHTLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPPHGJYM6ROJ344PPTJSZZ5T7TQPHTLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 May 2025 13:31:12 +0200,
Mark Brown wrote:
> 
> The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:
> 
>   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc6
> 
> for you to fetch changes up to 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:
> 
>   ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A collection of driver specific fixes that built up over the past few
> weeks, plus one core patch which fixes handling of topology files where
> some DAI names are substrings of others.

Pulled now.  This slipped from the PR I already sent this morning, so
will be likely in a PR in the next week for the 6.15-final.


thanks,

Takashi
