Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E80DFAE9588
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jun 2025 08:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4A5601F8;
	Thu, 26 Jun 2025 08:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4A5601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750917679;
	bh=kt8S1AwRVp2f2Q7HzwOBSEqicSROuvwWzZwUUdwCpoM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YgIPygF33zUt6Ft3BJHtBlhKjRMTWMSZ3iDVgMmNv0OQYpST2+bV8UP93K+4hJrHF
	 rLnFr3Mq1tJeGKFlecwFfUyfDmFdPN1IilGNKjBWUT9k6U7l56ZzxqxD4VTCszne1I
	 oc/so2BkgcDcDA9QyFawVhOqVxcco+FPQjW9b+54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B39F800FA; Thu, 26 Jun 2025 08:00:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1676F800FA;
	Thu, 26 Jun 2025 08:00:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81573F8016E; Thu, 26 Jun 2025 08:00:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 95F14F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Jun 2025 08:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F14F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XZVR+Uou;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2kfKKdqw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2MJkZ0nm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=S2mDMiTo
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CBFE1F441;
	Thu, 26 Jun 2025 06:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750917635;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=XZVR+UouBh/liivfC3lf3DR47rqfOZXZzeZtaVankrfziSAORaw6yf2LCde+C1/STK5y0q
	AA9Tq6kFs0GJQIjBFZHc5jBsK5jk395BfOFwW/Na9ZzEXbIvQdR31GxGt9fkKzwAGr7v19
	Pzz7PhlPatCWQ7s4Chtzic7yngKlpAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750917635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=2kfKKdqwHDH83z9mhLC11Dal1BJTo8yQwZ3rRwvZsNa3xR9aH5vpzrU5peB+p599eYq4JB
	f5WuibcKs9kPYmBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2MJkZ0nm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S2mDMiTo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750917634;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=2MJkZ0nm/tWUdhUUgpcb4ZoOTu7/JyVtM2ES2thgf4PlO+nwvH8PmyKVwLawH7js8/mxds
	PfcIiYL5RoiaqqeO8NfRrjkHlq1d2TWvKYk6tQNSG7VghnWszG0qSDxLNw7Djdj0OjaTtS
	dChw8ZcyefrjTEDGn9HrWZlfTX+BEGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750917634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=S2mDMiToDmHDZgTEOlH+dDu40ceaArSuj40AkLym8HWK1VWBgayIF+l4GHbratfgu4wtdN
	393gO55XQm1/5HCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3657B138A7;
	Thu, 26 Jun 2025 06:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBWXCwLiXGjyEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Jun 2025 06:00:34 +0000
Date: Thu, 26 Jun 2025 08:00:33 +0200
Message-ID: <8734bnhwji.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc3
In-Reply-To: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
References: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 5CBFE1F441
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: MQXWAE26OUD5EHHEB74QVMMLZFCLMRMB
X-Message-ID-Hash: MQXWAE26OUD5EHHEB74QVMMLZFCLMRMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQXWAE26OUD5EHHEB74QVMMLZFCLMRMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Jun 2025 20:52:55 +0200,
Mark Brown wrote:
> 
> The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:
> 
>   Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc3
> 
> for you to fetch changes up to 6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e:
> 
>   ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak. (2025-06-24 16:39:42 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A small collection of fixes, the main one being a fix for resume from
> hibernation on AMD systems, plus a few new quirk entries for AMD
> systems.

Pulled now.  Thanks.


Takashi
