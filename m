Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12413474B7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 10:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B34F1679;
	Wed, 24 Mar 2021 10:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B34F1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616578362;
	bh=SapQuvedMMoMFZ158PEwXuhwjVzD2GWWS+vzheIkBjo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buRBHZ0KPl7nXgApUzrum/5NWsVx1ezWcFD81tkhg1hC6al0YFzRZ5ebc50ep/qdt
	 WTMcb7Nl62k086SAx9F0j5/Ad6iGGHB4PXtJTZ2by5htXbvoDeeUKhLr+A5EwDR+hT
	 SQeGOHiz5DFeTfClGtyzZL7cmsa7EC3veLenozUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE08F800FF;
	Wed, 24 Mar 2021 10:31:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AAD6F8016B; Wed, 24 Mar 2021 10:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17116F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 10:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17116F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="RHJEdq1G"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B33461A02;
 Wed, 24 Mar 2021 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616578261;
 bh=SapQuvedMMoMFZ158PEwXuhwjVzD2GWWS+vzheIkBjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHJEdq1GkzcNicfCW1HMi6LL0POJi5GOw+2MiRFoYYI3Ynu/7d2Z1d+lDY1cZt8g2
 6lUqLa3/7d/6BV+UVXe7brZgFR2Xak17D54z/uRl88G13A8TtAcRVrcMg7htGST2u7
 CdHEQO8ikt0HwyvI48wBEYPYl2NMCoQbIS7oLkUM=
Date: Wed, 24 Mar 2021 10:30:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
Message-ID: <YFsG00+iDV/A4i3y@kroah.com>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmatyAoMZmBmkuZ@kroah.com>
 <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
 <YFo0WW8hOsHesSFC@kroah.com>
 <35cc8d35-a778-d8b2-bee3-bb53f8a6c51e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35cc8d35-a778-d8b2-bee3-bb53f8a6c51e@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On Tue, Mar 23, 2021 at 02:14:18PM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 3/23/21 1:32 PM, Greg KH wrote:
> > On Tue, Mar 23, 2021 at 01:04:49PM -0500, Pierre-Louis Bossart wrote:
> > > 
> > > > > Note that the auxiliary bus API has separate init and add steps, which
> > > > > requires more attention in the error unwinding paths. The main loop
> > > > > needs to deal with kfree() and auxiliary_device_uninit() for the
> > > > > current iteration before jumping to the common label which releases
> > > > > everything allocated in prior iterations.
> > > > 
> > > > The init/add steps can be moved together in the aux bus code if that
> > > > makes this usage simpler.  Please do that instead.
> > > 
> > > IIRC the two steps were separated during the auxbus reviews to allow the
> > > parent to call kfree() on an init failure, and auxiliary_device_uninit()
> > > afterwards.
> > > 
> > > https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#auxiliary-device
> > > 
> > > With a single auxbus_register(), the parent wouldn't know whether to use
> > > kfree() or auxiliary_device_uinit() when an error is returned, would it?
> > > 
> > 
> > It should, you know the difference when you call device_register() vs.
> > device_initialize()/device_add(), for what to do, right?
> > 
> > Should be no difference here either :)
> 
> sorry, not following.
> 
> with the regular devices, the errors can only happen on the second "add"
> stage.
> 
> int device_register(struct device *dev)
> {
> 	device_initialize(dev);
> 	return device_add(dev);
> }
> 
> that's not what is currently implemented for the auxiliary bus
> 
> the current flow is
> 
> ldev = kzalloc(..)
> some inits
> ret = auxiliary_device_init(&ldev->auxdev)
> if (ret < 0) {
>     kfree(ldev);
>     goto err1;
> }
> 
> ret = auxiliary_device_add(&ldev->auxdev)
> if (ret < 0)
>     auxiliary_device_uninit(&ldev->auxdev)
>     goto err2;
> }
> ...
> err2:
> err1:
> 
> How would I convert this to
> 
> ldev = kzalloc(..)
> some inits
> ret = auxiliary_device_register()
> if (ret) {
>    kfree(ldev) or not?
>    unit or not?
> }
> 
> IIRC during reviews there was an ask that the parent and name be checked,
> and that's why the code added the two checks below:
> 
> int auxiliary_device_init(struct auxiliary_device *auxdev)
> {
> 	struct device *dev = &auxdev->dev;
> 
> 	if (!dev->parent) {
> 		pr_err("auxiliary_device has a NULL dev->parent\n");
> 		return -EINVAL;
> 	}
> 
> 	if (!auxdev->name) {
> 		pr_err("auxiliary_device has a NULL name\n");
> 		return -EINVAL;
> 	}
> 
> 	dev->bus = &auxiliary_bus_type;
> 	device_initialize(&auxdev->dev);
> 	return 0;
> }
> 
> does this clarify the sequence?

Yes, thanks, but I don't know the answer to your question, sorry.  This
feels more complex than it should be, but I do not have the time at the
moment to look into it, sorry.

Try getting the authors of this code to fix it up :)

thanks,

greg k-h
