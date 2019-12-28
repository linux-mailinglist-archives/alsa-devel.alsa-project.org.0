Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8F12BD83
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 13:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30FEC1753;
	Sat, 28 Dec 2019 13:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30FEC1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577534834;
	bh=JO4/rWMykhh13JItLS2S8682/msMEeo6HnL4So35KBo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHaWlpJ7P35eZqbrkmFtItRIMwh4cnO5ySPhi6m3ajr8rNeOeSeqqVQDsJMvGD4kT
	 rVc56sSI66m+NzLJSjaEn/J1hIdZppAWnafbXCuHnBI3p7pSeZl3UVapslV+Bpg5NJ
	 6OV8GGRXmvZstjK+IYqEpQOex/w68Ny+nzZZiYE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA1FAF80138;
	Sat, 28 Dec 2019 13:05:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32A92F8011E; Sat, 28 Dec 2019 13:05:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6DAF8011E
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 13:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6DAF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h9g4NRyb"
Received: from localhost (unknown [122.178.200.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A98020748;
 Sat, 28 Dec 2019 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577534724;
 bh=wJqzOZYfIUcwpsmayT7euq6E2bx0zdBap1jaRbyPzBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9g4NRybIzJEDKgs1IRroNq1Jq4yHpfiCZkRuZF/BYQJYqAj5V9t1L+M9rCyyLaea
 WG7EfAewoU6ouhF0RPwQlgwi4ssh423j4Gcww7REytIqYxYndl6FDTT5ilt/exuSBx
 OpUWbuuetvhqrmiGz1rEEPlhs63POYFlyEyS0DqU=
Date: Sat, 28 Dec 2019 17:35:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191228120520.GQ3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-7-pierre-louis.bossart@linux.intel.com>
 <20191227070301.GK3006@vkoul-mobl>
 <2913a70d-f1e1-7d91-eb3c-33005c5c4007@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2913a70d-f1e1-7d91-eb3c-33005c5c4007@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 06/17] soundwire: add support for
 sdw_slave_type
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

On 27-12-19, 17:26, Pierre-Louis Bossart wrote:
> 
> > >   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
> > >   {
> > > -	struct sdw_slave *slave = to_sdw_slave_device(dev);
> > > +	struct sdw_slave *slave;
> > >   	char modalias[32];
> > > -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> > > -
> > > -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
> > > -		return -ENOMEM;
> > > +	if (is_sdw_slave(dev)) {
> > > +		slave = to_sdw_slave_device(dev);
> > > +
> > > +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
> > > +
> > > +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> > > +			return -ENOMEM;
> > > +	} else {
> > > +		/*
> > > +		 * We only need to handle uevents for the Slave device
> > > +		 * type. This error cannot happen unless the .uevent
> > > +		 * callback is set to use this function for a
> > > +		 * different device type (e.g. Master or Monitor)
> > > +		 */
> > > +		dev_err(dev, "uevent for unknown Soundwire type\n");
> > > +		return -EINVAL;
> > 
> > At this point and after next patch, the above code would be a no-op, do
> > we want this here, if so why?
> 
> to be future proof if someone wants to add support for a monitor, as
> explained above.
> I can remove this if you don't want it.

It can be added with monitor support whenever that comes. We dont like
dead code in kernel, the piece can come when future arrives :)

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
