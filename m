Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70F7754D1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 10:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA783D8;
	Wed,  9 Aug 2023 10:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA783D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691568701;
	bh=L73nNgj/T+XfBxjJR2+UtPKk/RZWj+sAi2RffEldOdU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NgETuheSDg17ujNT2iGrccWM+gC4QQBZQVpTOyWxIY/fMsmaIUuMeiM1/ElGtFqoF
	 64iLDsvqVsSOEnXmrZtZ+YjOQGwxK44eLfazXRQqxWjSwoNhpIaaNFeV81E841EUE0
	 bZsAwWt4suPege4XfoCSpkMJ9jPDTMwhMRah6/bk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43D22F80551; Wed,  9 Aug 2023 10:10:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5049F80116;
	Wed,  9 Aug 2023 10:10:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F410F80134; Wed,  9 Aug 2023 10:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93BB6F800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 10:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BB6F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P5vKO8M5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9Bb0mVhe
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EA442185F;
	Wed,  9 Aug 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691568605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wdxaznce1jyaxQqfPamw2XeK49djehdCU66Ngz9d40c=;
	b=P5vKO8M5zScOIg5HVYarz80fMCfeG+3A3Xj8ykxbkmaiDUeLrmrMkf2st8NAq3Gh/fhfQ0
	okz0KDFpNMx4MuP45hZy1qu+UXG/URc/PtJ437xNiKYIwYRR7vr7aPZCg0Jd17a/kgYm77
	HmkXQ/brcqfXz2Uu0jTbph9e+SAs1ks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691568605;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wdxaznce1jyaxQqfPamw2XeK49djehdCU66Ngz9d40c=;
	b=9Bb0mVhecSTZn6WA+x3gmUcYvHUdte51LnZbjYgpdkZQLWROFWa0qU5fO3MI+o+30Sc15v
	/GGv/qVHTGljr7Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69F9A13251;
	Wed,  9 Aug 2023 08:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zPfBGN1J02SzaAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 09 Aug 2023 08:10:05 +0000
Date: Wed, 09 Aug 2023 10:10:04 +0200
Message-ID: <87o7jgfxgj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: alsa-devel@alsa-project.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
In-Reply-To: 
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
References: <20230807135207.17708-1-tiwai@suse.de>
	<CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
	<CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZNWXADHFBZXWHVRZAXONWEU2CPLYQE4
X-Message-ID-Hash: KZNWXADHFBZXWHVRZAXONWEU2CPLYQE4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZNWXADHFBZXWHVRZAXONWEU2CPLYQE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 21:26:55 +0200,
Curtis Malainey wrote:
> 
> On Mon, Aug 7, 2023 at 3:34 PM Curtis Malainey <cujomalainey@google.com> wrote:
> >
> > > It's just a RFC and only lightly tested.
> >
> > Thanks for the series
> >
> > I will be hammering this in my test setup for next several hours
> 
> Testing has yielded 0 bugs overnight.
> 
> After discussion it seems like this might be more of a workaround for
> the APIs than properly using them. Adding Stephen for more input but
> having two kobj in the same allocation is technically not correct as
> you essentially refcounting the same thing twice. Also having an empty
> release function essentially nullifies the purpose of the refcounts.
> We should probably consider something that uses the API as intended
> rather than trying to fight their function.

Moving each PCM device and control device to own object and properly
release in the own device release could be another way to go.

OTOH, I'm still wondering whether how to assure synchronization if all
device releases are done asynchronously.  If there are some
dependencies between the resources (e.g. taking the parent's lock) at
release, and how can it be guaranteed to work?  Or, the release calls
must not touch anything outside its own?  If so, we'll still need to
two places to finish the stuff: quiesce and release.


thanks,

Takashi
