Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A04199A2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 18:50:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659DB16BA;
	Mon, 27 Sep 2021 18:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659DB16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632761415;
	bh=1H8zhlr9bUS74uDmVQ3XMYRJXSRAL6LpBn96mMcohrQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGoxmfJvrb3ebSx0eY2MhyoNNnMmicMGTFqtvQ5iY8wUrXUwxoZpJPyyb0HAST3ry
	 c7ZO6c1+wmpY4F4KJrkVsGiFaK2deCZRnULisFL7VVR3Dv7Mri38wkxNE3/SGek7K7
	 gPqvrHA+zuPHIcCXpGEBhm8ZpjSyoyOA3eNdbI7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22894F801EC;
	Mon, 27 Sep 2021 18:49:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7705F802C4; Mon, 27 Sep 2021 18:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2DBF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 18:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC2DBF801EC
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="224163389"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="224163389"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 09:49:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="486204709"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 09:49:00 -0700
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
To: Mark Brown <broonie@kernel.org>, Ryan Lee <RyanS.Lee@maximintegrated.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
Date: Mon, 27 Sep 2021 11:48:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927160622.GE4199@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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



On 9/27/21 11:06 AM, Mark Brown wrote:
> On Mon, Sep 27, 2021 at 04:01:25PM +0000, Ryan Lee wrote:
> 
>>>>       regcache_cache_only(max98373->regmap, true);
>>>> +     regcache_mark_dirty(max98373->regmap);
> 
>>> We already do the following sequence in max98373_io_init() when the
>>> amplifier re-attaches:
> 
>>>         if (max98373->first_hw_init) {
>>>                 regcache_cache_bypass(max98373->regmap, false);
>>>                 regcache_mark_dirty(max98373->regmap);
>>>         }
> 
>>> I don't see what marking the cache as dirty on suspend might do, we will do a
>>> sync only in the resume step.
> 
>>> IIRC this is a patch that we've seen before and removed since it wasn't
>>> aligned with any other codec driver.
> 
>> Yes, it does. There was an mute problem report due to amp register reset
>> during suspend/resume. and we confirmed that the modification 
>> is effective. (https://partnerissuetracker.corp.google.com/issues/194472331)
>> The added code helps to re-write valid values in cache to the amp hardware
>> when audio resume. Same code was there on i2c driver, but not on Soundwire
>> driver.

Ryan, we removed this in f184892613dd ('ASoC: codecs: max98373-sdw:
align regmap use with other codecs'), so even if this was needed you'd
need a mention that this is a revert and why this sequence is better.
You are suggesting a change based on an analogy with I2C which is
questionable: when a SoundWire device regains sync on the bus, it will
be re-initialized using a callback, and the resume waits for the
initialization to complete.

> More specifically what it does is make the invalidation of the register
> cache unconditional.  It doesn't really matter if the invalidation is
> done on suspend or resume, so long as it happens before we attempt to
> resync - this could also be done by deleting the first_hw_init check.

Mark, that's exactly my point: if the amp rejoins the bus, we will
*always* mark the cache as dirty, before the resync is done in the
resume sequence.

I am really trying to figure out if we have a major flaw in the resume
sequence and why things are different in the case of the Maxim amp.

Instead of changing the suspend sequence, can we please try to modify
the max98373_io_init() routine to unconditionally flag the cache as
dirty, maybe this points to a problem with the management of the
max98373->first_hw_init flag.
