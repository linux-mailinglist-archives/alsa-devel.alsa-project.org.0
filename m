Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E395120
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 00:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130D01615;
	Tue, 20 Aug 2019 00:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130D01615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566254937;
	bh=kLvXMxtGruiNEbXGzb6IS7m+4wxyMmjRIgj/Vq8Ej9A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnWP2justxFiVOMx/64dJkAVi2mZ0hGOqlAyBa0z7Hbf3tl9+8B82wHTwMcrDWrhL
	 Q3qR+AH5fuPOcGlWQl51cF77DEqH/VJUbsHVHXP4L+JqbKw1QFyOu3Bb3hTUlQimr2
	 bXqkPVuZZvEPQ7GnqOeTpM6W/4xSA8hR8tWc4LE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F564F802E0;
	Tue, 20 Aug 2019 00:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F206F800BF; Tue, 20 Aug 2019 00:47:11 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 809ECF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 00:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809ECF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="G/ShXRjt"
Received: by mail-lj1-x243.google.com with SMTP id x4so3264165ljj.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ocvBhbcNO8A6GkURy+GeujcgK5Y3BTIxAiCcITX3UKQ=;
 b=G/ShXRjtuUImD/yRwLBNDsO2Pj/LKc5k4gXMkmfhrgjA7PrLcD/Uu+/Va5SVFFKZ4a
 vAY7rlT15i5Y77N7xVXhjpD0YbpnVl0i7bgx0VZOzKQ3GMexWqCVz0G7EG59kNRMtkIX
 FRQ8rXOaep11zHHJkLo+ZRfMnVSC7MjNUOLug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ocvBhbcNO8A6GkURy+GeujcgK5Y3BTIxAiCcITX3UKQ=;
 b=CutYzkSA0KSwGC3JWmRxNbXzecn+6eFQb0d2fJtAxfNy9uUm+QWNLncquMCr7QZ+tU
 oFoMK4m0wFmAgU9kQ+UfhFaygC4dEyivMUfN6PRyI3Z7Mv6fHt/5DAE+43krZyNLOyjw
 9WlNlTwymIifYUCqzOqi8Nwb1JomKfflFJvJH+TojneG2RrXIiw7OYcaNOnWlFWfUU67
 JFb9xOZwUIAb6o/zkfH6kff4thdheUuDNl//Kcvb8y4bm7Z9fXKp73bYqKGKUz7LxZcz
 B6RpPbpv+yesX+3B/XoNiuTUvpySmtIXTv2zydK9St1kSkAX4GUR0tSthFZvrpoco4DJ
 16fQ==
X-Gm-Message-State: APjAAAWs0BR/YuBeT1zitdhgtwqPAlYo/g60RKObDSmWKhVLqNX98gaf
 zOFZM/IlZ/MIggpEoMl5JLoA8phlsh0=
X-Google-Smtp-Source: APXvYqxL0+qm/ol80SFuvd1A3LImVvvVhyk559ckq8DupmaFcuSfMpBlie+fdkb4vdCZrVvXu5k7rg==
X-Received: by 2002:a2e:a16d:: with SMTP id u13mr13996714ljl.55.1566254227422; 
 Mon, 19 Aug 2019 15:37:07 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id j30sm2553907lfk.48.2019.08.19.15.37.06
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 15:37:06 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id x4so3264104ljj.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 15:37:06 -0700 (PDT)
X-Received: by 2002:a2e:9d2:: with SMTP id 201mr13475968ljj.229.1566254225937; 
 Mon, 19 Aug 2019 15:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
 <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
In-Reply-To: <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
From: Jon Flatley <jflat@chromium.org>
Date: Mon, 19 Aug 2019 15:36:54 -0700
X-Gmail-Original-Message-ID: <CACJJ=pwsV2U669QqB0E05XxWppfXR81TrDCkEunfSefJ5Mij7w@mail.gmail.com>
Message-ID: <CACJJ=pwsV2U669QqB0E05XxWppfXR81TrDCkEunfSefJ5Mij7w@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "benzh@chromium.org" <benzh@chromium.org>, Jon Flatley <jflat@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

