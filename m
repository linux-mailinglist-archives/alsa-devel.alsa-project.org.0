Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E8286EBB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 08:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B5F16B3;
	Thu,  8 Oct 2020 08:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B5F16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602138858;
	bh=Lw9z0a6Ra4pYCEZXVDcmEoLt0XoG+o3QQBBjSLe+iLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE/m0J4uIs96ZZYAH875ohYr9IEa1aVIvQRUKeqM4GS1FsOYgmw0nq4yWSUKyXggf
	 wHTmXCq/XIKO3gG7cjQ0b9rRSGD3quCbhLuXcIXJF/0Pk4ldvtXve+XkwN80CG+bfJ
	 Ok3Fh7fpuiVzHHY2qGLvC8yAKh4uyX4B337lNf8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F07ECF80090;
	Thu,  8 Oct 2020 08:32:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83D90F80164; Thu,  8 Oct 2020 08:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50017F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 08:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50017F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="J4wJLz4n"
Received: by mail-ed1-x543.google.com with SMTP id o18so4652155edq.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T6WCoZxdckvRKJGdL/C3+abKBroTkwq+Cv2M9Ea/Upw=;
 b=J4wJLz4nBMEzbf100ACCB/Bd6uCESFEe6h/ytp/fArQhp+PqEe6wDNBMpvMNG7tPm1
 8IlEZA152jqzUOs6tnpnlk9r5hco7RRH8D3Ys47wsFfBqr0vAGaDNpOcdp75K6zTdqUO
 btR7tlOjqlvspO/XktdBts7wPM3RD3JTzWTMNiBYXpck7KJ8h1FFQ9JBx8hhH999iEiZ
 Xou5bS/nlxSA6PeH3Q6IFmiNZ4Yu2ZTrgVuCE+7/rjIZyGork2J185AvO0JaKNF/L5nR
 0BFJ48dVKdHw+UF20XqPOYqKkwKoP/y6pTGI3uWQcL5BuVVbvl4tfwaK/ldWnnLsteDB
 akYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6WCoZxdckvRKJGdL/C3+abKBroTkwq+Cv2M9Ea/Upw=;
 b=GHDCUF3eSZiOThoqSQa6u4KewddkMqogXeDW7BQXOTmL7sDpcj3R8grDl2pjUnhoOS
 0DiO33VKITVQ1t+ZUHOa+fi2CjNCiP/1x6EtAp697p6Xz6Fpi+3VBRP7rQKxnMK34XPb
 7uUqyO7Ih8Ob9Y983Z+NYaGAKJuHNL+AS7ytFxSmJzov59eP475xQyanFe/iKFLGv0H3
 vkLkPgAcmDAzIDRR4sWIcqdj5MwiFPgTDR1uPMogYcjJgiTY/5+3cQa9vXSIFZkCaNvA
 gplHXc6c6nPjRjooj7l/LPtkGnCtblYlbS0GCNDDg7GZUKqEA7mveUnqXOSiZ/oajvfN
 M2WA==
X-Gm-Message-State: AOAM532RApNnuhhvbNaP+TKZRm2E9E3CC+aRuOu7c5JXpSVJ2h8D9T8l
 LFlWPxGVDiUKGGXHYTnFN4OeNyhLcSCEVkgveo4TlQ==
X-Google-Smtp-Source: ABdhPJwgpM7H3h1DInduR4J71279wEVfVZ4kQCu4JvRNed2XMja6KyKSjQxlhH+H4bkYZVxCQ6SA/D1UOI3UnDXcONQ=
X-Received: by 2002:a50:9fa8:: with SMTP id c37mr7437375edf.233.1602138743085; 
 Wed, 07 Oct 2020 23:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <DM6PR11MB2841C531FC27DB41E078C52BDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201007192610.GD3964015@unreal>
 <BY5PR12MB43221A308CE750FACEB0A806DC0A0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <DM6PR11MB28415A8E53B5FFC276D5A2C4DD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201008052137.GA13580@unreal>
In-Reply-To: <20201008052137.GA13580@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 23:32:11 -0700
Message-ID: <CAPcyv4gz=mMTfLO4mAa34MEEXgg77o1AWrT6aguLYODAWxbQDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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

