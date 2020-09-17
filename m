Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097026DC76
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4861315F9;
	Thu, 17 Sep 2020 15:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4861315F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600348080;
	bh=tXED9ypy+kPPeF6JnxWh9p1oi/UnOkEUioVzoMCVEKY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhlxbdrN61LPQHcAZjtqRQhF55QTHJIZsCJny02CWUqFsqlDEKzhBoapKCuK3eHje
	 RhrhTPbIdgpHqg1Blx116MQolnmFlaIETe+cICykBnLrPe8UYqnRM0Kww3MbMNTCxq
	 cBglHOdMkE56fG078D2YWK+4lngMl4YZuViyDTHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C38F8028B;
	Thu, 17 Sep 2020 15:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D647BF8027C; Thu, 17 Sep 2020 15:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D36F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D36F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EKa1R18d"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FD0721582;
 Thu, 17 Sep 2020 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600347968;
 bh=tXED9ypy+kPPeF6JnxWh9p1oi/UnOkEUioVzoMCVEKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKa1R18dcUNG0h4K1M5wBdM61S+UmlO6CGmeNC9qh6hvHzKYFRm/Yz6dtJJA4y9gY
 DtyWtXehwfUlvH8J4KxAEC4EcATZCsALthOIEz954Urds10Xe0O+TAywErn5RXF2DK
 PiwLxzsSlCMtQOkrPI12LMIczSu6ZYLdTJmDQHls=
Date: Thu, 17 Sep 2020 15:06:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] soundwire: sysfs: add slave status and device number
 before probe
Message-ID: <20200917130640.GA3643521@kroah.com>
References: <20200916201504.52211-1-pierre-louis.bossart@linux.intel.com>
 <20200916201504.52211-3-pierre-louis.bossart@linux.intel.com>
 <20200917091938.GB52206@kroah.com>
 <2fc52eda-5c4a-e970-8a74-43c2037f9e0f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc52eda-5c4a-e970-8a74-43c2037f9e0f@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Thu, Sep 17, 2020 at 07:54:50AM -0500, Pierre-Louis Bossart wrote:
> Thanks for the review Greg,
> 
> > > +int sdw_slave_status_sysfs_init(struct sdw_slave *slave)
> > > +{
> > > +	return device_add_group(&slave->dev, &sdw_slave_status_attr_group);
> > 
> > DOesn't this race with userspace?  Why not make this part of the default
> > set of device attributes and have the driver core create them
> > automatically?
> 
> What did you mean by 'default set of device attributes', would you mind
> providing a pointer to an example so that I can look into this?

Set the "groups" pointer in any one of the normal driver core structures
(struct device_type, struct device, struct device_driver), or the
"bus_groups", "dev_groups", or "drv_groups" pointer in struct bus_type.

that should give you something to go on :)

thanks,

greg k-h