On Mon, Aug 19, 2019 at 11:08 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2019-08-19 04:33, Jie, Yang wrote:
> >
> >> -----Original Message-----
> >> From: Jon Flatley [mailto:jflat@chromium.org]
> >> Sent: Thursday, August 15, 2019 5:25 AM
> >> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Cc: Jon Flatley <jflat@chromium.org>; Jie, Yang <yang.jie@intel.com>;
> >> benzh@chromium.org; alsa-devel@alsa-project.org; Ranjani Sridharan
> >> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org; Jie Yang
> >> <yang.jie@linux.intel.com>
> >> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
> >>
> >> On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart <pierre-
> >> louis.bossart@linux.intel.com> wrote:
> >>>
> >>>
> >>>> There seems to be an issue when suspending the ALC5650. I think the
> >>>> nondeterministic behavior I was seeing just had to do with whether
> >>>> or not the DSP had yet suspended.
> >>>>
> >>>> I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW
> >>>> D3 potential crash issue") and things started working, including
> >>>> suspend/resume of the DSP. Any ideas for why this may be? I would
> >>>> like to resolve this so I can finish upstreaming the bdw-rt5650
> >>>> machine driver.
> >>>
> >>> Copying Keyon in case he remembers the context.
> >>>
> >>> Reverting a 5yr-old commit with all sorts of clock/power-related fixes
> >>> looks brave, and it's not clear why this would work with the rt5677
> >>> and not with 5650.
> >>
> >> No idea, I was just diffing the register writes looking for sources of discrepancy.
> >> The Chromium OS 3.14 kernel tree that Buddy uses doesn't have this patch, so
> >> I figured what's the worst that could happen?
> >
> > Hi Jon, sorry about just noticing this thread.
> >  From the dmesg log, the issue happens at runtime suspend/resume but not in boot, am I right(you can disable runtime PM for the device to confirm that)?

From what I can tell that is correct. Disabling runtime PM seems to
stabilize things. I tested this over 10 reboots. I'll kick off my
stress test script overnight just to see if this is 100% consistent.

> >
> > My points here are:
> > 1. the commit 0d2135ecadb0 was suggested by FW team to W/A D3 potential crash issue.
> > 2. it was verified with rt286(Broadwell.c, e.g. Dell XPS) from our side only(and may have been checked with rt5677 by Chrome team).
> > 3. please follow sequence in broadwell.c if issue happen at boot time.
> > If happened at runtime PM from DSP side, we should see it with all kinds of machine driver.

I'm not really a sound guy; I've been picking this up as I go along.
From what I've gathered it doesn't make sense to me why this is an
issue on buddy, but not other bdw platforms, such as samus. If I
understand correctly they both have the same DSP and use the same
runtime suspend/resume code. What makes this fail with the 5650 and
not the 5677 is the million dollar question.

> > Could you performing more test and debugging to see what it real happen there?

Yes, I'll continue poking at this. The debugging that got me this far
basically just involved placing traces on the sst_shim32_write/read
functions and looking at the diff from my best working reference,
which is our cros-kernel-3.14 branch. This is what lead me to
reverting 0d2135ecadb0, as it produced effectively identical traces as
I was seeing in 3.14.

> > 4. we have no reason to remove the commit directly, except correcting if some lines are proved wrong. And, as Pierre mentioned, SOF driver is preferred, as there is no new development effort to support SST haswell/Broadwell driver here(no platform, no developer, :-( ).

I'm not suggesting removing the commit, merely observing that
reverting it seems to fix the problem.

> >
> > Thanks,
> > ~Keyon>
>
> Got to disagree with the last one - no platform, no developer.
> We are setting up some BDW/ HSW here to join our happy SKL+ family in
> CI. This is because of /common cleanups which will engulf aDSP project
> (hsw/byt) obviously.
>
> These will be tested against the exact same BAT scope as other ADSP
> devices. Code here looks much better, at least compared to /skylake -
> ain't a high threshold though.. Given how outdated all SKL+ fw binaries
> are (on upstream repo) it might even come down simply to fw upgrade.
> Most of FW peps who took part in that project are already out. Although,
> found one or two who are willing to help : )
>
> And yes, I'm setting them up with rt286 too. There are some rt56XX but
> I'm unsure if rt5650 is amount them.
> Still got some problems with ACPI, but soon two new faces should be
> greeting audio CI bonfire..
>
> Czarek
>

I can continue to work at this to see if I can make any more headway.
Unfortunately without a solid intuitive understanding of the system,
or insight into the DSP, I'm limited to looking at traces and git
history for the most part.

Curtis: Do you think it makes sense to poke at samus and see if there
are any differences in the suspend/resume process, or are they pretty
much guaranteed to be identical?

Thanks for all your help on this.

- Jon

> >>>
> >>> Are you using the latest upstream firmware btw? Or the one which
> >>> shipped with the initial device (which could be an issue if the protocol
> >> changed).
> >>
> >> The firmware I'm loading is: `FW info: type 01, - version: 00.00, build 77,
> >> source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
> >> Hashes the same as the upstream binary.
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
