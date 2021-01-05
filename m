Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319F2EA15E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 01:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74AC21679;
	Tue,  5 Jan 2021 01:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74AC21679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609805732;
	bh=L0w1Zk/E1FPOQGtHy//Onb415wbaJ7/Bddjcc/9PC/U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzPpc3awG3e2FbFFOHLKX6UAQbg95DCusIlQe+fzgCgPMShKzT6UA5yN/sm7PbRzq
	 YMw81oF36vwi26A+asJc39oLMG83aksOfD+v+e8ywT+eqVRbtCDdqvytBRxCcpj+fs
	 /pSOFGvEScG7WV6qrtJF4VaAeVLfw/kjAUhAJOik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D63BFF80167;
	Tue,  5 Jan 2021 01:13:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E81F80166; Tue,  5 Jan 2021 01:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,PRX_BODY_32,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6A14F8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 01:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A14F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qxfuyl5g"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff3af3e0002>; Mon, 04 Jan 2021 16:13:50 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 00:13:47 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.57) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 5 Jan 2021 00:13:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFK+FndG/cFiE3fxW/2iKBiUSK06fiuto1bMhKb1SnY3Ow6Pzp4sMp0afneZwshtZYDgXTcxsJ4vB3WXMDe4L4BrSbCK5vfgpIUgE/EccfnwkYWMdxrhTwMM/llBYq/VRIgJGeMaStWeq3XwQjAdP7tWHdLtttsHj4TFNfHC2S+xkanup04qZMw4uxsSo3PjjJAkNodQoIosfUQQwnqCTh7l6TfT1QxGiyR+R81dh5k9XGKEN5nSqgqH2aHgsRtpvOYcHKxLTJFJds6RuxBvHOnGgrJhBK3EYY05A3KgPbxFwGCXkLEkiC+6G/OzlYmSUIYK7GLBueZ2cmCSp5XNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouPoyixJhHTpwOQtyr0SENnRQLXTJ/B4V1AQwbdoQ+E=;
 b=LnwF3zFeGuDvJnOlUrzhDTXbUpIzYYq8LCCZMNwh675n58vYhgQHc+5blg+ISx7HGieYHgRRzilCxAc0H4ZGEqezulE8x/9CKB1LME2Cl9nMR9SXk3qeUb8XY4EG09bz6jWRp0GtLoJEjSYjdRMdKNY94m+Swc0G4Qk2bMSsojOMULMrVFib1dryCt8ZxnsB8DNfmuZPwcXxzBjBIBH4JVv1pETay2+gYDjvOJmMqNO0RSjPPAq3pa4hK3jmIyI+52RcWVFvbKPD9rjuNWflqWF3gfXSbhRI9aA1ckImr0pLVfOt2y4kLiV489aHFdHwsFk7dLT3we+TLvIbPTlOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:186::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 00:13:44 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 00:13:44 +0000
Date: Mon, 4 Jan 2021 20:13:41 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20210105001341.GL552508@nvidia.com>
References: <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk> <20201218162817.GX552508@nvidia.com>
 <20201218180310.GD5333@sirena.org.uk> <20201218184150.GY552508@nvidia.com>
 <20201218203211.GE5333@sirena.org.uk> <20201218205856.GZ552508@nvidia.com>
 <20201221185140.GD4521@sirena.org.uk> <20210104180831.GD552508@nvidia.com>
 <20210104211930.GI5645@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210104211930.GI5645@sirena.org.uk>
X-ClientProxiedBy: MN2PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:208:134::45) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 MN2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:208:134::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Tue, 5 Jan 2021 00:13:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kwZyn-0025iE-PI; Mon, 04 Jan 2021 20:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609805630; bh=ouPoyixJhHTpwOQtyr0SENnRQLXTJ/B4V1AQwbdoQ+E=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=qxfuyl5g/kR9w+ajGwau+5FZEwAJtDvC3UMqi3WiBOPaC04QfVmiQzMDPbFJ+m9JB
 dNii3ODMcuvXXz4jviuLyd6c3fi9BCdKLZpY5NkbNUlri4//6j3YbH2OW2I1nSjOi3
 lwdRBqAyMSYnam0aBtD6Q28oSIClTZPqMc9v48sUe7jLtfbkBOOvRT3BMi9nomWXgV
 Wh4dgL3DSJgliOtg7M8G8uieBzIUdhFDoBMzALvfyaW8DHBcAHJbwLCcqZxZlA0tq5
 Yi8R8Gld3MeYkdl8TIaFTDI80CDVu7eAissXPabehYbkHDaWlHNaCACDa1aEfaOTTQ
 40/FjwjJ31LMQ==
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, lee.jones@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam
 Girdwood <lgirdwood@gmail.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Martin Habets <mhabets@solarflare.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave
 Ertman <david.m.ertman@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

On Mon, Jan 04, 2021 at 09:19:30PM +0000, Mark Brown wrote:


> > Regardless of the shortcut to make everything a struct
> > platform_device, I think it was a mistake to put OF devices on
> > platform_bus. Those should have remained on some of_bus even if they
> 
> Like I keep saying the same thing applies to all non-enumerable buses -
> exactly the same considerations exist for all the other buses like I2C
> (including the ACPI naming issue you mention below), and for that matter
> with enumerable buses which can have firmware info.

And most busses do already have their own bus type. ACPI, I2C, PCI,
etc. It is just a few that have been squished into platform, notably
OF.
 
> > are represented by struct platform_device and fiddling in the core
> > done to make that work OK.
> 
> What exactly is the fiddling in the core here, I'm a bit unclear?

I'm not sure, but I bet there is a small fall out to making bus_type
not 1:1 with the struct device type.. Would have to attempt it to see

> > This feels like a good conference topic someday..
> 
> We should have this discussion *before* we get too far along with trying
> to implement things, we should at least have some idea where we want to
> head there.

Well, auxillary bus is clearly following the original bus model
intention with a dedicated bus type with a controlled naming
scheme. The debate here seems to be "what about platform bus" and
"what to do with mfd"?

> Those APIs all take a struct device for lookup so it's the same call for
> looking things up regardless of the bus the device is on or what
> firmware the system is using - where there are firmware specific lookup
> functions they're generally historical and shouldn't be used for new
> code.  It's generally something in the form
> 
> 	api_type *api_get(struct device *dev, const char *name);

Well, that is a nice improvement since a few years back when I last
worked on this stuff.

But now it begs the question, why not push harder to make 'struct
device' the generic universal access point and add some resource_get()
API along these lines so even a platform_device * isn't needed?

Then the path seems much clearer, add a multi-bus-type device_driver
that has a probe(struct device *) and uses the 'universal api_get()'
style interface to find the generic 'resources'.

The actual bus types and bus structs can then be split properly
without the boilerplate that caused them all to be merged to platform,
even PCI could be substantially merged like this.

Bonus points to replace the open coded method disptach:

int gpiod_count(struct device *dev, const char *con_id)
{
	int count = -ENOENT;

	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
		count = of_gpio_get_count(dev, con_id);
	else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
		count = acpi_gpio_count(dev, con_id);

	if (count < 0)
		count = platform_gpio_count(dev, con_id);

With an actual bus specific virtual function:

    return dev->bus->gpio_count(dev);

> ...and then do the same thing for every other bus with firmware
> bindings.  If it's about the firmware interfaces it really isn't a
> platform bus specific thing.  It's not clear to me if that's what it is
> though or if this is just some tangent.

It should be split up based on the unique naming scheme and any bus
specific API elements - like raw access to ACPI or OF data or what
have you for other FW bus types.

Jason
