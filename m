Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 165ED2891AD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 21:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FAD11680;
	Fri,  9 Oct 2020 21:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FAD11680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602271483;
	bh=kuia1qBDE9Sj1BEviSYB3wwrqlXnj/pGc1gFqZr8j9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9UVzSZ70nTZPD2HBewmNOKf2T02aoCX8WKzjDRdwEmrXNeBv+x1uyv+uZmngkMmM
	 wlxTzyjjOHGuoa4U2FqsG9kHuruE6pgTL3247ULYteVJ1sagDyHIiW2KHWQCq22zF3
	 Ci8urosEmUaJwkxGPUiZEbOfeaZDdG9VZ3VUIxLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08EC6F8015B;
	Fri,  9 Oct 2020 21:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E045CF8015B; Fri,  9 Oct 2020 21:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_72,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB82F80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 21:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB82F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="i3nkO0VO"
Received: by mail-ej1-x643.google.com with SMTP id p15so14664728ejm.7
 for <alsa-devel@alsa-project.org>; Fri, 09 Oct 2020 12:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Etip+WdOg9WWZyxC9ekGwfWh8aAI6IBoMSdcjzYIQHo=;
 b=i3nkO0VO7rXIFqipfgGnmbMIthlTj+qlaXBfkHJOlE8jkFNU0C2a+bm/g7YKDw4+dx
 5KT3wwz4Lprnt8OIV4fGuPQPoNE31DjMvaQOccxvSEB2S5zeb7tIBOJs9yAIrnUmTFUI
 HLEM6UyDN8rgA4BO003+hWWFeCPscdnLZm7vez0omGjZfZTmQg4cdMdDz7MEW234nZ5d
 ZE5KFOVedvoAUBtDTyIcSOmtpP2CzeelB4tWgsUstjP6KAo0aDijBPHZR92j0LuWec6H
 Kz1550g2ZTti8VKmScoRmEImVdvP5AWSJ4lZBro68rdgHvk1j/uYE4LWBcRtIA1wli5X
 zqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Etip+WdOg9WWZyxC9ekGwfWh8aAI6IBoMSdcjzYIQHo=;
 b=AmQqicOu9vSeKmdLgYwjsFFT+wnK/Vmiz8/hCXPQYeswTODgzEkG+Qi0QWD+sCqLRI
 N/CivticLYfhNVBxiwC2kCbEObds20FTxhBTh0Yz4HTa/i/aCpnVdVxmry9g5IInJgqT
 HZmjaL0DNmmsV2oNI+mm1AUbm7EC9lLWfKNeGkkl4NRLNxp9mryR9PVykynqrebD41BX
 a9uB6QKxUmfGLNXLOnuXQffA893wGj/0CqEHx9fdsG8O4YxarTLiOI1iAenzPjkfNYWC
 1NLerqYfbj3A5KIyoR7YoB+6djjwDl63vlQ2yKiIpr2rEDZkQ2I+Ku8hu7Zr/15/mOms
 nZMw==
X-Gm-Message-State: AOAM532Puh0zJGPJlsqPtGA+aWHLzxBsMdyu9Z1E/8xnAIIzu920GG4S
 xmB4af/mGpnR8QE9TODunSMtK6avrD4dbdwCgZyfjA==
X-Google-Smtp-Source: ABdhPJy3E7TeahGnh8WAxn4QJnBvewqJpkGSdodnb8948tFEGT1JBPJIMUc2qZew8w0MyFKMi3t/mx3WTUjOPaIS62Y=
X-Received: by 2002:a17:906:4306:: with SMTP id
 j6mr16565774ejm.523.1602271373050; 
 Fri, 09 Oct 2020 12:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006172317.GN1874917@unreal>
 <DM6PR11MB2841976B8E89C980CCC29AD2DD0B0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <CAPcyv4hoS7ZT_PPrXqFBzEHBKL-O4x1jHtY8x9WWesCPA=2E0g@mail.gmail.com>
 <7dbbc51c-2cbd-a7c5-69de-76f190f1d130@linux.intel.com>
In-Reply-To: <7dbbc51c-2cbd-a7c5-69de-76f190f1d130@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 9 Oct 2020 12:22:41 -0700
Message-ID: <CAPcyv4h24md531OYTVkHqzK7Nb0dJc5PHkLDSDywh8mYgrXBjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
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

