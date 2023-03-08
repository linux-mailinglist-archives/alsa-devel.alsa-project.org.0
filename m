Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59FC6B0AF7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 15:24:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6F117DD;
	Wed,  8 Mar 2023 15:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6F117DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678285473;
	bh=Xwerx2xXUaxAefu4ArBHqTpEi/j/Yfjg8iwscA9h5+0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AhMPp5I0NcskxfhhXBoKNR18a4BTfyhfxXQoPbJJEuAmQTVtJxL2m4cENXDr9UaQt
	 aO8WYpVCK0TF+n6c88k9j8uKd7gchlNkn9+/amqzVeTdO8hCdQDFbnNzI+FpMIXxg7
	 lMVOkVqbfKI/qMuLELj6LJD0ZcNMvNIbzOeG000E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B636F80093;
	Wed,  8 Mar 2023 15:23:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 743D7F8042F; Wed,  8 Mar 2023 15:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A1A4F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 15:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1A4F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A7Z0pRu8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678285416; x=1709821416;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Xwerx2xXUaxAefu4ArBHqTpEi/j/Yfjg8iwscA9h5+0=;
  b=A7Z0pRu8ErCHnSKkaDTQIHnkSP7RYQQ400iZiOTZr5Wh2tdSLSKNw17L
   aKS8c2Ijxjv9KxScWBD9VNXq4uDStscl9t6KqaMMfIRCao2b438awphUr
   85D/kXUMsFhkeSGItRX9ScL6Mmc1CIAV6EqCTwRL93+dP/ioovKkx2Dqk
   bkmXEtP6uhMp57p1R1EiE9vlMARTzEyf8192W9jsjp6SWN+hb94GYJnPH
   pIJlOoqndiGPgy7IWZw0WTRUu5Zvz8IQkdNZoCmD5vvOckI2oj+8kBY26
   rwAB/+yrv7N62CZGYLKasNYXxSGfcPUvCnh/Psl+lMoYk4csXMp3b3Qkp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422432631"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400";
   d="scan'208";a="422432631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 06:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800768131"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400";
   d="scan'208";a="800768131"
Received: from vkhatavx-mobl.amr.corp.intel.com (HELO [10.255.34.124])
 ([10.255.34.124])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 06:23:28 -0800
Message-ID: <dfb09d78-0620-e535-08b6-894554201ead@linux.intel.com>
Date: Wed, 8 Mar 2023 08:23:28 -0600
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
 <85aba51e-1feb-5eb0-2e21-b714e217f9e4@linux.intel.com>
 <2e629a29-093e-46e9-2329-0d5afc916ee4@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2e629a29-093e-46e9-2329-0d5afc916ee4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SBIWPR4MW2UXFVSORQCUKSD77QHN2W4A
X-Message-ID-Hash: SBIWPR4MW2UXFVSORQCUKSD77QHN2W4A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBIWPR4MW2UXFVSORQCUKSD77QHN2W4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> device_for_each_child() will invoke amd_resume_child_device() function callback
>>> for each device which will try to resume the child device in this case.
>>> By definition, device_for_each_child() Iterate over @parent's child devices,
>>> and invokes the callback for each. We check the return of amd_resume_child_device()
>>> each time.
>>> If it returns anything other than 0, we break out and return that value.
>>>
>>> In current scenario, As AMP codec is not in runtime suspend state,
>>> pm_request_resume() will return a value as 1. This will break the
>>> sequence for resuming rest of the child devices(JACK codec in our case).
>> Well, yes, now that makes sense, thanks for the details.
>>
>> I think the reason why we didn't see the problem with the Intel code is
>> that both amplifiers are on the same dailink, so they are by
>> construction either both suspended or both active. We never had
>> different types of devices on the same link.
>>
>> I would however suggest this simpler alternative, where only negative
>> return values are returned:
>>
>> ret = pm_request_resume(dev);
>> if (ret < 0) {
>> 	dev_err(dev, "pm_request_resume failed: %d\n", ret);
>>         return ret;
>> }
>> return 0;
>>
>> this would work just fine, no?
>> No, As explained, pm_request_resume() return value is 1 for active device.
>>> As mentioned in an earlier thread, there are two possible solutions.
>>> 1. check pm runtime suspend state and return 0 if it is not suspended
>>> 2. simply always return 0 for amd_resume_child_device() function callback.
>>>
>>> We opted first one as solution.
>> My suggestion looks like your option 2. It's cleaner IMHO.
> To use option 2, we need to respin the patch series.
> Is it okay if we fix it as supplement patch?

I would vote for re-spinning a new version and ask others to review.
