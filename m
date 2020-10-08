Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B6286E16
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 07:28:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B588816B0;
	Thu,  8 Oct 2020 07:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B588816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602134899;
	bh=/KC8SYmVhsAPwhDcSPWxDyKU8idi29YzN2Gwgc8ifro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=es6/7mw9Kv2J6cS9nOMccdr38nsAQNBfSis8FfCwRHdRXFuqpvNg/snj/yS2YhIZC
	 T9w9lHLezDMwWvq9DWknSrD8T8pxlaK9CczQ2GPyvEW4SsxTh/FixmKep/B6N4ufpA
	 91deSCz6j7fqB7cIOLpptuHV8SjhHVBvGmktXKs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85525F8015A;
	Thu,  8 Oct 2020 07:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E8BF80164; Thu,  8 Oct 2020 07:26:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA69F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 07:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA69F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f+IA7WVn"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A9320708;
 Thu,  8 Oct 2020 05:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602134787;
 bh=/KC8SYmVhsAPwhDcSPWxDyKU8idi29YzN2Gwgc8ifro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+IA7WVn+08OlKm0xfQHpXE38NaYkfRfgRqCmIFQ5pOUqAYykcsQhkBx3gvYEkORZ
 eEVLnmGk4w/6TxxyWGZ/pYsSt/0D0qqJ37S2zyyXdTU0p6I6sPTLLu2gOwsxdVmUp7
 V4pmDotAL27lWCvuNpkxWztyvy9BEzi1FMyYEN08=
Date: Thu, 8 Oct 2020 08:26:23 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
Message-ID: <20201008052623.GB13580@unreal>
References: <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <DM6PR11MB2841C531FC27DB41E078C52BDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201007192610.GD3964015@unreal>
 <BY5PR12MB43221A308CE750FACEB0A806DC0A0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <DM6PR11MB28415A8E53B5FFC276D5A2C4DD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <c90316f5-a5a9-fe22-ec11-a30a54ff0a9d@linux.intel.com>
 <DM6PR11MB284147D4BC3FD081B9F0B8BBDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <c88b0339-48c6-d804-6fbd-b2fc6fa826d6@linux.intel.com>
 <BY5PR12MB43222FD5959E490E331D680ADC0B0@BY5PR12MB4322.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB43222FD5959E490E331D680ADC0B0@BY5PR12MB4322.namprd12.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Thu, Oct 08, 2020 at 04:56:01AM +0000, Parav Pandit wrote:
