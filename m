Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903458B8692
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 09:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B68DF9;
	Wed,  1 May 2024 09:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B68DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714550194;
	bh=uMttE0qhbz8kzX+Cp4ePSzGxNRWzrM6vWLazjFTdaDo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dZte+m2YGXjCafJPGdHr2QRdXeyrdZcgNAbSS/nP13AaEmVAm18r6he1pCPfFc/3D
	 KFhPSEa3cI4kXLCEbYYjg+w86nt/QMFfLMpIVsmoGYALTWwpcrx6Qndl10I/tH7rC0
	 HQ5O9s1P2wnE2IOaC+nb4vOECNum+iePaX1U1hwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE48F80579; Wed,  1 May 2024 09:56:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF5F7F80579;
	Wed,  1 May 2024 09:56:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCBB0F80266; Wed,  1 May 2024 09:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10E0FF8023A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 09:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E0FF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TL3RjE1C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d3YZLuBK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yNcB27fz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IaD1OLW0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E64EB2222C;
	Wed,  1 May 2024 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714550138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKP9IUsaQw2KIKjb+xbduzrCjX0eQanRZdwpyhbMhl8=;
	b=TL3RjE1CfebbYCYIdHhjhyoiHYUQiYGu5CGDS+jPn5wpKl7JTG4/v76fvdvGRVb+yDtUYK
	QY1kJdVnJ75ClmkJ+31ySov/LkK1gnmngd3SydUQ4Dg0awjnALZnCZYBXEdTYDqtNfTSl8
	Fm9bjQ3H2V+bLNeAa2/erAQdYBrTfPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKP9IUsaQw2KIKjb+xbduzrCjX0eQanRZdwpyhbMhl8=;
	b=d3YZLuBKoC3OyF/3grO6HSkQY4lrJaVbBVmqNgLnUG+HWxgTE73gciDvyoGtzwrGXWBkAq
	0ZSGXZlxxnS9CQBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714550137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKP9IUsaQw2KIKjb+xbduzrCjX0eQanRZdwpyhbMhl8=;
	b=yNcB27fzZ9y9hRiCrcRQSPrI+zmAn+qatan8//V+JRR4fXNNci/hMUCwMGDlovThgXAHmj
	iVIhfYeRPyV7b/NziapG70onXRRLwOa0I8A0KAxw3N+nj/SxupMxsvVZB+7wF2nzNnnDDJ
	l6jQ+78LJ6eUmWPWp7RwB6XxB1npqxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKP9IUsaQw2KIKjb+xbduzrCjX0eQanRZdwpyhbMhl8=;
	b=IaD1OLW0J3FQikd8cIFP4cBc5W7NBnwFGXJ7rQIGpw7iXY2D8IHiMVwphPLna1sfntlQOX
	SyXd3m7fZb9dqzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACAC613942;
	Wed,  1 May 2024 07:55:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D+BlKHn1MWbnYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 May 2024 07:55:37 +0000
Date: Wed, 01 May 2024 09:55:50 +0200
Message-ID: <87mspakltl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Manuel Barrio Linares <mbarriolinares@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Add sampling rates support for Mbox3
In-Reply-To: <20240430171020.192285-1-mbarriolinares@gmail.com>
References: <87cyq7nw19.wl-tiwai@suse.de>
	<20240430171020.192285-1-mbarriolinares@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-2.98)[99.90%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
Message-ID-Hash: ODMPMOA3VGZKJ5S3TW3Q4SJESW7SZWVX
X-Message-ID-Hash: ODMPMOA3VGZKJ5S3TW3Q4SJESW7SZWVX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODMPMOA3VGZKJ5S3TW3Q4SJESW7SZWVX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 19:10:18 +0200,
Manuel Barrio Linares wrote:
> 
> This adds support for all sample rates supported by the
> hardware,Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}
> 
> Fixes syncing clock issues that presented as pops. To test this, without
> this patch playing 440hz tone produces pops.
> 
> Clock is now synced between playback and capture interfaces so no more
> latency drift issue when using pipewire pro-profile.
> (https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)
> 
> Signed-off-by: Manuel Barrio Linares <mbarriolinares@gmail.com>

Applied to for-next branch now.  Thanks!


Takashi
