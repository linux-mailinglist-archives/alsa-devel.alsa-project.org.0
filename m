Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DA585174
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 16:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299B415CA;
	Fri, 29 Jul 2022 16:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299B415CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659104461;
	bh=rG+qA9pRCh2XHrx6FPAQMmQX+gy1CarW8WVq6ER5xt0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXHQYoSMWL6YtaToDnE3D4qrEAq0NvYcSfQf0gLgJGTwErDR6E7YLg8Mj+fPVLvyS
	 /pQ1TTJYsLliLBEmbTpL9EsdNWjkpQn8Eljh5gsmK+mpbFTHuVfE5kGzC7eV2Mh7XB
	 BT/uy+OSTwcMX0ih0p+CV2SSxgvFYmkGXBWqCjes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A929FF8049C;
	Fri, 29 Jul 2022 16:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD47F8049C; Fri, 29 Jul 2022 16:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01E7F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01E7F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="pv0PQedt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5342B82803;
 Fri, 29 Jul 2022 14:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66E1C433D6;
 Fri, 29 Jul 2022 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659104395;
 bh=rG+qA9pRCh2XHrx6FPAQMmQX+gy1CarW8WVq6ER5xt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pv0PQedtK+W5XN5LIhRHRvE3N86IVP8C3RjR+hcaZcAG9IFPIIpYWLmEU1hT66tjg
 iV29/MuQi5uAgiI1LHVsfkSw3jzhIBG+sGVT2VnWiBwQlTFViZMmBVR4LivjK2whK6
 4pMAV+y3jG8AYKg3xRlbf7RwL2Vau3QV1ke0Cn1A=
Date: Fri, 29 Jul 2022 16:19:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/5] soundwire: sysfs: have the driver core handle the
 creation of the device groups
Message-ID: <YuPsiB5QUWjlzIYi@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-3-gregkh@linuxfoundation.org>
 <be630e3a-3b3b-48cf-d61c-840ab04f1140@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be630e3a-3b3b-48cf-d61c-840ab04f1140@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Fri, Jul 29, 2022 at 09:12:17AM -0500, Pierre-Louis Bossart wrote:
> 
> > diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> > index 893296f3fe39..81c77e6ddbad 100644
> > --- a/drivers/soundwire/bus_type.c
> > +++ b/drivers/soundwire/bus_type.c
> > @@ -193,6 +193,7 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
> >  
> >  	drv->driver.owner = owner;
> >  	drv->driver.probe = sdw_drv_probe;
> > +	drv->driver.dev_groups = sdw_attr_groups;
> >  
> >  	if (drv->remove)
> >  		drv->driver.remove = sdw_drv_remove;
> 
> Minor rebase issue: this version of the bus_type.c code is no longer
> up-to-date, this patch creates a conflict with "soundwire: bus_type: fix
> remove and shutdown support" merged by Vinod - should be in your
> char-misc tree as well for 5.20.

Sorry, did this against Linus's tree, I will rebase it against 5.20-rc1
when that comes out and resend it then.

thanks,

greg k-h
