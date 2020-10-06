Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641A284EEE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1894D172F;
	Tue,  6 Oct 2020 17:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1894D172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601998034;
	bh=AbyQLPdBYmWHDUbTDkMWbCK1310XTbhWe/9BLFaNfSI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4ixDts+ThJoZ9j4KGjmAEeTEG2SPsgeqt+omqoy1zdydcVfIyouWXcpLb1qNfiKp
	 Vnd1ueQueWg2pjAo+CIHjH6AnIFXI3jyhnhm3c5E/Taf7u4lKoU+6+xyJ+HBcgHnw2
	 XQpgX4q4YRfut1CpaXUTUT2Tm+XTecqXLum7KfEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748F1F8012C;
	Tue,  6 Oct 2020 17:25:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B493F8012B; Tue,  6 Oct 2020 17:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD05EF80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD05EF80127
IronPort-SDR: SiOVVLccaAN0tbtTp542L6uUtNBF5ku+uNhydzlCkwL2N9kYDRG8/FuRzOJ0wADx+Zes4fkcfr
 qoBYXqXRm88Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="226132625"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="226132625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 08:18:10 -0700
IronPort-SDR: jyseSU0pg3l97W6nWc2ghmP+1PlhkgiTtjpSWzlQToieuZXfHvP5XeXyhpnzuq+dfIx1uY6gyr
 n6Y0n91f/yMQ==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="460840058"
Received: from mforsman-mobl.amr.corp.intel.com (HELO [10.212.97.68])
 ([10.212.97.68])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 08:18:08 -0700
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Leon Romanovsky <leon@kernel.org>, Dave Ertman <david.m.ertman@intel.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
Date: Tue, 6 Oct 2020 10:18:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006071821.GI1874917@unreal>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, parav@mellanox.com, tiwai@suse.de,
 netdev@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 fred.oh@linux.intel.com, linux-rdma@vger.kernel.org, dledford@redhat.com,
 broonie@kernel.org, jgg@nvidia.com, gregkh@linuxfoundation.org,
 kuba@kernel.org, dan.j.williams@intel.com, shiraz.saleem@intel.com,
 davem@davemloft.net, kiran.patil@intel.com
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

Thanks for the review Leon.

>> Add support for the Ancillary Bus, ancillary_device and ancillary_driver.
>> It enables drivers to create an ancillary_device and bind an
>> ancillary_driver to it.
> 
> I was under impression that this name is going to be changed.

It's part of the opens stated in the cover letter.

[...]

>> +	const struct my_driver my_drv = {
>> +		.ancillary_drv = {
>> +			.driver = {
>> +				.name = "myancillarydrv",
> 
> Why do we need to give control over driver name to the driver authors?
> It can be problematic if author puts name that already exists.

Good point. When I used the ancillary_devices for my own SoundWire test, 
the driver name didn't seem specifically meaningful but needed to be set 
to something, what mattered was the id_table. Just thinking aloud, maybe 
we can add prefixing with KMOD_BUILD, as we've done already to avoid 
collisions between device names?

[...]

>> +int __ancillary_device_add(struct ancillary_device *ancildev, const char *modname)
>> +{
>> +	struct device *dev = &ancildev->dev;
>> +	int ret;
>> +
>> +	if (!modname) {
>> +		pr_err("ancillary device modname is NULL\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = dev_set_name(dev, "%s.%s.%d", modname, ancildev->name, ancildev->id);
>> +	if (ret) {
>> +		pr_err("ancillary device dev_set_name failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = device_add(dev);
>> +	if (ret)
>> +		dev_err(dev, "adding ancillary device failed!: %d\n", ret);
>> +
>> +	return ret;
>> +}
> 
> Sorry, but this is very strange API that requires users to put
> internal call to "dev" that is buried inside "struct ancillary_device".
> 
> For example in your next patch, you write this "put_device(&cdev->ancildev.dev);"
> 
> I'm pretty sure that the amount of bugs in error unwind will be
> astonishing, so if you are doing wrappers over core code, better do not
> pass complexity to the users.

In initial reviews, there was pushback on adding wrappers that don't do 
anything except for a pointer indirection.

Others had concerns that the API wasn't balanced and blurring layers.

Both points have merits IMHO. Do we want wrappers for everything and 
completely hide the low-level device?

> 
>> +EXPORT_SYMBOL_GPL(__ancillary_device_add);
>> +
>> +static int ancillary_probe_driver(struct device *dev)
>> +{
>> +	struct ancillary_driver *ancildrv = to_ancillary_drv(dev->driver);
>> +	struct ancillary_device *ancildev = to_ancillary_dev(dev);
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach(dev, true);
>> +	if (ret) {
>> +		dev_warn(dev, "Failed to attach to PM Domain : %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ancildrv->probe(ancildev, ancillary_match_id(ancildrv->id_table, ancildev));
> 
> I don't think that you need to call ->probe() if ancillary_match_id()
> returned NULL and probably that check should be done before
> dev_pm_domain_attach().

we'll look into this.

> 
>> +	if (ret)
>> +		dev_pm_domain_detach(dev, true);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ancillary_remove_driver(struct device *dev)
>> +{
>> +	struct ancillary_driver *ancildrv = to_ancillary_drv(dev->driver);
>> +	struct ancillary_device *ancildev = to_ancillary_dev(dev);
>> +	int ret;
>> +
>> +	ret = ancildrv->remove(ancildev);
>> +	dev_pm_domain_detach(dev, true);
>> +
>> +	return ret;
> 
> You returned an error to user and detached from PM, what will user do
> with this information? Should user ignore it? retry?

That comment was also provided in earlier reviews. In practice the error 
is typically ignored so there was a suggestion to move the return type 
to void, that could be done if this was desired by the majority.

[...]

>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>> index 5b08a473cdba..7d596dc30833 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -838,4 +838,12 @@ struct mhi_device_id {
>>   	kernel_ulong_t driver_data;
>>   };
>>
>> +#define ANCILLARY_NAME_SIZE 32
>> +#define ANCILLARY_MODULE_PREFIX "ancillary:"
>> +
>> +struct ancillary_device_id {
>> +	char name[ANCILLARY_NAME_SIZE];
> 
> I hope that this be enough.

Are you suggesting a different value to allow for a longer string?
