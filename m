Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D182E700495
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 12:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC11C14E;
	Fri, 12 May 2023 12:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC11C14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683885653;
	bh=JbNUPB4oSNCKDmk7Abo2VzGqSrdqOLl6WBvUfg4Ly88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YoGnTrdFYXYtYkdA6p6Q9/VAXTr6psMSWuKoUTFQMrcy9E6w5PGD+rqsvNLF4VWuZ
	 6b6e5W269+6QnJTd/Vwaz+ZdlP51w5MulHGG++LaRKu+Fko69cqM0oAbbFLO2UspA1
	 8Tja2UmVLii3RzFkh8m1wF4fBBHers7pNZQmZgN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E95F802E8; Fri, 12 May 2023 12:00:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6B3F8032D;
	Fri, 12 May 2023 12:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A37F8052E; Fri, 12 May 2023 11:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4004EF802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 11:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4004EF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KbGnVdYH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4bC2roOA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79084204A2;
	Fri, 12 May 2023 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683885589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z18hPfpjhOQ3bNlWRKK16HNv7/8D2OGUe1pMRkeDNBs=;
	b=KbGnVdYHVQsJDuoTXd/T2R/kaWqEq0lzZN1BNn89ta7P75cnr1dOsa6aQI+fv75J8AmoON
	ZHGHEB3JpqBBz6wUM5mywbaLgNHaNRLagLuVdbcbSNnwQYcVAfY67ttF+yKUPRGigI5c56
	yOZ8z8PmwSE+LT+esRsZTSeJOaBnEAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683885589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z18hPfpjhOQ3bNlWRKK16HNv7/8D2OGUe1pMRkeDNBs=;
	b=4bC2roOAv6i3cnLh3WTBX6fhr5BNH2Wv8hcC/h2c1a+oZFqRkR57YNB3Fn1QMZpcblDlmA
	NlNN5OVeGSj8e+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5740C13466;
	Fri, 12 May 2023 09:59:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wpAkFBUOXmQcUwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 12 May 2023 09:59:49 +0000
Date: Fri, 12 May 2023 11:59:48 +0200
Message-ID: <87o7mpamzv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 07/14] ALSA: emu10k1: properly assert DSP init constraints
In-Reply-To: <ZF4GAwocaGBJRidc@ugly>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
	<20230510173917.3073107-8-oswald.buddenhagen@gmx.de>
	<87a5yaaum2.wl-tiwai@suse.de>
	<ZF4GAwocaGBJRidc@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WYQRCR6ICCDXQ2XXKI25X3YKQXVPQ7B2
X-Message-ID-Hash: WYQRCR6ICCDXQ2XXKI25X3YKQXVPQ7B2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYQRCR6ICCDXQ2XXKI25X3YKQXVPQ7B2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 11:25:23 +0200,
Oswald Buddenhagen wrote:
> 
> On Fri, May 12, 2023 at 09:15:17AM +0200, Takashi Iwai wrote:
> > On Wed, 10 May 2023 19:39:10 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> If these are hit, we've already trashed kernel memory by writing past
> >> the end of the allocated buffer. There is no recovery from that.
> >> 
> > Again, this is NAK.
> 
> > First of all, if we really do care the overflow
> > seriously, we should check at each increment instead of after
> > breakage.  It shouldn't be too difficult at all.
> > 
> not difficult, but pointless bloat.
> 
> > Second, using BUG_ON() like this case is an overkill.  It was clearly
> > stated by Linus in the past a few times (although I can't find the
> > source right now).
> > 
> you seem to have an irrational aversion against assertions, maybe
> because linus likes to scream at people.

Not because he's screaming but, it's because his opinion is correct
regarding this.

> relevant comments from linus were easy enough to find:
> https://yarchive.net/comp/linux/BUG.html
> https://lore.kernel.org/all/CA+55aFwyNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-3UNT=0Og@mail.gmail.com/T/#u
> 
> and there is also the documentation on BUG() itself.
>
> i don't see anything in either of these that would imply that my use
> of BUG_ON() is inappropriate. it catches a serious programming error,
> is easy to prove correct (the scope is a single function), and the
> only immediate effect is that it will crash the insmod process (though
> i would expect possible followup effects due to the kernel memory
> corruption, which is exactly why the assert is there). i have a hard
> time thinking of a *more* appropriate use for BUG().

I can't agree here at all.  Sorry, but this is still NAK.

The reason why BUG_ON() is bad is that it cannot allow debugging
easily.  It crashes and locks up, and you may not see what's going
on.

Do you want to catch and fix the bug?  Then put the check at more
proper pint that prevents the real corruption.  the check is
basically already too late -- it means that you might have already
broken someone else's system.  If the size matters, it can be a
conditional build with CONFIG_SND_DEBUG, for example.
But simply replacing and putting BUG_ON() makes little sense.

Of course, it's just my opinion, but I won't change my mind about it.
So I'm not going to discuss about this further and waste time.


thanks,

Takashi
