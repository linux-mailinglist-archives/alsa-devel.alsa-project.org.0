Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E52151E2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 18:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3975818B8;
	Mon,  6 May 2019 18:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3975818B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557161280;
	bh=Pm/NFhRE+Fg3bPxtiWvmzhBB2X9VktDS7McsrIoyJ7g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHMrpxmsvX1JWa5ynupM0Yu8+9BZp6//qS1anL9mK8LGXEGfWLJoyn0UoxCMujkqB
	 4gSf7kZJIOFCoixMI38Afi0+MSxMktJ4Y7VCydFu7fL/a9Ds/qpkNN6u3O5N1xbBk9
	 TrzyGrfJBh+8clUjXIRAkK1LMYqQkCF4KiUv/pfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F0AF896FF;
	Mon,  6 May 2019 18:46:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F4BF896F0; Mon,  6 May 2019 18:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A240FF89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 18:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A240FF89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 09:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="171355585"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2019 09:46:08 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 8116D58010A;
 Mon,  6 May 2019 09:46:07 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
 <20190504065444.GC9770@kroah.com>
 <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
 <20190506151953.GA13178@kroah.com> <20190506162208.GI3845@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <be72bbb1-b51f-8201-fdff-958836ed94d1@linux.intel.com>
Date: Mon, 6 May 2019 11:46:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506162208.GI3845@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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

On 5/6/19 11:22 AM, Vinod Koul wrote:
> On 06-05-19, 17:19, Greg KH wrote:
>> On Mon, May 06, 2019 at 09:42:35AM -0500, Pierre-Louis Bossart wrote:
>>>>> +
>>>>> +int sdw_sysfs_slave_init(struct sdw_slave *slave)
>>>>> +{
>>>>> +	struct sdw_slave_sysfs *sysfs;
>>>>> +	unsigned int src_dpns, sink_dpns, i, j;
>>>>> +	int err;
>>>>> +
>>>>> +	if (slave->sysfs) {
>>>>> +		dev_err(&slave->dev, "SDW Slave sysfs is already initialized\n");
>>>>> +		err = -EIO;
>>>>> +		goto err_ret;
>>>>> +	}
>>>>> +
>>>>> +	sysfs = kzalloc(sizeof(*sysfs), GFP_KERNEL);
>>>>
>>>> Same question as patch 1, why a new device?
>>>
>>> yes it's the same open. In this case, the slave devices are defined at a
>>> different level so it's also confusing to create a device to represent the
>>> slave properties. The code works but I am not sure the initial directions
>>> are correct.
>>
>> You can just make a subdir for your attributes by using the attribute
>> group name, if a subdirectory is needed just to keep things a bit more
>> organized.
> 
> The key here is 'a subdir' which is not the case here. We did discuss
> this in the initial patches for SoundWire which had sysfs :)
> 
> The way MIPI disco spec organized properties, we have dp0 and dpN
> properties each of them requires to have a subdir of their own and that
> was the reason why I coded it to be creating a device.

Vinod, the question was not for dp0 and dpN, it's fine to have 
subdirectories there, but rather why we need separate devices for the 
master and slave properties.

> 
> Do we have a better way to handle this?
> 
>> Otherwise, you need to mess with having multiple "types" of struct
>> device all associated with the same bus.  It is possible, and not that
>> hard, but I don't think you are doing that here.
>>
>> thnaks,
>>
>> greg k-h
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
