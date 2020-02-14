Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5515F60B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 19:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8291679;
	Fri, 14 Feb 2020 19:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8291679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581706026;
	bh=WjCz1KugVUMCrmz82ITagvOChUDYzUbfymnOFIfBobI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctVkLaLI9P17HDM5NjID+TBNXURixaujbbgSkD9T6QG5U6KSUQJkTcNjB5v990Ap/
	 GhHvnmz4uRWPVyGVedotraKnYjEtPrGabYrO4rax/6W1AdTQkgYvx6E8+R7cJDQvdO
	 B3vNs4Z0HvQ6QGYhltSoedHq2X4OTpJtKMTB9kqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C15F6F80157;
	Fri, 14 Feb 2020 19:45:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A718BF8014F; Fri, 14 Feb 2020 19:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE7AFF80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 19:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE7AFF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KqpYxaTL"
Received: by mail-qk1-x743.google.com with SMTP id v2so10206620qkj.2
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 10:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of8Awt9rEqyy32r52fmiKSVswu4h8kjSfTeTq0F8J4E=;
 b=KqpYxaTLsAdtqFx55QtzvTbe4EEZjE0rIX2YU2htiloGVOq4C6XT9VE4mil2to2AQm
 wZKQIWsfzfIr8pu3GH00kxGao+y9Y0kUOY8LKoC1dtn9w1/WCs6DX17omnV2qmo/mgb9
 pH5zyyd9CqWQgDOJdwBcoAQJjMPv7oGrkRmRbqKiEcKfa/tia4/fielGQFo5mlNdd3zs
 MslMHHjwr38O6dlYSntivcQX8Z/9Vt2U2LqX/sw79Svgm3C9Hxo0FiVb2rkCXuz8WxQA
 SAdC0p73QmYMwDTEN8N058kiiGFs/wTJST8o2j/HefuS+Z5k8L7oHhUqMpzejah4403D
 Szlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of8Awt9rEqyy32r52fmiKSVswu4h8kjSfTeTq0F8J4E=;
 b=tjnxnhRvnVZi9ECGig8z8kWD9qw0a6Y6v9+LAkPXADPYPGs/ynUjriWMpPlcusvEVd
 7TW4PyimyuNh/9A7HlLnI8fRwuy3Idvc4dRPZjSgWERMZWa5QPGaadWIf5sqCDNMdntC
 wqEQJ8ehddyxD/CVWrboKLCvZ9CVaMC7xx7aT0Uqz09j2LIalAwd4z1gT/FIXRaGVndB
 7+KfwMeoV//1V2T51fIdO73A1h33BlqRK2jVzbq1g0/u8M4ycmM/WUQ7LY/zfGnqSrBO
 3d+RnlkYnRdfgoCr1KGPsBPlnfjNnrw5gJ4f85XGFl+lqQrmJPSx+D3c6v3vYcoCG4mF
 QmCw==
X-Gm-Message-State: APjAAAWCSfDGAYxIBuoVLV2TrLlMpoUwhIe1XYjsJCZSOqc+Ut26KTJj
 EasBvfVGe4g33BiQrhChh5jPtxSeWXDma2c/hveIOQ==
X-Google-Smtp-Source: APXvYqxGmPNWxuQXZFZCy72dkVbRKbbt7Y9RLlLF9LjdVlwHZ3zO/WBtLuxQ+6RxDjDZioBVsDs1UafTOvbvlu1Ewq8=
X-Received: by 2002:a37:a78d:: with SMTP id q135mr3757202qke.158.1581705917366; 
 Fri, 14 Feb 2020 10:45:17 -0800 (PST)
MIME-Version: 1.0
References: <CAOReqxhbvG03QvqkbjnGB8w5cM4WOK4qeZ+bh0apNna7i3ZimA@mail.gmail.com>
 <23daf96d-f854-f01f-bc4e-2afc47299c0a@perex.cz>
In-Reply-To: <23daf96d-f854-f01f-bc4e-2afc47299c0a@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 14 Feb 2020 10:45:06 -0800
Message-ID: <CAOReqxgK3BPnm3ds0fvMjc4q0mUnDgK5E1X2tV2nXz3uYwymLA@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] alsa-ucm-conf via portage on arm
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Not yet, that was going to be my follow up. I just wanted to make sure
there is not ALSA restriction first. I assumed there wasn't but
figured better safe than sorry. I will follow up with Lars.

On Fri, Feb 14, 2020 at 10:39 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 14. 02. 20 v 19:23 Curtis Malainey napsal(a):
> > Hello Takashi and Jaroslav,
> >
> > There appears to be a upstream package issue for alsa-ucm-conf in that
> > portage seems to have it restricted to x86 and amd64 platforms. Given
> > the nature of the ucms I figure this is an error and was hoping you
> > know who to speak to in order to resolve this. If this isn't an error
> > what can I do to help get the repo to state in which it is supported
> > on arm/arm64?
> >
> > See https://gitweb.gentoo.org/repo/gentoo.git/commit/media-libs/alsa-ucm-conf/alsa-ucm-conf-1.2.1.2.ebuild?id=dd3e0570e2465639431709bce0410b787d312bbe
> >
> > Curtis
>
> It's Gentoo specific and you see signed-off-by in this commit.
>
> Did you contact this person (Lars Wendler) from Gentoo?
>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
