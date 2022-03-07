Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18144D05AD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BB016CB;
	Mon,  7 Mar 2022 18:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BB016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646675357;
	bh=TkxdnYyg7gX1Fn5AmqIoXMBNc++v9VmckYXtv4iEEZU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDF4gRy4YanXoKrEXhrnafnWeM1gexjGYNqnkYj6ditFCrxCp1XYFv8MkXmQ9a6lb
	 tiXPUhG5rEAmRl8abQLG+fqQz4lgD3VdYL8OurHk/Rt07qk/LISsT3ieLtSb/zbkoy
	 LLFkQJln5/gX2oJuAWKRtVu97vvLCaFHSkEGqVNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA1D1F80159;
	Mon,  7 Mar 2022 18:48:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F51FF80124; Mon,  7 Mar 2022 18:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A387F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A387F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HO192Z75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646675286; x=1678211286;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TkxdnYyg7gX1Fn5AmqIoXMBNc++v9VmckYXtv4iEEZU=;
 b=HO192Z75WwcsvgYb4pQwD+0R1m+vpHNH2dRLyWQeF8a8tVWmjPbeelkJ
 xVbYFpNmGtjaVgWPZ1V9niz6K0z8uYUK6wFvguQ8uqIaqQXphDl5DinnG
 qcMTMrWc8pDchTsY4jQkUg+7BOmEtaCBYmiWsGYgWF+tE57l0vQdrZSW9
 8cOUYVlGdKqeFlK2VSPZdm9fXklBtpOUNBOx3c59u3SPDwptSFzVNt9tm
 tNcLuu6NsHpEqq0gdxC43zC7g24iutxSQ0dpiUETTeEPuFVJYcnsyWKLs
 HBZnS6edfnygZGq54B5SUYd3betb1eZ9TzJeQR+hK+/sWE7+y2/GoYnyT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253287220"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="253287220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:47:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643336664"
Received: from rhack-mobl1.amr.corp.intel.com (HELO [10.209.14.71])
 ([10.209.14.71])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:47:58 -0800
Message-ID: <cb8f27ec-4dc7-243a-0526-13b0d6a5d15e@linux.intel.com>
Date: Mon, 7 Mar 2022 11:47:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
 <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
 <e463df51-a0a5-b863-0cd6-80b1d60dc09b@intel.com>
 <886dacf8fdffb08af26cea6e754d09d4ed7811ea.camel@linux.intel.com>
 <818cb84e-44c2-ab4f-03b5-5b72b598c6e6@intel.com>
 <a281e2885720f83cb95615dd4d6a04ba55ab1521.camel@linux.intel.com>
 <9bea7c9a-0e99-b1b1-9d98-da6797c93a87@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9bea7c9a-0e99-b1b1-9d98-da6797c93a87@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



>>>>>> How come you dont have a loop here? What if the rec'd data size
>>>>>> if
>>>>>> larger than the max size of IP payload?
>>>>> That's not how LARGE_CONFIG_GET message works. There is no
>>>>> looping
>>>>> involved or expected by the firmware and so we don't have it
>>>>> here.
>>>> So, are you saying that when retrieving data from the FW, the size
>>>> of
>>>> the retrieved data can never exceed max IPC payload size?
>>>
>>>
>>>
>>>
>>> Precisely.
>> This is fundmentally flawed isnt it? If set_large_config() sets a
>> config that can exceed max IPC size, get_large_config() has to be able
>> to support it.
> 
> I could ask people on the list to "not look for a second" then there 
> would be no problem explaining all the *recommended flows*.
> 
> Simple, honest answer is: Yes, that's fundamentally flawed.
> Now, as older firmware generations do not expect nor support larger 
> payload sizes, adding such code here is essentially adding dead code so 
> we have decided to add none of it.

Adding a comment and/or an explanation in the commit message wouldn't 
hurt then.
