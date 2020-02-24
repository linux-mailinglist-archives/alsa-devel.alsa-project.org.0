Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E869216A437
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 11:44:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2B116AC;
	Mon, 24 Feb 2020 11:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2B116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582541055;
	bh=e+5Gq3+CTN8X/VB4OrUNu6tJzjBIwox13nQLzF6Qpsg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtgKL9Ewo8v+XRlgKohI8gZXAkbl9w2IBhIcpSsEXIDF0O3swzK4n5mNxemIqRGI/
	 UVBxAL+N1UmKaLUl06mbxiSyNHY03QrvEpdMEQKUBwQPnLUaVZhGSFxj04iF8oDzgL
	 f2xbgQMxB6OEY4N5b0cpQXR8S3ddr5hPLsDD00dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C702BF801F2;
	Mon, 24 Feb 2020 11:43:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A2CF80171; Mon, 24 Feb 2020 11:43:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D0A9F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 11:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0A9F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 02:43:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; d="scan'208";a="225935345"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.154.74])
 ([10.249.154.74])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 Feb 2020 02:43:02 -0800
Subject: Re: [PATCH] Intel: Skylake: Fix inconsistent IS_ERR and PTR_ERR
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Joe Perches <joe@perches.com>, Xu Wang <vulab@iscas.ac.cn>,
 "Slawinski, AmadeuszX" <amadeuszx.slawinski@intel.com>
References: <20200221101112.3104-1-vulab@iscas.ac.cn>
 <1247da797bc0a860e845989241385e124e589063.camel@perches.com>
 <8e96c207-cdf8-2d1f-755e-be60555c8728@linux.intel.com>
 <a0f5a3bc-3814-4e96-f81a-b693f78d2511@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <f05ddcba-4cd2-fb55-1829-53e7ef19943f@linux.intel.com>
Date: Mon, 24 Feb 2020 11:42:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a0f5a3bc-3814-4e96-f81a-b693f78d2511@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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



On 2/23/2020 4:59 PM, Cezary Rojewski wrote:
> On 2020-02-21 16:40, Pierre-Louis Bossart wrote:
>> On 2/21/20 8:41 AM, Joe Perches wrote:
>>> On Fri, 2020-02-21 at 18:11 +0800, Xu Wang wrote:
>>>> PTR_ERR should access the value just tested by IS_ERR.
>>>> In skl_clk_dev_probe(),it is inconsistent.
> 
> Please include all maintainers of given driver when submitting the 
> patch, thank you.
> 
>>> []
>>>> diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c 
>>>> b/sound/soc/intel/skylake/skl-ssp-clk.c
>>> []
>>>> @@ -384,7 +384,7 @@ static int skl_clk_dev_probe(struct 
>>>> platform_device *pdev)
>>>>                   &clks[i], clk_pdata, i);
>>>>           if (IS_ERR(data->clk[data->avail_clk_cnt])) {
>>>> -            ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
>>>> +            ret = PTR_ERR(data->clk[data->avail_clk_cnt]);
>>>
>>> NAK.
>>>
>>> This is not inconsistent and you are removing the ++
>>> which is a post increment.  Likely that is necessary.
>>>
>>> You could write the access and the increment as two
>>> separate statements if it confuses you.
>>
>> Well to be fair the code is far from clear.
> 
> Thanks for notifying, Pierre.
> 
> Although NAK is upheld here. Proposed change is likely to introduce 
> regression.
> 
>>
>> the post-increment is likely needed because of the error handling in 
>> unregister_src_clk 1
>>          data->clk[data->avail_clk_cnt] = register_skl_clk(dev,
>>                  &clks[i], clk_pdata, i);
>>
>>          if (IS_ERR(data->clk[data->avail_clk_cnt])) {
>>              ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
>>              goto err_unreg_skl_clk;
>>          }
>>      }
>>
>>      platform_set_drvdata(pdev, data);
>>
>>      return 0;
>>
>> err_unreg_skl_clk:
>>      unregister_src_clk(data);
>>
>> static void unregister_src_clk(struct skl_clk_data *dclk)
>> {
>>      while (dclk->avail_clk_cnt--)
>>          clkdev_drop(dclk->clk[dclk->avail_clk_cnt]->lookup);
>> }
>>
>> So the post-increment is cancelled in the while().
>>
>> That said, the avail_clk_cnt field is never initialized or incremented 
>> in normal usages so the code looks quite suspicious indeed.
> 
> As basically entire old Skylake code, so no surprises here : )
> struct skl_clk_data::avail_clk_cnt field is initialized with 0 via 
> devm_kzalloc in skl_clk_dev_probe().
> 
>>
>> gitk tells me this patch is likely the culprit:
>>
>> 6ee927f2f01466 ('ASoC: Intel: Skylake: Fix NULL ptr dereference when 
>> unloading clk dev')
>>
>> -        data->clk[i] = register_skl_clk(dev, &clks[i], clk_pdata, i);
>> -        if (IS_ERR(data->clk[i])) {
>> -            ret = PTR_ERR(data->clk[i]);
>> +        data->clk[data->avail_clk_cnt] = register_skl_clk(dev,
>> +                &clks[i], clk_pdata, i);
>> +
>> +        if (IS_ERR(data->clk[data->avail_clk_cnt])) {
>> +            ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
>>               goto err_unreg_skl_clk;
>>           }
>> -
>> -        data->avail_clk_cnt++;
>>
>> That last removal is probably wrong. Cezary and Amadeusz, you may want 
>> to look at this?
> 
> Indeed, code looks wrong. Idk what are we even dropping in 
> unregister_src_clk() if register_skl_clk() fails and avail_clk_cnt gets 
> incremented anyway.
> 
> In general usage of while(ptr->counter--) (example of which is present 
> in unregister_src_clk()) is prone to errors. Decrementation happens 
> regardless of while's check outcome and caller may receive back handle 
> in invalid state.
> 
> Amadeo, your thoughts?
>

Right, there is a problem with how we do increment available clock 
counter. It should be done in success path, sent fix.

Amadeusz
