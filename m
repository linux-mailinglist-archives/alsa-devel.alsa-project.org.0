Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1912359C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 20:26:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561F2950;
	Tue, 17 Dec 2019 20:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561F2950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576610770;
	bh=SEHGD+AjRjEU36Qx9YklqJxHUdXNxQW4ydpd9TzGPDU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boF5gfHZleDsMYzL71O5p/NWh4tjQ6qo3MDuYezwcnj6kPhl5+Gv2th6EJXNodI7v
	 lYXcM3GFfK3ewUDzgRERWSpjemHHdo02jdw+sVeHU9FSvysrwez5zd7lykL3Pj1hQN
	 RWLhykzXmbx81sSxMNL7vSqsaEb8LGuEgtiLIa1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E5E3F80234;
	Tue, 17 Dec 2019 20:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7743BF80234; Tue, 17 Dec 2019 20:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 47CC0F80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 20:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CC0F80088
Received: from [192.168.178.106] (pD95EF574.dip0.t-ipconnect.de
 [217.94.245.116])
 by mail.bugwerft.de (Postfix) with ESMTPSA id BC582281AEB;
 Tue, 17 Dec 2019 19:17:55 +0000 (UTC)
To: Lee Jones <lee.jones@linaro.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org> <20191217133952.GJ18955@dell>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <ce6e0b19-ec40-c17b-cee6-05eca52d5df3@zonque.org>
Date: Tue, 17 Dec 2019 20:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217133952.GJ18955@dell>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
	transceivers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Lee,

Thanks a lot for your review, much appreciated.

I'll leave out the trivial things from your reply and address those in a v2.

I'm well aware of the fact that there are some details in this driver 
stack that deserve discussion. I wanted to title this set 'RFC', but I 
forgot to do so when I sent it.

On 12/17/19 2:39 PM, Lee Jones wrote:
> On Mon, 09 Dec 2019, Daniel Mack wrote:
> 
>> The core driver for these devices is split into several parts.
>>
>> The master node driver is an I2C client. It is responsible for
>> bringing up the bus topology and discovering the slave nodes.
>> This process requries some knowlegde of the slave node configuration
>> to program the bus timings correctly, so the master drivers walks
>> the tree of nodes in the devicetree. The slave driver handles platform
>> devices that are instantiated by the master node driver after
>> discovery has finished.
>>
>> Master nodes expose two addresses on the I2C bus, one (referred to as
>> 'BASE' in the datasheet) for accessing registers on the transceiver
>> node itself, and one (referred to as 'BUS') for accessing remote
>> registers, either on the remote transceiver itself, or on I2C hardware
>> connected to that remote transceiver, which then acts as a remote I2C
>> bus master.
>>
>> In order to allow MFD sub-devices to be registered as children of
>> either the master or any slave node, the details on how to access the
>> registers are hidden behind a regmap config. A pointer to the regmap
>> is then exposed in the struct shared with the sub-devices.
>>
>> The ad242x-bus driver is a simple proxy that occupies the BUS I2C
>> address and which is referred to through a devicetree handle by the
>> master driver.
>>
>> For the discovery process, the driver has to wait for an interrupt
>> to occur. In case no interrupt is configured in DT, the driver falls
>> back to interrupt polling. After the discovery phase is completed,
>> interrupts are only needed for error handling and GPIO handling,
>> both of which is not currenty implemented.
>>
>> Code common to both the master and the slave driver lives in
>> 'ad242x-node.c'.


>> +++ b/drivers/mfd/ad242x-bus.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/mfd/ad242x.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +
>> +static int ad242x_bus_i2c_probe(struct i2c_client *i2c,
>> +				const struct i2c_device_id *id)
>> +{
>> +	dev_set_drvdata(&i2c->dev, i2c);
>> +	i2c_set_clientdata(i2c, &i2c->dev);
> 
> Please explain to me what you think is happening here.
> 
>> +	return 0;
>> +}
> 
> What does this driver do?  Seems kinda pointless?

As explained in the commit log, these devices expose two addresses on 
the i2c bus, and each of which exists for a distinct purpose. The 
primary one is used to access registers on the master node itself, the 
second one is proxying traffic to remote nodes.

Now, the question is how to support that, and the approach chosen here 
is to have a dummy driver sitting on the 2nd address, and to reach out 
to it via a DT phandle from the master node. I don't like that much 
either, but I'm not aware of a cleaner way to bind two addresses with 
one driver. If there is any, I'd be happy to change that.

