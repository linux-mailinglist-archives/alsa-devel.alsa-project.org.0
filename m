Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9FF9EE826
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 15:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 445C231E;
	Thu, 12 Dec 2024 15:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 445C231E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734012069;
	bh=E22O9Qi9YPbAhw8To5DsFzWSP6ZIXE6l4L+6RgecuAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VXUvv/Je0KNUaguBwujONgHGyJRJovl13txrnjjW++qme0M5dzeNSv6ofzF4IuTmu
	 c92aVpimj46RUsjv/ccvUZc56E/vQ+/XOUO2x4wIs/UC44/hdqV7Ag7ZOsbe6PSZar
	 t0dmIBewutp9BDbtiGpbMxQMPigYxekDNzSycKNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EDFAF805BE; Thu, 12 Dec 2024 15:00:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A71FBF805BF;
	Thu, 12 Dec 2024 15:00:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87FEF8012B; Thu, 12 Dec 2024 15:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F80BF8012B
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 15:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F80BF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IR6q95XH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ODJINeSB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IR6q95XH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ODJINeSB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 352742117A;
	Thu, 12 Dec 2024 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1734012015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2q2SEL87ufNv6xoyAR3SGoaWzHC4otfXAshUA8hWCM=;
	b=IR6q95XHDzc8K6i8ILlMvuGruJHlFBWKfX85ortbtDzMqt/NlnciaVGrLwGWCZn7kD6vQx
	rw2TSXEoPQhoJ/I9DzMKdECEq2dNbg44wyWVQDFGKf0F39KwamI1kQlY70bXvWMA4zi0aA
	iJhbM89mIT8ffQ4/QhVG+MeBB2Z2TQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734012015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2q2SEL87ufNv6xoyAR3SGoaWzHC4otfXAshUA8hWCM=;
	b=ODJINeSB+Y/af+ppCiqu3XsEfF1ADpcDLlbNIyZDk0Dl8YGPvwSp5DiexZObKOJH3nW6zO
	udaZuXzs2k7rS0Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1734012015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2q2SEL87ufNv6xoyAR3SGoaWzHC4otfXAshUA8hWCM=;
	b=IR6q95XHDzc8K6i8ILlMvuGruJHlFBWKfX85ortbtDzMqt/NlnciaVGrLwGWCZn7kD6vQx
	rw2TSXEoPQhoJ/I9DzMKdECEq2dNbg44wyWVQDFGKf0F39KwamI1kQlY70bXvWMA4zi0aA
	iJhbM89mIT8ffQ4/QhVG+MeBB2Z2TQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734012015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2q2SEL87ufNv6xoyAR3SGoaWzHC4otfXAshUA8hWCM=;
	b=ODJINeSB+Y/af+ppCiqu3XsEfF1ADpcDLlbNIyZDk0Dl8YGPvwSp5DiexZObKOJH3nW6zO
	udaZuXzs2k7rS0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15A4513939;
	Thu, 12 Dec 2024 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENsUBG/sWmfVZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Dec 2024 14:00:15 +0000
Date: Thu, 12 Dec 2024 15:00:14 +0100
Message-ID: <87frmtypap.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc2
In-Reply-To: <66e632c08f0370075bb18692c9fb1c17.broonie@kernel.org>
References: <66e632c08f0370075bb18692c9fb1c17.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: WSSMTPV7TRAMV3LVHFLDFMVKJTAQ6J2L
X-Message-ID-Hash: WSSMTPV7TRAMV3LVHFLDFMVKJTAQ6J2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSSMTPV7TRAMV3LVHFLDFMVKJTAQ6J2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Dec 2024 14:08:00 +0100,
Mark Brown wrote:
> 
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc2
> 
> for you to fetch changes up to 255cc582e6e16191a20d54bcdbca6c91d3e90c5e:
> 
>   ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array (2024-12-12 11:08:49 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.13
> 
> A small pile of driver specific fixes, all quite small and not
> particularly major.

Pulled now.  Thanks.


Takashi
