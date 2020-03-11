Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D418110A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:47:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B337166A;
	Wed, 11 Mar 2020 07:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B337166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583909258;
	bh=xz+sZJFmubD4ssEsM3A90XjoRD6psOOwHmjKnsrsbRM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6PgB0ezDDqh2ZxQ099srceuFsPky3kmIBXq/0zvvn9udh24IGb+BrQWSBTAPkc6K
	 1ChIqaBN6swhRTMFXAiEcMisNTALQinVfZ0C52bzr016iZYMiOcGqVr49dcTlOcY2E
	 ElkPLBz0RQ8GkVeb4OuxdB5luIsTMIo8oUaIIaRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE3E6F801A3;
	Wed, 11 Mar 2020 07:45:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B2AF801EB; Wed, 11 Mar 2020 07:45:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41349F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 07:45:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41349F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P1oqWI0b"
Received: from localhost (unknown [106.201.105.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8FE2208C4;
 Wed, 11 Mar 2020 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583908610;
 bh=xz+sZJFmubD4ssEsM3A90XjoRD6psOOwHmjKnsrsbRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1oqWI0bB64jxOIKXemfToG1CvrCaC6br86A0kjyJxQhPHifa7j2i9ugHhLGczlyo
 DPtJBSxqsush0+l/FD/Jlvdk9DM9kDk6X37pe3phnpMGJ0eByGOfBxisXuo70PzBxX
 +LSeueSF3WTfjkpcVDO1HuyZLHg6rx2tp//ZoDmI=
Date: Wed, 11 Mar 2020 12:06:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Message-ID: <20200311063645.GH4885@vkoul-mobl>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
 <20200304095312.GT4148@vkoul-mobl>
 <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
 <20200305063646.GW4148@vkoul-mobl>
 <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
 <20200306050115.GC4148@vkoul-mobl>
 <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

On 06-03-20, 09:40, Pierre-Louis Bossart wrote:
> > > > Why do you need a extra driver for this. Do you have another set of
> > > > device object and driver for DSP code? But you do manage that, right?
> > > > I am proposing to simplify the device model here and have only one
> > > > device (SOF PCI) and driver (SOF PCI driver), which is created by actual
> > > > bus (PCI here) as you have in rest of the driver like HDA, DSP etc.
> > > > 
> > > > I have already recommended is to make the int-sdw a module which is
> > > > invoked by SOF PCI driver code (thereby all code uses SOF PCI device and
> > > > SOF PCI driver) directly. The DSP in my time for skl was a separate
> > > > module but used the parent objects.
> > > > 
> > > > The SOF sdw init (the place where sdw routines are invoked after DSP
> > > > load) can call sdw_probe and startup. Based on DSP sequencing you can
> > > > call these functions directly without waiting for extra device to be
> > > > probed etc.
> > > > 
> > > > I feel your flows will be greatly simplified as a result of this.
> > > 
> > > Not at all, no. This is not a simplification but an extremely invasive
> > > proposal.
> > > 
> > > The parent-child relationship is extremely useful for power management, and
> > > guarantees that the PCI device remains on while one or more of the masters
> > > are used, and conversely can suspend when all links are idle. I currently
> > > don't need to do anything, it's all taken care of by the framework.
> > > 
> > > If I have to do all the power management at the PCI device level, then I
> > > will need to keep track of which links are currently active. All these links
> > > are used independently, so it's racy as hell to keep track of the usage when
> > > the pm framework already does so quite elegantly. You really want to use the
> > > pm_runtime_get/put refcount for each master device, not manage them from the
> > > PCI level.
> > 
> > Not at all, you still can call pm_runtime_get/put() calls in sdw module
> > for PCI device. That doesn't change at all.
> > 
> > Only change is for suspend/resume you have callbacks from PCI driver
> > rather than pm core.
> There are two other related issues that you didn't mention.
> 
> the ASoC layer does require a driver with a 'name' for the components
> registered with the master device. So if you don't have a driver for the
> master device, the DAIs will be associated with the PCI device.
> 
> But the ASoC core does make pm_runtime calls on its own,
> 
> soc_pcm_open(struct snd_pcm_substream *substream)
> {
> ...
> 	for_each_rtd_components(rtd, i, component)
> 		pm_runtime_get_sync(component->dev);
> 
> and if the device that's associated with the DAI is the PCI device, then
> that will not result in the relevant master IP being activated, only the PCI
> device refcount will be increased - meaning there is no hook that would tell
> the PCI layer to turn on a specific link.
> 
> What you are recommending would be an all-or-nothing solution with all links
> on or all links off, which beats the purpose of having independent
> link-level power management.

Why can't you use dai .startup callback for this?

The ASoC core will do pm_runtime calls that will ensure PCI device is
up, DSP firmware downloaded and running.

You can use .startup() to turn on your link and .shutdown to turn off
the link.

-- 
~Vinod
