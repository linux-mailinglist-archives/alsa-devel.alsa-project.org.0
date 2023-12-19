Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2816818CE9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2893DDF3;
	Tue, 19 Dec 2023 17:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2893DDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703004672;
	bh=o/k8w+KwAgcQoxX0YyOLJxZiQxvyrpoQFrxkS7/kYkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mVhIP3Au+Melr+v1SIdVrRlR/OeBChqlD9nJxw4OstuD3U2/JqTdzlki57v5r6cHw
	 tes+Ix7RpZqNFSSkNfRqYAovwHBdD7im2RC7VHoUUi2jjEV/ZcAHahoduhwr+9t3se
	 OXkbxcr5pCEvwac73vGHpFGDLif22Pnfl7L3QIvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D4AF8016E; Tue, 19 Dec 2023 17:50:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE3AF8016E;
	Tue, 19 Dec 2023 17:50:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D7E9F80431; Tue, 19 Dec 2023 17:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36107F800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36107F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c9iGKJHr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703004644; x=1734540644;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o/k8w+KwAgcQoxX0YyOLJxZiQxvyrpoQFrxkS7/kYkc=;
  b=c9iGKJHrc34dC87+HU8cR1Z1ZQ+/1v9otQe0HsnA1zpIXZIhWvE0FSW5
   fiiwFq1Ec+Bq1/Z5KXOs4Oj7Kh5wf/fldBzexHs4C8woc9sHV92LZlPIK
   ISFwVut98iiDW+axyY+zAzb1EdXyzEU4wpvG8rvHioa9sGmBzN1VGRWXQ
   VskXwKv0q+wOfehGr1eVyXtZOAZlgeap1wn1V99dAz4n5nWDmKrOYsoNt
   NPTCWxYFhyFqmxpjXG7VvNYfp5kuIOdUDnUpJS+6/rm7M7ruOEie9f9IU
   LdUbqg3lvoes8JwyhAoilQg8d6NhSrQmJDbjK2E9YH3FbnkTVoVjDLkxj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399518886"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="399518886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="949224088"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="949224088"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230])
 ([10.252.34.230])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:50:33 -0800
Message-ID: <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
Date: Tue, 19 Dec 2023 17:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V7IMKFL7ND7XQAIAXLNCKLWVHUYZGCBE
X-Message-ID-Hash: V7IMKFL7ND7XQAIAXLNCKLWVHUYZGCBE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7IMKFL7ND7XQAIAXLNCKLWVHUYZGCBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>> This feels a lot like it could map onto the regmap async interface, it
>>> would need a bit of a rework (mainly that currently they provide
>>> ordering guarantees with respect to both each other and sync I/O) but
>>> those could be removed with some care) but it's got the "here's a list
>>> of I/O, here's another call to ensure it's all actually happened" thing.
>>> It sounds very much like how I was thinking of the async API when I was
>>> writing it and the initial users.
> 
>>> It's this bit that really got me thinking it could fit well into regmap.
> 
>> I really don't know anything about this async interface, if you have
>> pointers on existing examples I am all ears....I am not aware of any
>> Intel platform or codec used on an Intel platform making use of this API.
> 
> grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
> or there's the rbtree cache sync code which uses a back door to go into
> an async mode.  Basically just variants of all the normal regmap I/O
> calls with a _complete() call you can use to wait for everything to
> happen.  The implementation is a bit heavyweight since it was written to
> work with fairly slow buses.

I spent a fair amount of time this afternoon trying to understand the
regmap_async parts, and I am not following where in the code there is an
ordering requirement/enforcement between async and sync usages.

I do see this comment in the code

 * @async_write: Write operation which completes asynchronously,
optional and must serialise with respect to non-async I/O.

But that 'must' is a requirement on the codec side, isn't it?

When using regmap_raw_write_async(), the lock is released immediately. I
don't see anything at the regmap level that would prevent a codec driver
from using regmap_raw_write() immediately.

That's probably a violation of the API to do so, but it's the same
problem I was referring earlier in the conversation where 'regular'
read/writes cannot happen in parallel with BTP/BRA transactions.

Also is this just me spacing out or there is no regmap_raw_read_async()?

