Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F5AE42C9
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 07:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E28D1749;
	Fri, 25 Oct 2019 07:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E28D1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571980270;
	bh=8MX9l3LB4PDqdyC1bMSZiaUVdoIoNoaLV7h8XyhR7gw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RvYRCDvgZWFfL8Tp7RbUMYEmNFNNiAGTygd14qR5DTk6UsGgUYqiGutkVUQ+lhiFD
	 ke3U8EGHcfVr7Gtfha/MXEPYIMc1aXyP6W1PgHFuMXhXdU5NfGsxJxQvdMT/UYfJUp
	 9DVtobHOsnwiSBEMlZxW138OeULbf4li5AyzCJ6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E17F8036F;
	Fri, 25 Oct 2019 07:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72D83F8036F; Fri, 25 Oct 2019 07:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30A27F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 07:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A27F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="svtDkxvM"
Received: by mail-oi1-x243.google.com with SMTP id i185so649863oif.9
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 22:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwRH7eiPf3zurLT0sf+esJ6vDt0ZLnFOkVDb5pG5aZU=;
 b=svtDkxvMCKGMW8taauKqXMMtu7iq3PGG4kb9tubsh0TmHZ+L4nzTSDLE0usfIIE+Hj
 O9Z47rHPnOGpGw1tdbjSqe0Lun1SgXpawIjCgYV1m5x6ARw6nBybntDxQu8HdV6YoyxY
 PUcPfxxGQvCPAkgH/CTNSFxy0yCmYUBwXvHs0/32mmoVKut5DyeBGfagHoMpWMO2njGw
 XRFNko6mGVv2vjH2WZQmGzM5jti2R3yMk6yzHxKPl7Uoq4OGCnT1VYkxRK5PwNN+hmBJ
 Pr4oREcDsrOXzQYThd5aLO370i1Klvva3eTQD10QL5ue2VUtMCsFcCH6ToFtGG8vuQHU
 ctzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwRH7eiPf3zurLT0sf+esJ6vDt0ZLnFOkVDb5pG5aZU=;
 b=Km+YpOX+N57nlf2LUiemllhWzloK7UwEcOq6DFrpu6tI5t+vBPh2fTuOW/G7EVBEom
 Z0EwGonFBRtdtXUQZnQg9wQS+XyHrEhULdifSjTHHjhx4V6JwWrtfMcige56KO62Tx2s
 /jtoTRCOFQyi7S//GB5+wrUK9pV+P+gORJ1CTpI4zlINRoYv56Hnzx3qUtYXVlGHi+mD
 0cJdHWw9TSE159rCmikQrrlDRYPJz+4llCQW/7nDCOU7/l62E/GWDYM3DHl9z1QTPb98
 vVUtyRxn8Th/apEe0C75j8kRKC5f2lYTe1cujQBTnjCwg6XWNvqLYokAJezcimJAfiOB
 AvwA==
X-Gm-Message-State: APjAAAWQBjtPF7vVbjDmudhZISKCW4jezEkbdlTdhWT2to7epgY7yg5s
 OyAqR3aheS+scyF9IU3Ow4UoZ6jbiERF654aQg6mSg==
X-Google-Smtp-Source: APXvYqykhATBlQzFRqfhiqLlkAX/E/GWa7ix6MYB2xZIdZGuzeZT+Fo14f5xDHl7EyKgI5u0+PohxGjkO+y5L9RpuG8=
X-Received: by 2002:aca:5015:: with SMTP id e21mr1421594oib.174.1571980157675; 
 Thu, 24 Oct 2019 22:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
 <20191024191411.GH46373@sirena.co.uk>
In-Reply-To: <20191024191411.GH46373@sirena.co.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Oct 2019 13:09:06 +0800
Message-ID: <CA+Px+wU0MAJVbS42X5J=RhDoz4C1M5VcW0kV0ji73sBtMM6omA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, jarkko.nikula@linux.intel.com,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>,
 Hsin-yu Chao <hychao@google.com>
Subject: Re: [alsa-devel] Questions about max98090 codec driver
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

On Fri, Oct 25, 2019 at 3:14 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 25, 2019 at 02:23:18AM +0800, Tzung-Bi Shih wrote:
>
> > The playback stream becomes silent and the console keeps printing "PLL
> > unlocked".  But, if comment out the msleep(10) between the SHDN off
> > and on, the issue fixed.  I am trying to find the reason but facing
> > further more questions and may need your inputs.
>
> Wow, that's a bit special.  I'm wondering if the PLL unlock error
> handling isn't connected to the PLL configuration?

I don't quite understand here.  Did you mean: when max98090_pll_work()
get called, the PLL may have locked.  The code doesn't check
M98090_REG_DEVICE_STATUS but shutdown and on anyway.  In the case
max98090 may generate a new interrupt and again and again?

> > I feel it is weird to sleep in max98090_pll_work().  Especially, at
> > this line https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2125
> > (it makes less sense to "wait" in another thread).  Note that, the
> > threaded IRQF_ONESHOT handler and max98090_pll_work() are in 2
> > different threads.
>
> Sleeping after starting a PLL to give it time to lock is pretty normal.

I was trying to say: sleeping after starting in max98090_pll_work()
makes less sense by current implementation.  During the sleep time,
max98090 may generate a new ULK interrupt and try to schedule
max98090_pll_work() again.

> Doing so after stopping is a bit more fun.

Yes, and I couldn't find a recommendation of SHDN hold time in the
datasheet.  I guess we're safe to remove the sleep after stopping.
But I also don't expect it would be causing any problems if sleeping
after stopping.

> > I guess the original intention is:
> > - disable ULK interrupt in IRQ handler
> > (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2260)
> > - schedule max98090_pll_work() to workaround it
> > - wait 10ms to give PLL chance to lock
> > - enable ULK interrupt again
> > If max98090 claims its PLL is unlocked again, repeat the above by
> > receiving another ULK interrupt.
>
> I think so.

I will fix toward this direction.

> > 2. According to the datasheet page 164 table 90
> > (https://datasheets.maximintegrated.com/en/ds/MAX98090.pdf), there are
> > some registers should only be adjusted when SHDN==0.  But I fail to
> > find max98090.c tries to set SHDN to 0 and restore it afterwards when
> > writing to these registers.  For example,
> > https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L1897.
> > I am wondering if it would bring any side effects because the
> > datasheet states "Changing these settings during normal operation
> > (SHDN=1) can compromise device stability and performance
> > specifications."
>
> That does sound like it might be causing problems, yes - even if it's
> not the problem you're seeing it's probably a good idea to try to follow
> the datsheet recommendation in case it's causing some other problem.

I will try to fix toward this direction too.

One observed drawback of the fix is: when playbacking something, the
playback stream will be silent shortly if starting to capture (because
of the SHDN off and on).  Is it acceptable?
One workaround of this issue in ChromeOS is: enable DMIC-related
functions even if only speaker will be used.  More power consumption
would be expected in the case.  Would it be acceptable?

> If the ChromeOS code is working for you we may as well get it upstream,
> if we can start the PLL faster than the 10ms that's a win and the
> confirmation that we got lock looks like a win too.

From the datasheet page 26, the table states "PLL Lock Time" needs 2ms
typically and 7ms at most.  I will fix toward this direction: to see
if PLL could get locked less than 10ms and confirm we got lock in
max98090_pll_work().

With all proper fixes above, I should re-insert the msleep between
SHDN off and on to observe if the odd issue happens again.  We haven't
figured out the root cause afterall.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
