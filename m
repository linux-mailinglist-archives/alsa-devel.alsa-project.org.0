Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481805B5F74
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 19:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BBB16CE;
	Mon, 12 Sep 2022 19:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BBB16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663004265;
	bh=FcBcnGvzARlKI6nqPOAWcfgoQk755nH6VQ0v7eG9aK0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suktd721XH2XhtQt8sLBFENZm4NI1iMfN3JDLveAHeBFpkf/1JNIC1t664ROunL7L
	 nGjzz99w4s0vnl/ImpJVcLQ+PSr5ZIb31P+oUycMZxgj0iSv1ev5F73/GldWMjBhI/
	 YG67BDWmFdIkazWCxeOR6U1pFg82fiGMy9tbBWCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02B4FF804E7;
	Mon, 12 Sep 2022 19:36:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F37FF8027B; Mon, 12 Sep 2022 19:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0D0AF800EC;
 Mon, 12 Sep 2022 19:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0D0AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mb9NUYxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663004170; x=1694540170;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FcBcnGvzARlKI6nqPOAWcfgoQk755nH6VQ0v7eG9aK0=;
 b=Mb9NUYxeMwetvsqa9sNdj0+1qu+RgDcCD+BExarOnEt5uY1HUejTgBY6
 Hv7oz7J4yh6CArNmCAY9Td0uzj40GWVznej4q3aQhhGB+3fN4Eb/JCoS9
 ALdCaJ3iadbQPVqX38pJ06rg6GtSTHHggdGzdqEl3g9FTryKwZbayjye6
 lxCPyu6JbKyyZHt5MjSB9nXdEMeGd+aCnR+Hohf6aqtmDIg+WURdkf0cC
 5TmtWiwiHIx5IcQk14AUdEPVj7pODLdMlSrCtTSOgg8db1NT7wdhSA6B/
 iQqlCUfrsFYGlxjVwXTIqLMWnfR6DT9dlnWykno7W2rZosXCHBscX4u9R A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="296662322"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="296662322"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 10:36:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705236481"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 10:35:58 -0700
Message-ID: <9055c565-8616-8480-ea49-8db1b8707b34@linux.intel.com>
Date: Mon, 12 Sep 2022 19:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] soundwire: intel: Don't disable interrupt until
 children are removed
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 sanyog.r.kale@intel.com, broonie@kernel.org
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-6-rf@opensource.cirrus.com>
 <c83fb25e-ef59-63e1-4223-648dab9885ea@linux.intel.com>
 <9de21235-c77d-f53f-3426-4a5927f484c9@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9de21235-c77d-f53f-3426-4a5927f484c9@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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



On 9/12/22 17:36, Richard Fitzgerald wrote:
> On 12/09/2022 11:53, Pierre-Louis Bossart wrote:
>>
>>
>> On 9/7/22 12:14, Richard Fitzgerald wrote:
>>> The cadence_master code needs the interrupt to complete message
>>> transfers.
>>> When the bus driver is being removed child drivers are removed, and
>>> their
>>> remove actions might need bus transactions.
>>>
>>> Use the sdw_master_ops.remove callback to disable the interrupt handling
>>> only after the child drivers have been removed.
>>>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>>   drivers/soundwire/intel.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>>> index 01be62fa6c83..d5e723a9c80b 100644
>>> --- a/drivers/soundwire/intel.c
>>> +++ b/drivers/soundwire/intel.c
>>> @@ -1255,6 +1255,13 @@ static int intel_prop_read(struct sdw_bus *bus)
>>>       return 0;
>>>   }
>>>   +static void intel_bus_remove(struct sdw_bus *bus)
>>> +{
>>> +    struct sdw_cdns *cdns = bus_to_cdns(bus);
>>> +
>>> +    sdw_cdns_enable_interrupt(cdns, false);
>>
>> don't you need to check for any on-going transactions on the bus?
>>
> 
> As all the child drivers have removed, I think the only other place that
> can generate bus transactions is the PING handler but
> sdw_cdns_enable_interrupt(false) calls cancel_work_sync() to
> cancel the cdns->work and it sets a flag so that it will not be
> re-queued.
> 
>> I wonder if there could be a corner case where there are no child
>> devices but still a device physically attached to the bus. I am not sure
>> if the 'no devices left' is a good-enough indication of no activity on
>> the bus.
>>
> 
> As above - yes there could, but sdw_cdns_enable_interrupt(false) will
> cancel the work and stop it being re-queued.

Ah yes, I forgot that part, thanks!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

