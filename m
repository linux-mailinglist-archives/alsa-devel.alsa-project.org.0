Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4962854B3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 00:43:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7861684;
	Wed,  7 Oct 2020 00:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7861684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602024180;
	bh=6gJUbhs4LoROgBpmelrcW5C5Gm4z2ZEvYd4mz68/qEk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=od16di5MO3wOGYKQRuYBcYtmGlVK9x1rJfzBSYMcwt/AH0wYRHvoC/tUjDWZwEBBV
	 1fifFvBYSPlSOZ0GJ+QbMqFWDsFNP4FPBDnGEwMbMT7jCRXIWdHBRakYzJMqlZdUnH
	 CMsqPpv/mUTk95RZvJyrt+s7hObD19gl5FnB7W18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 352BBF80163;
	Wed,  7 Oct 2020 00:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B41E5F8015B; Wed,  7 Oct 2020 00:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35B5F80053
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 00:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35B5F80053
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="OwvJ1Bbo"
Received: by mail-ed1-x544.google.com with SMTP id x1so167542eds.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9jLq/izFOjx8ZtJix1FJn3SLNLAzQiR5kI8DeRM+7s=;
 b=OwvJ1BboGbPQAJ5DnJDRg3Fm2WbOUXpbwPysWFCzTjienQ4XAVzmCCZeG5Kr6DeRN1
 ZHIP6HZSy7EFiDsOWQUKsP6s1XkuHRVl6oEhdWvYh+nyWg86XyO3ttrQ6C5+9q2P0Lx9
 pnyxFnQCyW9Iqdr4DM8g1KeF9CUTT9BVBE/NF6qZ5VnBeQEmGw5Wxf1+O/M7M75nl2jU
 Lhzuw6C0NGZUvF8ac+9Ph1xx5+29wGh0xDPUPMGuUn8RFC+wIbFoH8iK59x3ZpR9JuHR
 cyv+TBqQSQLU3ZlfQSaKFevON1YeJDY+EmeSNNs6kEVVvA7bOt2oeGHryKcgg7J7yVhV
 x/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9jLq/izFOjx8ZtJix1FJn3SLNLAzQiR5kI8DeRM+7s=;
 b=hhu6+8CD8ECfK7hxg2LKX5NIS6gGpT8dKnR7dCAg9oyx9zHqr7+AdIhE6Oz7xpsUty
 1xWoZl6GGXeECSA7oO6TbpWb+uZckLghl3RPAXkD/VFiuGfQvCZxWw2cfw7GkJc+5Kxm
 Xmz0xp0RNsBjvwvLKgd6zXi0XtaZFbHaqBGevh1wwv3luQgaQU1gG2JVGoMy0Sxcn7rS
 cguufL5C/EsKtP5wuoq1Vr+3GzSnL3Ouv7nf+aPwNW+W+dRRcx870bcjYkaGxVRCOJl9
 Mqcps1ZIJAxbXVtF+KfPIWpcll4ndVD2x4nwImX/EPSUSCspEVU5HuX3o3606G1abDal
 ry+A==
X-Gm-Message-State: AOAM533z2/v9caXkipWC2En6Zs8XmpEOur7saB7OR/G/NtaovhVm+MxL
 7pqj7u4a9GS/BIZbZyd2NWcE666t8rug69imSkNOVQ==
X-Google-Smtp-Source: ABdhPJxkCUMwMJpcEGuU/WnoBnvltH7g59fWD1egLOVPiJcVQiOFRYItspAy5XfwKrllmpkp7eynC1abXszXNNkeYDw=
X-Received: by 2002:aa7:d1d5:: with SMTP id g21mr395860edp.348.1602024068802; 
 Tue, 06 Oct 2020 15:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
In-Reply-To: <20201005112547.GA401816@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 6 Oct 2020 15:40:58 -0700
Message-ID: <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

On Mon, Oct 5, 2020 at 4:25 AM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 04, 2020 at 11:45:41PM +0000, Williams, Dan J wrote:
> > [ Ugh, as other have lameneted, I was not copied on this thread so I
> > could not respond in real time. Let me be another to say, please copy
> > all impacted lists and stakeholders on patches. ]
> >
> > On Sat, 2020-10-03 at 11:08 +0200, Greg KH wrote:
> > [..]
> > >
> > > > Several names were suggested (like peer bus, which was shot down
> > > > because in
> > > > parts on the English speaking world the peerage means nobility),
> > > > finally
> > > > "ancillary bus" was arrived at by consensus of not hating it.
> > >
> > > "not hating it", while sometimes is a good thing, for something that
> > > I
> > > am going to have to tell everyone to go use, I would like to at least
> > > "like it".  And right now I don't like it...
> > >
> > > I think we should go back to "virtual" for now, or, if the people who
> > > didn't like it on your "internal" reviews wish to participate here
> > > and
> > > defend their choice, I would be glad to listen to that reasoning.
> >
> > I came out strongly against "virtual" because there is nothing virtual
> > about these devices, they are functional partitions of the parent
> > device. Also, /sys/devices/virtual is already the land of unparented  /
> > software-defined devices. Having /sys/devices/virtual alongside that is
> >  not quite a namespace collision, but it's certainly namespace
> > confusion in my view.
> >
> > I proposed other names, the team came back with "ancillary" which was
> > not my first choice, but perfectly suitable. In deference to the people
> > doing the work I let their choice stand.
> >
> > It is an uncomfortable position being a middle tier reviewer of pre-
> > release patch sets when the patch set can still be de-railed by
> > preference nits. A lack of deference makes it a difficult job to
> > convince people "hey my internal review will save you some time
> > upstream", when in practice they can see the opposite is true.
>
> I will publically state that without those middle-tier reviews, this
> would have been a worse submission, which is why I am _REQUIRING_ them
> from Intel at the moment.
>
> So your review did not happen in vain, and if developers complain about
> this, send them to me please.
>
> As for the name, why is everyone ignoring the fact that we have had
> /sys/devices/virtual/ for decades now, with no one being confused about
> that name usage?  I see this as an extension of that existing code
> pattern, is everyone missing that?

Oh, I was specifically reacting to /sys/devices/virtual being a place
where un-parented devices land. Things like raid composite devices and
other devices that just do not fit cleanly in the parent device
hierarchy, each of them has independent lifetime rules, some do not
attach to drivers they just exist in an "unbound" state when active...
it's an anything goes catch all space. This bus is the opposite, all
devices have a maximum lifetime tied to their parent device bind
lifetime, and they are not active without drivers. Placing them under
/sys/bus/virtual/devices confuses what the "virtual" term means to
sysfs.

"ancillary" devices and drivers has meaning to me, in a way that
"virtual" devices and drivers does not. If "ancillary" does not hit
the right tone what about "aux" for "auxiliary"
(/sys/bus/aux/devices)?
