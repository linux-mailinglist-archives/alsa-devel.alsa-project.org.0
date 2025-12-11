Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89561CB51E6
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 09:36:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A7CE6021D;
	Thu, 11 Dec 2025 09:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A7CE6021D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765442214;
	bh=iwWmDXoiN0Ap/jP5OdLUtw7mJk8qvjBw6zIJin2J4ms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Id6zZwEWMnRL0d0bQgTc0jkS7k4aXcOqRe/J4PTysB20BC992m9/xmEuWFxRU+uGZ
	 uK/MzTofLdLveKdmnCJu0VVdGUgLoCA3Nl9ZHI0dnKV6Tp+ibpZ6vsVJ42BFcc9KUA
	 YNMGZhWiKCwNJXNJuDkM6KXTuPBwxqMeQyXzOaEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D443F80093; Thu, 11 Dec 2025 09:36:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61DE3F805C7;
	Thu, 11 Dec 2025 09:36:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA2FF804CC; Thu, 11 Dec 2025 09:34:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC480F80095
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 09:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC480F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PFdhbfb8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KHXHpCWJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=uCOoRNWn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cZNz4rQM
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 094175BDD1;
	Thu, 11 Dec 2025 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765442072;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=PFdhbfb83eXTBHhMzoluHyY3xkR3BCMl4bAq4Xc8W9tqwOLDnUbWzoxP9hXOB6ikVViBqg
	++Q5lzpa95S7/w4DIUhj9vBgcP/BNJNAR3+oHyEZ9HYACodkfAY+bh9Pv1gbGs4LbuqcIm
	zJoCzDPYwg6VLsp0XQnVIqsRHfXD2N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=KHXHpCWJl+MnXSIztZkXaW2swLBGgePg/J7lHPJPiHkDKfvY+zrnDOQak5kmVNsh775VUS
	ijxV78IV/Lx4U1Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765442071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=uCOoRNWn7Hu31l8JaFLNfycbs63d43u5BhoFuwzrMtpenW3l2szAXsWhMqScGwVbR175oS
	ve8afa5bd76nlKMYCVgp3hz0npid4ApGJ6Hca/KMALGJk0fFFOZdx1FcwNxGhHG/ETPP3k
	JaH4dSv3I+h2TjPJmutZt1PfOF2GanQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=cZNz4rQMqEb+TlHGvBVzSSOOroy57VPCy4zj8dJiwf+1BvS+QLPqwBUnFSz7IPKPfiY0Kq
	sWCAEwHBSMorxZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4CA93EA63;
	Thu, 11 Dec 2025 08:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Nz+8MhaCOmkvSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 08:34:30 +0000
Date: Thu, 11 Dec 2025 09:34:30 +0100
Message-ID: <875xadct7t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-merge-window
In-Reply-To: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
References: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: JQBVOWJVT4JEWN5D7FIHHIX4MHPBPRKQ
X-Message-ID-Hash: JQBVOWJVT4JEWN5D7FIHHIX4MHPBPRKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQBVOWJVT4JEWN5D7FIHHIX4MHPBPRKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Dec 2025 01:48:41 +0100,
Mark Brown wrote:
> 
> The following changes since commit c5fae31f60a91dbe884ef2789fb3440bb4cddf05:
> 
>   ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-merge-window
> 
> for you to fetch changes up to f34836a8ddf9216ff919927cddb705022bf30aab:
> 
>   ASoC: amd: acp: update tdm channels for specific DAI (2025-12-10 09:17:53 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A small pile of fixes that came in during the merge window, it's all
> fairly standard device specific stuff.

Pulled now.  Thanks.


Takashi
