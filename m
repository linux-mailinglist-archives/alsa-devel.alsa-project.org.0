Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E5285BB8
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 11:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F334D16CE;
	Wed,  7 Oct 2020 11:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F334D16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602062149;
	bh=RJp1ZaGRw1c3VEIgpRBNUt0Z05Wq2ds76EI7r5hyp7c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/3qg1gtTv2RygzoiFxXXiLzqOAQNvWHM0SyyERAtgExJfCs5urv3NFNIjsaQz5yT
	 FE0wHCaE2V8wofS/+fJPFM8XSKKZrOYOd6CWiTYqj64eWLGl0QeIlpOEqpzoFRNzn4
	 mKrkYQ4BCddRwHs3so8vG1QDV9fAA1OvFiYtvJyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A48F8016A;
	Wed,  7 Oct 2020 11:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2B27F80128; Wed,  7 Oct 2020 11:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC4AF800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 11:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC4AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K0OZjKjq"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AE3F20870;
 Wed,  7 Oct 2020 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602062039;
 bh=RJp1ZaGRw1c3VEIgpRBNUt0Z05Wq2ds76EI7r5hyp7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0OZjKjq3PUMPARGW2usTX2oH5+fHUB2An4H6FMghFP89xsuWQkQYo7SRGZ6l3RQK
 LOaZC066g4Acf+LqHZPGHbDV9G31Yr9VljT+t6nWbyyqd7WRi5pTJlgRzctgEWAtSW
 twTMwXInZEWmdG88/yCitwubu+TYdSODR3UwxZv4=
Date: Wed, 7 Oct 2020 11:14:43 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201007091443.GA822254@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
 <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
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

On Tue, Oct 06, 2020 at 03:40:58PM -0700, Dan Williams wrote:
> On Mon, Oct 5, 2020 at 4:25 AM gregkh@linuxfoundation.org
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Oct 04, 2020 at 11:45:41PM +0000, Williams, Dan J wrote:
> > > [ Ugh, as other have lameneted, I was not copied on this thread so I
> > > could not respond in real time. Let me be another to say, please copy
> > > all impacted lists and stakeholders on patches. ]
> > >
> > > On Sat, 2020-10-03 at 11:08 +0200, Greg KH wrote:
> > > [..]
> > > >
> > > > > Several names were suggested (like peer bus, which was shot down
> > > > > because in
> > > > > parts on the English speaking world the peerage means nobility),
> > > > > finally
> > > > > "ancillary bus" was arrived at by consensus of not hating it.
> > > >
> > > > "not hating it", while sometimes is a good thing, for something that
> > > > I
> > > > am going to have to tell everyone to go use, I would like to at least
> > > > "like it".  And right now I don't like it...
> > > >
> > > > I think we should go back to "virtual" for now, or, if the people who
> > > > didn't like it on your "internal" reviews wish to participate here
> > > > and
> > > > defend their choice, I would be glad to listen to that reasoning.
> > >
> > > I came out strongly against "virtual" because there is nothing virtual
> > > about these devices, they are functional partitions of the parent
> > > device. Also, /sys/devices/virtual is already the land of unparented  /
> > > software-defined devices. Having /sys/devices/virtual alongside that is
> > >  not quite a namespace collision, but it's certainly namespace
> > > confusion in my view.
> > >
> > > I proposed other names, the team came back with "ancillary" which was
> > > not my first choice, but perfectly suitable. In deference to the people
> > > doing the work I let their choice stand.
> > >
> > > It is an uncomfortable position being a middle tier reviewer of pre-
> > > release patch sets when the patch set can still be de-railed by
> > > preference nits. A lack of deference makes it a difficult job to
> > > convince people "hey my internal review will save you some time
> > > upstream", when in practice they can see the opposite is true.
> >
> > I will publically state that without those middle-tier reviews, this
> > would have been a worse submission, which is why I am _REQUIRING_ them
> > from Intel at the moment.
> >
> > So your review did not happen in vain, and if developers complain about
> > this, send them to me please.
> >
> > As for the name, why is everyone ignoring the fact that we have had
> > /sys/devices/virtual/ for decades now, with no one being confused about
> > that name usage?  I see this as an extension of that existing code
> > pattern, is everyone missing that?
> 
> Oh, I was specifically reacting to /sys/devices/virtual being a place
> where un-parented devices land. Things like raid composite devices and
> other devices that just do not fit cleanly in the parent device
> hierarchy, each of them has independent lifetime rules, some do not
> attach to drivers they just exist in an "unbound" state when active...
> it's an anything goes catch all space. This bus is the opposite, all
> devices have a maximum lifetime tied to their parent device bind
> lifetime, and they are not active without drivers. Placing them under
> /sys/bus/virtual/devices confuses what the "virtual" term means to
> sysfs.

"virtual" here means "not real" :)

> "ancillary" devices and drivers has meaning to me, in a way that
> "virtual" devices and drivers does not. If "ancillary" does not hit
> the right tone what about "aux" for "auxiliary"
> (/sys/bus/aux/devices)?

"aux" is nice, I'll think about that.  simple is good, and naming is
hard...

thanks,

greg k-h
