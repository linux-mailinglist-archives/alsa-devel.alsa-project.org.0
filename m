Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5A30AED2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 19:15:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BA91768;
	Mon,  1 Feb 2021 19:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BA91768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612203321;
	bh=CpTptIGjSHXb3hCGCW8qnv5nukm7ScbWOZ+lgVV1ytY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1HNCbqwXvQMTHAyz2eYkPznB95ARhvveWjNuvyn3bC0mkH/+ePxdu3bJEGKBO9y4
	 TWw2kHcm8Jrqc42DVC2cyDOC34+0R29mwakXqx2Wto+G0c4JrjNDkdB8HDrv4lOic1
	 M4BARQ9xepBUkOc8LGzeum/pEiIj69ns716Vpb70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BF6F801DB;
	Mon,  1 Feb 2021 19:13:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79412F80155; Mon,  1 Feb 2021 19:13:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8585F80153
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 19:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8585F80153
IronPort-SDR: ZmRQwe8pT9tNFdMipYLVQM0MBn7NqrNU1fR501Gf3wBeupAThfUaCYUK92JoTIMwRZrsGoxfP/
 DA4cODZa1zBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="167833504"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="167833504"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:25 -0800
IronPort-SDR: F1OCSwCWMWWO8ZfuC0+dHytr+ZVp45YovOdB931iHaVBxxH4bG2VO6cOjrP59hwiAQVpvxkJcg
 G5D0zWmlXLJg==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="412516918"
Received: from dkhaldi-mobl1.amr.corp.intel.com (HELO [10.212.126.61])
 ([10.212.126.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:24 -0800
Subject: Re: [PATCH 3/3] soundwire: bus: clear parity interrupt before the
 mask is enabled
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-4-yung-chuan.liao@linux.intel.com>
 <20210201110921.GZ2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f5ef9a07-73df-c2b6-3e03-001f53700c5b@linux.intel.com>
Date: Mon, 1 Feb 2021 10:29:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201110921.GZ2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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


>>   	 * Set SCP_INT1_MASK register, typically bus clash and
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index f7ba1a77a1df..c1fdc85d0a74 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1286,7 +1286,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
>>   	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
>>   		prop->hw_disabled = true;
>>   
>> -	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;
>> +	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH |
>> +		SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY;
> 
> move this to intel patch please..
> 
>>   
>>   	return 0;
>>   }
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index a2766c3b603d..30415354d419 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -426,6 +426,7 @@ struct sdw_master_prop {
>>   };
>>   
>>   #define SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH	BIT(0)
>> +#define SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY	BIT(1)
> 
> Why not add this quirk in patch 1..?

There is an element of history here. We first found out about the bus 
clash on multiple devices and dealt with a specific bug number. Then we 
spend weeks on the parity issue on a new platform and ultimately showed 
we needed a similar work-around.

All these problems are not typical from a user perspective; they appear 
when loading/unloading modules in loops, at some point it seems some 
hardware devices don't always reset properly or there's something 
problematic in power delivery.

I don't think it's an issue if we refactor the code to add the quirks 
first, and add the intel.c patches later. We probably want 2 intel 
changes to keep the references to the bugs though and the detailed 
explanations.

> Also add comments about each quirk, hopefully it wont be a big table

Sounds fine.
