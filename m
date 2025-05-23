Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC23AC29E9
	for <lists+alsa-devel@lfdr.de>; Fri, 23 May 2025 20:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EC5601EC;
	Fri, 23 May 2025 20:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EC5601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748026038;
	bh=exfZi28LK/trzOKnywSoFWt3RzoqLBk1xldJvN7sRY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gs6UAOxHKcyLLoDFxird5uw9VKxvKfzKGrt2XL7tPmHKuacCVOBGBqi9S9TwLMTgW
	 R6pZcn+gaNlhCSoJlTMtUp9V91pJJybLRkQJzxMj/KDdPcQPdxCDFaTU0CyltTRjQP
	 GfUKoixaEW0YErZC+HVdvqwxbTMctlwwNwFwQ6Kw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79DADF805B4; Fri, 23 May 2025 20:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FDCF805A8;
	Fri, 23 May 2025 20:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5832F8057E; Fri, 23 May 2025 20:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3CBEF80508
	for <alsa-devel@alsa-project.org>; Fri, 23 May 2025 20:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3CBEF80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fEmuNfxC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5Zvaq3hc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fEmuNfxC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5Zvaq3hc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 866551F79B;
	Fri, 23 May 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1748025998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=fEmuNfxCr+Q5xU6FhQ7N+Aj31rKNMlzdsnmfy0NPXlmIP4Ju1jcQa9yaYX6RpIKNVKmCgC
	bfTvjUHwgfd4RpcpL9ZQVboyqWijCtE9xxxRwiUpqppz4XMXZVAMncvHYxyeVl8wpC1Hna
	jjuPpsaFprQBLgfj4kpwtBHLhwclRYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748025998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=5Zvaq3hctCjJZneJPqNsXUbOuSBe7rXInFoBgMWmwqV6PRn7Cr1BMk0f5z31oIWTlc5eSS
	mGan64QXvnzjd4AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fEmuNfxC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5Zvaq3hc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1748025998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=fEmuNfxCr+Q5xU6FhQ7N+Aj31rKNMlzdsnmfy0NPXlmIP4Ju1jcQa9yaYX6RpIKNVKmCgC
	bfTvjUHwgfd4RpcpL9ZQVboyqWijCtE9xxxRwiUpqppz4XMXZVAMncvHYxyeVl8wpC1Hna
	jjuPpsaFprQBLgfj4kpwtBHLhwclRYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748025998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=5Zvaq3hctCjJZneJPqNsXUbOuSBe7rXInFoBgMWmwqV6PRn7Cr1BMk0f5z31oIWTlc5eSS
	mGan64QXvnzjd4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DD27137B8;
	Fri, 23 May 2025 18:46:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /LzCFI7CMGiPUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 May 2025 18:46:38 +0000
Date: Fri, 23 May 2025 20:46:37 +0200
Message-ID: <87h61brwqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.16-2
In-Reply-To: <ba7f879f929f53a179738402df6f13e9.broonie@kernel.org>
References: <ba7f879f929f53a179738402df6f13e9.broonie@kernel.org>
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 866551F79B
Message-ID-Hash: KNYWFNNDZ3AONSCYCYDT25TE4SXH3ORB
X-Message-ID-Hash: KNYWFNNDZ3AONSCYCYDT25TE4SXH3ORB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNYWFNNDZ3AONSCYCYDT25TE4SXH3ORB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 May 2025 19:51:28 +0200,
Mark Brown wrote:
> 
> The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:
> 
>   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.16-2
> 
> for you to fetch changes up to 43a38a0ff8c63ee156d997cd13063c63cd55d812:
> 
>   ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Additional v6.16 updates
> 
> A couple more updates on top of the last set I sent you, a new driver
> for the ES8375 and a fix for the Cirrus KUnit tests from Jaroslav.

Pulled now.  Thanks.


Takashi
