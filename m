Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CCC94DBA4
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2024 10:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F200E10BE;
	Sat, 10 Aug 2024 10:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F200E10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723279946;
	bh=zT5rASv96Ev8n9CddTVeF1TAdQH7tDQYlH/IQ8smeuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P+6DkSPj1zupNCAKQfr0Fy4i/ZXz//lVDjcfmcgNKyg/H25hweYw2TysiN4N3TBO4
	 a53jgpMVJGI5YW/IGTcXSJ2ip3YT4KqukhYUzBGLndJ6Em1nqHe2IYz+z5XwcziIuD
	 8qRWQriFBqoLabflWUhWlAoEPEKMoj5DmQ8Nn7RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5047CF805C1; Sat, 10 Aug 2024 10:52:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E07F805AE;
	Sat, 10 Aug 2024 10:51:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 671C3F802DB; Sat, 10 Aug 2024 10:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 502A0F800BF
	for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2024 10:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502A0F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hvMyslfl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=twiaINLH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hvMyslfl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=twiaINLH
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7F69220E0;
	Sat, 10 Aug 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723279254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOlgF9chdSFGs3DgiXE9oTOri2EHGPEGhgk4hioJWuk=;
	b=hvMyslfl1Oe1tI1q7bQBtBd3LHUe8KIm0hQU618WeXvPxVIsct/+tlF6Hn66KzO2jXJED1
	etjr1czhUcMEn2TLUXOQVzLf58UwgRLxpDAgTGF0FNrFXVLYgMOTKGszugJzFeZDTzcVIG
	KFpinlXggNhdo0DBinz0/nNqLHRUuZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOlgF9chdSFGs3DgiXE9oTOri2EHGPEGhgk4hioJWuk=;
	b=twiaINLHiatdKiMDBzGlMbjAu+R6EdysgaDWY9WtiebRK0SlrdFODd3EM5eEHBmU/C7tC6
	nXke1zuo+a+Sq3Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723279254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOlgF9chdSFGs3DgiXE9oTOri2EHGPEGhgk4hioJWuk=;
	b=hvMyslfl1Oe1tI1q7bQBtBd3LHUe8KIm0hQU618WeXvPxVIsct/+tlF6Hn66KzO2jXJED1
	etjr1czhUcMEn2TLUXOQVzLf58UwgRLxpDAgTGF0FNrFXVLYgMOTKGszugJzFeZDTzcVIG
	KFpinlXggNhdo0DBinz0/nNqLHRUuZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723279254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOlgF9chdSFGs3DgiXE9oTOri2EHGPEGhgk4hioJWuk=;
	b=twiaINLHiatdKiMDBzGlMbjAu+R6EdysgaDWY9WtiebRK0SlrdFODd3EM5eEHBmU/C7tC6
	nXke1zuo+a+Sq3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76EC913704;
	Sat, 10 Aug 2024 08:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aPHFGpYnt2azJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Aug 2024 08:40:54 +0000
Date: Sat, 10 Aug 2024 10:41:34 +0200
Message-ID: <87a5hklqgx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norman Bintang <normanbt@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	broonie@kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	cujomalainey@chromium.org,
	Chih-Yang Hsia <paulhsia@chromium.org>,
	David Riley <davidriley@chromium.org>
Subject: Re: [PATCH] ALSA: pcm: Add xrun counter for snd_pcm_substream
In-Reply-To: <20240809140648.3414349-1-normanbt@chromium.org>
References: <20240809140648.3414349-1-normanbt@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: N2ZSJFOL5KGTXEHA3XVBETHECNWNPC55
X-Message-ID-Hash: N2ZSJFOL5KGTXEHA3XVBETHECNWNPC55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2ZSJFOL5KGTXEHA3XVBETHECNWNPC55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Aug 2024 16:06:45 +0200,
Norman Bintang wrote:
> 
> This patch adds an xrun counter to snd_pcm_substream as an alternative
> to using logs from XRUN_DEBUG_BASIC. The counter provides a way to track
> the number of xrun occurences, accessible through the /proc interface.
> 
> The counter is enabled when CONFIG_SND_PCM_XRUN_DEBUG is set.
> 
> Example output:
> 
> $ cat /proc/asound/card0/pcm9p/sub0/status
> 
> owner_pid   : 1425
> trigger_time: 235.248957291
> tstamp      : 0.000000000
> delay       : 1912
> avail       : 480
> avail_max   : 1920
> -----
> hw_ptr      : 672000
> appl_ptr    : 673440
> xrun_counter: 3  # (new row)
> 
> Signed-off-by: Norman Bintang <normanbt@chromium.org>
> Reviewed-by: Chih-Yang Hsia <paulhsia@chromium.org>
> Tested-by: Chih-Yang Hsia <paulhsia@chromium.org>
> Reviewed-by: David Riley <davidriley@chromium.org>

Applied to for-next branch.  Thanks.


Takashi
