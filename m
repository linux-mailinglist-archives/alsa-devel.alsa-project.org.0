Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4894CBE5
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 10:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD207EB1;
	Fri,  9 Aug 2024 10:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD207EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723191184;
	bh=RRj/1q1q6eg0gbGGGe39oP5ek67xmYzaX+9oOgI76k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQcRRls075un24FbmHzQkJshXrz1GIAbytZz8Z8HpbTCM+tb9Yka+sPoZBnEuW2z8
	 ErnsvoBQ/+uk/X+ckJLbjtXluvT9zwYh7RkSJPLosojIKKHItWrdVF7KRLAjWecwDU
	 sV/1/h4zRxOo/DH1PEJBLCLEuVm81uStS7ObqheM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFD99F805B2; Fri,  9 Aug 2024 10:12:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA340F805AE;
	Fri,  9 Aug 2024 10:12:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E39DF802DB; Fri,  9 Aug 2024 10:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D634BF800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D634BF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EDDQGKgg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DnOiTO4e;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EDDQGKgg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DnOiTO4e
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D768E1FF1C;
	Fri,  9 Aug 2024 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723190416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9oaP7iS+TWbeJiYRiMCTpsay9XuAKqxHmat/ZuPOjLA=;
	b=EDDQGKggJrHMi1v6qRPOMlOfATI7WrH8UNRGYj/7TZ0vQvG33giQr0+fCnh1qYzzjhzr83
	3D1hEPFwqseLxjmXg4cIBRVOlZ/PkF9cv8w8bwxhYgdszPMp+qG5J2mUHTKfoiUv4Rg/VH
	6/Tltio2F6OYeva79DEin4Teu/UN5+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723190416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9oaP7iS+TWbeJiYRiMCTpsay9XuAKqxHmat/ZuPOjLA=;
	b=DnOiTO4el3Kq75hS+kH3XNBrGnsCrQhe7YUHbN2FPWNWWXWIu9A6SvXcb4md4Px8GMp/qw
	U2MtWvS1pviGHPDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723190416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9oaP7iS+TWbeJiYRiMCTpsay9XuAKqxHmat/ZuPOjLA=;
	b=EDDQGKggJrHMi1v6qRPOMlOfATI7WrH8UNRGYj/7TZ0vQvG33giQr0+fCnh1qYzzjhzr83
	3D1hEPFwqseLxjmXg4cIBRVOlZ/PkF9cv8w8bwxhYgdszPMp+qG5J2mUHTKfoiUv4Rg/VH
	6/Tltio2F6OYeva79DEin4Teu/UN5+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723190416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9oaP7iS+TWbeJiYRiMCTpsay9XuAKqxHmat/ZuPOjLA=;
	b=DnOiTO4el3Kq75hS+kH3XNBrGnsCrQhe7YUHbN2FPWNWWXWIu9A6SvXcb4md4Px8GMp/qw
	U2MtWvS1pviGHPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA3161379A;
	Fri,  9 Aug 2024 08:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hidRLJDMtWbrGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 08:00:16 +0000
Date: Fri, 09 Aug 2024 10:00:56 +0200
Message-ID: <871q2y86rr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.11-rc2
In-Reply-To: <6bdf8d7232943e6210f6560931e6d2ab.broonie@kernel.org>
References: <6bdf8d7232943e6210f6560931e6d2ab.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.30 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: DMAG43UMWWNBMPAKQQSOCYJXEZDXH43O
X-Message-ID-Hash: DMAG43UMWWNBMPAKQQSOCYJXEZDXH43O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMAG43UMWWNBMPAKQQSOCYJXEZDXH43O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Aug 2024 23:49:42 +0200,
Mark Brown wrote:
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc2
> 
> for you to fetch changes up to 72776774b55bb59b7b1b09117e915a5030110304:
> 
>   ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value (2024-08-08 20:34:56 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.11
> 
> Quite a lot of fixes have come in since the merge window, there's some
> repetitive fixes over the Qualcomm drivers increasing the patch count,
> along with a large batch of fixes from Cirrus.  We also have some quirks
> and some individual fixes.

Pulled now.  Thanks.


Takashi
