Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E78225E3
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 01:19:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC72E12;
	Wed,  3 Jan 2024 01:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC72E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704241158;
	bh=FY89b4AJ2MZiRPSwlr36/UQZwgxvjhJn6VGbhtCiZ10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M4PqI+diPfqfjvIbWG3HAifB0hO1izIfckcnavIJzpZ2YkIem85xX239HdncSsDPH
	 szgPNV9w/GF06Ie9uYEYtXpo8HDBRCvvCewJeZ7eltOgqkoAu/XK/ADdy5AcO+T9xe
	 ndQ9vAFgXDBwXmNyrBoy2GXqfSwwTXZlgic6mi8o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81192F80612; Wed,  3 Jan 2024 01:18:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A2FF8060C;
	Wed,  3 Jan 2024 01:18:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B93F8059F; Wed,  3 Jan 2024 01:17:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B4FAF80022
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 01:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4FAF80022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=merlins.org
	; s=key; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w/zX07yk+Jq1OGq/27+WNumLIhMXOzoQ92krOFylHrA=; b=aKm3suUKzIF2AsCeFtldwpeEfQ
	EygPfJCAM4XGFqWklmD+GlN6XjOQb1hpZR1kBF632i44RxvJU0a5jWsLxFlYpro0xiErosY4/UFf0
	ZOnghmwEyTlUn4FNBJrFApTz9Y3oXOqcaEBDTY8JQySlX4Qpp3UK7VnwWvUdukxlKATsKJ7WVQuoe
	T0lvWNOjQWHNQpURsePWlgw2KLoZ81EynCJH4Gj8tlGXd41AKf7zvFawmddYBlGoPvNckSd7XvMv0
	xx3vQ26VoXq23hcaHt2Nkko5G9GhVpWfzNmKgD/WpvrDh8r9+8CWhgoy1oI0W7j7zy6V5CGpaMPir
	Q6+aqABA==;
Received: from lfbn-idf3-1-20-89.w81-249.abo.wanadoo.fr ([81.249.147.89]:38406
 helo=merlin.svh.merlins.org)
	by mail1.merlins.org with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
	id 1rKj6w-0004Kj-PJ by authid <merlins.org> with srv_auth_plain;
 Tue, 02 Jan 2024 10:03:30 -0800
Received: from merlin by merlin.svh.merlins.org with local (Exim 4.96)
	(envelope-from <marc@merlins.org>)
	id 1rKj6v-0004Q9-2A;
	Tue, 02 Jan 2024 10:03:29 -0800
Date: Tue, 2 Jan 2024 10:03:29 -0800
From: Marc MERLIN <marc@merlins.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones => missing alsa-ucm-conf
Message-ID: <ZZRP8RqT83cE-S5m@merlins.org>
References: <20231223234430.GA11359@merlins.org>
 <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 81.249.147.89
X-SA-Exim-Mail-From: marc@merlins.org
Message-ID-Hash: EMEAWJIEFI46WNDG5X2EU5SUNGZUNQR5
X-Message-ID-Hash: EMEAWJIEFI46WNDG5X2EU5SUNGZUNQR5
X-MailFrom: marc@merlins.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMEAWJIEFI46WNDG5X2EU5SUNGZUNQR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 02, 2024 at 02:23:49AM -0800, Marc MERLIN wrote:
> > Please file a bug at 
> > https://github.com/thesofproject/linux/issues
>  
> THanks, done: https://github.com/thesofproject/linux/issues/4758

First, a big thanks for the quick reply and help.
For the benefit of archives and the next potential person looking for
this, my debian system was lacking 
alsa-ucm-conf
which for this soundcare is not optional at all. 

Long gone are the days of simple soundcards that just worked (never mind
self made DAC with resistors in the parrallel port :) ), nowadays sound
cards need a lot of things for anything to work. I had read about some
puzzling defaults of having an amp for speakers, controlled in software,
and off by default :-/  but didn't know that mine was so new/complex
that it would not show up in alsamixer where you would normally unmute
an output and be in your way. Now I've read about alsaucm and maybe
there was a magic combination that would have worked with alsamixer
but too many variables to try, hence aslaucm. 

I spent probably over 10 hours on this building kernels, and comparing
debian to ubuntu, and doing a ridiculous amount of diffs between the
setups, I was unable to see anything about the output being muted, but I
Guess it wasn't being muted, the amp needing to be turned on is yet
another thing and it didn't how up where I looked.

So, a few thoughts:
1) for sure, debian package alsa-ucm-conf should be required, not
recommended. It's not big, people who can't keep track of everything
that changes all the time, have no idea that they need it, and really
need it installed by default if their hardware requires it.
I've filed a couple of bugs with them, including on the package
description that gives little clue that the package can be so essential

Description-en: ALSA Use Case Manager configuration files
 This package contains ALSA Use Case Manager configuration of audio
 input/output names and routing for specific audio hardware. They can be
 used with the alsaucm tool.

2) I spent many hours reading the internet on all issues with sound and
muting and why sound could work on headphones and not speakers, and
nothing gave me a hint that worked, or even mentioned alsaucm.
When I have some time, I'll write a page that I'll try to get
indexed so that the next person dealing with this has a better chance
to find the answer

3) I failed to find the linux-sound list, that's on me, and my mail to
alsa-devel was bouncing for unknown reasons.

A huge huge thanks to you, Kai, for finding this Email and your help.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
