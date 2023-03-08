Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA36B0A3B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:59:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684721872;
	Wed,  8 Mar 2023 14:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684721872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283984;
	bh=fDkj2qqI5Hd3gyncELfzGm9AhlqswmOIQl8Kz6+UxNw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTUeyonzrsbtjBfipc7kkn8syO/V9YKPRIxfwOtSSb3vQ1Qg41XBsfq+ktu/zS690
	 t3l02+kxrNrcDPawTtyz2o52hXXF4hBn/HUvfKNKWXeOukD8JK+j60B441aszC4ims
	 1ogMa5Gy0cpz6cHFqdwAnWotpJo8ydHBZ3pZcwk4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D830BF8042F;
	Wed,  8 Mar 2023 14:58:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 358D2F80482; Wed,  8 Mar 2023 14:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1422BF80236
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1422BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HMzSO0Os
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678283929; x=1709819929;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fDkj2qqI5Hd3gyncELfzGm9AhlqswmOIQl8Kz6+UxNw=;
  b=HMzSO0OsV0+eFwKsc4BZh/l2vKiZ+GqsPM7M3qNV5bqb5/pyY6+ltp7+
   JzgzaDa/itIGSu9e7Y5FGRa/Rq8FOQ8gS0VDlpBcgC88JkeAOTVHfXWqi
   C8bUCjRqOH4j+IeXjFybKoBmCmbN317jZyuZtpehifq1M0Tq/9zmJAdqp
   SloACFpPYD5K2wBjV4yKePCYMpdkOx+hvQrZh4u1xq0X5PvWBG2oxCc8c
   6qsmiljt6e3OIuGAv8XZwyUuUtXntICAQjH+yTW4xUwgi/pwpjnx6yLPW
   CWdOGmVXTgK0yHnt6ZbAKbPpra371HKtUDP6nskXqr37jMMV7FLw9MKjm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336170525"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400";
   d="scan'208";a="336170525"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="709429695"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400";
   d="scan'208";a="709429695"
Received: from vkhatavx-mobl.amr.corp.intel.com (HELO [10.255.34.124])
 ([10.255.34.124])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:58:44 -0800
Message-ID: <85aba51e-1feb-5eb0-2e21-b714e217f9e4@linux.intel.com>
Date: Wed, 8 Mar 2023 07:58:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V6 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-9-Vijendar.Mukunda@amd.com>
 <4330af6a-ce97-53ed-f675-6d3d0ac8f32f@linux.intel.com>
 <d5a75826-d762-27fc-5820-6826debdecd9@amd.com>
 <9399110b-bbba-f96e-85ef-a317e8f4d518@linux.intel.com>
 <4cbbff8a-c596-e9cc-a6cf-6f8b66607505@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4cbbff8a-c596-e9cc-a6cf-6f8b66607505@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JLLI4EX4Z6SA77K5RADZVUS3V7ITXFXS
X-Message-ID-Hash: JLLI4EX4Z6SA77K5RADZVUS3V7ITXFXS
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLLI4EX4Z6SA77K5RADZVUS3V7ITXFXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/7/23 22:32, Mukunda,Vijendar wrote:
> On 08/03/23 02:38, Pierre-Louis Bossart wrote:
>>
>> On 3/7/23 14:25, Mukunda,Vijendar wrote:
>>> On 07/03/23 20:58, Pierre-Louis Bossart wrote:
>>>>> +static int amd_resume_child_device(struct device *dev, void *data)
>>>>> +{
>>>>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!slave->probed) {
>>>>> +		dev_dbg(dev, "skipping device, no probed driver\n");
>>>>> +		return 0;
>>>>> +	}
>>>>> +	if (!slave->dev_num_sticky) {
>>>>> +		dev_dbg(dev, "skipping device, never detected on bus\n");
>>>>> +		return 0;
>>>>> +	}
>>>>> +	if (!pm_runtime_suspended(dev))
>>>>> +		return 0;
>>>>> +	ret = pm_request_resume(dev);
>>>> I still don't get why the test above was needed. It's racy and brings
>>>> limited benefits.
>>> As explained below thread,
>>>
>>> https://lore.kernel.org/lkml/acd3a560-1218-9f1d-06ec-19e4d3d4e2c9@amd.com
>>>
>>> Our scenario is multiple peripheral devices are connected
>>> over the same link.
>>>
>>> In our implementation, device_for_each_child() function invokes
>>> amd_resume_child_device callback for each child.
>>> When any one of the child device is active, It will break the
>>> iteration, which results in failure resuming all child devices.
>> Can you clarify the 'it will break the iteration' statement?
>>
>> Are you saying pm_request_resume() will return a negative error code if
>> the device is already active?
>>
>> We've used an unconditional pm_request_resume() in the Intel code for
>> quite some time, including with multiple amplifiers per link, and have
>> never observed the issue you report, so I'd like to get to the root
>> cause pretty please. You took the Intel code and added a test for AMD
>> platforms, and I'd really like to understand if the Intel code was wrong
>> in the first place, or if the test is not needed. Something does not add
>> up here.
> AMP Codec (In aggregate mode) + Jack Codec connected over the same
> link on our platform.
> Consider below, scenario.
> Active stream is running on AMP codec and Jack codec is already in runtime
> suspend state.
> If system level suspend is invoked, in prepare callback, we need to resume
> both the codec devices.
> 
> device_for_each_child() will invoke amd_resume_child_device() function callback
> for each device which will try to resume the child device in this case.
> By definition, device_for_each_child() Iterate over @parent's child devices,
> and invokes the callback for each. We check the return of amd_resume_child_device()
> each time.
> If it returns anything other than 0, we break out and return that value.
> 
> In current scenario, As AMP codec is not in runtime suspend state,
> pm_request_resume() will return a value as 1. This will break the
> sequence for resuming rest of the child devices(JACK codec in our case).

Well, yes, now that makes sense, thanks for the details.

I think the reason why we didn't see the problem with the Intel code is
that both amplifiers are on the same dailink, so they are by
construction either both suspended or both active. We never had
different types of devices on the same link.

I would however suggest this simpler alternative, where only negative
return values are returned:

ret = pm_request_resume(dev);
if (ret < 0) {
	dev_err(dev, "pm_request_resume failed: %d\n", ret);
        return ret;
}
return 0;

this would work just fine, no?


> 
> As mentioned in an earlier thread, there are two possible solutions.
> 1. check pm runtime suspend state and return 0 if it is not suspended
> 2. simply always return 0 for amd_resume_child_device() function callback.
> 
> We opted first one as solution.

My suggestion looks like your option 2. It's cleaner IMHO.
