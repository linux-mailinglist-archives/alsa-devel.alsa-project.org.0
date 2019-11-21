Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1033104871
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 03:21:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F12F172A;
	Thu, 21 Nov 2019 03:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F12F172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574302904;
	bh=RwXqclZOQvLy+pdtmaodRhdVUvk8B993eFFsV7upRGk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQDhd5c3nFh5L2WYjfQU7HYGCEbPoURd5MlivD6fcoHiYsskqnfmcj9rgCNQjYEyp
	 y7YOcBsScLTZ91xM9/2NXWnQqi91sA0vYy4eyLTvE4gjTaIj+Qz+k40bej83wjsspQ
	 FQtI3oxmEoYRvtZ/KUsPqYpNpeuk5qLKN/f0OrQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAACF8013E;
	Thu, 21 Nov 2019 03:20:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC62F8013D; Thu, 21 Nov 2019 03:19:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9758F800FF
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 03:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9758F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GO9QctZd"
Received: by mail-io1-xd43.google.com with SMTP id x21so1599119ior.2
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaihhKpnbvKXLn46y6C83O8J7yDbV2a09ptM8U0gXU4=;
 b=GO9QctZdcwIydheLfhmlzPMQc7irHdfoBzmEF8PRU41+E4f8bv9cjODfY1RPFZi/zh
 JUY4hbul8ySf/xK0mTSsvyujU1Duw9hbHlO8QZt65w147VwVXhh1T2fSJ8OV3Ti5t+iG
 djxfRRM6D8vzhu/Z2NaB7Pv7kg7igYwA6qIKs+EuxC7KI3ftZK0Sb22Lj8/Z/V/JUm2W
 MN2b9yrQ0ZS13b808hQWP5p+GY9L0Yr+egwOS4W8x4tvDR2iqf2EvdHXymBq3ROHLHb1
 nakhXjc8miij1easVAgjX4bs1hv/d3SMxdK0IL+XVIheoIxlgkzqOpqY9QrwQmNdnskG
 W7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaihhKpnbvKXLn46y6C83O8J7yDbV2a09ptM8U0gXU4=;
 b=jDdpqj+eF+hR6u2i2l3PHfdqCZh5qWnHQkRCc2qiiYIf1iPBZPwnfEHyvQ2haq0evU
 Pe4JMD1WMHJBR6HG+rZPGDPmIjJa+iVg8vah07quRBZPnsj5UPoVZOtGypIC3rQ2GHKf
 lEndXmkWcZygq7yrX+v2Qj3g6Y9sI2uLBAgewdKqGCfvlxKcsRdxD4FYmGKa6KCDTUA0
 jfjvtlFMA84XXn6EDDZ9ykqgFpvuQOM/8gnKbeYdIo/Av6c99/ufMJF2CdEcEK+fmL4N
 ihuqfXUCyT5kB5aJvPT71G6Ot20sl/D9HMB5aP1yGbT4FUoHpv8xjxEv3qOO6xGeBrab
 llSw==
X-Gm-Message-State: APjAAAWC5Mihb6qD2Fzq8H2pa87jhESN/S9/Bexo8G7GRpFaIC7y5kiy
 qg3OuYY67dMx7vk7vOXmUYX7X1Od0KWS7EBg2p2JtQ==
X-Google-Smtp-Source: APXvYqwif7tx9L8dO7JqMRXKC2G0LKsmkuk3CcloxjIKw3Z4D053KZA4YP6NN5P3iIQVLQhq5k4A04LV/GBJQ76y6no=
X-Received: by 2002:a6b:ec08:: with SMTP id c8mr574574ioh.257.1574302792468;
 Wed, 20 Nov 2019 18:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
In-Reply-To: <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 21 Nov 2019 10:19:41 +0800
Message-ID: <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
	conditions
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

On Thu, Nov 21, 2019 at 12:10 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 11/20/19 12:02 AM, Tzung-Bi Shih wrote:
> > max98090_interrupt() and max98090_pll_work() run in 2 different threads.
> > There are 2 possible races:
> >
> > Note: M98090_REG_DEVICE_STATUS = 0x01.
> > Note: ULK == 0, PLL is locked; ULK == 1, PLL is unlocked.
> >
> > max98090_interrupt      max98090_pll_work
> > ----------------------------------------------
> > schedule max98090_pll_work
> >                          restart max98090 codec
> > receive ULK INT
> >                          assert ULK == 0
> > schedule max98090_pll_work (1).
> >
> > In the case (1), the PLL is locked but max98090_interrupt unnecessarily
> > schedules another max98090_pll_work.
>
> if you re-test that the PLL is already running, then you can exit the
> work function immediately without redoing the sequence?

ACK.

> maybe also play with the masks so that the PLL unlock is masked in the
> interrupt and unmasked after the PLL locks?

ACK, this is our option A mentioned below.

> > max98090_interrupt      max98090_pll_work      max98090 codec
> > ----------------------------------------------------------------------
> >                                                 ULK = 1
> > receive ULK INT
> > read 0x01
> >                                                 ULK = 0 (clear on read)
> > schedule max98090_pll_work
> >                          restart max98090 codec
> >                                                 ULK = 1
> > receive ULK INT
> > read 0x01
> >                                                 ULK = 0 (clear on read)
> >                          read 0x1
> >                          assert ULK == 0 (2).
>
> what are those 0x01 and 0x1? is the second a typo possibly?

ACK, a typo.

> > In the case (2), both max98090_interrupt and max98090_pll_work read
> > the same clear-on-read register.  max98090_pll_work would falsely
> > thought PLL is locked.
> >
> > There are 2 possible options:
> > A. turn off ULK interrupt before scheduling max98090_pll_work; and turn
> > on again before exiting max98090_pll_work.
> > B. remove the second thread of execution.
> >
> > Adopts option B which is more straightforward.
>
> but has the side effect of possibly adding a 10ms delay in the interrupt
> thread?

(forgot to mention) Option A cannot fix the case (2) race condition:
there would be 2 threads read the same clear-on-read register.  In
theory, the hardware should faster than CPUs' accesses via I2C.
max98090 should returns ULK=1 any time if PLL is unlocked.  Shall we
ignore the case (2) and adopt option A?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
