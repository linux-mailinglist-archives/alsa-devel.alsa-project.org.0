Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE80BECEE7
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 13:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B1E60235;
	Sat, 18 Oct 2025 13:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B1E60235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760788747;
	bh=r7V9iP+qICC9tlKBg73FN3NIr0qQ+HP+pQAEe8GVRpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a73KpKNVIkp6PtT8WEWf4mJXOYKAObZhNaCQADKOxxDRALPrCZ5ZlzkZGeZTSr5Lu
	 Lyzh1o7ixS4WZxCMPKtyhWHQ+ITnsLJTNWeZn4R8Izeibm5UFIfCRhh9wKG3XvbeIV
	 oRM1Pu4E0jYd2O6vo38Tf8VzMfLTtiCQwKLwttRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E33F80695; Sat, 18 Oct 2025 13:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C183AF80696;
	Sat, 18 Oct 2025 13:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB514F80602; Thu, 16 Oct 2025 20:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03395F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Oct 2025 20:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03395F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=n4MxHswO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=J+rKLfPX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=n4MxHswO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=J+rKLfPX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2143F21DEC;
	Thu, 16 Oct 2025 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1760638745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=n4MxHswO5wewn3IDNMqCBhJR4LrLBFVZx5NKog/yQtmjPqgkDVHvPc3qHUqvMHgoY+4BcF
	vdHNJOKSrlMNeuzEiqC0YKYeb3ZJ/9FfM7iFykwo7vtkdQV462vL0e3T0taU5gMQnBjI+C
	d4K8lZluyTXVm6xhfAM93zU1ybaKyvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760638745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=J+rKLfPXIkhnVxnJhuKXTmzKJQenAwhdmAkhfOncw3XWsCDWSUCsrUiQKPw3grYMjADq6s
	BApgNUbtHXXdaEBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1760638745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=n4MxHswO5wewn3IDNMqCBhJR4LrLBFVZx5NKog/yQtmjPqgkDVHvPc3qHUqvMHgoY+4BcF
	vdHNJOKSrlMNeuzEiqC0YKYeb3ZJ/9FfM7iFykwo7vtkdQV462vL0e3T0taU5gMQnBjI+C
	d4K8lZluyTXVm6xhfAM93zU1ybaKyvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760638745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=J+rKLfPXIkhnVxnJhuKXTmzKJQenAwhdmAkhfOncw3XWsCDWSUCsrUiQKPw3grYMjADq6s
	BApgNUbtHXXdaEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF5CC1376E;
	Thu, 16 Oct 2025 18:19:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0/c7NRg38WjlYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 18:19:04 +0000
Date: Thu, 16 Oct 2025 20:19:04 +0200
Message-ID: <874iry7lrb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc1
In-Reply-To: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
References: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: 4LUHQ75WROPRQ5E4QJXZXAQK352I5SMY
X-Message-ID-Hash: 4LUHQ75WROPRQ5E4QJXZXAQK352I5SMY
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 16 Oct 2025 19:04:02 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc1
> 
> for you to fetch changes up to f1a450f9e17d341f69f8fb19f6d13ef9f1aa508b:
> 
>   ASoC: nau8821: Fix IRQ handling and improve jack (2025-10-16 12:41:35 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A moderately large collection of driver specific fixes, plus a few new
> quirks and device IDs.  The NAU8821 changes are a little large but more
> in mechanical ways than in ways that are complex.

Pulled now.  Thanks.


Takashi
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
