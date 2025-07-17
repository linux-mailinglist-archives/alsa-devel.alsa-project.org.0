Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48434B08DA0
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 14:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868C160190;
	Thu, 17 Jul 2025 14:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868C160190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752756955;
	bh=7WhetJ5wf4BPVPCgjGiJPfQF02jcOWcQnWrBaoIyiEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jvQEmKPSVGLIqdTEUNnEtJun7yzpsHwUfM3jakEueSMoE/dJg/OpwAK234uTG3Fd7
	 5P0+rTn6IoW4wU+vlK9atYLHYqWQif52wZOXb8SM072nJSI0A67tSL26rF3KKMwn85
	 kTfjomDeDNNUH44PpKiR5aTsedntwPSxn313pDrk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D300EF805BE; Thu, 17 Jul 2025 14:55:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B73F80169;
	Thu, 17 Jul 2025 14:55:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C17B0F80217; Thu, 17 Jul 2025 14:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4744DF800B6
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 14:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4744DF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EF9+IgXX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iMDqvDoy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EF9+IgXX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iMDqvDoy
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B9001F399;
	Thu, 17 Jul 2025 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752756902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=EF9+IgXXLXLceKyqx92q/baaiNzHq96FZQY4I1FFu+RU78ed1qVZYGOXutcqdRd8oQV/Bp
	0ZICiOo1ObSs51H3dRZxwH1EPk2CsksQbtUcZExltbk1BV89ZBR0lUG+7sPuntDboP43l8
	iA/YOZQh8h0R6Edb4EbiQYupmRHKrs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752756902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=iMDqvDoy6t8Hg/b120z7dOZ+MZ2sSG2pegQW+XLFLkWUGMc8NCtyAPDdwQbmaB3YL6D335
	tcUSgXoIylycmgDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752756902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=EF9+IgXXLXLceKyqx92q/baaiNzHq96FZQY4I1FFu+RU78ed1qVZYGOXutcqdRd8oQV/Bp
	0ZICiOo1ObSs51H3dRZxwH1EPk2CsksQbtUcZExltbk1BV89ZBR0lUG+7sPuntDboP43l8
	iA/YOZQh8h0R6Edb4EbiQYupmRHKrs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752756902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vTVqjV+8dgnMiClKeXRTNqjNXMqnlcDvCnCG0TjUplg=;
	b=iMDqvDoy6t8Hg/b120z7dOZ+MZ2sSG2pegQW+XLFLkWUGMc8NCtyAPDdwQbmaB3YL6D335
	tcUSgXoIylycmgDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E27941392A;
	Thu, 17 Jul 2025 12:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ooMNqXyeGiJFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Jul 2025 12:55:01 +0000
Date: Thu, 17 Jul 2025 14:55:01 +0200
Message-ID: <8734av9dui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc6
In-Reply-To: <1d784c862857c2d2f3870c0e140863da.broonie@kernel.org>
References: <1d784c862857c2d2f3870c0e140863da.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: WM4XCYTMPREQTCIHKJW7RXTRBIO7CBK4
X-Message-ID-Hash: WM4XCYTMPREQTCIHKJW7RXTRBIO7CBK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WM4XCYTMPREQTCIHKJW7RXTRBIO7CBK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Jul 2025 14:32:44 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:
> 
>   ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc6
> 
> for you to fetch changes up to 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:
> 
>   ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A relatively large set of changes, but most of them are quirk
> information for various x86 systems.  There is one more substantial fix
> for a NULL pointer dereference when removing the AVS driver, plus one
> for Kconfig dependencies.

Thanks, pulled now.


Takashi
