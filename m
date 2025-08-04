Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D46B19BED
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AC660275;
	Mon,  4 Aug 2025 09:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AC660275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754291384;
	bh=IScqngVTy9Czx1qpiFUE70keR4EIO7qzyYAIBvVVdyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZcvUOPdaG6/S6P33HUIA5gsEWeFg08UleSOjphV045LJpcToannyjC79xLmLMAbfy
	 lgVUNGRvp1+RiFbMiw6oY3az0lgtJwm66GulDv1YLCcE66w5GtWzglKWe0I7fqpAFv
	 2QD0fOnyR5MhWEU1fWJdeUFWcwWKoh8MjvABG9MQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A74F805C4; Mon,  4 Aug 2025 09:09:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D54C2F805C4;
	Mon,  4 Aug 2025 09:09:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D95F804CF; Mon,  4 Aug 2025 09:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8172AF8003C
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 09:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8172AF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Alw7gtG4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D8zr59Qm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Alw7gtG4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D8zr59Qm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D435219B0;
	Mon,  4 Aug 2025 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754291308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNyCLwv6wdprMW5agjROWU9E+a8cjf4zMSZR1jiML+Q=;
	b=Alw7gtG45bp7/iY/JKNLWTjKV/cuICTe96LtT6F1PFgXzUqkmvCK0iEgej3zY8WNKF0tNB
	vYmkQ1jiTUfeDOXwk5Yz1MyHE0/Es4V4fRWtCyBGzcBtOmaLKpfVqAWh9xMA5KVQm7UpRN
	V+Eq6h7b1WglhFohqk+Ntk5+gyGKd98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754291308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNyCLwv6wdprMW5agjROWU9E+a8cjf4zMSZR1jiML+Q=;
	b=D8zr59QmkH4gQIufePLOf3x/3ACz4+J23LVdsiChSKpKinKhzNS4lb70X5b4Hmpn7rLbid
	wQN26qxceqp6yMDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Alw7gtG4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D8zr59Qm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754291308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNyCLwv6wdprMW5agjROWU9E+a8cjf4zMSZR1jiML+Q=;
	b=Alw7gtG45bp7/iY/JKNLWTjKV/cuICTe96LtT6F1PFgXzUqkmvCK0iEgej3zY8WNKF0tNB
	vYmkQ1jiTUfeDOXwk5Yz1MyHE0/Es4V4fRWtCyBGzcBtOmaLKpfVqAWh9xMA5KVQm7UpRN
	V+Eq6h7b1WglhFohqk+Ntk5+gyGKd98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754291308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qNyCLwv6wdprMW5agjROWU9E+a8cjf4zMSZR1jiML+Q=;
	b=D8zr59QmkH4gQIufePLOf3x/3ACz4+J23LVdsiChSKpKinKhzNS4lb70X5b4Hmpn7rLbid
	wQN26qxceqp6yMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D98213A7E;
	Mon,  4 Aug 2025 07:08:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K/a6DWxckGj1UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Aug 2025 07:08:28 +0000
Date: Mon, 04 Aug 2025 09:08:27 +0200
Message-ID: <87h5yn1s44.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Accelerate the front MIC charging
 and discharging of the 897 codec
In-Reply-To: <87jz3j1ug9.wl-tiwai@suse.de>
References: <20250804030518.424229-1-wangdich9700@163.com>
	<87jz3j1ug9.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 7D435219B0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: XTTZWJ4LLOPZGTN4ZWTNGVU7JHHVSEVH
X-Message-ID-Hash: XTTZWJ4LLOPZGTN4ZWTNGVU7JHHVSEVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTTZWJ4LLOPZGTN4ZWTNGVU7JHHVSEVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Aug 2025 08:17:58 +0200,
Takashi Iwai wrote:
> 
> On Mon, 04 Aug 2025 05:05:17 +0200,
> wangdich9700@163.com wrote:
> > 
> > From: wangdicheng <wangdicheng@kylinos.cn>
> > 
> > The front MIC capacitance of the Inspur board is too large, resulting in a longer charging and discharging time required,
> > which in turn prevents recording for 5 seconds before startup.
> > Therefore, software is used to increase the delay by 2 seconds to avoid this issue.
> 
> First off, the HD-audio code was replaced in the latest Linus tree to
> sound/hda/* directories, so please adapt the patches accordingly.
> 
> About the code change:
> 
> - The 2.5 seconds wait is way too long and inappropriate to be put in
>   the resume callback.  It has to be fixed differently.
> 
> - Does it apply really to all devices with 0x10ec1304?  It's Realtek's
>   vendor id, so this can match to many devices.
> 
> - Last but not least, it's not nice to have a code that depends on the
>   certain vendor id there.  Again, please implement in a different way
>   so that it can be handled in more device-specific code rather than
>   the common function.

One more thing: the mailing list for Linux kernel sound stuff is
linux-sound@vger.kernel.org.  Please use this one instead of
alsa-devel ML.


thanks,

Takashi
