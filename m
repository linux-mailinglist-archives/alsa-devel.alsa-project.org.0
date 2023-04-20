Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D46E9E0E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 23:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B79EB4;
	Thu, 20 Apr 2023 23:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B79EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682026970;
	bh=HALc4FVe9LgqdT5G1DSgR3blWubsBzZEXzOIkoeKVlE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrd4RgGX1cFWthD+kqi3miFMtVjnqH41waWQMrrU4nVffWnbw6Ju9OLUKUAtM5yRG
	 71rygs7/liNEmRqDhB+x0z+pS9pDwwQLMwQL3uL3rIn3cbipNw02+uOc15q9QZOJuE
	 P1ETsoxCy1Ps9eYP8CyjEO3nBdLtlMxwvIIWQk6w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC3E5F80155;
	Thu, 20 Apr 2023 23:41:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DDEDF8019B; Thu, 20 Apr 2023 23:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8EC2F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 23:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EC2F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FIduqXvR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682026908; x=1713562908;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HALc4FVe9LgqdT5G1DSgR3blWubsBzZEXzOIkoeKVlE=;
  b=FIduqXvR+wz4VmWvskir6fYJ5TMBwE3F8nSTr4ftZBjB/lsoI3ud1BDm
   iik3Gs0RSTvv6uQZOODUqftmEDIVmo7NuNus97O3POPHCqFBK6xdmUfUT
   TynCnonTTzMg4HX74tZEf+ZoNgc+hech0w8s93Xs91Y8RyRbZrQ43ui9K
   xYJsfpBsD5rst+oy7YwqC2+x/YWGu64QSpEezEJDJxCIdkMJPvutvdyQC
   mwpKwejYLADKqg5P2wIRHO+D++h+DRk4dYbR/9f4rFeWUGGV33QF9DjBE
   gDnZzHmwAMKVD6s2SmdsiP9IxC6K0NYALS+zRUMdAOPyoHM/z0orYrtWW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334725958"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="334725958"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803487020"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="803487020"
Received: from mprabhug-mobl.amr.corp.intel.com (HELO [10.209.102.50])
 ([10.209.102.50])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:41:40 -0700
Message-ID: <37dfe2e3-6431-b16e-2f19-811e5b0da0fd@linux.intel.com>
Date: Thu, 20 Apr 2023 16:13:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] soudnwire: master: protect concurrecnt check for
 bus->md
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-6-krzysztof.kozlowski@linaro.org>
 <7ee41bcb-8656-49ec-40b6-15072c080d08@linux.intel.com>
 <beaec77b-9a61-6afd-59fa-fa726cae7a54@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <beaec77b-9a61-6afd-59fa-fa726cae7a54@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JURM5DWKYYBY6NDC5CJNTLDP2Y3OYMRN
X-Message-ID-Hash: JURM5DWKYYBY6NDC5CJNTLDP2Y3OYMRN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JURM5DWKYYBY6NDC5CJNTLDP2Y3OYMRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/20/23 12:27, Krzysztof Kozlowski wrote:
> On 20/04/2023 18:42, Pierre-Louis Bossart wrote:
>> typos in commit title...
>>
>> On 4/20/23 05:16, Krzysztof Kozlowski wrote:
>>> The Soundwire master controllers might want to check for bus->md
>>
>> Apologies for being pedantic but 'manager' and 'controller' are
>> different concepts in SoundWire, see DisCo spec.
>> It's not a 1:1 mapping, a controller can rely on M managers
> 
> I wrote master, not manager. For the Qualcomm case one controller is one
> master, but in general I try to avoid the master/slave terminology.

The Soundwire 1.2.1 spec moved away from master/slave and uses
manager/peripheral. It's the same concepts, just different terms. At
some point we'll update the code, it's just been too busy in 2022/2023
to do this replacement. It doesn't hurt to use the new terms.

>>> initialization to avoid race between early interrupt and finish of
>>> sdw_bus_master_add()/sdw_master_device_add().  Such early interrupt can
>>> happen if Soundwire devices are not powered off during their probe.
>>>
>>> Add a store release barrier, so the Soundwire controllers can safely
>>> check it in concurrent (e.g. in interrupt) way.
>>
>> Can you elaborate on the race condition? I am not following what breaks,
>> and what entity generates the 'early interrupt'.
> 
> The condition is explained in next patch. If you think it's better, I
> can squash it with next.
> 
> If the condition is still not clear, drop a note in next patch, so I
> will elaborate there.

will do.

>> I am specifically concerned about adding this in common code without any
>> matching smp_load_acquire() - which is only added in the following patch
>> for the Qualcomm manager only, but not added for Intel/AMD managers. Is
>> this not a problem?
> 
> Shouldn't be. The barrier just won't be effective for these drivers, but
> that should not be a problem, because I also did not add to these
> checking bus->md in a concurrent path.
> 
> Basically the barrier here is necessary because I want to check bus->md
> in Qualcomm master interrupt handler.

I really don't have any understanding or background on what this does.

Is there actually a precedent for this? I mean, dealing with the
device/driver model is already complicated, if now we have to be careful
on when the device pointer is stored it adds a whole new element of
complexity or skillset required to understand the bus operation.

Re-looking at the code, the 'md' variable is allocated in
sdw_master_device_add(), initialized with all kinds of values, used by
device_register() so presumably when you store the value it's stored
somewhere consistent, no?
