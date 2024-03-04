Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62E870C84
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 22:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A8385D;
	Mon,  4 Mar 2024 22:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A8385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709587604;
	bh=rv/XfYNi4BvAvBRukdMOjwDjaM7kpgWfrZ72HbgE9Zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rjeRp3LPbykNJeQCs+tQoDegwYr4slPS5v90uhexuZbcErzKIT9/WG7a/86BCW62S
	 wsm9xUPfWdY6UWzizALwR5GhTmYeN19Z1lKA0Vag2XyBi5og+YDFrZlBCF0C9hY8IU
	 KEZZsocleX/c7H7KgkCGGqwyWl9zcqG83Xa8PAhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61B6EF8014B; Mon,  4 Mar 2024 22:26:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD03BF8059F;
	Mon,  4 Mar 2024 22:26:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD09BF8024E; Mon,  4 Mar 2024 22:26:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88A6BF80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 22:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A6BF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TjEHSm/X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709587560; x=1741123560;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rv/XfYNi4BvAvBRukdMOjwDjaM7kpgWfrZ72HbgE9Zk=;
  b=TjEHSm/Xf7Mv22SAwZ60Zi2ACpFpLP1f0VU2MOh3AvpdUQgm1pLB0loy
   aQxcBWgxhfEQ8ml2xFXPVnHQ0eBDuSqr+AOvXYlQ7yKVQdu/MPZsCGmJc
   NcgHwFnMEYk0XduEliOlSAWfreM0fImUqijRnlLkcAX3SkASNNfVE6RwK
   b2DawPZMhMta6nTzajKcH9qUjDA1dbfKbcrBnK8EacurmEtLcGSsrJKSM
   jeD1dvwl/tScwNUFlhwKVU8yeD2dExzNjFuUq23smNDgIpRXRx7NLKEa8
   RscGjSnBWjKfj6FVWzH/lIQW2z/Angun7DsSGPPjJEgXYm9/j9/0vGlwQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3967705"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="3967705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 13:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="40128260"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160])
 ([10.212.71.160])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 13:25:26 -0800
Message-ID: <50fbb243-ab41-411d-9e3f-b8d9f5574768@linux.intel.com>
Date: Mon, 4 Mar 2024 15:25:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
 <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
 <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DRP5OQOP6S3NE35CK4C4YJGXJABIXCDN
X-Message-ID-Hash: DRP5OQOP6S3NE35CK4C4YJGXJABIXCDN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRP5OQOP6S3NE35CK4C4YJGXJABIXCDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/4/24 14:50, Cezary Rojewski wrote:
> On 2024-03-04 8:32 PM, Pierre-Louis Bossart wrote:
>> On 3/4/24 13:05, Cezary Rojewski wrote:
>>> One of the framework responsibilities is to ensure that the enumerated
>>> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
>>> the are checks in soc-core.c and soc-pcm.c that verify this, a component
>>> driver may attempt to workaround this by loading an invalid graph
>>> through the topology file.
>>>
>>> Be strict and fail topology loading when invalid graph is encountered.
>>
>> This is very invasive, it's perfectly possible that we have a number of
>> 'broken' topologies where one path is 'invalid' but it doesn't impact
>> functionality.
>>
>> This should be an opt-in behavior IMHO, not a blanket change.
> 
> To my best knowledge, soc-topology.c' first "customer" was the
> skylake-driver and the final details were cloudy at best back then.
> 
> Right now sound-drivers utilizing the topology feature do so in more
> refined fashion. Next, in ASoC we have three locations where
> snd_soc_dapm_add_routes() is called but error-checks are done only in
> 2/3 of them. This is bogus.

I don't disagree that it was a mistake to omit the check on the returned
value, but now that we have topologies in the wild we can't change the
error handling without a risk of breaking "working" solutions. Exhibit A
is what happened in the other places where this error check was added...

> If the intended way of using snd_soc_dapm_add_routes() is to ignore the
> return, it should be converted to void and flag ->disable_route_checks
> removed.

Now that would go back to an "anything goes" mode, not necessarily a
great step.

>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>   sound/soc/soc-topology.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>> index d6d368837235..778f539d9ff5 100644
>>> --- a/sound/soc/soc-topology.c
>>> +++ b/sound/soc/soc-topology.c
>>> @@ -1083,8 +1083,9 @@ static int
>>> soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>               break;
>>>           }
>>>   -        /* add route, but keep going if some fail */
>>> -        snd_soc_dapm_add_routes(dapm, route, 1);
>>> +        ret = snd_soc_dapm_add_routes(dapm, route, 1);
>>> +        if (ret && !dapm->card->disable_route_checks)
>>> +            break;

you could alternatively follow the example in soc-core.c, with a
dev_info() thrown if the route_checks is disabled and a dev_err() thrown
otherwise. At least this would expose the reason for the failure after a
change in error handling, and a means to 'restore' functionality for
specific cards if the topology cannot be updated.

>>>       }
>>>         return ret;