>
>
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Sent: Thursday, October 8, 2020 3:20 AM
> >
> >
> > On 10/7/20 4:22 PM, Ertman, David M wrote:
> > >> -----Original Message-----
> > >> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > >> Sent: Wednesday, October 7, 2020 1:59 PM
> > >> To: Ertman, David M <david.m.ertman@intel.com>; Parav Pandit
> > >> <parav@nvidia.com>; Leon Romanovsky <leon@kernel.org>
> > >> Cc: alsa-devel@alsa-project.org; parav@mellanox.com; tiwai@suse.de;
> > >> netdev@vger.kernel.org; ranjani.sridharan@linux.intel.com;
> > >> fred.oh@linux.intel.com; linux-rdma@vger.kernel.org;
> > >> dledford@redhat.com; broonie@kernel.org; Jason Gunthorpe
> > >> <jgg@nvidia.com>; gregkh@linuxfoundation.org; kuba@kernel.org;
> > >> Williams, Dan J <dan.j.williams@intel.com>; Saleem, Shiraz
> > >> <shiraz.saleem@intel.com>; davem@davemloft.net; Patil, Kiran
> > >> <kiran.patil@intel.com>
> > >> Subject: Re: [PATCH v2 1/6] Add ancillary bus support
> > >>
> > >>
> > >>
> > >>>> Below is most simple, intuitive and matching with core APIs for
> > >>>> name and design pattern wise.
> > >>>> init()
> > >>>> {
> > >>>> 	err = ancillary_device_initialize();
> > >>>> 	if (err)
> > >>>> 		return ret;
> > >>>>
> > >>>> 	err = ancillary_device_add();
> > >>>> 	if (ret)
> > >>>> 		goto err_unwind;
> > >>>>
> > >>>> 	err = some_foo();
> > >>>> 	if (err)
> > >>>> 		goto err_foo;
> > >>>> 	return 0;
> > >>>>
> > >>>> err_foo:
> > >>>> 	ancillary_device_del(adev);
> > >>>> err_unwind:
> > >>>> 	ancillary_device_put(adev->dev);
> > >>>> 	return err;
> > >>>> }
> > >>>>
> > >>>> cleanup()
> > >>>> {
> > >>>> 	ancillary_device_de(adev);
> > >>>> 	ancillary_device_put(adev);
> > >>>> 	/* It is common to have a one wrapper for this as
> > >>>> ancillary_device_unregister().
> > >>>> 	 * This will match with core device_unregister() that has precise
> > >>>> documentation.
> > >>>> 	 * but given fact that init() code need proper error unwinding,
> > >>>> like above,
> > >>>> 	 * it make sense to have two APIs, and no need to export another
> > >>>> symbol for unregister().
> > >>>> 	 * This pattern is very easy to audit and code.
> > >>>> 	 */
> > >>>> }
> > >>>
> > >>> I like this flow +1
> > >>>
> > >>> But ... since the init() function is performing both device_init and
> > >>> device_add - it should probably be called ancillary_device_register,
> > >>> and we are back to a single exported API for both register and
> > >>> unregister.
> > >>
> > >> Kind reminder that we introduced the two functions to allow the
> > >> caller to know if it needed to free memory when initialize() fails,
> > >> and it didn't need to free memory when add() failed since
> > >> put_device() takes care of it. If you have a single init() function
> > >> it's impossible to know which behavior to select on error.
> > >>
> > >> I also have a case with SoundWire where it's nice to first
> > >> initialize, then set some data and then add.
> > >>
> > >
> > > The flow as outlined by Parav above does an initialize as the first
> > > step, so every error path out of the function has to do a
> > > put_device(), so you would never need to manually free the memory in
> > the setup function.
> > > It would be freed in the release call.
> >
> > err = ancillary_device_initialize();
> > if (err)
> > 	return ret;
> >
> > where is the put_device() here? if the release function does any sort of
> > kfree, then you'd need to do it manually in this case.
> Since device_initialize() failed, put_device() cannot be done here.
> So yes, pseudo code should have shown,
> if (err) {
> 	kfree(adev);
> 	return err;
> }
>
> If we just want to follow register(), unregister() pattern,
>
> Than,
>
> ancillar_device_register() should be,
>
> /**
>  * ancillar_device_register() - register an ancillary device
>  * NOTE: __never directly free @adev after calling this function, even if it returned
>  * an error. Always use ancillary_device_put() to give up the reference initialized by this function.
>  * This note matches with the core and caller knows exactly what to be done.
>  */
> ancillary_device_register()
> {
> 	device_initialize(&adev->dev);
> 	if (!dev->parent || !adev->name)
> 		return -EINVAL;
> 	if (!dev->release && !(dev->type && dev->type->release)) {
> 		/* core is already capable and throws the warning when release callback is not set.
> 		 * It is done at drivers/base/core.c:1798.
> 		 * For NULL release it says, "does not have a release() function, it is broken and must be fixed"
> 		 */
> 		return -EINVAL;
> 	}
> 	err = dev_set_name(adev...);
> 	if (err) {
> 		/* kobject_release() -> kobject_cleanup() are capable to detect if name is set/ not set
> 		  * and free the const if it was set.
> 		  */
> 		return err;
> 	}
> 	err = device_add(&adev->dev);
> 	If (err)
> 		return err;
> }
>
> Caller code:
> init()
> {
> 	adev = kzalloc(sizeof(*foo_adev)..);
> 	if (!adev)
> 		return -ENOMEM;
> 	err = ancillary_device_register(&adev);
> 	if (err)
> 		goto err;
>
> err:
> 	ancillary_device_put(&adev);
> 	return err;
> }
>
> cleanup()
> {
> 	ancillary_device_unregister(&adev);
> }
>
> Above pattern is fine too matching the core.
>
> If I understand Leon correctly, he prefers simple register(), unregister() pattern.
> If, so it should be explicit register(), unregister() API.

This is my summary
https://lore.kernel.org/linux-rdma/20201008052137.GA13580@unreal
The API should be symmetric.

Thanks
