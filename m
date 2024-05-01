Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763758B86A6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 10:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B681DEC;
	Wed,  1 May 2024 10:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B681DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714550527;
	bh=gwdIyEa5KnTIH9TjCdQLW1RthD6r6amy2at0A9QHilY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D2CyDRFuVqfj15WNTE8O5YnW4Kran9hUztwc6Mp8O8aXhJM/IIQWze5v5r5UAs3qO
	 OdHq0xGnZvLfzAU6MYDGGm995XAuZMsMktib7ZFcU0drIAl88rL+k2mzPCNfdwymiZ
	 hmApmedGaOeoW6T40u2vtZtoNmePEd8WO9w3eh3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C95F0F8057D; Wed,  1 May 2024 10:01:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFCFF80570;
	Wed,  1 May 2024 10:01:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B99F80266; Wed,  1 May 2024 09:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB0A0F800E2
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 09:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0A0F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ao7lYAn1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N/zem7HC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ao7lYAn1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N/zem7HC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 384851F83F;
	Wed,  1 May 2024 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714550191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=Ao7lYAn10PD+5FWN0jRiSPTtVBxL/ky3byfP5NL/poVBLSVp4FXesnvF67ifuKwFWsdaKD
	sZLwRAD09wb/QEpQmy1IxLibpuaaiwscptV3dTDmjId7LfJ/3VmIkPeXScNzY+HrWn01cK
	fvib3Hz1xo27rK1v4rJ08LV6zIQf2rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=N/zem7HCRmliPV3qv0CSc5qlI/2iAU1B5jORt8yTJHIm8irdfhv44+syE9KXtJyDECmabu
	yz1x6X+7P93z+0Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ao7lYAn1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="N/zem7HC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714550191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=Ao7lYAn10PD+5FWN0jRiSPTtVBxL/ky3byfP5NL/poVBLSVp4FXesnvF67ifuKwFWsdaKD
	sZLwRAD09wb/QEpQmy1IxLibpuaaiwscptV3dTDmjId7LfJ/3VmIkPeXScNzY+HrWn01cK
	fvib3Hz1xo27rK1v4rJ08LV6zIQf2rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714550191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbShhzRvkENSkAajAqPQX9B40UecySTKTXDv62B0uN8=;
	b=N/zem7HCRmliPV3qv0CSc5qlI/2iAU1B5jORt8yTJHIm8irdfhv44+syE9KXtJyDECmabu
	yz1x6X+7P93z+0Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F287F13942;
	Wed,  1 May 2024 07:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HnsDOq71MWYyZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 May 2024 07:56:30 +0000
Date: Wed, 01 May 2024 09:56:43 +0200
Message-ID: <87le4ukls4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: alsa-devel@alsa-project.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: aoa: soundbus: i2sbus: pcm: use 'time_left'
 variable with wait_for_completion_timeout()
In-Reply-To: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
References: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 384851F83F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.84 / 50.00];
	BAYES_HAM(-2.83)[99.25%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
Message-ID-Hash: BJI5IJWMEMFEWG53JCSJG4LZUYIVGALX
X-Message-ID-Hash: BJI5IJWMEMFEWG53JCSJG4LZUYIVGALX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJI5IJWMEMFEWG53JCSJG4LZUYIVGALX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 14:10:27 +0200,
Wolfram Sang wrote:
> 
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied now to for-next branch.


Takashi
