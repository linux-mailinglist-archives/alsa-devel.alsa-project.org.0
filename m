Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59817787514
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 18:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D9467F1;
	Thu, 24 Aug 2023 18:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D9467F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692893899;
	bh=e2pYCj8X8emDdW65nXnKFgcmtrJVqisW5Ty8qYSLP0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R/YJbpeB6aKoJojEOEau1yc19T0TvBbdnl8kRFXNeWkRjIvEQ8NFGkFOWYNgejlt9
	 OQPgcYSOpxS5nEDgC7jFeIH03hWndqnpUp8Wx+9J5Fr2UVgl4o8kXgxqlEIwN1W10D
	 1sgp0BEgRYYTOc4XRWfnXHginZkiHw+e3JU4OP0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEEA6F800BF; Thu, 24 Aug 2023 18:17:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A90EFF800F5;
	Thu, 24 Aug 2023 18:17:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9240CF80158; Thu, 24 Aug 2023 18:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7168F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 18:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7168F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZmVYnMM2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692893761; x=1724429761;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e2pYCj8X8emDdW65nXnKFgcmtrJVqisW5Ty8qYSLP0M=;
  b=ZmVYnMM2JO+zvkdH4iix97dxiPbH65Tlg0kTzXgar1G2ImS33UbsdTmA
   7yfOBO8O/znl8Rk9U2njnqDfE8/dhtib7H1hotinC05VtlAWfIRME06kL
   MApVmRna15LqqnPe4xr1jO3w55bB6hbSWVQs+zrE76pdA5u3ROcCkRz7d
   GY/4B+ZrQeNcPv09M0PdK/KKrt0oD7kApWmiSVdrYOygHJKfJwp7QK6rQ
   OSpXsZeD3Jf2hYXG+oN55uyDoikjKAJdudFSlmak3tXIDNWCyVR6uiwgw
   RttCFVSUfISeUwZSzui+7F+ARaHLU1gH4KzfZZEY9SXNJia/+sF0hEW7B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="371887934"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="371887934"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="772145640"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="772145640"
Received: from bgeorge1-mobl.amr.corp.intel.com (HELO [10.212.15.55])
 ([10.212.15.55])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:09:22 -0700
Message-ID: <728cb1cc-4d5e-112b-fa93-b25696dabc5b@linux.intel.com>
Date: Thu, 24 Aug 2023 09:43:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
 <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
 <20230823163935.GG103419@ediswmail.ad.cirrus.com>
 <20230824093328.GH103419@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230824093328.GH103419@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LFP56ZT3TXFHG4DXUDUQAI72SU5SSW3W
X-Message-ID-Hash: LFP56ZT3TXFHG4DXUDUQAI72SU5SSW3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFP56ZT3TXFHG4DXUDUQAI72SU5SSW3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/24/23 04:33, Charles Keepax wrote:
> On Wed, Aug 23, 2023 at 04:39:35PM +0000, Charles Keepax wrote:
>> On Wed, Aug 23, 2023 at 05:19:31PM +0100, Mark Brown wrote:
>>> On Wed, Aug 23, 2023 at 03:49:58PM +0000, Charles Keepax wrote:
>>>> On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
>>>>> Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
>>>>> added an additional local params in __soc_pmc_hw_params, for the
>>>>> CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
>>>>> bytes) and keeping two local copies of it makes the stack frame for
>>>>> __soc_pcm_hw_params really large. As the two copies are only used
>>>>> sequentially combine these into a single local variable to shrink the
>>>>> stack frame.
>>>
>>>> Hmm... this might need a little more thought its not clear why this
>>>> should change the frame size and it only seems to change the frame
>>>> size on the ARM cross compiler I am using, not x86.
>>>
>>> Isn't that just going to be a function of the compiler being smart
>>> enough to work out that there aren't overlapping uses of the two
>>> variables and they can share stack space?  There's no reason not to help
>>> it figure that out.
>>
>> Yeah I think my only concern here was I no longer was certain I
>> understood what was happening. I don't think the patch can do any
>> harm, well except for the names being slightly less clear in the
>> code. It is starting to look like the mostly comes down to the
>> compiler being smart enough, although both were GCC in my case
>> so the difference is still a little surprising to me.
>>
> 
> Ah ok I see what is going on here, it depends on if you have
> -Os or -O2 set. -O2 will merge the two variables and give a
> smaller stack frame, -Os does not.
> 
> I would be inclined to say merge the patch, since it does help
> if some is trying to size optimise their kernel, but I don't
> feel strongly. Also I could respin to put this in the commit
> message if people prefer?

v2 with an updated commit message sounds good to me.
