Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95ADA22DF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 19:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D77165D;
	Thu, 29 Aug 2019 19:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D77165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567101423;
	bh=JrZ5v7U2jOatW8HPR7odu9TSGOaiMK2r+5mprwdey+4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/kuBF43EYlTyF9jjBO4ol1kjoCS1krQGcUcg74L3Yxy2QW3RWRthxcJ3shtXcqBX
	 zAEldO782N6tCENJrYfgdRjcZ+Op7++5IuWDhDwdLcikxdsJ3J84GwyktRk+YGibGH
	 /F1nEms6XToK7rjjh5Al//qTO0aH/qYgnFmTMDrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C214F80274;
	Thu, 29 Aug 2019 19:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C5D4F802A0; Thu, 29 Aug 2019 19:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E28F80273
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E28F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iZmIt2cI"
Received: by mail-qt1-x82d.google.com with SMTP id a13so4691695qtj.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EY65L7pPPwzv0UbrFWWEHU/CO8l7zqHfujlADGua0w=;
 b=iZmIt2cISmR6N/D4ahQMgqXBpOMMDbychdxiti5A0G5GrxdHD5QcQ0OY9X/rzfUrZ/
 YbsV+KkXft+g+I+uoIiyFkvmEixFGxd1+jfwSLnRh6rcZ9RyQi6mJ9uJw5PR0p323pqz
 eaRsl7KNtEi77ziHsM6eukb5r1wBcuNj0qXBxAi/lxI2qPM9yudVgd/D7XBL21OrS0kY
 55kr/7OpIRbp1n9wLr4dbOwi1Nw3+2iE1XbBUlPBjIVy+hOxL39ZvnCGEIBNphCM1tps
 w7H1N13igwmhAwrIfm7WnT+15+QYLOyRKVLj32QUy4YUdULwxw+wYfgbJap91dRUV96P
 Dzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EY65L7pPPwzv0UbrFWWEHU/CO8l7zqHfujlADGua0w=;
 b=r3cMSc7On+fG33TIrqhTfjpk0ZuHXEGhDPH9fflWsaVZok6pc/WZ97pcr45cwFD3FY
 G8B/d6g5FA0yhAAHCj4D4ELkN4e/0E7T7HPTCBj55DVQxToS5RdV+mXqIBOFGM+T9hxJ
 Z9maRTgjooG8WE8SHk0XtAn1RP7RhaD2btUvehQX4FQ/QkYL52VnHgUY+AxdsLqvnnNm
 BEaMUKQH64vQTVdtuGPNtOjYblKZBcVvOmdrlzmvgi5MzYhZdBFJLo3tXYUdkLr5LG8i
 XY1ccbtXdVsTjjRe4TPf5pbw6KXV7J7E34bveCxmjyPIQV9TRhPCxqPqX6njJHjoi8yZ
 C59w==
X-Gm-Message-State: APjAAAXo8P4VNMNZnwMkBFCtVsTsqeB1GcOtaLYs+6ioi4CvM1JaJ1Gp
 XGex2SX4JZkViNnV2FPhzEP4t/CpDncBWR+jM0ajnQ==
X-Google-Smtp-Source: APXvYqz8q4zerYkUqoq7Ty/cOjIlJEMZVzIXrlVqw8o3idG2sKA0Nq0DCUTvInCicV8Pu4T7YJI8tox2vTVEg1bqWA0=
X-Received: by 2002:ac8:38ed:: with SMTP id g42mr11373060qtc.24.1567101280797; 
 Thu, 29 Aug 2019 10:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190827202825.GP23391@sirena.co.uk>
In-Reply-To: <20190827202825.GP23391@sirena.co.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 29 Aug 2019 10:54:29 -0700
Message-ID: <CAOReqxjCTZosbvv8Q-t5zGdreKnk8nWH2Yq-9soLbOk8FOcsgw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On Thu, Aug 29, 2019 at 7:24 AM Mark Brown <broonie@kernel.org> wrote:
>
> Hi,
>
> As in previous years we're going to have an audio miniconference so we can
> get together and talk through issues, especially design decisions, face to
> face.  This year's event will be held on October 31st in Lyon, France,
> the day after ELC-E.  This will be held at the Lyon Convention Center (the
> ELC-E venue), generously sponsored by Intel.
>
> As with previous years let's pull together an agenda through a mailing
> list discussion - if people could reply to this mail with any topics
> they'd like to discuss we can take it from there.  Of course if we can
> sort things out more quickly via the mailing list that's even better!
>
I may be miss reading this but I'm reading that as 'the mailing list'
or ' the mailing list'. Is there an alternative such as a google doc?

I am interested in discussing the possibility of upstreaming some of
the features we have built into our UCMs locally. With the growing
number of UCMs being maintained by ALSA upstream we think it would be
beneficial to get those features upstreamed if the community agrees.
> If you're planning to attend please fill out the form here:
>
>     https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link
>
> This event will be covered by the same code of conduct as ELC-E.
>
> Thanks again to Intel for supporting this event.
>
> Thanks,
> Mark
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
