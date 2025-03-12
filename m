Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358BA5DF74
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Mar 2025 15:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9A06024C;
	Wed, 12 Mar 2025 15:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9A06024C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741791060;
	bh=ZJH47BS51vcf2c6lBX0xT6flaBRz9vNqC20UYWo1yjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8RVLSnk/c/tfZdKlY7kNO26L7MsoH7xC7u5YUpG3DEeXziYqjedsStPTuhQHbECT
	 yqKrNsnQ7uZB9kdIhjCzWGe1bTIPf+OcGZHr+Pe6pDuqzbwER3JqLcRQb5wTOaYboI
	 U4ycbV7Qvl3q3S3oZuo5MQ4E1ETiHy7FLDjP5CNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7103F805BB; Wed, 12 Mar 2025 15:50:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96CC2F805AF;
	Wed, 12 Mar 2025 15:50:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC722F80301; Wed, 12 Mar 2025 15:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDF91F8003C
	for <alsa-devel@alsa-project.org>; Wed, 12 Mar 2025 15:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF91F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FZUFD2wM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eVvUOHmN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Miw4Vjso;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dh7fGeUs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79E8C1F443;
	Wed, 12 Mar 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741791019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=FZUFD2wMrFUMAgUcoHMRpFNP53c2D4/cP2IPoJX9Z3WehHgWVx1AYDErpqJ2ZSQsJ8J3QJ
	H7d8C2/DcP8mDgI/o9MLfpEto1ZAWumGfpWmMYijZ5ZCtx8qsi0upz3+1XIts3SLfo5jx5
	CIEzU6cFXRC9R0GhgXqtknGlfJQWMJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=eVvUOHmNQgZRU4mwDZaBrR8ZmQeQdU4kzyM5AyObhQB8Q14TRB6AySmDTaos26GzJczCpT
	VlokVijrJQENLSAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Miw4Vjso;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dh7fGeUs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741791018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=Miw4VjsomqCDt2+/oQMzdZN9x9A9HVpl4iKkI8IOlEa/nAF3kO4RNZ8oda7507r1TY6qig
	UKTburLhMmwrCwfsjJ2jYSYavAzTGFLL10QdSE4CNlgqDH0dVe/BwSfsMZ6JjutrFk0xBy
	6jo4JSv+fnw7WeAt4+EI0l4Sl872iPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=dh7fGeUslUIZTUCRkiW+Ac96XZKUaRzipfm//0rQCIK4T+Y9AQI0RAW+UET+g6P3a0fBbt
	tPjbRAZe1V6hZrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53DB3132CB;
	Wed, 12 Mar 2025 14:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VyJOEyqf0WeofgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 14:50:18 +0000
Date: Wed, 12 Mar 2025 15:50:17 +0100
Message-ID: <87cyemz4k6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc6
In-Reply-To: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
References: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 79E8C1F443
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: YQBL5JZVE3MXIDG7IVLI47Q5ZRZLV524
X-Message-ID-Hash: YQBL5JZVE3MXIDG7IVLI47Q5ZRZLV524
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQBL5JZVE3MXIDG7IVLI47Q5ZRZLV524/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Mar 2025 15:08:20 +0100,
Mark Brown wrote:
> 
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6
> 
> for you to fetch changes up to ed92bc5264c4357d4fca292c769ea9967cd3d3b6:
> 
>   ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe() (2025-03-11 13:51:52 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> The bulk of this is driver specific fixes, mostly unremarkable.  There's
> also one core fix from Charles, fixing up confusion around the limiting
> of maximum control values.
> 
> ----------------------------------------------------------------
> Alexey Klimov (1):
>       ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
> 
> Bard Liao (2):
>       ASoC: rt1320: set wake_capable = 0 explicitly
>       ASoC: rt722-sdca: add missing readable registers
> 
> Charles Keepax (2):
>       ASoC: ops: Consistently treat platform_max as control value
>       ASoC: cs42l43: Fix maximum ADC Volume
> 
> Christophe JAILLET (1):
>       ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
> 
> Maciej Strozek (1):
>       ASoC: cs42l43: Add jack delay debounce after suspend

This one causes a build error without CONFIG_PM.


Takashi
