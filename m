Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27033D95
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 05:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D6384D;
	Tue,  4 Jun 2019 05:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D6384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559619553;
	bh=t/2aGQU22uhNpFiHEH5qRxDur4mNEewD702ReDXXobc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMyBnizQVJCMd/VwP7yus057raA7mYyUe/hff3yOheizP1Dk3tS9Ad8EIDAvQDGTZ
	 ZhtnY1bld9lRAKeznr5DT3DP4P8/HDa23qzpILgkV3W9XA+UpZ/dZ+H/WEmc7Zg8gf
	 VJ+8yZHrB7jK6cxYEKBF8ff3ul3q/uICWkI0Cwlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A56F896F7;
	Tue,  4 Jun 2019 05:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B40BCF896F7; Tue,  4 Jun 2019 05:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A13F896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 05:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A13F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eEzxZ+ci"
Received: by mail-oi1-x242.google.com with SMTP id b21so10571104oic.8
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 20:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/B0Fo/CQclHMkpSGbbQNFwxoM4w8GhS11bPznj3s5WY=;
 b=eEzxZ+ci/DrZSmjaz+ekmTz0kYTviVN3f6n891MbF2VpToDsXr5D7cBg2WmnMoPv9c
 rtKjEKmTjuodMMXlUJVbKZc+Xr1fyP0svHzxPFaM1xBRWrWFNSw/MiiPoIQffCc46o7s
 q/Rtmi0VMahX+cr/2R+336Y2W/5uS5UEcRIYQ54kt79qbsA9s90eg+FZhXXvOkatPSJI
 /rWKtbGWNfEdQkGlG0Ztkf0/teweinoMwWPzlGE6DnUAVwJzPZ8o1xeZimWVHfgnYvda
 BBISYZk3URTziXos023bU29KbTbO2cXqZOo4cFZbvxiEJhZmWMrQvuqlIMS1SkrRfN/9
 lNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/B0Fo/CQclHMkpSGbbQNFwxoM4w8GhS11bPznj3s5WY=;
 b=TBsK035AXn80GUY95mcVB/ssXaKTR86AzLGJXabn9UiGflkAD5K6510mvGY1RvVrl1
 d1wwQPfSoD8hXfSulEYu8HXb25lAazHQRHZWmH6B/+64jnLNR2eeSQ87SflHgg28rUgv
 2fy/ZD5OFmMQKzshypxIDs8j7Qjg/aVSNlRcqzBS4EwUPmrkjvIN7QBop6nKdsi3CkaB
 pkfgQZ4g30OL1X9eNaGdFHlhCILGFcFiIQRScHo7UXL0wAmrroQDem5K6kDrUPbXjGLA
 pNyDDKDKy6tHoPnMqfMk+NWaBxjnFVTHZCo6uFoyPkQB6mDXxsAnYcKjLaBZdkn4T8wa
 78Ng==
X-Gm-Message-State: APjAAAVWcg3aHWbwUH9etOyAL4h5UiS4tZ+NHOsGZb3KpeHvh3VPPzta
 mfu9kyOJFc2lh+h3Kf3rWrNz9ePLmTfxPtFXJEtniA==
X-Google-Smtp-Source: APXvYqyCR0bpmTzvaoqJ+GhRr2ZoHRPYxobfhwKOsRhvYLfZBQjCqS3eqmAM9zAnGnovjDBj5bW4acdjDpF+gB15AlY=
X-Received: by 2002:aca:3b82:: with SMTP id i124mr3108218oia.82.1559619442199; 
 Mon, 03 Jun 2019 20:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190530073229.121032-1-tzungbi@google.com>
 <CA+Px+wXJsar1X=1EdDvMDvPv4DzDG+BmOgSopAqU48Y3Qa=acg@mail.gmail.com>
 <CAOReqxiJGEsEBR7g3sK57d_b3SZJZBCmfrARpCSWBiEm6sNk6w@mail.gmail.com>
In-Reply-To: <CAOReqxiJGEsEBR7g3sK57d_b3SZJZBCmfrARpCSWBiEm6sNk6w@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 4 Jun 2019 11:37:10 +0800
Message-ID: <CA+Px+wXYMyQvcrLkabsXQYdFroBqBSMpz2Jj-w6MxWR1kHot7Q@mail.gmail.com>
To: Curtis Malainey <cujomalainey@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: move DAI pre-links initiation
	to snd_soc_instantiate_card
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

On Tue, Jun 4, 2019 at 1:10 AM Curtis Malainey <cujomalainey@google.com> wrote:
>
> > >  probe_end:
> > > -       if (ret < 0)
> > > +       if (ret < 0 && ret != -EPROBE_DEFER)
> > >                 soc_cleanup_card_resources(card);
> > Should not call soc_cleanup_card_resources() if soc_init_dai_link()
> > returns fail.  Some context has not initialized yet in the case.
> Why not? You need to clean up the platform naming if links fails which
> will causes a use-after-free bug if you don't clean it up.
Some context may have not initialized if soc_init_dai_link() returns
fail.  See v2 https://patchwork.kernel.org/patch/10974149/ if it would
help.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
