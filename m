Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5401158F1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AA818BF;
	Tue,  7 May 2019 07:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AA818BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206970;
	bh=5omYXfUonX30HtwcjRKjla79q340DgrHtQP/qEx+7EM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoFt34DwPwjS69rBzHlFsLk2m1Rbf0NvhjZbTzlz9wFMMs1DJE2mnB2+h/XGH3L7p
	 xxQXPELedhzZi8QqZaWC1JqZqheCTB1w6oRjnIcyzo8s9JsOTt07RO+R4ixIm7rT6/
	 QIj3uEXvHkzLQh8uFySS8wSj7zffOKc5rZnlK2e4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 215A6F89678;
	Tue,  7 May 2019 07:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68FA8F89674; Tue,  7 May 2019 07:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 037DFF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 07:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 037DFF89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C/+Tyj3E"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99391206A3;
 Tue,  7 May 2019 05:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557206858;
 bh=UVbc4iB6zImLc+u0YFa5xDna8kmTDTd7akBPgEp3Vm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C/+Tyj3EJnEfQtmPl4wAuOQmnEKvTFlW8qYh1dF6fbWNETkJKsnDW4/hwieXjvtRh
 e6JxXYLq0TKNmzbFmn/p+2eDhYS30fnWzdO6OAXl9PLL0ps1lSJktKaNZeYrHg1sq4
 XDQEjEqG4MpYNu5dAjwWMA0jGzYWSNhwVqhJBhGA=
Date: Tue, 7 May 2019 10:57:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190507052732.GD16052@vkoul-mobl>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
 <20190504065242.GA9770@kroah.com>
 <b0059709-027e-26c4-25a1-bd55df7c507f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0059709-027e-26c4-25a1-bd55df7c507f@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
 master(s)
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

On 06-05-19, 21:24, Pierre-Louis Bossart wrote:
> 
> > > +int sdw_sysfs_bus_init(struct sdw_bus *bus)
> > > +{
> > > +	struct sdw_master_sysfs *master;
> > > +	int err;
> > > +
> > > +	if (bus->sysfs) {
> > > +		dev_err(bus->dev, "SDW sysfs is already initialized\n");
> > > +		return -EIO;
> > > +	}
> > > +
> > > +	master = kzalloc(sizeof(*master), GFP_KERNEL);
> > > +	if (!master)
> > > +		return -ENOMEM;
> > 
> > Why are you creating a whole new device to put all of this under?  Is
> > this needed?  What will the sysfs tree look like when you do this?  Why
> > can't the "bus" device just get all of these attributes and no second
> > device be created?
> 
> I tried a quick hack and indeed we could simplify the code with something as
> simple as:
> 
> [attributes omitted]
> 
> static const struct attribute_group sdw_master_node_group = {
> 	.attrs = master_node_attrs,
> 	.name = "mipi-disco"
> };
> 
> int sdw_sysfs_bus_init(struct sdw_bus *bus)
> {
> 	return sysfs_create_group(&bus->dev->kobj, &sdw_master_node_group);
> }
> 
> void sdw_sysfs_bus_exit(struct sdw_bus *bus)
> {
> 	sysfs_remove_group(&bus->dev->kobj, &sdw_master_node_group);	
> }
> 
> which gives me a simpler structure and doesn't require additional
> pretend-devices:
> 
> /sys/bus/acpi/devices/PRP00001:00/int-sdw.0/mipi-disco# ls
> clock_gears
> /sys/bus/acpi/devices/PRP00001:00/int-sdw.0/mipi-disco# more clock_gears
> 8086
> 
> The issue I have is that for the _show() functions, I don't see a way to go
> from the device argument to bus. In the example above I forced the output
> but would need a helper.
> 
> static ssize_t clock_gears_show(struct device *dev,
> 				struct device_attribute *attr, char *buf)
> {
> 	struct sdw_bus *bus; // this is what I need to find from dev
> 	ssize_t size = 0;
> 	int i;
> 
> 	return sprintf(buf, "%d \n", 8086);
> }
> 
> my brain is starting to fry, but I don't see how container_of() would work
> here since the bus structure contains a pointer to the device. I don't also
> see a way to check for all devices for the bus_type soundwire.
> For the slaves we do have a macro based on container_of(), so wondering if
> we made a mistake in the bus definition? Vinod, any thoughts?

yeah I dont recall a way to get bus fed into create_group, I did look at
the other examples back then and IIRC and most of them were using a
global to do the trick (I didn't want to go down that route).

I think that was the reason I wrote it this way...

BTW if you do use psedo-device you can create your own struct foo which
embeds device and then then you can use container approach to get foo
(and foo contains bus as a member).

Greg, any thoughts?

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
