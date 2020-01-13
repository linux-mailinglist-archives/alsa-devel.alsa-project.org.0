Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E8138AA5
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 06:20:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94AE38;
	Mon, 13 Jan 2020 06:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94AE38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578892803;
	bh=MkJcZhlDh1fpL7pzqRZlxAlNT8v6pK9A9kIrLJ6Htpw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJnGxcH8n9D5jp0cW99bAj/lBMmO3bBF7mrB3Zstah4KnJpMQ5lvNWe3wfbLbZ6Oz
	 IOFI5/VIlNr7SHWRJYDQv+pi+XVBc70/XbVIQTWv/wlu4w/nMUzB9LRV6vpwIIIUkD
	 pbiHT0SXeYUv9mvqmpv9N6c2GkgfOp/3xVAnbRyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B32F801EB;
	Mon, 13 Jan 2020 06:18:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73BE1F801EB; Mon, 13 Jan 2020 06:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D33DF80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 06:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D33DF80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j3jz0N5A"
Received: from localhost (unknown [106.200.247.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A14E9214D8;
 Mon, 13 Jan 2020 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578892686;
 bh=3JKBMvq4OBBdAcG1hCHnQX+4annnKW7d3wE9F87ZrQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3jz0N5Aoe9CXGAepvpGpVO8BvntXLyGAFDvV2r7gStAYSdri3pOEjAVGuvqE90DX
 IU625KzcsjrajuGt3ZYEMNwOnVbQoMuroxzAJ0S22qj4gYUwgeuLYppsABVWD+IGYC
 NEXfnlIRxHM3j/ghpm4vg8BvyL1CtREVllqfgrtI=
Date: Mon, 13 Jan 2020 10:48:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200113051800.GP2818@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
 <20191227090826.GM3006@vkoul-mobl>
 <5be4d9df-0f46-d36f-471c-aae9e1f55cc0@linux.intel.com>
 <20200106054221.GN2818@vkoul-mobl>
 <32ae46a7-59ee-4815-270a-a519ff462345@linux.intel.com>
 <20200110064303.GX2818@vkoul-mobl>
 <39000dd7-3f77-bc33-0ad3-aa47ba2360f7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39000dd7-3f77-bc33-0ad3-aa47ba2360f7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 09/17] soundwire: intel: remove platform
 devices and use 'Master Devices' instead
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

On 10-01-20, 10:08, Pierre-Louis Bossart wrote:
> 
> > > > The "big" difference is that probe is called by core (asoc) and not by
> > > > driver onto themselves.. IMO that needs to go away.
> > > 
> > > What I did is not different from what existed already with platform devices.
> > > They were manually created, weren't they?
> > 
> > Manual creation of device based on a requirement is different, did I ask
> > you why you are creating device :)
> > 
> > I am simple asking you not to call probe in the driver. If you need
> > that, move it to core! We do not want these kind of things in the
> > drivers...
> 
> What core are you talking about?

soundwire core ofcourse! IMO All that which goes into soundwire-bus-objs is
considered as soundwire core part and rest are drivers intel, qc, so on!
> 
> The SOF intel driver needs to create a device, which will then be bound with
> a SoundWire master driver.
> 
> What I am doing is no different from what your team did with
> platform_register_device, I am really lost on what you are asking.

Again repeating myself, you call an API to do that is absolutely fine,
but we don't do that in drivers or open code these things

> > > > > FWIW, the implementation here follows what was suggested for Greybus 'Host
> > > > > Devices' [1] [2], so it's not like I am creating any sort of dangerous
> > > > > precedent.
> > > > > 
> > > > > [1]
> > > > > https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
> > > > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124
> > > > 
> > > > And if you look closely all this work is done by core not by drivers!
> > > > Drivers _should_ never do all this, it is the job of core to do that for
> > > > you.
> > > 
> > > Please look at the code again, you have a USB probe that will manually call
> > > the GreyBus device creation.
> > > 
> > > static int ap_probe(struct usb_interface *interface,
> > > 		    const struct usb_device_id *id)
> > > {
> > > 	hd = gb_hd_create(&es2_driver, &udev->dev, 	
> > > 
> > > 
> > > static struct usb_driver es2_ap_driver = {
> > > 	.name =		"es2_ap_driver",
> > > 	.probe =	ap_probe, <<< code above
> > > 	.disconnect =	ap_disconnect,
> > > 	.id_table =	id_table,
> > > 	.soft_unbind =	1,
> > > };
> > 
> > Look closely the driver es2 calls into greybus core hd.c and gets the
> > work done, subtle but a big differances in the approaches..
> 
> I am sorry, I have absolutely no idea what you are referring to.
> 
> The code I copy/pasted here makes no call to the greybus core, it's ap_probe
> -> gb_hd_create. No core involved. If I am mistaken, please show me what I
> got wrong.

1. es2_ap_driver is host controller driver

2. gb_hd_create() is an API provided by greybus core!

es2 driver doesn't open code creation like you are doing in intel driver,
it doesn't call probe on its own, greybus does that

This is very common pattern in linux kernel subsytems, drivers dont do
these things, the respective subsystem core does that... see about es2
driver and implementation of gb_hd_create(). See callers of
platform_register_device() and its implementation.

I don't know how else I can explain this to you, is something wrong in
how I conveyed this info or you... or something else, I dont know!!!

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
