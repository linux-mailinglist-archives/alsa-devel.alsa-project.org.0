Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDD2F3B86
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 21:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5C016EC;
	Tue, 12 Jan 2021 21:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5C016EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610483626;
	bh=GY2dA0tnQaLR9kEC3NT4xt1yRQpDneTbZbrAIKrMDus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssZnpDvFHK3VsWgO+LP9f37p+ew3VL+ag69y54BlOXKXOZDfeDk+YyfHXZGU8XuTg
	 hpIljEJYNP9MuIzh1fITpPTXtwL2DTBJzSbJjDCTlyA93W/gGIBqWZjx1Hlee+MgRK
	 vCsjoXacIfKNgM7QGk+NmAlyJ2RhlVlCqZ4zUf48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55417F8025E;
	Tue, 12 Jan 2021 21:32:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C6ECF8025E; Tue, 12 Jan 2021 21:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32803F80113;
 Tue, 12 Jan 2021 21:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32803F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NECVjxVo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6EB923121;
 Tue, 12 Jan 2021 20:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610483517;
 bh=GY2dA0tnQaLR9kEC3NT4xt1yRQpDneTbZbrAIKrMDus=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NECVjxVoRln3d4p1r5Ulst7EhYowHP8qioQf/sAQDaOxnilA1DmINtX3aRy0F6gG1
 Irc41z9hx6ObGoAEx03mWjl7VrIDzHgMJ6dgZsRQLqPbutbM9LH1er+Wmb4YQ+Jaqy
 yasUDIprrPZebVSs8YRhihGkJCasksBWNrqM0HR0lk353Ux40ffjjqYJHaEEuPgVrQ
 kXYFG6rxaEKJsf7DusfkIZ3wuK9fFo20Jo/QqcUuAWVj99SxoJpLLlv1EwiUQpabni
 yXxwmaVTPFGobikiujLpi7njtrQkUEztji41fImb5SAGLnkDpn+uSD0I6rYf/pM7yY
 vmReBAbI6nmOQ==
Received: by mail-oi1-f182.google.com with SMTP id 9so3760007oiq.3;
 Tue, 12 Jan 2021 12:31:56 -0800 (PST)
X-Gm-Message-State: AOAM533z4+LbZImWw9vHOY1xMxbmd6F2YMJ2Sav+xZn2QW+qyht9iyX4
 t8gFNDKbYsYKrL9Q4TTIcTkDr1QG79JZ3iKuVB4=
X-Google-Smtp-Source: ABdhPJzUs07y/E2oEl4yvSU0ct0rH7Wcp5EwXovXPevceHZU7X0QfVzhdASEM7Yl9Iad9GELmZOfgrhXc42/sMTWcZU=
X-Received: by 2002:aca:44d:: with SMTP id 74mr629231oie.4.1610483516212; Tue,
 12 Jan 2021 12:31:56 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
 <20210105190808.613050-1-arnd@kernel.org>
 <59a36212-2412-2dd3-62f2-69c6f65312b1@linux.intel.com>
 <s5hv9c2qmy4.wl-tiwai@suse.de>
 <ed4b4b5b-0cde-3d08-bbbf-3f0d90ce46ea@linux.intel.com>
In-Reply-To: <ed4b4b5b-0cde-3d08-bbbf-3f0d90ce46ea@linux.intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 12 Jan 2021 21:31:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3eOt_5cYsJQuTtFJqLpX0ZS_GGk=x-pJk4Lg=mdVX-_g@mail.gmail.com>
Message-ID: <CAK8P3a3eOt_5cYsJQuTtFJqLpX0ZS_GGk=x-pJk4Lg=mdVX-_g@mail.gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH] ASoC: SOF: Intel: avoid reverse
 module dependency
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 12, 2021 at 9:17 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >> Since this is going to be a really invasive change, and past
> >> experience shows that mucking with Kconfigs will invariably raise a
> >> number of broken corner cases, if there is support from
> >> Mark/Takashi/Jaroslav on this idea, we should first test it in the SOF
> >> tree so that we get a good test coverage and don't break too many eggs
> >> in Mark's tree. We would also need to concurrently change our CI
> >> scripts which are dependent on module names.
> >
> > I'm in favor of the way Arnd proposed.  It's more straightforward and
> > less code.
>
> Thanks Takashi for the feedback.
>
> Since yesterday I looked at another problem where we can have unmet
> dependencies between SoundWire (m) and SOF (y), so we probably need to
> rethink all this. We had similar issue with SOF and HDaudio before, it's
> time to revisit all this.

I think I ran into the same thing yesterday, and came up with a patch for
that one as well. I think it should be independent of the other one but I did
not try it by itself.

I'll send it along with a fixed version of the one in this thread, together the
have now survived a few hundred randconfig builds.

       Arnd
