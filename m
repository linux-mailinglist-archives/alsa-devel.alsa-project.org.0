Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A88B8DCB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 18:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9EDE0F;
	Wed,  1 May 2024 18:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9EDE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714579926;
	bh=5fahGpb5uYdA5bkZ4GrzwqW6Swzz235lhwKCeVGbG8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MBda1ZZ9851is/kwEfyj13h/yXdyC2GiqLy9EpD8hf9ybbl/Bsqelxags+xii8GyI
	 /vBVpX1J+AZ6Mzu5ND2ldGWq1ryAUBJ9RnhKRAKWoF8U84XQx9csxjkZ7jF4+qOUJi
	 QWG6tZqX9QVwggicfXnAnQTOapJP7Cg1m0mZ2Q2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2214F80587; Wed,  1 May 2024 18:11:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65961F8057B;
	Wed,  1 May 2024 18:11:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D6FF80266; Wed,  1 May 2024 18:11:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACE7EF8023A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 18:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE7EF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LyNkk+B2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3Sudy/GD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=LyNkk+B2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3Sudy/GD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAC7F1F835;
	Wed,  1 May 2024 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714579878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XA0gg+t09WHMl4fWsDziCzvlvMYJIwVwucXmAPq4WU=;
	b=LyNkk+B2HfIYkVIP/rjV8nOwP2hQ25+X4kZnm6UcVGC7PkaGPRhWhII2u7wGtfpUxrqlty
	Wor+kcbowXZ/grGyqK4Y+WrloFZSFE2lnbgkHD48keJwbI/o34SYjDj8t072v8ZKJsHTKZ
	tpjec5+2DuGauB8IlMhN0L7CycpPRgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714579878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XA0gg+t09WHMl4fWsDziCzvlvMYJIwVwucXmAPq4WU=;
	b=3Sudy/GD/JhZqMN09vxJtY0LN4iPFAGv15hukpQh40/4ZU1Bz5bFoJzUu/GmzbDZ9dMcOg
	HVaGalKrhC6PvZAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714579878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XA0gg+t09WHMl4fWsDziCzvlvMYJIwVwucXmAPq4WU=;
	b=LyNkk+B2HfIYkVIP/rjV8nOwP2hQ25+X4kZnm6UcVGC7PkaGPRhWhII2u7wGtfpUxrqlty
	Wor+kcbowXZ/grGyqK4Y+WrloFZSFE2lnbgkHD48keJwbI/o34SYjDj8t072v8ZKJsHTKZ
	tpjec5+2DuGauB8IlMhN0L7CycpPRgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714579878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7XA0gg+t09WHMl4fWsDziCzvlvMYJIwVwucXmAPq4WU=;
	b=3Sudy/GD/JhZqMN09vxJtY0LN4iPFAGv15hukpQh40/4ZU1Bz5bFoJzUu/GmzbDZ9dMcOg
	HVaGalKrhC6PvZAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB2B13942;
	Wed,  1 May 2024 16:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NPxPJaZpMmaCYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 May 2024 16:11:18 +0000
Date: Wed, 01 May 2024 18:11:30 +0200
Message-ID: <87bk5pldfx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.9-rc6
In-Reply-To: <549018ebcc16eaa42ffac7fdc865feb8.broonie@kernel.org>
References: <549018ebcc16eaa42ffac7fdc865feb8.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: IE7V6OT7OQHYU6ZJ7ZVGMHIVIJ6YODM4
X-Message-ID-Hash: IE7V6OT7OQHYU6ZJ7ZVGMHIVIJ6YODM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IE7V6OT7OQHYU6ZJ7ZVGMHIVIJ6YODM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 May 2024 16:07:49 +0200,
Mark Brown wrote:
> 
> The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:
> 
>   Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc6
> 
> for you to fetch changes up to c5782bb5468acf86d8ca8e161267e8d055fb4161:
> 
>   ASoC: meson: tdm fixes (2024-04-30 23:36:23 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.9
> 
> This is much larger than is ideal, partly due to your holiday but also
> due to several vendors having come in with relatively large fixes at
> similar times.  It's all driver specific stuff.
> 
> The meson fixes from Jerome fix some rare timing issues with blocking
> operations happening in triggers, plus the continuous clock support
> which fixes clocking for some platforms.  The SOF series from Peter
> builds to the fix to avoid spurious resets of ChainDMA which triggered
> errors in cleanup paths with both PulseAudio and PipeWire, and there's
> also some simple new debugfs files from Pierre which make support a lot
> eaiser.

Thanks, pulled now.


Takashi