On Wed, Oct 7, 2020 at 10:21 PM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Wed, Oct 07, 2020 at 08:46:45PM +0000, Ertman, David M wrote:
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Wednesday, October 7, 2020 1:17 PM
> > > To: Leon Romanovsky <leon@kernel.org>; Ertman, David M
> > > <david.m.ertman@intel.com>
> > > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; alsa-
> > > devel@alsa-project.org; parav@mellanox.com; tiwai@suse.de;
> > > netdev@vger.kernel.org; ranjani.sridharan@linux.intel.com;
> > > fred.oh@linux.intel.com; linux-rdma@vger.kernel.org;
> > > dledford@redhat.com; broonie@kernel.org; Jason Gunthorpe
> > > <jgg@nvidia.com>; gregkh@linuxfoundation.org; kuba@kernel.org; Williams,
> > > Dan J <dan.j.williams@intel.com>; Saleem, Shiraz
> > > <shiraz.saleem@intel.com>; davem@davemloft.net; Patil, Kiran
> > > <kiran.patil@intel.com>
> > > Subject: RE: [PATCH v2 1/6] Add ancillary bus support
> > >
> > >
> > > > From: Leon Romanovsky <leon@kernel.org>
> > > > Sent: Thursday, October 8, 2020 12:56 AM
> > > >
> > > > > > This API is partially obscures low level driver-core code and needs
> > > > > > to provide clear and proper abstractions without need to remember
> > > > > > about put_device. There is already _add() interface why don't you do
> > > > > > put_device() in it?
> > > > > >
> > > > >
> > > > > The pushback Pierre is referring to was during our mid-tier internal
> > > > > review.  It was primarily a concern of Parav as I recall, so he can speak to
> > > his
> > > > reasoning.
> > > > >
> > > > > What we originally had was a single API call
> > > > > (ancillary_device_register) that started with a call to
> > > > > device_initialize(), and every error path out of the function performed a
> > > > put_device().
> > > > >
> > > > > Is this the model you have in mind?
> > > >
> > > > I don't like this flow:
> > > > ancillary_device_initialize()
> > > > if (ancillary_ancillary_device_add()) {
> > > >   put_device(....)
> > > >   ancillary_device_unregister()
> > > Calling device_unregister() is incorrect, because add() wasn't successful.
> > > Only put_device() or a wrapper ancillary_device_put() is necessary.
> > >
> > > >   return err;
> > > > }
> > > >
> > > > And prefer this flow:
> > > > ancillary_device_initialize()
> > > > if (ancillary_device_add()) {
> > > >   ancillary_device_unregister()
> > > This is incorrect and a clear deviation from the current core APIs that adds the
> > > confusion.
> > >
> > > >   return err;
> > > > }
> > > >
> > > > In this way, the ancillary users won't need to do non-intuitive put_device();
> > >
> > > Below is most simple, intuitive and matching with core APIs for name and
> > > design pattern wise.
> > > init()
> > > {
> > >     err = ancillary_device_initialize();
> > >     if (err)
> > >             return ret;
> > >
> > >     err = ancillary_device_add();
> > >     if (ret)
> > >             goto err_unwind;
> > >
> > >     err = some_foo();
> > >     if (err)
> > >             goto err_foo;
> > >     return 0;
> > >
> > > err_foo:
> > >     ancillary_device_del(adev);
> > > err_unwind:
> > >     ancillary_device_put(adev->dev);
> > >     return err;
> > > }
> > >
> > > cleanup()
> > > {
> > >     ancillary_device_de(adev);
> > >     ancillary_device_put(adev);
> > >     /* It is common to have a one wrapper for this as
> > > ancillary_device_unregister().
> > >      * This will match with core device_unregister() that has precise
> > > documentation.
> > >      * but given fact that init() code need proper error unwinding, like
> > > above,
> > >      * it make sense to have two APIs, and no need to export another
> > > symbol for unregister().
> > >      * This pattern is very easy to audit and code.
> > >      */
> > > }
> >
> > I like this flow +1
> >
> > But ... since the init() function is performing both device_init and
> > device_add - it should probably be called ancillary_device_register,
> > and we are back to a single exported API for both register and
> > unregister.
> >
> > At that point, do we need wrappers on the primitives init, add, del,
> > and put?
>
> Let me summarize.
> 1. You are not providing driver/core API but simplification and obfuscation
> of basic primitives and structures. This is new layer. There is no room for
> a claim that we must to follow internal API.

Yes, this a driver core api, Greg even questioned why it was in
drivers/bus instead of drivers/base which I think makes sense.

> 2. API should be symmetric. If you call to _register()/_add(), you will need
> to call to _unregister()/_del(). Please don't add obscure _put().

It's not obscure it's a long standing semantic for how to properly
handle device_add() failures. Especially in this case where there is
no way to have something like a common auxiliary_device_alloc() that
will work for everyone the only other option is require all device
destruction to go through the provided release method (put_device())
after a device_add() failure.

> 3. You can't "ask" from users to call internal calls (put_device) over internal
> fields in ancillary_device.

Sure it can. platform_device_add() requires a put_device() on failure,
but also note how platform_device_add() *requires*
platform_device_alloc() be used to create the device. That
inflexibility is something this auxiliary bus is trying to avoid.

> 4. This API should be clear to drivers authors, "device_add()" call (and
> semantic) is not used by the drivers (git grep " device_add(" drivers/).

This shows 141 instances for me, so I'm not sure what you're getting at?

Look, this api is meant to be a replacement for places where platform
devices were being abused. The device_initialize() + customize device
+ device_add() organization has the flexibility needed to let users
customize naming and other parts of device creation in a way that a
device_register() flow, or platform_device_{register,add} in
particular, did not.

If the concern is that you'd like to have an auxiliary_device_put()
for symmetry that would need to come with the same warning as
commented on platform_device_put(), i.e. that's it's really only
vanity symmetry to be used in error paths. The semantics of
device_add() and device_put() on failure are long established, don't
invent new behavior for auxiliary_device_add() and
auxiliary_device_put() / put_device().
