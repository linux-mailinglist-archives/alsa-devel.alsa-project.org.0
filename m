Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD97ED00E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 20:52:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BC5820;
	Wed, 15 Nov 2023 20:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BC5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700077951;
	bh=ngiPfeziv8PT2BpwQ1I8V9zHtCUA2oybBprQ4dI1p18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SpxwOQgzcGwykdNeIC8HCtGNV9Vs9LYdaxupnpUdNaC/5UfmW0LM4jc1Z/isIQRy2
	 ISGCw2eiDKwLNmEv8XqU/NcX9KZAIQqv2cURh6ZqviBBoH/xHPsuzWUTgircFdD4Mx
	 sAYxGVq3tlSx8c3f1kUFnPA11eBOgvSrE1OwIZU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E0AF802E8; Wed, 15 Nov 2023 20:51:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD75F8016E;
	Wed, 15 Nov 2023 20:51:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3876F801D5; Wed, 15 Nov 2023 20:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75D53F80166
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 20:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D53F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I6sCW4aI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700077884; x=1731613884;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ngiPfeziv8PT2BpwQ1I8V9zHtCUA2oybBprQ4dI1p18=;
  b=I6sCW4aIFzJSs27LoWA4yK684xXbKWxg0YrPg1JFhgUcK27l5q8PyI5q
   caBgK49rUKAXj94mj30MK5qmApMT1FN5P0kSdEQFMbwUcxx7v1Tc/E5/m
   wA4+n/5yanjzEcGU/4HS9XCg2SvdLqQEGgvwVhG1FGqnTMYbXYuLbV5US
   eusEbCJ1EG6eIctm1MHnCCzNUq7jAJBO/OzNuo2CTRGpCcZrURQBfLHwo
   q7ILpMpVcc6hyWEMQ1DFOBzzkD7qhvhhhv9i8RSUgUODmjKWiGtZspfNb
   +B0EH3q5KH+b7HmjqSAXQu4No6R/0x+Ac4xS/Vnw6XgsIvw2+PJIT0r95
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477165503"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200";
   d="scan'208";a="477165503"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741528085"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200";
   d="scan'208";a="741528085"
Received: from ipaliych-mobl2.amr.corp.intel.com (HELO [10.212.183.137])
 ([10.212.183.137])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:51:15 -0800
Message-ID: <05147111-e46b-42a5-9e99-ec289e61730f@linux.intel.com>
Date: Wed, 15 Nov 2023 13:51:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: add an error code check in
 amd_sdw_clock_stop_exit
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, Su Hui
 <suhui@nfschina.com>, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20231115095407.1059704-1-suhui@nfschina.com>
 <3e461bb5-fa6b-4729-8ff5-ccc1d2887066@linux.intel.com>
 <5729c613-182b-43d2-a2ed-caff046b68e7@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5729c613-182b-43d2-a2ed-caff046b68e7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DF444LEY5AK3CFG6URZJI3H5OODR6VLB
X-Message-ID-Hash: DF444LEY5AK3CFG6URZJI3H5OODR6VLB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DF444LEY5AK3CFG6URZJI3H5OODR6VLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>>> index 3a99f6dcdfaf..f391b541f4b7 100644
>>> --- a/drivers/soundwire/amd_manager.c
>>> +++ b/drivers/soundwire/amd_manager.c
>>> @@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>>>  		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
>>>  					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
>>>  					 AMD_SDW_TIMEOUT);
>>> +		if (ret)
>>> +			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
>>> +				ERR_PTR(ret));
>> Is this really the desired behavior?
>>
>> This patch fixes the static analysis issue by logging the error code,
>> but does it make sense to continue resuming here and trying to exit from
>> the clock stop mode?
>>
>> At this point a bus reset might be a more relevant behavior...
> As per earlier discussion, when we sent the initial patch series,
> It was communicated that even clock stop sequence fails,
> return '0' in suspend/resume callbacks that why we returned
> status as zero.

clock stop is for suspend and clock stop exit for resume. Different
problems.

> In this scenario, it's not continuing resume when clock stop exit
> sequence fails. Even In Intel's case, if the clock stop sequence fails,
> just code is exiting from that sequence.

that's right, in the Intel SoundWire drivers we never prevent the
pm_runtime suspend from happening, and discard any errors. In the resume
step we do a bus reset anyways.

But that's different here, this is the clock stop exit which happens on
resume and IIRC there is no bus reset. If the resume fails, what is the
expected behavior? If you keep going then you are going to have other
issues down the road.

>>
>>>  		if (val & AMD_SDW_CLK_RESUME_DONE) {
>>>  			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>>>  			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
> 
