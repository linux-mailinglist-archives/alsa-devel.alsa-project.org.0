Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE48995E3
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 08:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607602D05;
	Fri,  5 Apr 2024 08:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607602D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712299936;
	bh=xy1gHBtgpzI/axsyxXlCUFGl6RCbhE5UAI9y3Pzygck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iuQawSpni/4SGRVtjg+uQkOdUWhGEPDlnGbtO5F7baWcvkX0w07Dj6C5V5Kz6EqNN
	 I9eAANpJUHfHf5Vl/Zx2MzT4JapQkTW66MlZp39dQofmbtqUmXHd/EdGjjWGdirKOB
	 v82WkwmmOCKP/XNUFryZtj8hmduHgiy/6kD6BHdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1D6BF8057D; Fri,  5 Apr 2024 08:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0628FF8057E;
	Fri,  5 Apr 2024 08:51:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43815F8020D; Fri,  5 Apr 2024 08:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C44F6F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 08:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44F6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qgXa1QuY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OAv9Vlx/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=qgXa1QuY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OAv9Vlx/
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 186571F766;
	Fri,  5 Apr 2024 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712299747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xy/6UJMGtx4uu9M2JPofz6m8IVzqKmhWiB194invW7s=;
	b=qgXa1QuYstZWQdCihLNXcZd3DXhvV/OpLkgYaVVtGyWNFYtjeDExI9c3vVMQqqS4v5Ub+E
	aN9rKDfZepRYGyYToLdYwRvK8YscU7hrlxEJVGZQZVcIEZfGl5pSt/1hnhitA8mbWHWfJg
	88g3JNiYzjqxglKBxf5m/uhP7JoQExA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712299747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xy/6UJMGtx4uu9M2JPofz6m8IVzqKmhWiB194invW7s=;
	b=OAv9Vlx/OjMFLbcEX9Y7kmYj0R7tWCkKf0iZvRTxpxiCJ6yC/ikWUWT2vJ10U8yuaVWueT
	hycpsiw4XmrSFFBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712299747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xy/6UJMGtx4uu9M2JPofz6m8IVzqKmhWiB194invW7s=;
	b=qgXa1QuYstZWQdCihLNXcZd3DXhvV/OpLkgYaVVtGyWNFYtjeDExI9c3vVMQqqS4v5Ub+E
	aN9rKDfZepRYGyYToLdYwRvK8YscU7hrlxEJVGZQZVcIEZfGl5pSt/1hnhitA8mbWHWfJg
	88g3JNiYzjqxglKBxf5m/uhP7JoQExA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712299747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xy/6UJMGtx4uu9M2JPofz6m8IVzqKmhWiB194invW7s=;
	b=OAv9Vlx/OjMFLbcEX9Y7kmYj0R7tWCkKf0iZvRTxpxiCJ6yC/ikWUWT2vJ10U8yuaVWueT
	hycpsiw4XmrSFFBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EB4DA139E8;
	Fri,  5 Apr 2024 06:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id cGgdOOKeD2bAIQAAn2gu4w
	(envelope-from <tiwai@suse.de>); Fri, 05 Apr 2024 06:49:06 +0000
Date: Fri, 05 Apr 2024 08:49:11 +0200
Message-ID: <87frw0nw2g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.9-rc2
In-Reply-To: <20240404220723.95599C433C7@smtp.kernel.org>
References: <20240404220723.95599C433C7@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.63 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.33)[75.87%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns]
Message-ID-Hash: OM6MNVLNEO5J4H47PRUO2PLIPQAFNQMZ
X-Message-ID-Hash: OM6MNVLNEO5J4H47PRUO2PLIPQAFNQMZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OM6MNVLNEO5J4H47PRUO2PLIPQAFNQMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 Apr 2024 00:07:13 +0200,
Mark Brown wrote:
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc2
> 
> for you to fetch changes up to 90f8917e7a15f6dd508779048bdf00ce119b6ca0:
> 
>   ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path (2024-04-04 19:51:51 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.9
> 
> A relatively large set of fixes here, the biggest piece of it is a
> series correcting some problems with the delay reporting for Intel SOF
> cards but there's a bunch of other things.  Everything here is driver
> specific except for a fix in the core for an issue with sign extension
> handling volume controls.

Thanks, pulled now.


Takashi
