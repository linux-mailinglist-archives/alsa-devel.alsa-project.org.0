Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1839CD3E6A
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Dec 2025 11:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72B2560203;
	Sun, 21 Dec 2025 11:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72B2560203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766312402;
	bh=2M2PKj+6AxdWiFnBbhl1tCsgFwbldzqTE+iLle8YIo8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q49IOCKgCmWkevhoXHKv1IbvVzp7pmFcMNQENEz48SBTyqSx/6YtNg5W2DJRX3dC1
	 eIjxK+o/9fesVWeAIcmh7qU4PeC0kd/H8RxOt07JJGCLZpygFURbVhtNLStkc6mEC7
	 sJGmqlYleKYKdjZxQ4/Fwkr5t2ZAgSPycXPbev9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CCA5F805DF; Sun, 21 Dec 2025 11:19:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C315F805C8;
	Sun, 21 Dec 2025 11:19:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 513ACF80496; Sun, 21 Dec 2025 11:19:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A836FF801F5
	for <alsa-devel@alsa-project.org>; Sun, 21 Dec 2025 11:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A836FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W9V5HAm2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=recEkCfq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W9V5HAm2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=recEkCfq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C87E55BE1B;
	Sun, 21 Dec 2025 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1766312343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hukJl7JVHsaVHjhuHp29w14ZTDridEdHML4mF4NsPvI=;
	b=W9V5HAm2NbasGqYotesJE2Oe1WuKLXQS3hEP2oaavGrpg/ZpqRJCTK6O4AcHeFXNHB481L
	4GF+M9ZorT+oXbWaVd9JOrQh+Vl4lCM5Q+cm5iPhSg33vlsO0/rlz5MNLxM3WtXeoi8xug
	19tSyDgMZQi6X/RWjMYLpEv3xgJA1N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hukJl7JVHsaVHjhuHp29w14ZTDridEdHML4mF4NsPvI=;
	b=recEkCfqGM93u2jmS1dm9IC9KbjAZjlsDOGlc0on0YKNJYAoBBz/IesCkqaQBltu316Knw
	/p+0KfO1osHR4YAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1766312343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hukJl7JVHsaVHjhuHp29w14ZTDridEdHML4mF4NsPvI=;
	b=W9V5HAm2NbasGqYotesJE2Oe1WuKLXQS3hEP2oaavGrpg/ZpqRJCTK6O4AcHeFXNHB481L
	4GF+M9ZorT+oXbWaVd9JOrQh+Vl4lCM5Q+cm5iPhSg33vlsO0/rlz5MNLxM3WtXeoi8xug
	19tSyDgMZQi6X/RWjMYLpEv3xgJA1N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766312343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hukJl7JVHsaVHjhuHp29w14ZTDridEdHML4mF4NsPvI=;
	b=recEkCfqGM93u2jmS1dm9IC9KbjAZjlsDOGlc0on0YKNJYAoBBz/IesCkqaQBltu316Knw
	/p+0KfO1osHR4YAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6759313A54;
	Sun, 21 Dec 2025 10:19:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 95NqFZfJR2lVfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 21 Dec 2025 10:19:03 +0000
Date: Sun, 21 Dec 2025 11:18:58 +0100
Message-ID: <87y0mwyw6l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc1
In-Reply-To: <00e012c86db2f59544afb66176c25978@kernel.org>
References: <00e012c86db2f59544afb66176c25978@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: LPQSMDJVXGHYS752HKGK63CX72ZKMGKS
X-Message-ID-Hash: LPQSMDJVXGHYS752HKGK63CX72ZKMGKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPQSMDJVXGHYS752HKGK63CX72ZKMGKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Dec 2025 16:25:22 +0100,
Mark Brown wrote:
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc1
> 
> for you to fetch changes up to 56d953a8d0da5e53c2594edde23465ec49385b1c:
> 
>   ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> We've been quite busy with fixes since the merge window, though not in
> any particularly exciting ways - the standout thing is the fix for _SX
> controls which were broken by a change to how we do clamping, otherwise
> it's all fairly run of the mill fixes and quirks.

Pulled now.  Thanks.


Takashi
