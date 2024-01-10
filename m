Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B9829538
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 09:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A340DF54;
	Wed, 10 Jan 2024 09:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A340DF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704875666;
	bh=KO9rdj5A2JNJ3Dv+QU04OtNQekOyZkfM3LPQpsNh7Ls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pg8h7b4aZ+tAqg6QPK2i9HeDFsLsafUbZhzpYqq5j3ffkCE7KYIgTZR5iKmLJZoxk
	 AarIMOemDzpXqSKZuvgFrSWAl7umyl3oEhQGbJVqtHyO37CnfX7ij/gfE+6Lwh1Ws/
	 wliUjg31z0hBaONlAzY5Q5ZzjnA1h6sk0gkbRdig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DD3CF8059F; Wed, 10 Jan 2024 09:33:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D815CF8057F;
	Wed, 10 Jan 2024 09:33:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 673CBF80254; Wed, 10 Jan 2024 09:33:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84E83F80086
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 09:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E83F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dp/sCtAc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tKpJ2Agg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dp/sCtAc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tKpJ2Agg
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73ED8221C1;
	Wed, 10 Jan 2024 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704875614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQZzGN43E0SL4SCEDxq3yUCgNGZwogw3SRz8A7qLqXU=;
	b=dp/sCtAcXFVbeRhjZqe82kYDEBjIX0M//eX4M6gcsz1Nvj7hkngMR9z9TV/fEeKl9tEW+i
	kGUXJwV+Eg6mOniwG8h3xErsvMDKw0keG4cKnpQPCI5HtNg1u1obqNLcKvNwUL49ZUxoOj
	Pku59XdMCAYH+8TVb/BptUlr131wzSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704875614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQZzGN43E0SL4SCEDxq3yUCgNGZwogw3SRz8A7qLqXU=;
	b=tKpJ2AggRSSDbKen7kQqfKCDiw2iCCb63vqLiMwSZS1exP4n3mXTF24CBFaziGTvgQBybc
	08Ic+seEbjJTMABQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704875614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQZzGN43E0SL4SCEDxq3yUCgNGZwogw3SRz8A7qLqXU=;
	b=dp/sCtAcXFVbeRhjZqe82kYDEBjIX0M//eX4M6gcsz1Nvj7hkngMR9z9TV/fEeKl9tEW+i
	kGUXJwV+Eg6mOniwG8h3xErsvMDKw0keG4cKnpQPCI5HtNg1u1obqNLcKvNwUL49ZUxoOj
	Pku59XdMCAYH+8TVb/BptUlr131wzSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704875614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQZzGN43E0SL4SCEDxq3yUCgNGZwogw3SRz8A7qLqXU=;
	b=tKpJ2AggRSSDbKen7kQqfKCDiw2iCCb63vqLiMwSZS1exP4n3mXTF24CBFaziGTvgQBybc
	08Ic+seEbjJTMABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDDD313786;
	Wed, 10 Jan 2024 08:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oVt1OF1WnmUHZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jan 2024 08:33:33 +0000
Date: Wed, 10 Jan 2024 09:33:33 +0100
Message-ID: <87zfxdpoyq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Rosin <peda@axentia.se>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: use devm_snd_soc_register_card()
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: ++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dp/sCtAc";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tKpJ2Agg
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [4.33 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.16)[88.77%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[bootlin.com,csie.org,tuxon.dev,bitmer.com,perex.cz,gmail.com,kernel.org,microchip.com,axentia.se,sholland.org,suse.com,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 73ED8221C1
Message-ID-Hash: S3LEGNHJSUPFD7XJZKOXT226TJ5GXLWV
X-Message-ID-Hash: S3LEGNHJSUPFD7XJZKOXT226TJ5GXLWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3LEGNHJSUPFD7XJZKOXT226TJ5GXLWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jan 2024 02:27:39 +0100,
Kuninori Morimoto wrote:
> 
> 
> Hi Mark
> 
> We can use devm_snd_soc_register_card()
> instead of      snd_soc_register_card(),  and is possible
> to ignore       snd_soc_unregister_card().

I haven't looked through all code changes, but in general, be careful
when the driver is releasing something else than the devres-managed
stuff.  Namely, the devres stuff is released *after* the call of
remove callback.

For example, in your patch for cirrus driver:

 static void edb93xx_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
 	ep93xx_i2s_release();
 }
 
This will end up with different call orders of soc-unregister and
ep93xx_i2s_release().  This kind of changes may easily be a hidden
source of UAF.


Takashi
