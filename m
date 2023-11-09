Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDF7E6C54
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 15:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2581829;
	Thu,  9 Nov 2023 15:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2581829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699539468;
	bh=jg7JzmMEy0cFxyXgWZPtlJ500vC9wrC8bv3u3XSCdV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CH7aT828zZnuHQ+FwqL5qwTWJ0rwf8PWGoIyQVDJeygrYlW/4LRK4588gnyG6tjhE
	 vNAYN5HbSD1HQSKTbWDSH8//IHEONUhf41V7ERgGC7Yekz/varIeaRNBKJWD9aOSDz
	 k4gF5uIaCVi6h3+L+CDgRsqKUCTNfAe9DQBXnpng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0791F80166; Thu,  9 Nov 2023 15:16:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5702BF80169;
	Thu,  9 Nov 2023 15:16:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DBD6F8016D; Thu,  9 Nov 2023 15:16:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BEB4F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 15:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BEB4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O1SKWGbG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/rK29Dys
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6EA2E1F8B3;
	Thu,  9 Nov 2023 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699539402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/jVBnVWK0SM/uXc8av6/ruC2uAa8hAihIHkJrhyXVA=;
	b=O1SKWGbGshAsYq88FqAlrfDEkFsJcQ2uh4o0tBQyqB0uNh6biMLOjk1tjZ/9q+d+JVDGei
	4TP6YD/XgfFuTy+AkF2CKeUrxChc9mobcxDuXyqiwgtVydzpS0ZGqwlOUyGIOnLL2qkgv+
	G2gmze4xrtcwoqa4hydzm6JvgO4GDHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699539402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/jVBnVWK0SM/uXc8av6/ruC2uAa8hAihIHkJrhyXVA=;
	b=/rK29DysvvUFNHgp3MHEqQRebCFqMAHgoGfv2SMgeQh9rPpXdZq4Pg3pn0zySDRZRK4m93
	3nxrMAZivcZVU0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DA04138E5;
	Thu,  9 Nov 2023 14:16:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xAAfCsrpTGX4aAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 09 Nov 2023 14:16:42 +0000
Date: Thu, 09 Nov 2023 15:16:41 +0100
Message-ID: <87o7g3roza.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?EUC-KR?B?sK29xcf8?= <s47.kang@samsung.com>
Cc: <kuninori.morimoto.gx@renesas.com>,
	<alsa-devel@alsa-project.org>,
	<lgirdwood@gmail.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>,
	<cpgs@samsung.com>,
	<pilsun.jang@samsung.com>,
	<seungbin.lee@samsung.com>,
	<donghee.moon@samsung.com>
Subject: Re: [PATCH] ALSA: core: Replace mutex_lock with mutex_trylock
In-Reply-To: <87edh0ctc5.wl-tiwai@suse.de>
References: 
 <CGME20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf@epcas2p2.samsung.com>
	<664457955.21699345385931.JavaMail.epsvc@epcpadp4>
	<87y1f9r705.wl-tiwai@suse.de>
	<1891546521.01699446601660.JavaMail.epsvc@epcpadp3>
	<87edh0ctc5.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UVPYIOPB4P5AXRJD6JEEPO3F63G537W7
X-Message-ID-Hash: UVPYIOPB4P5AXRJD6JEEPO3F63G537W7
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVPYIOPB4P5AXRJD6JEEPO3F63G537W7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Nov 2023 13:39:22 +0100,
Takashi Iwai wrote:
> 
> On Wed, 08 Nov 2023 13:14:15 +0100,
> °­½ÅÇü wrote:
> > 
> > > Thanks for the patch.  But this change may break the current working
> > > behavior; e.g. when two proc reads are running concurrently, one would
> > > be aborted unexpectedly.
> > > 
> > > IIUC, the problem is the call of proc_remove(), and this call itself
> > > can be outside the global mutex.
> > > 
> > > Could you check whether the patch below works instead?  (Note that
> > > it's only compile-tested.)  It makes the proc_remove() called at
> > > first, then clearing the internal entries.  The function was renamed
> > > accordingly for avoiding confusion, too.
> > > 
> > > 
> > > Takashi
> > 
> > You are right. My patch is just for avoiding the deadlock. 
> > It may lead to other problem instead the deadlock(e.g. USB sound card
> > registration failure)
> > Your patch works well without any problems.
> > But I can't confirm that the problem is solved or not.
> > because the issue has occurred only once until now.
> > (Test method: USB insertion / removal during a call)
> 
> Maybe you can reproduce it more easily by adding some delay
> (e.g. ssleep(2)) before mutex_lock() in snd_info_entry_open().

... in our case, it's rather snd_info_text_entry_open().

> Then it's easier to cause a race.

I could actually reproduce the bug with the extra delay, and confirmed
that my patch works around it.
I'm going to submit a proper patch.


Takashi
