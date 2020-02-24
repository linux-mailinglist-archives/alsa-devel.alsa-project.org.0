Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734D16ADEB
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 18:44:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C03CF168F;
	Mon, 24 Feb 2020 18:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C03CF168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582566280;
	bh=cx4mGPVnKORT1HZdcmBHoYbdEcwTsW4nzzydki8CiKM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7ThxXg9oMS6xURvHjMRO/qsecy/TOVKneXD4NgBSA8fE5hzZ7kidI1W3mzAHrwO8
	 gfeifrUGSC4jOZeHtnpQBM/XbXOOtfXpvqyqcQmZL4wPdmeCjIipIWKFesOElxoWnz
	 vlzNvmvW5YF9u9rOjMkVhg00WRKBmz1AQIpZ65FM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F01F80090;
	Mon, 24 Feb 2020 18:42:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC4DF8014E; Mon, 24 Feb 2020 18:42:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE376F800C6
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 18:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE376F800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 09:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; d="scan'208";a="230725208"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.88])
 ([10.252.15.88])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2020 09:42:47 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix available clock counter
 incrementation
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
 <2ff5ef8e-8a95-14a3-b050-3dc974ffe22c@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <dd5cdb01-eaac-7536-e587-3caf13132e9b@intel.com>
Date: Mon, 24 Feb 2020 18:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2ff5ef8e-8a95-14a3-b050-3dc974ffe22c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:INTEL ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2020-02-24 17:18, Pierre-Louis Bossart wrote:
> On 2/24/20 6:52 AM, Amadeusz Sławiński wrote:
>> Incrementation of avail_clk_cnt was incorrectly moved to error path. Put
>> it back to success path.
>>

>> diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c 
>> b/sound/soc/intel/skylake/skl-ssp-clk.c
>> index 1c0e5226cb5b..bd43885f3805 100644
>> --- a/sound/soc/intel/skylake/skl-ssp-clk.c
>> +++ b/sound/soc/intel/skylake/skl-ssp-clk.c
>> @@ -384,9 +384,11 @@ static int skl_clk_dev_probe(struct 
>> platform_device *pdev)
>>                   &clks[i], clk_pdata, i);
>>           if (IS_ERR(data->clk[data->avail_clk_cnt])) {
>> -            ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
>> +            ret = PTR_ERR(data->clk[data->avail_clk_cnt]);
> 
> Are you sure?
> 
> If you start with avail_clk_cnt set to zero, the error handling will 
> decrement and access offset -1
> 
> static void unregister_src_clk(struct skl_clk_data *dclk)
> {
>       while (dclk->avail_clk_cnt--)
>           clkdev_drop(dclk->clk[dclk->avail_clk_cnt]->lookup); <<< oob 
> access with offset -1
> }
> 

Decrementation will occur after while's check evaluation - loop will 
exit, decrementation happens regardless.
