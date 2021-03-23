Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830923467CC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 19:34:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1D68167C;
	Tue, 23 Mar 2021 19:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1D68167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616524479;
	bh=blp+hy/JGs0I9wj2BdEuYdLq8UU6QZuI7VWHXUe948g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pu6gUs41rbTlj/ePJ+4/3h/r2YZF1AosS1fSA76Z5PuddHaWIvnEicoAPlSNP6WWp
	 pt5NpepKYY4lRc31blsoWVJpZZW+3DQzHYrXaLa11xEBBeZXvx4xM2FI6iBMvNau2g
	 IgxacM8jMHYPSOgGj3dNRQfl7zlQcWffHl34TNjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53202F80268;
	Tue, 23 Mar 2021 19:33:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B646F8025F; Tue, 23 Mar 2021 19:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 061B6F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 19:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 061B6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="xmFaYaa0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A82F7619C3;
 Tue, 23 Mar 2021 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616524380;
 bh=blp+hy/JGs0I9wj2BdEuYdLq8UU6QZuI7VWHXUe948g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xmFaYaa0Z2BhwzXUK2yUbhUhMfWTQG3ks/JTARuWcLDimNspKxuEMHiRHWMVK7vor
 mrI5vuFgL3Uaux/dIoo1e5gZAUtBYWhkcdjt+dr5Z5we+ALkjb8uidCxQ86ogdvYfU
 c6TVKJMjhmaWz8VL291x0V3swP4DF7ssFDQpY8R4=
Date: Tue, 23 Mar 2021 19:32:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
Message-ID: <YFo0WW8hOsHesSFC@kroah.com>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmatyAoMZmBmkuZ@kroah.com>
 <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
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

On Tue, Mar 23, 2021 at 01:04:49PM -0500, Pierre-Louis Bossart wrote:
> 
> > > Note that the auxiliary bus API has separate init and add steps, which
> > > requires more attention in the error unwinding paths. The main loop
> > > needs to deal with kfree() and auxiliary_device_uninit() for the
> > > current iteration before jumping to the common label which releases
> > > everything allocated in prior iterations.
> > 
> > The init/add steps can be moved together in the aux bus code if that
> > makes this usage simpler.  Please do that instead.
> 
> IIRC the two steps were separated during the auxbus reviews to allow the
> parent to call kfree() on an init failure, and auxiliary_device_uninit()
> afterwards.
> 
> https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#auxiliary-device
> 
> With a single auxbus_register(), the parent wouldn't know whether to use
> kfree() or auxiliary_device_uinit() when an error is returned, would it?
> 

It should, you know the difference when you call device_register() vs.
device_initialize()/device_add(), for what to do, right?

Should be no difference here either :)
