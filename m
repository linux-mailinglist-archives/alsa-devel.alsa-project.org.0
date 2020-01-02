Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3E12EB41
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 22:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A0116B3;
	Thu,  2 Jan 2020 22:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A0116B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578000019;
	bh=nByoQhVsLkwlmEsPuChmtDpOfIqt+Sqnv9mwygo/ZiU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTQLwbMK5ak3bqzHuK9QTPGIqZCa+b0uIlGZhf7jHHWohHWIZl/X96Jl2rmqHBmr9
	 cKjwENNCxBCRvoPobc1+Kzcmil72ray3hVrutSonh/n9Zlal2luG/VMxJkcctbwecP
	 fKGTKZvt0JLMIFTVZLNM4FeQ5HvJOJoy9FlKWsL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3FDF80265;
	Thu,  2 Jan 2020 22:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94985F8011E; Thu,  2 Jan 2020 22:18:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0B1FF8011E
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 22:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0B1FF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 13:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="224819822"
Received: from ybabin-mobl1.amr.corp.intel.com (HELO [10.252.139.105])
 ([10.252.139.105])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2020 13:18:24 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-9-pierre-louis.bossart@linux.intel.com>
 <20191227071433.GL3006@vkoul-mobl>
 <1922c494-4641-8c40-192d-758b21014fbc@linux.intel.com>
 <20191228120930.GR3006@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <820dbbcd-1401-4382-f5a2-9cdba1d6fcd5@linux.intel.com>
Date: Thu, 2 Jan 2020 11:36:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191228120930.GR3006@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 08/17] soundwire: add initial
 definitions for sdw_master_device
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


>>>> A parent (such as the Intel audio controller) would use sdw_md_add()
>>>> to create the device, passing a driver as a parameter. The
>>>> sdw_md_release() would be called when put_device() is invoked by the
>>>> parent. We use the shortcut 'md' for 'master device' to avoid very
>>>> long function names.
>>>
>>> I agree we should not have long name :) but md does not sound great. Can
>>> we drop the device and use sdw_slave and sdw_master for devices and
>>> append _driver when we are talking about drivers...
>>>
>>> we dont use sd for slave and imo this would gel well with existing names
>>
>> In SoundWire parlance, both 'Slave' and 'Master' are 'Devices', so yes we do
>> in the standard talk about 'Slave Devices' and 'Master Devices'.
>>
>> Then we have Linux 'Devices' which can be used for both.
>>
>> If we use 'sdw_slave', would we be referring to the actual physical part or
>> the Linux device?
>>
>> FWIW the Greybus example used 'Host Device' and 'hd' as shortcut.
> 
> But this messes up consistency in the naming of sdw objects. I am all for
> it, if we do sd for slave and name all structs and APIs accordingly. The key
> is consistency!
> 
> So it needs to be sd/md and so on or sdw_slave and sdw_master and so
> on... not a mix of both


Well the problem is that the existing code took a shortcut and only 
modeled the slave part, e.g.

struct sdw_slave *slave = dev_to_sdw_dev(dev);

so now it's difficult to add 'sdw_slave_device' and 'sdw_master_device' 
without quite a few changes.

Would this work for you if we used the following names:

sdw_slave (legacy shortcut for sdw_slave_device, which could be removed 
in a a future cleanup if desired).
sdw_slave_driver
sdw_master_device
sdw_master_driver

and all the 'md' replaced by the full 'master_device'.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
