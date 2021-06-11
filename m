Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F23A4190
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 14:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD221947;
	Fri, 11 Jun 2021 13:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD221947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623412847;
	bh=TG1JTlsrmuTESaFmWCoPTxQZH4wWLM9/wtKG5Xnnols=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d18P/4kNRWeySQQfmeOr4YRyO8i0nprRHPXRf37hOC6LUJfYSC4shFnihg1Cl28Cp
	 zOQFFTio8tqVqTkzFKn7Y5OHgmOTHrBQz7Jyi+tLoMlDkMGwDuktOFbJ5AgdDIkVo5
	 WJm5/yUOnnUggrRd7PaayTYX8linwZ8Rr721EiFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C27BF80276;
	Fri, 11 Jun 2021 13:59:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C0EDF8026C; Fri, 11 Jun 2021 13:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1666F80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 13:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1666F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EO2dBSiX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BFFC6100A;
 Fri, 11 Jun 2021 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623412746;
 bh=TG1JTlsrmuTESaFmWCoPTxQZH4wWLM9/wtKG5Xnnols=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EO2dBSiXkacRHnCAPolfBCRDEb9OPbg1ve/EwFuOqHh3kQ5mmexfZVeOTacvMi6xp
 +mzmB1q9yORl91RgmESF8qGPlWgDdvEcBr4AgZnYc5eoJpg7ypimNG7J+vI1G2dQ+p
 zZXaZCPZNaQPnE1YI/hrKxrdP249y8lmcAt4fDQPBy4I78XSovibOPeaPj98w5YhK5
 vRDmOpOmDnhLm2oDCoDHDohoWglPpH077bUe+GYScp+JwYqD2CGLOQ/BLmVcHfktId
 f0GLWNRJBu3VWgrU679ez8Yv7sPIygYzjxwhFNkOT0cOUMP55JEesCFwDihUJONQ1w
 ty+J/ceLvCUtg==
Date: Fri, 11 Jun 2021 17:29:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMNQBpFX9DXcoGAc@vkoul-mobl>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 09-06-21, 09:44, Pierre-Louis Bossart wrote:
> 
> 
> On 6/8/21 11:46 PM, Vinod Koul wrote:
> > Hi Pierre,
> > 
> > You might want to check your setting, this and some other mail (not all
> > though) sent by you seem to have landed up in my spam folder, dont know
> > why gmail is doing that...
> 
> I haven't changed any of my configurations, not sure what happens?
> 
> > On 01-06-21, 08:56, Pierre-Louis Bossart wrote:
> > > 
> > > > > b) Vinod commented:
> > > > > 
> > > > > "What I would like to see the end result is that sdw driver for Intel
> > > > > controller here is a simple auxdev device and no additional custom setup
> > > > > layer required... which implies that this handling should be moved into
> > > > > auxdev or Intel code setting up auxdev..."
> > > > > 
> > > > > I was unable to figure out what this comment hinted at: the auxbus is
> > > > > already handled in the intel_init.c and intel.c files and the auxbus is used
> > > > > to model a set of links/managers below the PCI device, not the controller
> > > > > itself. There is also no such thing as a simple auxdev device used in the
> > > > > kernel today, the base layer is meant to be extended with domain-specific
> > > > > structures. There is really no point in creating a simple auxbus device
> > > > > without extensions.
> > > > 
> > > > <back from vacations>
> > > 
> > > same here :-)
> > > 
> > > > I would like to see that the init_init.c removed completely, that is my
> > > > ask here
> > > > 
> > > > This layer was created by me to aid in creating the platform devices.
> > > > Also the mistake was not to use platform resources and instead pass a
> > > > custom structure for resources (device iomem address, irq etc)
> > > 
> > > We are 100% aligned on the ask to remove intel_init.c, this layer is
> > > unnecessary and adds more work for developers/maintainers. We will move all
> > > this in the SOF driver.
> > > 
> > > > I would like to see is the PCI/SOF parent driver create the sdw aux
> > > > device and that should be all needed to be done. The aux device would be
> > > > probed by sdw driver. No custom resource structs for resources please.
> > > I was following the previous paragraph but got stuck on the last sentence
> > > 'no custom structs for resources', see below.
> > > 
> > > > If that is not possible, I would like to understand technical details of
> > > > why that would be that case. If required necessary changes should be
> > > > made to aux bus to handle and not have sequencing issue which you had
> > > > trouble with platform approach.
> > > 
> > > I don't know what you are referring to with the 'sequencing issue which you
> > > had trouble with platform approach'. We never had any technical issues with
> > > platform devices, the solution works and has been productized. We are only
> > > doing this iso-functionality transition because GregKH asked us to do only
> > > use platform devices IF there is a real platform device (controlled by
> > > DT/ACPI).
> > > 
> > > I think we are also having language/specification issues here. I don't
> > > understand what you describe as a 'resource' - there is no interaction with
> > > firmware - nor how we can avoid being domain-specific for something that is
> > > Intel-specific.
> > > 
> > > Let's go back to the code to help the discussion: the auxiliary driver which
> > > manages a SoundWire link needs to be provided with a 'custom' structure that
> > > describes basic information provided by the PCI parent (link masks, quirks,
> > > IO register bases) and contains internal fields needed for the link
> > > management (mutex, ops, list, etc). This is the structure we use:
> > > 
> > > struct sdw_intel_link_res {
> > > 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
> > > 	void __iomem *registers;
> > > 	void __iomem *shim;
> > > 	void __iomem *alh;
> > 
> > These are resources and any auxiliary_device should add this. That way
> > while creating you can set up. Hint look at how platform_device sets up
> > resources
> 
> If you look at the *existing* code, we don't handle any "resources" with the
> platform devices, we use the platform_device_info.data to pass the link
> information. It's a void pointer. We do not touch the resource field in the
> platform_device_into at all.

Yes that is true I dont disagree on that part. My ask here is to make it
better, it can be followed up after this but I would at least like to
agree on the direction.

> https://elixir.bootlin.com/linux/latest/source/drivers/soundwire/intel_init.c#L168
>
> > > 	int irq;
> > 
> > irq is a generic field and should be again moved into auxiliary_device
> 
> It's information passed by the parent so that all links use the same irq. We
> added this maybe 1.5 years ago after spending months chasing race conditions
> that we could not root cause. there's nothing generic about this field.
> 
> > > 	const struct sdw_intel_ops *ops;
> > 
> > This is for callbacks right? Why cant the sdw aux driver call APIs
> > exported by SOF driver?
> 
> this is part of the context, this could be moved to a different structure.

ok

> > > 	struct device *dev;
> > 
> > Why do you need a dev pointer here? Is this parent or something else?
> 
> for convenience for runtime_pm, there are cases where the link can suspend
> but the parent has to remain active due to power rail dependencies, so we
> need to handle pm_runtime_get_noresume() and pm_runtime_put_noidle().
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/soundwire/intel.h#L25
> 
> We already use this field *today*, this isn't new. I guess we could use
> dev->parent but that'd be a different patch.

Absolutely, that should be a different patch.

> 
> > > 	struct mutex *shim_lock; /* protect shared registers */
> > 
> > Okay so you serialize the access to shim across sdw and sof right?
> > export an api from sof driver and get rid of lock here
> 
> this is again something we do today. This is not a new field.
> 
> see the description here:
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/soundwire/intel.h#L25
> 
> This is not about serialization between SOF and SDW, only SDW drivers access
> the shim. It's about serialization between the different SDW driver
> instances accessing common hardware registers. Nothing new.

Yes this is existing and can be improved upon. I guess can be moved to
SOF driver?

> 
> > > 	u32 *shim_mask;
> > > 	u32 clock_stop_quirks;
> > > 	u32 link_mask;
> > > 	struct sdw_cdns *cdns;
> > > 	struct list_head list;
> > 
> > 
> > these sound as internal data to sdw instance, move into intel
> > driver instances
> 
> what intel driver?

Should have been clear, sdw intel driver

> 
> We have a PCI Intel driver for the parent (SOF) and a driver instance for
> each SoundWire link - probed when the parent creates the different SoundWire
> devices.
> 
> we need to have an Intel link driver which is different from the SOF driver
> used for the parent. This is information needed at the child level.
> 
> > > };
> > > 
> > > We could if it was desired for architectural clarity split this structure in
> > > what is provided by the parent and what is used inside of the auxiliary
> > > driver as an internal context that the parent doesn't touch, but these
> > > definitions are again Intel-specific.
> > 
> > So rather than think Intel specfic, I would suggest you think in generic
> > terms. You have a child auxiliary_device (think like PCI etc), add
> > the generic resources like iomem regions, irq etc and call into SOF
> > driver. That would make sdw driver look neat and help you get rid of
> > this bits
> 
> Not able to get what this means, sorry. the child device should not 'call
> into the SOF driver', mixing parent and child layers leads to disaster in
> general.
> 
> The model is exactly the same as what we have today with the platform
> devices. We did not add ANY new fields or information, what is passed in
> that structure is exactly the same as what we do upstream today with the
> platform devices.

