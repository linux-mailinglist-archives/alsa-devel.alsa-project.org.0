Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F75288AD8
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 16:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C47D1658;
	Fri,  9 Oct 2020 16:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C47D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602253732;
	bh=g79A2zWaiQzREGsuYtTY5BWsaj1TKuX6pMtdTz51DH8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VunHeCurW45+sGcvoiufzfsCWs1nlW4QGgkGpjOgw9vmr+iggJrhG30BKhHHuOjnu
	 e+OVuAwaWpwOxMXS1S065RwModrAsmFBzRJxHd+t3AHhowrCAslibRAhIiZGBHM5rD
	 yihlvRZbSer8HU9nTbBbK8D/LYd3OgOFn74dcAzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF6F3F80165;
	Fri,  9 Oct 2020 16:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05A7F8015B; Fri,  9 Oct 2020 16:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,PRX_BODY_72,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7436F800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 16:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7436F800BF
IronPort-SDR: Gdg4uHvvKVx+VKri10FsiLIOSNp3Q8dInHcUx85YXnW/ufGo+kkE9s9znWg5DZkfOJKXar6RYq
 FChmqZW7HDZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="153324093"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="153324093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:26:57 -0700
IronPort-SDR: 3ts88toX+FpcSjw/MRIl9XJpFPlGTxsTARgljTKSbiRwG08//VzNz1NdpgGIcGrXsOiuc7viXz
 hpGhmMNa224Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419460732"
Received: from sjkim-mobl1.amr.corp.intel.com (HELO [10.212.131.60])
 ([10.212.131.60])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:26:55 -0700
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Dan Williams <dan.j.williams@intel.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006172317.GN1874917@unreal>
 <DM6PR11MB2841976B8E89C980CCC29AD2DD0B0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <CAPcyv4hoS7ZT_PPrXqFBzEHBKL-O4x1jHtY8x9WWesCPA=2E0g@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7dbbc51c-2cbd-a7c5-69de-76f190f1d130@linux.intel.com>
Date: Fri, 9 Oct 2020 09:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hoS7ZT_PPrXqFBzEHBKL-O4x1jHtY8x9WWesCPA=2E0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, Leon Romanovsky <leon@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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



>>>> +
>>>> +   ancildrv->driver.owner = owner;
>>>> +   ancildrv->driver.bus = &ancillary_bus_type;
>>>> +   ancildrv->driver.probe = ancillary_probe_driver;
>>>> +   ancildrv->driver.remove = ancillary_remove_driver;
>>>> +   ancildrv->driver.shutdown = ancillary_shutdown_driver;
>>>> +
>>>
>>> I think that this part is wrong, probe/remove/shutdown functions should
>>> come from ancillary_bus_type.
>>
>>  From checking other usage cases, this is the model that is used for probe, remove,
>> and shutdown in drivers.  Here is the example from Greybus.
>>
>> int greybus_register_driver(struct greybus_driver *driver, struct module *owner,
>>                              const char *mod_name)
>> {
>>          int retval;
>>
>>          if (greybus_disabled())
>>                  return -ENODEV;
>>
>>          driver->driver.bus = &greybus_bus_type;
>>          driver->driver.name = driver->name;
>>          driver->driver.probe = greybus_probe;
>>          driver->driver.remove = greybus_remove;
>>          driver->driver.owner = owner;
>>          driver->driver.mod_name = mod_name;
>>
>>
>>> You are overwriting private device_driver
>>> callbacks that makes impossible to make container_of of ancillary_driver
>>> to chain operations.
>>>
>>
>> I am sorry, you lost me here.  you cannot perform container_of on the callbacks
>> because they are pointers, but if you are referring to going from device_driver
>> to the auxiliary_driver, that is what happens in auxiliary_probe_driver in the
>> very beginning.
>>
>> static int auxiliary_probe_driver(struct device *dev)
>> 145 {
>> 146         struct auxiliary_driver *auxdrv = to_auxiliary_drv(dev->driver);
>> 147         struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>>
>> Did I miss your meaning?
> 
> I think you're misunderstanding the cases when the
> bus_type.{probe,remove} is used vs the driver.{probe,remove}
> callbacks. The bus_type callbacks are to implement a pattern where the
> 'probe' and 'remove' method are typed to the bus device type. For
> example 'struct pci_dev *' instead of raw 'struct device *'. See this
> conversion of dax bus as an example of going from raw 'struct device
> *' typed probe/remove to dax-device typed probe/remove:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=75797273189d

Thanks Dan for the reference, very useful. This doesn't look like a a 
big change to implement, just wondering about the benefits and 
drawbacks, if any? I am a bit confused here.

First, was the initial pattern wrong as Leon asserted it? Such code 
exists in multiple examples in the kernel and there's nothing preventing 
the use of container_of that I can think of. Put differently, if this 
code was wrong then there are other existing buses that need to be updated.

Second, what additional functionality does this move from driver to 
bus_type provide? The commit reference just states 'In preparation for 
introducing seed devices the dax-bus core needs to be able to intercept 
->probe() and ->remove() operations", but that doesn't really help me 
figure out what 'intercept' means. Would you mind elaborating?

And last, the existing probe function does calls dev_pm_domain_attach():

static int ancillary_probe_driver(struct device *dev)
{
	struct ancillary_driver *ancildrv = to_ancillary_drv(dev->driver);
	struct ancillary_device *ancildev = to_ancillary_dev(dev);
	int ret;

	ret = dev_pm_domain_attach(dev, true);

So the need to access the raw device still exists. Is this still legit 
if the probe() is moved to the bus_type structure?

I have no objection to this change if it preserves the same 
functionality and possibly extends it, just wanted to better understand 
the reasons for the change and in which cases the bus probe() makes more 
sense than a driver probe().

Thanks for enlightening the rest of us!


