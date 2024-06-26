Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7C9198C7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 22:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044B71912;
	Wed, 26 Jun 2024 22:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044B71912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719432754;
	bh=HKV/TsQWPi+gku8UaAqLiGA7FvYWPTpWbOn3UqGMNls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMTvHMsSV0EHLhTgYqg1hb21XkISZCOZG7MMa5cQ79b+LI9S9MO8URHw4f8Q3X5A/
	 6UCuRlafYhQ33yN17Fd59yaH4dGQQ45yMGqan4xTrRV5m8LeT8nsEINDMghsqV1TB8
	 5r7vFPgvVALpwRqsPS570Ej5jgRnkeKEpGD8ybg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7D3F805AF; Wed, 26 Jun 2024 22:12:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC41AF805B1;
	Wed, 26 Jun 2024 22:12:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B08A6F80423; Wed, 26 Jun 2024 22:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBE87F800ED
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 22:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE87F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Yiv1CYVJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V/bHTPzV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=v7Oouutx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3hhIChBF
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2EE921AB7;
	Wed, 26 Jun 2024 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719432712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2k6B3pblDhexdaEUfKSKYpKd9LZrY1yXUkdJeI6I7M=;
	b=Yiv1CYVJ8nFhLeiaOyb7ER2jeSPOlLMlLqU5pGa6VlL7q0qB3PDNPxJG2T+1JKIGPrm6Dw
	zxlWeK8w4tbWCn4+xCSO2T4pRUrqNvD3gchLJfenDjbJMe0DOBP35lt8DSZFcaYZqiowKL
	mPDMypmogLpvPFfacwXheY0Y7n/iaMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719432712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2k6B3pblDhexdaEUfKSKYpKd9LZrY1yXUkdJeI6I7M=;
	b=V/bHTPzV9AI9u14H9cowCX8J/j1QKtP9OZWQfoL9Th8UMg49Pz00RqEfbLJpZWe0cOQntn
	v2oXvat4ViQQj+Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v7Oouutx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3hhIChBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719432711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2k6B3pblDhexdaEUfKSKYpKd9LZrY1yXUkdJeI6I7M=;
	b=v7Oouutx2wS5ePxpGoHjoDHJkFeekqkF7CsszPlC3z3Nyk2uh0da80wgslSdLsxmYfyFGP
	sF+eaejCna4HhfMIzejY3Evz7s46xlalYCtekjKvLEncqrtuUhH6yXvZEpapKksNhIkUm0
	XCgxOuXn7TvbKMsi1peR9Johi/G8N8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719432711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2k6B3pblDhexdaEUfKSKYpKd9LZrY1yXUkdJeI6I7M=;
	b=3hhIChBFq+xInlLG4yoEJ53hyI7lHqYI6GuRVYtfthhKjxx0qUAZbpE3r4lvFeTgtC8N2F
	IMTZL925fs5oZACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A16CF13AAD;
	Wed, 26 Jun 2024 20:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PmI8Jgd2fGb+PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Jun 2024 20:11:51 +0000
Date: Wed, 26 Jun 2024 22:12:19 +0200
Message-ID: <87sewzh3a4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.10-rc5
In-Reply-To: <45ac83fae7eec4c6a7e297e2f27295df.broonie@kernel.org>
References: <45ac83fae7eec4c6a7e297e2f27295df.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E2EE921AB7
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 7X4OENFSIR6RB4L2LFH6LJFW2PJEXDO7
X-Message-ID-Hash: 7X4OENFSIR6RB4L2LFH6LJFW2PJEXDO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7X4OENFSIR6RB4L2LFH6LJFW2PJEXDO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Jun 2024 20:10:32 +0200,
Mark Brown wrote:
> 
> The following changes since commit c3f38fa61af77b49866b006939479069cd451173:
> 
>   Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.10-rc5
> 
> for you to fetch changes up to 68f97fe330e01450ace63da0ce5cab676fc97f9a:
> 
>   ASoC: rt5645: fix issue of random interrupt from push-button (2024-06-26 16:34:48 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.10
> 
> A relatively large batch of updates, largely due to the long interval
> since I last sent fixes due to various travel and holidays.  There's a
> lot of driver specific fixes and quirks in here, none of them too major,
> and also some fixes for recently introduced memory safety issues in the
> topology code.

Pulled now.  Thanks.


Takashi
