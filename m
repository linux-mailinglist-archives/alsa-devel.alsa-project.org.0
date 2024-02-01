Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB28B845832
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:53:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09ECB852;
	Thu,  1 Feb 2024 13:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09ECB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706792003;
	bh=/ru0zXTaaS2/J/SSKV/QHTnOSJfYrMceKX/qeZonjqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TL4YxYuAjBd5Uzow/Zr99VMTEFnLf5ggALJ41J1wOyZZReR2bb2844GPpaDvLNlK3
	 dyIBUS5NIhqC/pTaoP81+4MQ078m1V+ccDigJFY2UzfM2kNhPxSk7+kmJ0aWVz+O26
	 tlk7hVj8BwC4+V41Roq01Gh2J+xNIMLwft0bK5cs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8974CF805AA; Thu,  1 Feb 2024 13:52:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37490F8056F;
	Thu,  1 Feb 2024 13:52:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45101F8055C; Thu,  1 Feb 2024 13:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C705FF8055B
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C705FF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oOrDEdNt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/ls5P5Rn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=oOrDEdNt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/ls5P5Rn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05C0722103;
	Thu,  1 Feb 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z/sO5sk+ugV5UlFMs7Tp/f/pg4soqL+4mnjLjk+XAt4=;
	b=oOrDEdNt7mdnnMTXuqk9jmbtSVLXZw4+kS5FukXio/a9iL/hB7kEyQ8GQHtZQweePkIB9i
	zJ0CCGBqu7cRHKiJkSGxkTbbPBoOKB3ARvXpMLPJu3Uq0a7ciRLQu/3G3olZGYK9GRqKtV
	l3Fee/sqQJUD86w10WJeeIjEVRH4LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z/sO5sk+ugV5UlFMs7Tp/f/pg4soqL+4mnjLjk+XAt4=;
	b=/ls5P5RnqDGaaNLKsLt/hkg9Aaan6dC60eE2FTnIGOvPCYjj2Z5Pth1IzCkMRLJnptuQ7T
	Jex2GYN70brDt1CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z/sO5sk+ugV5UlFMs7Tp/f/pg4soqL+4mnjLjk+XAt4=;
	b=oOrDEdNt7mdnnMTXuqk9jmbtSVLXZw4+kS5FukXio/a9iL/hB7kEyQ8GQHtZQweePkIB9i
	zJ0CCGBqu7cRHKiJkSGxkTbbPBoOKB3ARvXpMLPJu3Uq0a7ciRLQu/3G3olZGYK9GRqKtV
	l3Fee/sqQJUD86w10WJeeIjEVRH4LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z/sO5sk+ugV5UlFMs7Tp/f/pg4soqL+4mnjLjk+XAt4=;
	b=/ls5P5RnqDGaaNLKsLt/hkg9Aaan6dC60eE2FTnIGOvPCYjj2Z5Pth1IzCkMRLJnptuQ7T
	Jex2GYN70brDt1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9479139B1;
	Thu,  1 Feb 2024 12:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gTDHMxSUu2USPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 12:52:36 +0000
Date: Thu, 01 Feb 2024 13:52:36 +0100
Message-ID: <87jznoz6qz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc2
In-Reply-To: <20240201123920.85589C433F1@smtp.kernel.org>
References: <20240201123920.85589C433F1@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oOrDEdNt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/ls5P5Rn"
X-Spamd-Result: default: False [-1.03 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.72)[93.26%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 05C0722103
Message-ID-Hash: DORUA7O32Q3XEBLOS2FQVFDCII73PRGZ
X-Message-ID-Hash: DORUA7O32Q3XEBLOS2FQVFDCII73PRGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DORUA7O32Q3XEBLOS2FQVFDCII73PRGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Feb 2024 13:39:17 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc2
> 
> for you to fetch changes up to 5513c5d0fb3d509cdd0a11afc18441c57eb7c94c:
> 
>   ASoC: amd: acp: Fix support for a Huawei Matebook laptop (2024-01-29 20:16:36 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.8
> 
> Quite a lot of fixes that came in since the merge window, a large
> portion for for Qualcomm and ES8326.
> 
> The 8 DAI support for Qualcomm is just raising a constant to allow for
> devies that otherwise only need DTs, and there's a few other device ID
> updates for sunxi (Allwinner) and AMD platforms.

Thanks, pulled now.


Takashi
