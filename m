Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2913B154
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 18:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AE5417E6;
	Tue, 14 Jan 2020 18:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AE5417E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579024214;
	bh=rsRbKeOtpgBnFhJEfjzX0ypJs2yF+k/13U2fLhirxz0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rp2/zgG0pdypdnN+6k719WINPNGZDvpWWytlErEEKDHSZdfRw3o60vAU2k/unspEe
	 XOpNlAUt5xfUSA2OO7vS8g4EP0ucnpeO/9zpIkjC4WhzHjZ1/Nn7+LXC48pQqcipdy
	 StCj3pTAap6gmbh5sx+CJOqM5fR4Cdkjux2per5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2D61F8021E;
	Tue, 14 Jan 2020 18:48:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A538F80171; Tue, 14 Jan 2020 18:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD05F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 18:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD05F80121
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 09:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,319,1574150400"; d="scan'208";a="225285555"
Received: from snathamg-mobl.amr.corp.intel.com (HELO [10.252.136.159])
 ([10.252.136.159])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2020 09:48:20 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200114060959.GA2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6635bf0b-c20a-7561-bcbf-4a480a077ae4@linux.intel.com>
Date: Tue, 14 Jan 2020 10:01:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114060959.GA2818@vkoul-mobl>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> I am quoting the code in patch, which i pointed in my first reply!
> 
> On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> 
>> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
>> index 4b769409f6f8..42f7ae034bea 100644
>> --- a/drivers/soundwire/intel_init.c
> 
> This is intel specific file...
> 
>> +++ b/drivers/soundwire/intel_init.c
> 
> snip ...
> 
>> +static struct sdw_intel_ctx
>> +*sdw_intel_probe_controller(struct sdw_intel_res *res)
> 
> this is intel driver, intel function!
> 
>> -
>> -		link->pdev = pdev;
>> -		link++;
>> +		/* let the SoundWire master driver to its probe */
>> +		md->driver->probe(md, link);
>                              ^^^^^^
> which does this... calls a probe()!
> 
> And my first reply was:
> 
>>> +             /* let the SoundWire master driver to its probe */
>>> +             md->driver->probe(md, link);
>>
>> So you are invoking driver probe here.. That is typically role of driver
>> core to do that.. If we need that, make driver core do that for you!
> 
> I rest my case!

I think you are too focused on the probe case and not realizing the 
extensions suggested by this patchset. A "driver" is not limited to 
'probe' and 'remove' cases.

As mentioned since mid-September, there is a need for an initialization 
of software/kernel structures (which I called probe but should have been 
called init really), and a second step where the hardware is actually 
configured - after all power rail dependencies are under control.

Can you please look at the .startup callback and let me know how a 
'driver core' would handle this?

To the best of my knowledge, there is no .startup in any device model 
functionality, so the only thing I could do to avoid a direct call is 
add a wrapper to avoid a direct call, e.g.

static inline sdw_master_device_startup(struct sdw_master_device *md)
{
     if (md && md->driver && md->driver->startup)
         md->driver->startup(md);
}


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
