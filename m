Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D538DAC1371
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 20:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186F3601DF;
	Thu, 22 May 2025 20:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186F3601DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747938959;
	bh=B7kjcrh/Zn1LpLtn1DXdZmcM9ev6/ThkZGcCmN4LFAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/A9x3jZ4IBD0jl7xPNntB6yaiWFCVk+gQvCYwOJcB/CtIRxn/BhwJoTx9ubeF6y6
	 b7XGiys5v9Eih+QEPXerlw+L5QiWXS6NXG/2OmgN2eXS+A9fdcXOw4sTHkOnysmKUo
	 WEXyljmVVqPPc1eej+nQF3rij4z3CnPAYFE8gFQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF641F805B1; Thu, 22 May 2025 20:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96171F805A1;
	Thu, 22 May 2025 20:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F989F8056F; Thu, 22 May 2025 20:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6F6DF800C1
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 20:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F6DF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Sn2hRaeE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0rdtmnkG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Sn2hRaeE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0rdtmnkG
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0F4A1F891;
	Thu, 22 May 2025 18:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747938916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=Sn2hRaeEiI3n0vfMAFc3sN16wBUr3xAQYpn8g2olDcUdqEwqWDJdO9COwx41U1yEjLW3xe
	gduVpKTpSkc3vjo2OG6GMxxV41Wb/KbH5Zys+XA8hL4J2+UA4+iODFrdtUmkUaaMazAqub
	qT8t0oJfU1UY+CQAThSR7ETjGRZiP28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=0rdtmnkG0h9k9dyg53aarh30oRG2S2gj6+95VeCI3Y5RYPn3kioUSjVO/sDlnphxGifIMd
	dwQpZZRVri76ihCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Sn2hRaeE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0rdtmnkG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747938916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=Sn2hRaeEiI3n0vfMAFc3sN16wBUr3xAQYpn8g2olDcUdqEwqWDJdO9COwx41U1yEjLW3xe
	gduVpKTpSkc3vjo2OG6GMxxV41Wb/KbH5Zys+XA8hL4J2+UA4+iODFrdtUmkUaaMazAqub
	qT8t0oJfU1UY+CQAThSR7ETjGRZiP28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=0rdtmnkG0h9k9dyg53aarh30oRG2S2gj6+95VeCI3Y5RYPn3kioUSjVO/sDlnphxGifIMd
	dwQpZZRVri76ihCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A802A137B8;
	Thu, 22 May 2025 18:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mhItKGRuL2gaXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 18:35:16 +0000
Date: Thu, 22 May 2025 20:35:16 +0200
Message-ID: <871psg8pej.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.16
In-Reply-To: <db1ca3958fd5a955bbe43f3191bf4bfd.broonie@kernel.org>
References: <db1ca3958fd5a955bbe43f3191bf4bfd.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C0F4A1F891
Message-ID-Hash: MAN2ME7LS3XNCBYCOKCDAUEOGVQQCFJB
X-Message-ID-Hash: MAN2ME7LS3XNCBYCOKCDAUEOGVQQCFJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAN2ME7LS3XNCBYCOKCDAUEOGVQQCFJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 May 2025 18:05:36 +0200,
Mark Brown wrote:
> 
> The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:
> 
>   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.16
> 
> for you to fetch changes up to 7ce3bf76c3adfbfcfa712d5090428f67c97db201:
> 
>   Add Tegra264 support in AHUB drivers (2025-05-22 14:38:05 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.16
> 
> The changes in this release are quite large, mainly in drivers rather
> than the core.  This is partly due to cleanups that touch a lot of
> drivers and partly due to several relatively large new drivers.
> 
>  - Support for automatically enumerating DAIs from standards conforming
>    SoundWire SDCA devices, further work is required for these to be
>    useful in an actual card.
>  - Conversion of quite a few drivers to newer GPIO APIs.
>  - More helpers and cleanups from Mormimoto-san.
>  - Support for a wider range of AVS platforms.
>  - Support for AMD ACP 7.x platforms, Cirrus Logic CS35L63 and CS48L32,
>    Everest Semiconductor ES8389, Longsoon-1 AC'97 controllers, nVidia
>    Tegra264, Richtek ALC203 and RT9123 and Rockchip SAI controllers.

Pulled now to for-next branch.


thanks,

Takashi
