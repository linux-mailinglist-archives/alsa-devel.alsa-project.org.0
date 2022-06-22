Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77385553D5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 20:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B1B61ACA;
	Wed, 22 Jun 2022 20:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B1B61ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655924224;
	bh=jBqGi3tYBlSSu+e2U4ixn4oSXn0R8lunapUpGX5+1+0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ei+e51WOyNOnhDt0LGcoEnuqdNfRPTkSPrrEcHluCqo0IVvw1wA9beCW9xIcVXZJ2
	 VOQhj7PkvFimO3Zgpfl90jPgaHRUk9bpCrkHScWiqMmyRB1T4kz48ayFZfLikZhJoo
	 gICv5HAKStTHlnkZ2uPF6nmjoWQTzO2IdWevXPFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B655DF8032D;
	Wed, 22 Jun 2022 20:56:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 093E3F802D2; Wed, 22 Jun 2022 20:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1210F80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 20:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1210F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AjLLWU/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655924158; x=1687460158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jBqGi3tYBlSSu+e2U4ixn4oSXn0R8lunapUpGX5+1+0=;
 b=AjLLWU/VOlTPl6mjkAyXNzOUYXqEd4uC2BMOnWJtPZnTwiUoqTy7IBLx
 deJbDMeL9sOm1VgII2bhLiBASH/gAyssb35Vu+mXOdYI0teAUexUaQGmW
 lDYtX2zJo6gW+fxTh/61HXrQEMuIQ4Pkyg7oL0HArcKOe9CNkfY07OP9Y
 xhaXdjlloQn9u8NO/Oq+bmB6NdpPTEf4a7cSIH1OR+h7XHf7eIRcnrsGC
 1TOoSjZY5Nvy4nOgUEwOMVSU5Mq64a5u9lh6t5384iVz+e8V3aXCt5pIY
 mt6em/v95qm2cggnCA2dRpgVqyj7Jo4SqIU0EPcGDeVpKZ8W/WuM9e8wy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280563023"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="280563023"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:55:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="585851487"
Received: from hwkennel-mobl1.amr.corp.intel.com (HELO [10.212.112.142])
 ([10.212.112.142])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:55:53 -0700
Message-ID: <28efb05f-2f8e-c0fb-c079-0f65ee5283c5@linux.intel.com>
Date: Wed, 22 Jun 2022 13:55:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
 <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
 <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
 <11ef5841-6c33-4647-7309-ba94da6308aa@linux.intel.com>
 <58f3ae25-59c3-6432-2c7a-ca11b5f37492@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <58f3ae25-59c3-6432-2c7a-ca11b5f37492@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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


>>> Thanks for the report! However, this has been reported earlier during
>>> the v2 review [1]. This is also why a fix have been provided [2] earlier
>>> today. Notice that shape of link->exit() found here is shared by other
>>> Intel boards e.g.: SOF ones. In general, the initial discussion
>>> regarding card->remove() revealed some 'probe vs remove' problems within
>>> the framework.
>>>
>>>
>>> [1]:
>>> https://lore.kernel.org/alsa-devel/69e4263a-e036-cb21-2360-55b06600911e@intel.com/
>>>
>>>
>>> [2]:
>>> https://lore.kernel.org/alsa-devel/1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com/T/#t
>>>
>>
>> It's rather difficult to follow these changes and error reports buried
>> in email report sent on a Sunday of a three-day week-end for me.
>> I also had additional errors not reported,
>>
>> [   36.125113] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin HV
>> [   36.125128] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin VREF
>> [   36.125130] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin LDO1
>> [   36.125921] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1
>>
>> it's unclear to me why a dailink change in a machine driver would cause
>> such codec-side issues.
>>
>> If the changes in this 17-patch series need to be tied to a framework
>> fix, you have to make the dependencies explicit and better yet provide a
>> self-contained patch series that does not introduce a temporary
>> regression, or introduce the framework change first and clearly describe
>> the dependency in a longer Broadwell-specific patchset. This is an 8-yr
>> old device, it shouldn't be that hard.
> 
> 
> The last part is not helpful in solving the problem.
> 
> This reply comments 00/17 whereas in fact you are speaking solely about
> 16/17. Because of that I'm suggesting: leave that patch (the 16/17 one)
> out when merging. It will be send later once link->exit() issue is dealt
> with. All other patches are independent of either of changes.

That's fine with me. It wasn't self-explanatory from this cover letter
or your earlier answer that this patch 16 can be dropped for now. If
that patch is omitted, feel free to add my

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> Simultaneously the link->exit() fix, which is the fruit of this
> discussion, is still valid and can be send as standalone patch - what is
> already the case [1].

That's fine as well. What I was arguing on is the relationship between
patchsets and dependencies, what you are suggesting is perfectly acceptable.

