Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D9347686
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 11:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DDC1679;
	Wed, 24 Mar 2021 11:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DDC1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616583130;
	bh=/DCxC4MVMwIyzSFr6RbtguBXrzP9DLGR2jAPymHThME=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwDuAPWQmWYG1VtY/YGg+o57++660xs3bZeGtUaeyjYhmjpUQ4fhG2fHI8ahbhpqB
	 RzvJ1zKrZq7grw1uXZ2/BNXgOhkK9UeJz7eEewR53tkZeW1ifsTapBxoWFPdgS2h95
	 ZppBm76p1CMQPyMdeQuFV8EWPLv2DbjC1LCU1yOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68858F801D5;
	Wed, 24 Mar 2021 11:50:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0247F8016B; Wed, 24 Mar 2021 11:50:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B3A3F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 11:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B3A3F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O/bb6DGf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C01561993;
 Wed, 24 Mar 2021 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616583034;
 bh=/DCxC4MVMwIyzSFr6RbtguBXrzP9DLGR2jAPymHThME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/bb6DGfhUw3ZD/fBgjnliOhlyeWcJEfnOPKuMY1sWDr2uonei9+EPjyNb0WvtAH5
 +hGC29q8lYpEuAQbAQU98/VRNx8lOL7DaAhno/4kJbOuLgx4MGaFxB/BVmDSY+Be1S
 Kx28X42Dlv0d/APh7T2603xisumy4BGcKZKHeczJfL4CijroP7D3/PfgQjCPkFKcu7
 bZN1jp5Vgd+ENJDx6SFnaBEG7ap6ig4bwQpnwnp8QDFDCQkfDQ8LbmdLBgbEdDnIFy
 ACqGWTK1zMR/LG3yP0o3oP34Jv3Sa1DjN6cu7su40Pd72A1kiQxZSCx1MwWqZdP0O3
 oqmlTTyLnm/Yw==
Date: Wed, 24 Mar 2021 16:20:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
Message-ID: <YFsZdiVQpLfsWmv2@vkoul-mobl.Dlink>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmPTkNkX6QPWiCa@vkoul-mobl.Dlink> <YFma1ClahDe2bZhR@kroah.com>
 <aa9cfc49-913e-b3ba-1d92-2fab55bf4fa7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa9cfc49-913e-b3ba-1d92-2fab55bf4fa7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
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

On 23-03-21, 12:29, Pierre-Louis Bossart wrote:
> Thanks Greg and Vinod for the reviews
> 
> > > > -static int intel_master_probe(struct platform_device *pdev)
> > > > +static int intel_link_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
> > > >   {
> > > > -	struct device *dev = &pdev->dev;
> > > > +	struct device *dev = &auxdev->dev;
> > > > +	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
> > > 
> > > Do we need another abstractions for resources here, why not aux dev
> > > creation set the resources required and we skip this step...
> 
> Not sure what resources you are referring to?

Resources in the sdw_intel_link_dev which are sdw_intel_link_res. They
should be resources for auxdev and if you do that lets you get rid of
this abstraction.

> 
> this is just a container_of() and the documented way of extending the auxbus
> (see https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#example-usage)
> 
> 
> struct sdw_intel_link_dev {
> 	struct auxiliary_device auxdev;
> 	struct sdw_intel_link_res link_res;
> };
> 
> #define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
> 	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)
> 
> > > >   	struct sdw_intel *sdw;
> > > >   	struct sdw_cdns *cdns;
> > > >   	struct sdw_bus *bus;
> > > > @@ -1346,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
> > > >   	cdns = &sdw->cdns;
> > > >   	bus = &cdns->bus;
> > > > -	sdw->instance = pdev->id;
> > > > -	sdw->link_res = dev_get_platdata(dev);
> > > > +	sdw->instance = auxdev->id;
> > > 
> > > so auxdev has id and still we pass id as argument :( Not sure if folks
> > > can fix this now
> > 
> > That's odd, yeah, it should be fixed.
> 
> I think we are talking about different things?
> 
> this is defined in mod_devicetable.h:
> 
> struct auxiliary_device_id {
> 	char name[AUXILIARY_NAME_SIZE];
> 	kernel_ulong_t driver_data;
> };
> 
> and used for the driver probe:
> 
> 	ret = auxdrv->probe(auxdev, auxiliary_match_id(auxdrv->id_table, auxdev));
> 
> but there is a separate id:
> 
> struct auxiliary_device {
> 	struct device dev;
> 	const char *name;
> 	u32 id;
> };
> 
> which is set during the device initialization in intel_init.c
> 
> 	/* we don't use an IDA since we already have a link ID */
> 	auxdev->id = link_id;
> 
> In the auxiliary bus design, the parent has to take care of managing this
> id, be it with an IDA or as we do here with a physical link ID that is
> unique.

Aha, maybe both of them should not be 'id' to avoid this confusion!

That also reminds me that we have duplicate info:

+       sdw->instance = auxdev->id;
+       bus->link_id = auxdev->id;

drop the local driver instance and use bus->link_id please

> in short, I don't see how I could change the code given the differences in
> concepts?

-- 
~Vinod
