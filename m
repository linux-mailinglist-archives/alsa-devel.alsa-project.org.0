Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5870738279
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5EA3836;
	Wed, 21 Jun 2023 13:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5EA3836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348657;
	bh=7QBHZaWGpgML3bccn9yBAWgsyF73qca2uv8Bv8Cwr00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LpFM3KaDKVykY60mxcjpfcylIHUSFQYZ3mQvbAuHysthD5xyimWKt101RJq0CrCW8
	 sILdxcV2xYmaa2j9hFijq2UYQjCxNk6cYjFmXEjx8dep9kRxybQ/J6lVC/vM5K2AM5
	 BGoewzk+l/2sTJANQDBOKbgPaZtxA/s//CA3kty8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A806AF80535; Wed, 21 Jun 2023 13:56:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D6A8F80132;
	Wed, 21 Jun 2023 13:56:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B197F80141; Wed, 21 Jun 2023 13:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2A4CF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A4CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bu10ImQ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687348577; x=1718884577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7QBHZaWGpgML3bccn9yBAWgsyF73qca2uv8Bv8Cwr00=;
  b=bu10ImQ9I+Q0hbPfXi4FsI9Cv7xywOnPHoaHiA0MhDmToW6zXUS1QvVs
   luCluBUhGCUnVRKNDgA+5TG977hdr7J07f+am0ACCMy0MtcUSn50rAsox
   +V5YbFV16vib1FjiQAoNMBbK6lUlhM4uGtadCgmkfrrRQFVprqJOfk3Pp
   2ofXGPbz3nYQVa4gvUwkfRssffEeb9GIZdw/EU6Xg2vyDl/U4k7mIhh1k
   UfMHx0AFU+CSaxTBrktkeH0mi/MqhBT89Rp3FfnLX+anG2TMCg2o7IYCE
   8nfWsywbL/OIDuxL7qpdLnpRxC95T/HqeKCZvsOXioJiAChI3euJ7ezqv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349880692"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400";
   d="scan'208";a="349880692"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 04:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="714451259"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400";
   d="scan'208";a="714451259"
Received: from taoki-mobl1.gar.corp.intel.com (HELO [10.254.114.157])
 ([10.254.114.157])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 04:56:04 -0700
Message-ID: <e098e8a9-533b-319e-ea0c-24af28714471@linux.intel.com>
Date: Wed, 21 Jun 2023 13:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] soundwire: introduce SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-3-yung-chuan.liao@linux.intel.com>
 <ZIF94vZHzeGXfyin@matsya>
 <6c75e986-29a4-d97c-3862-d20397f8b8b4@linux.intel.com>
 <ZJLYQCwvvIwEj47H@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZJLYQCwvvIwEj47H@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GATSIR5BFU4Y7YNPSVMRRPK5IW6NTUCM
X-Message-ID-Hash: GATSIR5BFU4Y7YNPSVMRRPK5IW6NTUCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GATSIR5BFU4Y7YNPSVMRRPK5IW6NTUCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> This seems to be a consequence of Intel hardware decisions, so I guess
>>> best suited place for this is Intel controller, do we really want to
>>> have this in core logic?
>>
>> It's a valid objection.
>>
>> The reason why I added the alternate strategies in the core logic is
>> that the IDA and hybrid approach are just software-based with no
>> specific hardware dependencies. If QCOM or AMD wanted to use the
>> strategies contributed and tested by Intel, it'd be a two-line change on
>> their side.
>>
>> That said, it's likely that at some point *someone* will want to
>> constrain the device number allocation further, be it with ACPI/DT
>> properties or reading hardware registers. The device number is a
>> de-facto priority given the way we scan the PING frames, so some systems
>> may want to give a higher priority to a specific peripherals.
>>
>> This would push us to add a master ops callback to control the device
>> number allocation. It's a bit invasive but that would give the ultimate
>> flexibility. Reuse between vendors could be possible if 'generic'
>> callbacks were part of a library to pick from.
>>
>> I don't really have any objections if this vendor-specific callback was
>> preferred, it may be a bit early to add this but long-term it's probably
>> what makes more sense.
>>
>> I'll go with the flow on suggested recommendations.
> 
> Thanks, if it all one of the other two controller start using this, it
> would make sense to move it to core then, for now would be better to
> have this in specific driver

The code is much cleaner indeed that way.

I still have to work on a race condition if the codec driver probe
happens *after* the enumeration. In that case, the properties needed to
decide which allocation to use are not initialized yet.

We may need to either force the codec to re-enumerate with a ForceReset,
or to switch the device number. In theory the latter is straightforward
but there can be additional races if there are interrupts thrown just
before the device number change happens.