Yes that is the correct thing to do from conversion point of view. But
as part of conversion, as a follow up patches I would like to see things
improved. My ask here again is to remove the init layer. I would have
liked the resources like irq and iomem ones moved into aux device, but
looks like consensus is that aux device will not support that!

> To make my point, here is the structure in intel.h as of v5.13-rc1
> 
> struct sdw_intel_link_res {
> 	struct platform_device *pdev;
> 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
> 	void __iomem *registers;
> 	void __iomem *shim;
> 	void __iomem *alh;
> 	int irq;
> 	const struct sdw_intel_ops *ops;
> 	struct device *dev;
> 	struct mutex *shim_lock; /* protect shared registers */
> 	u32 *shim_mask;
> 	u32 clock_stop_quirks;
> 	u32 link_mask;
> 	struct sdw_cdns *cdns;
> 	struct list_head list;
> };
> 
> and here's what we suggested in this patch:
> 
> struct sdw_intel_link_res {
> 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
> 	void __iomem *registers;
> 	void __iomem *shim;
> 	void __iomem *alh;
> 	int irq;
> 	const struct sdw_intel_ops *ops;
> 	struct device *dev;
> 	struct mutex *shim_lock; /* protect shared registers */
> 	u32 *shim_mask;
> 	u32 clock_stop_quirks;
> 	u32 link_mask;
> 	struct sdw_cdns *cdns;
> 	struct list_head list;
> };
> 
> You will notice that we removed the platform_device *pdev, but embedded this
> structure into a larger one to make use of container_of()
> 
> struct sdw_intel_link_dev {
> 	struct auxiliary_device auxdev;
> 	struct sdw_intel_link_res link_res;
> };
> 
> That's it. We did not change anything else, all the other fields are
> identical. We are only changing the TYPE of device and the interfaces for
> probe/remove but using the same information and the same device hierarchy.

The move in itself is okay but I dont think that should be the end goal.

-- 
~Vinod
