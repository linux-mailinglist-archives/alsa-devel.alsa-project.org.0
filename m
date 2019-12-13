Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8711ED3F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 22:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D731658;
	Fri, 13 Dec 2019 22:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D731658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576273850;
	bh=VD3DuvNyfZpiZiQZR1cdBThdaLtrMb3Izz30xMYhV2Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgnbuPiK3uWFknt8H7mQrM6a9ejaTc9d8lMJKWCjrvIBWBWCtLoRNSTgudyX3Y1fl
	 QVLCIsCYwK6yhAxDLOfWRJYj6Qpjv8dfSKDp5jFwC9YLzVQh1bjP6iPH80zmhJKr5k
	 kqZz94rNhDTCsjomYB0HKuv9kXtUFURqB0smdKbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649CBF80234;
	Fri, 13 Dec 2019 22:49:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B3ABF8021D; Fri, 13 Dec 2019 22:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06618F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 22:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06618F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y8YzYSCM"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 118892465B;
 Fri, 13 Dec 2019 21:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576273738;
 bh=N7ld8QpWhFKFVlnsxwXVqKOE2P/6aREGj1EyVdGbtVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y8YzYSCMInoCO3CmS3C3d2st2xu9ICzKSfa/M9uR5gXKM6rb7JMBP71djJXiOXJmq
 tfp7xfiC+2AYWpQP5SFUstHGQQPa5xQBIjO0f0FvLZI7E+vAtlO/4GZG/AO0qg3+Jt
 SUa8SL67t0qGDql2E5CjaiPhS7uitw0Wp5Nua8vM=
Date: Fri, 13 Dec 2019 17:10:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213161046.GA2653074@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
 <20191213072844.GF1750354@kroah.com>
 <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
 definitions for sdw_master_device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 13, 2019 at 09:49:57AM -0600, Pierre-Louis Bossart wrote:
> On 12/13/19 1:28 AM, Greg KH wrote:
> > On Thu, Dec 12, 2019 at 11:04:02PM -0600, Pierre-Louis Bossart wrote:
> > > Since we want an explicit support for the SoundWire Master device, add
> > > the definitions, following the Grey Bus example.
> > 
> > "Greybus"  All one word please.
> 
> Ack, will fix.
> 
> > > @@ -59,9 +59,12 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
> > >   		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> > >   			return -ENOMEM;
> > > +	} else if (is_sdw_md(dev)) {
> > 
> > Ok, "is_sdw_md()" is a horrid function name.  Spell it out please, this
> > ends up in the global namespace.
> 
> ok, will use is_sdw_master_device.
> 
> > 
> > Actually, why are you not using module namespaces here for this new
> > code?  That would help you out a lot.
> 
> I must admit I don't understand the question. This is literally modeled
> after is_gb_host_device(), did I miss something in the Greybus
> implementation?

No, I mean the new MODULE_NAMESPACE() support that is in the kernel.
I'll move the greybus code to use it too, but when you are adding new
apis, it just makes sense to use it then as well.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