On Fri, Oct 9, 2020 at 7:27 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> >>>> +
> >>>> +   ancildrv->driver.owner = owner;
> >>>> +   ancildrv->driver.bus = &ancillary_bus_type;
> >>>> +   ancildrv->driver.probe = ancillary_probe_driver;
> >>>> +   ancildrv->driver.remove = ancillary_remove_driver;
> >>>> +   ancildrv->driver.shutdown = ancillary_shutdown_driver;
> >>>> +
> >>>
> >>> I think that this part is wrong, probe/remove/shutdown functions should
> >>> come from ancillary_bus_type.
> >>
> >>  From checking other usage cases, this is the model that is used for probe, remove,
> >> and shutdown in drivers.  Here is the example from Greybus.
> >>
> >> int greybus_register_driver(struct greybus_driver *driver, struct module *owner,
> >>                              const char *mod_name)
> >> {
> >>          int retval;
> >>
> >>          if (greybus_disabled())
> >>                  return -ENODEV;
> >>
> >>          driver->driver.bus = &greybus_bus_type;
> >>          driver->driver.name = driver->name;
> >>          driver->driver.probe = greybus_probe;
> >>          driver->driver.remove = greybus_remove;
> >>          driver->driver.owner = owner;
> >>          driver->driver.mod_name = mod_name;
> >>
> >>
> >>> You are overwriting private device_driver
> >>> callbacks that makes impossible to make container_of of ancillary_driver
> >>> to chain operations.
> >>>
> >>
> >> I am sorry, you lost me here.  you cannot perform container_of on the callbacks
> >> because they are pointers, but if you are referring to going from device_driver
> >> to the auxiliary_driver, that is what happens in auxiliary_probe_driver in the
> >> very beginning.
> >>
> >> static int auxiliary_probe_driver(struct device *dev)
> >> 145 {
> >> 146         struct auxiliary_driver *auxdrv = to_auxiliary_drv(dev->driver);
> >> 147         struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> >>
> >> Did I miss your meaning?
> >
> > I think you're misunderstanding the cases when the
> > bus_type.{probe,remove} is used vs the driver.{probe,remove}
> > callbacks. The bus_type callbacks are to implement a pattern where the
> > 'probe' and 'remove' method are typed to the bus device type. For
> > example 'struct pci_dev *' instead of raw 'struct device *'. See this
> > conversion of dax bus as an example of going from raw 'struct device
> > *' typed probe/remove to dax-device typed probe/remove:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=75797273189d
>
> Thanks Dan for the reference, very useful. This doesn't look like a a
> big change to implement, just wondering about the benefits and
> drawbacks, if any? I am a bit confused here.
>
> First, was the initial pattern wrong as Leon asserted it? Such code
> exists in multiple examples in the kernel and there's nothing preventing
> the use of container_of that I can think of. Put differently, if this
> code was wrong then there are other existing buses that need to be updated.
>
> Second, what additional functionality does this move from driver to
> bus_type provide? The commit reference just states 'In preparation for
> introducing seed devices the dax-bus core needs to be able to intercept
> ->probe() and ->remove() operations", but that doesn't really help me
> figure out what 'intercept' means. Would you mind elaborating?
>
> And last, the existing probe function does calls dev_pm_domain_attach():
>
> static int ancillary_probe_driver(struct device *dev)
> {
>         struct ancillary_driver *ancildrv = to_ancillary_drv(dev->driver);
>         struct ancillary_device *ancildev = to_ancillary_dev(dev);
>         int ret;
>
>         ret = dev_pm_domain_attach(dev, true);
>
> So the need to access the raw device still exists. Is this still legit
> if the probe() is moved to the bus_type structure?

Sure, of course.

>
> I have no objection to this change if it preserves the same
> functionality and possibly extends it, just wanted to better understand
> the reasons for the change and in which cases the bus probe() makes more
> sense than a driver probe().
>
> Thanks for enlightening the rest of us!

tl;dr: The ops set by the device driver should never be overwritten by
the bus, the bus can only wrap them in its own ops.

The reason to use the bus_type is because the bus type is the only
agent that knows both how to convert a raw 'struct device *' to the
bus's native type, and how to convert a raw 'struct device_driver *'
to the bus's native driver type. The driver core does:

        if (dev->bus->probe) {
                ret = dev->bus->probe(dev);
        } else if (drv->probe) {
                ret = drv->probe(dev);
        }

...so that the bus has the first priority for probing a device /
wrapping the native driver ops. The bus ->probe, in addition to
optionally performing some bus specific pre-work, lets the bus upcast
the device to bus-native type.

The bus also knows the types of drivers that will be registered to it,
so the bus can upcast the dev->driver to the native type.

So with bus_type based driver ops driver authors can do:

struct auxiliary_device_driver auxdrv {
    .probe = fn(struct auxiliary_device *, <any aux bus custom probe arguments>)
};

auxiliary_driver_register(&auxdrv); <-- the core code can hide bus details

Without bus_type the driver author would need to do:

struct auxiliary_device_driver auxdrv {
    .drv = {
        .probe = fn(struct device *), <-- no opportunity for bus
specific probe args
        .bus = &auxilary_bus_type, <-- unnecessary export to device drivers
    },
};

driver_register(&auxdrv.drv)