>> +struct ad242x_node *ad242x_master_get_node(struct ad242x_master *master)
>> +{
>> +	return &master->node;
>> +}
>> +EXPORT_SYMBOL_GPL(ad242x_master_get_node);
>> +
>> +struct ad242x_i2c_bus *ad242x_master_get_bus(struct ad242x_master *master)
>> +{
>> +	return &master->bus;
>> +}
>> +EXPORT_SYMBOL_GPL(ad242x_master_get_bus);
>> +
>> +const char *ad242x_master_get_clk_name(struct ad242x_master *master)
>> +{
>> +	return __clk_get_name(master->sync_clk);
>> +}
>> +EXPORT_SYMBOL_GPL(ad242x_master_get_clk_name);
>> +
>> +unsigned int ad242x_master_get_clk_rate(struct ad242x_master *master)
>> +{
>> +	return master->sync_clk_rate;
>> +}
>> +EXPORT_SYMBOL_GPL(ad242x_master_get_clk_rate);
> 
> All of these functions provide abstraction for the sake of
> abstraction.  They should be removed and replaced with the code
> contained within them.

That would mean to expose the internals of the struct, which is what I 
wanted to avoid. But okay, I'll see how the respin of this driver looks 
like and reconsider.

>> +	return ret == 0 ? -ETIMEDOUT : 0;
>> +}
>> +
>> +/* See Table 3-2 in the datasheet */
> 
> Do you provide a link to the datasheet anywhere?

Yes, in the cover letter. But you're right, I can add that to the code 
as well. Will do.

>> +static unsigned int ad242x_master_respoffs(struct ad242x_node *node)
>> +{
>> +	if (node->tdm_mode == 2 && node->tdm_slot_size == 16)
>> +		return 238;
>> +
>> +	if ((node->tdm_mode == 2 && node->tdm_slot_size == 32) ||
>> +	    (node->tdm_mode == 4 && node->tdm_slot_size == 16))
>> +		return 245;
>> +
>> +	return 248;
> 
> No magic numbers please.  You need to define them.

I generally agree, but these are just magic numbers in the datasheet.
You're thinking of something like this, next to a comment?

   #define AD242X_RESPOFFS_248 248

>> +	master->sync_clk_rate = clk_get_rate(master->sync_clk);
>> +	if (master->sync_clk_rate != 44100 && master->sync_clk_rate != 48000) {
> 
> Please define these magic numbers.
> 
> Something descriptive that tells us what the different clock speeds
> do.

The device can only operate on one of the two clock speeds. I can add a 
comment on that, but do you think defines for these two particular 
constants would make the code more readable?

>> +	master->dn_slot_alt_fmt =
>> +		of_property_read_bool(dev->of_node,
>> +				      "adi,alternate-downstream-slot-format");
>> +	master->up_slot_alt_fmt =
>> +		of_property_read_bool(dev->of_node,
>> +				      "adi,alternate-upstream-slot-format");
> 
> Obviously this all needs to be run past the DT maintainer(s).

Yes, absolutely. I believe I copied them all in the thread.

>> +	/* Register platform devices for nodes */
>> +
>> +	for_each_available_child_of_node(nodes_np, np)
>> +		of_platform_device_create(np, NULL, dev);
> 
> What are you doing here?
> 
> Either use OF to register all child devices OR use MFD, not a mixture
> of both.

Okay, this one is interesting, and I'd really appreciate some guidance here.

What the master node driver does here is register a number of slave node 
devices which are then handled by the driver in ad242x-slave.c. Because 
the master is not able to auto-probe slave nodes, users need to define 
them manually in DT. The driver will try to discover them at probe time, 
and then create a platform device for each of them.

Both the master driver and the slave driver are then registering 
sub-devices for functions (such as GPIO, clk, audio-codec etc) via MFD, 
as they can be enabled on both device types. And the function-drivers 
are agnostic about whether the device type (master or slave) they 
communicate with.

What would be a good way to support this scheme if not by a mixture of 
child devices and MFD?

>> +static int ad242x_slave_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ad242x_slave *slave;
>> +	struct ad242x_node *mnode;
>> +	struct regmap *regmap;
>> +	unsigned int val;
>> +	int i, ret;
>> +
>> +	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
>> +	if (!slave)
>> +		return -ENOMEM;
>> +
>> +	regmap = devm_regmap_init(dev, NULL, slave, &ad242x_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		ret = PTR_ERR(regmap);
>> +		dev_err(dev, "regmap init failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	of_property_read_u32(dev->of_node, "reg", &val);
>> +	slave->node.id = val;
> 
> This looks like an abuse of the 'reg' property.

I had my doubts about that as well, but I've found my places that do 
similar things. Not sure, but of course that can be renamed.


Again, thanks for your review.

Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
