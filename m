Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2702834E7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD05C17CB;
	Mon,  5 Oct 2020 13:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD05C17CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897216;
	bh=73x1pOSrbylUIdxdz8W0qj4xoO7H7t3kcmVJa2tdr0s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJZdMhQf2mF5XKM+hde0hzRPBIt60wEiVb6MbBru+agWVRqPEK+53RgyhAc7VS5zf
	 Q8ir38KSKYE6NfvIR1grafjLAoEu8TONIlF0dHLxglyfDnCh6cve2LxOyrHlqDHrxI
	 lYQlCaeaWadGxnXdBiyE9IzTh1ajv4X1p+P4nkoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED149F8027B;
	Mon,  5 Oct 2020 13:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 103A7F8026A; Mon,  5 Oct 2020 13:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75FF2F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75FF2F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N2W+2qL+"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0F8720774;
 Mon,  5 Oct 2020 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601897102;
 bh=73x1pOSrbylUIdxdz8W0qj4xoO7H7t3kcmVJa2tdr0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N2W+2qL+19MtlJlPi/SV4mQvcU0IcGnDurovqH4BeasJRr5lkNxMWAK7reaAWV8rP
 a6tktm2h9F2Wn0Ba+3vxs2uDI+VWzilLpo9XSSrUlt2MIoa29nVBP6/BeyGTYjreKA
 HOAzVloBjfB3oJZ5XFYmbbB6F7H/ft1B5WArxWZw=
Date: Mon, 5 Oct 2020 13:25:47 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201005112547.GA401816@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
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

On Sun, Oct 04, 2020 at 11:45:41PM +0000, Williams, Dan J wrote:
> [ Ugh, as other have lameneted, I was not copied on this thread so I
> could not respond in real time. Let me be another to say, please copy
> all impacted lists and stakeholders on patches. ]
> 
> On Sat, 2020-10-03 at 11:08 +0200, Greg KH wrote:
> [..]
> > 
> > > Several names were suggested (like peer bus, which was shot down
> > > because in
> > > parts on the English speaking world the peerage means nobility),
> > > finally
> > > "ancillary bus" was arrived at by consensus of not hating it.
> > 
> > "not hating it", while sometimes is a good thing, for something that
> > I
> > am going to have to tell everyone to go use, I would like to at least
> > "like it".  And right now I don't like it...
> > 
> > I think we should go back to "virtual" for now, or, if the people who
> > didn't like it on your "internal" reviews wish to participate here
> > and
> > defend their choice, I would be glad to listen to that reasoning.
> 
> I came out strongly against "virtual" because there is nothing virtual
> about these devices, they are functional partitions of the parent
> device. Also, /sys/devices/virtual is already the land of unparented  /
> software-defined devices. Having /sys/devices/virtual alongside that is
>  not quite a namespace collision, but it's certainly namespace
> confusion in my view.
> 
> I proposed other names, the team came back with "ancillary" which was
> not my first choice, but perfectly suitable. In deference to the people
> doing the work I let their choice stand.
> 
> It is an uncomfortable position being a middle tier reviewer of pre-
> release patch sets when the patch set can still be de-railed by
> preference nits. A lack of deference makes it a difficult job to
> convince people "hey my internal review will save you some time
> upstream", when in practice they can see the opposite is true.

I will publically state that without those middle-tier reviews, this
would have been a worse submission, which is why I am _REQUIRING_ them
from Intel at the moment.

So your review did not happen in vain, and if developers complain about
this, send them to me please.

As for the name, why is everyone ignoring the fact that we have had
/sys/devices/virtual/ for decades now, with no one being confused about
that name usage?  I see this as an extension of that existing code
pattern, is everyone missing that?

thanks,

greg k-h
