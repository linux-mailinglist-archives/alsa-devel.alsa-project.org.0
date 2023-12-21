Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7C81BCDA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 18:18:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23697DEE;
	Thu, 21 Dec 2023 18:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23697DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703179115;
	bh=CQ5BMEY01eCGDObN5YrAljWUIig88/OPg2GM4GEG430=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q7z17VV5iul01OlHF49Q3goG8+QLiLsP2U3hPP/JguCB5VlaGdWCcGWQlLwUina/r
	 do/4n3BwPrPQ4dwVQS8TeCiyr4YvYw+J9UqUny53rkrW1VW/SwJfzJVKNIpc6H5Thb
	 F5/FL0A4osj/WPINw6GGSjcxbDyG6wMGyeGAWJpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 076C1F80124; Thu, 21 Dec 2023 18:18:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C019AF80431;
	Thu, 21 Dec 2023 18:18:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44181F80212; Thu, 21 Dec 2023 18:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FE0FF800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 18:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE0FF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FGa8tD/q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703179070; x=1734715070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CQ5BMEY01eCGDObN5YrAljWUIig88/OPg2GM4GEG430=;
  b=FGa8tD/q6ZMyrCbniBvM2T4eF7Q3olQwphCBg4ELdRzqRNw6Z5mFGS9U
   CsxrmJjmZVLfwJV1nv+8Ku4pXpaur6NM20wpV+dRog2604Wwj+yIe1IF1
   B116Q0aEzswyDK/U5yKvwH+xcejX+93tbO4+VIOh/JhwuYAoDQbmAPNg9
   cFbS+Ngk8dx4yxX/oITPlxWF6gWbNbG5I39JFqEHqQFqD5+KxgcAnCW1N
   1Qe03BuhJ73SkIL5f9Pm4Q28uxWj60sbJhBZkhwCNwgfzAd8MDHnUK/5F
   FNle+hGrlPbm7QwpDZBOFqt3wQPV1GucMSsJuXJwfThmn/vOSLeB/sUtm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482190073"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="482190073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770011031"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="770011031"
Received: from wdangelo-mobl.ger.corp.intel.com (HELO [10.252.51.4])
 ([10.252.51.4])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:17:32 -0800
Message-ID: <b3c3339d-978f-4ca0-8450-3c9756f191ed@linux.intel.com>
Date: Thu, 21 Dec 2023 18:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
 <ZYAzS3tggqQg8_PW@matsya>
 <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
 <ZYROLuFZNdwGHReR@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYROLuFZNdwGHReR@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HB7ZPZMHPZHYDE5UHWPYJVDZ6DGOSXLF
X-Message-ID-Hash: HB7ZPZMHPZHYDE5UHWPYJVDZ6DGOSXLF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HB7ZPZMHPZHYDE5UHWPYJVDZ6DGOSXLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/21/23 15:39, Vinod Koul wrote:
> On 18-12-23, 14:20, Pierre-Louis Bossart wrote:
>>
>>
>> On 12/18/23 05:55, Vinod Koul wrote:
>>> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>>>> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
>>>> dedicated stream which will typically not be handled by DAIs or
>>>> dailinks. Since there's only one BPT stream per link, storing the
>>>> pointer at the link level seems rather natural.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>  include/linux/soundwire/sdw.h | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>>>> index e54c5bbd2b91..8db0cd7d0d89 100644
>>>> --- a/include/linux/soundwire/sdw.h
>>>> +++ b/include/linux/soundwire/sdw.h
>>>> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>>>>   * @stream_refcount: number of streams currently using this bus
>>>>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>>>>   * be zero or one, multiple streams per link is not supported).
>>>> + * @bpt_stream: pointer stored for convenience.
>>>>   */
>>>>  struct sdw_bus {
>>>>  	struct device *dev;
>>>> @@ -996,6 +997,7 @@ struct sdw_bus {
>>>>  	int hw_sync_min_links;
>>>>  	int stream_refcount;
>>>>  	int bpt_stream_refcount;
>>>> +	struct sdw_stream_runtime *bpt_stream;
>>>
>>> So we are limiting to single stream? Can we have multiple transfers
>>> queued up, which I guess might imply multiple streams?
>>
>>
>> Yes for now there is a BTP/BRA single stream active when there are no
>> audio transfers taking place. This is the only way to guarantee
>> predictable download/resume times.
>>
>> There is no mechanism to queue up transfers, be it from the same
>> peripheral device or different ones. It would be up to the peripheral
>> driver to wait for the BTP stream to be available.
>>
>> Adding a queuing mechanism is a bridge too far for now, most platforms
>> only have 1 or 2 devices only, and a peripheral driver may or may not be
>> ok with delayed downloads. For now the main ask is to reduce download
>> times, a single stream is already a good start. There are other
>> refinements we need to add as well, such as changing clocks to use the
>> fastest gear. I'd like to proceed with baby steps...
> 
> Since the API is async in nature, I think it is very reasonable that we
> add the queue support (a simple list would do) and notify when the
> transfer is complete..

On paper queueing is nice/elegant.

In practice it's likely that there's a bit of configuration needed
before/after each download, e.g. restart the DSP.

It would also be an absolute horror to deal with error flow if one of
the queued transfers did not succeed.

I would be more than happy if we successfully enable a single transfer
across multiple platforms, and look at queueing as a optimization.

BTW even if there are multiple transfers queued, there's still only one
stream active at a given time.

