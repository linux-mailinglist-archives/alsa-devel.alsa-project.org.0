Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAE6FF6C4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58435F08;
	Thu, 11 May 2023 18:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58435F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683821232;
	bh=HR/MmjA8ADp4MHdDb7JNcg7dDl4DOulN9Ab6Z4XVqt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V/ghs/Sdph54gcoI05qtPHJr+4QznuO+b3qqosZLfTmvNqPQzlsCkomTF6gVih3qO
	 n9ANidiTwNCisE7P+CFqmLtiVxU9OOR/CnQKT05KN91PK8WQ1f+5fDHykpMVsLuBnj
	 ziOpng37PMtLes5ri6LCUGuYSFGEgkWsVek74LUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1064F8052E; Thu, 11 May 2023 18:06:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 395EFF8032D;
	Thu, 11 May 2023 18:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4FE7F8052E; Thu, 11 May 2023 18:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA0BF8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA0BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tz+kh13Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xxGYa1rd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 10DDC1FF6A;
	Thu, 11 May 2023 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683821175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJckLey2rE6VlDnueYStqSpphJd9RqYm1BabcoHNEPc=;
	b=tz+kh13QsgrUgtRdwIXVmBM2aZDqM1so8lhj6k/FKawaBu6NzApPenr6iOgUBGjEHfJbLX
	q9dN7dMII0mlA9mEbgaQBBJ6AoyQEjBD4+Xa1Yg29dSmMNmGVkQvALK7x6kvvGGNV1p9t6
	X36jMQmEH07j/tl+KiqNIDkltR5bLjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683821175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJckLey2rE6VlDnueYStqSpphJd9RqYm1BabcoHNEPc=;
	b=xxGYa1rdGqsnllvCimWrm9cOb28bsSBtdGBmbhdkcZWyqsaoOwtO7i1kjYpV0KRO/I0LfV
	SQITYvX00jKC1pCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB58A134B2;
	Thu, 11 May 2023 16:06:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JvSHLHYSXWRIBAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 11 May 2023 16:06:14 +0000
Date: Thu, 11 May 2023 18:06:14 +0200
Message-ID: <87ednm4zux.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: nemesis@icequake.net
Cc: alsa-devel@alsa-project.org,    Jaroslav Kysela <perex@perex.cz>,   
 Stefan Binding <sbinding@opensource.cirrus.com>,    Meng Tang
 <tangmeng@uniontech.com>,    Andy Chi <andy.chi@canonical.com>,
 "Luke D. Jones" <luke@ljones.dev>,    Philipp Jungkamp
 <p.jungkamp@gmx.net>, Kacper =?ISO-8859-2?Q?Michaj=B3ow?=
 <kasper93@gmail.com>,    Yuchi Yang <yangyuchi66@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] snd-hda-intel: Apply HP B&O top speaker profile to
 Pavilion 15
In-Reply-To: <ZFvD/HwNPd6xuCMo@icequake.net>
References: <ZFvD/HwNPd6xuCMo@icequake.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: S73BRZMHXUF4YWYP5UIABOU5XTF75XPR
X-Message-ID-Hash: S73BRZMHXUF4YWYP5UIABOU5XTF75XPR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S73BRZMHXUF4YWYP5UIABOU5XTF75XPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 May 2023 18:19:08 +0200,
Ryan C. Underwood wrote:
> 
> 
> The Pavilion 15 line has B&O top speakers similar to the x360 and
> applying the same profile produces good sound.  Without this, the sound
> would be tinny and underpowered without either applying
> model=alc295-hp-x360 or booting another OS first.

The code change looks OK, but could you give your Signed-off-by tag?
It's a legal requirement and mandatory for merging to the upstream.

Also, you can reduce the recipients in Cc a bit more.
For this kind of trivial change, just maintainers and ML should
suffice.


thanks,

Takashi
