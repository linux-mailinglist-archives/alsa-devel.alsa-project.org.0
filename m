Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632D77BFED
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 20:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6EC3E8;
	Mon, 14 Aug 2023 20:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6EC3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692038672;
	bh=PJkvzD6m99v52qVvewr6hJcz/Qx70aWvnPZtyluuAog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ve+ctFT8Jo3713khl+HvUARE1W8riPjHV2fZiVXdk1Kp3Kh7HxOB0Lx/7UXhCXDwJ
	 yw8tCUR/oX0OXcCKOokYvSVa+kZ93x/d+3Iq2M6f7roM72WkmoSgszQgGz/COxcwrB
	 5vv7rwaJ2r/gOWoEdXq7prnM6NNAthfNkggLUKBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69047F80536; Mon, 14 Aug 2023 20:43:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7DEF80254;
	Mon, 14 Aug 2023 20:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D64F8025F; Mon, 14 Aug 2023 20:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDB63F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 20:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB63F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GjX0SHaD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692038612; x=1723574612;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PJkvzD6m99v52qVvewr6hJcz/Qx70aWvnPZtyluuAog=;
  b=GjX0SHaDfoqfstbaOKBvbnJXejjmPrOheutj7Q3xCO/jaZH1CDPHn4kP
   PUIF9yZVgcS95k1ihFV+KO9G39ZyV1gMebnqjBylRezUTsrIog869FkNc
   NdKLKi2ajk3qEsEDCGZ/OiOZpLG7H6N1k9ZlcyO7AG3+iYNTJSEuDMi87
   /IbMrI3QJqZ4x9Yjfl0REDvfgbVJWl/P+NBf7djazd1OlEW3TKZPQreNK
   wuUh/EswjwNo4aN4QwbfY2xeB/ntdIlh+fZ7vV54Ji32jG7YuDQk3sa7H
   gkiJRx1/+QxohW6PEm3fuwwQlNnacqDBFvlM9Wwos0IZMK6oOjp0HCBa+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372106026"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="372106026"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 11:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907311212"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="907311212"
Received: from ryana2x-mobl.amr.corp.intel.com (HELO [10.212.126.76])
 ([10.212.126.76])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 11:43:24 -0700
Message-ID: <ca3018de-4a26-7330-fd84-45b9b4b7f339@linux.intel.com>
Date: Mon, 14 Aug 2023 12:02:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 hdegoede@redhat.com, broonie@kernel.org, tiwai@suse.com, perex@perex.cz
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-14-cezary.rojewski@intel.com>
 <0474e41a-0e69-d739-1e4a-cdc555e6fbd0@linux.intel.com>
 <fef42075-44f8-c897-c05a-180dd30f5b37@intel.com>
 <389f2953-1463-34f1-b720-92af800aad5d@linux.intel.com>
 <5b31b859-5130-fcce-4104-4cc8cc0e41e4@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5b31b859-5130-fcce-4104-4cc8cc0e41e4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IQBYJBFWBRDO2IPLHKID2S5LXF6SURWU
X-Message-ID-Hash: IQBYJBFWBRDO2IPLHKID2S5LXF6SURWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQBYJBFWBRDO2IPLHKID2S5LXF6SURWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>>> To provide option for selecting different bit-per-sample than just the
>>>>> maximum one, use the new format calculation mechanism.
>>>>
>>>> Can you remind me what the issue is in selecting the maximum
>>>> resolution?
>>>>
>>>> Isn't it a good thing to select the maximum resolution when possible so
>>>> as to provide more headroom and prevent clipping? Usually we try to
>>>> make
>>>> sure the resolution becomes limited when we reach the analog parts.
>>>> I am
>>>> not sure I see a compelling reason to reduce the resolution on the host
>>>> side.
>>>
>>> Maximum resolution is still the default, nothing changes there.
>>> Moreover, new subformat options are not added to any driver apart from
>>> the avs-driver.
>>
>> What's so special about this driver that it needs more capabilities for
>> a standard interface?
> 
> This is kind of an off-topic question.
> 
> While maintaining status quo from user perspective, we want to test the
> hardware with full-stack, just like it's the case on Windows side.
> Tested hardware yields less recommended flows.

yeah, but at some point you have to draw a line. It's not because the
codec exposes all kinds of capabilities that you want the host driver to
enable each single possible option.

Take I2S codecs for example, there are countless degrees of freedom
between 18, 20, 24, 32 bits and all sorts of formatting (DSP_X, I2S),
slot size, etc. We use the same subsets in 90% of the cases.

>>> The patchset provides _an option_ to change bits-per-sample. Right now
>>> there's no option to do that so the hardware - here, SDxFMT and PPLCxFMT
>>> - is not tested. We have enough recommended flows already. Frankly there
>>> is one for SDxFMT for the APL-based platforms (or BXT-based if one
>>> prefers that naming) present within snd_hda_intel and DSP drivers alike.
>>>
>>>> I am also not sure what this patch actually changes, given that the
>>>> firmware actually converts everything to the full 32-bit resolution.
>>>
>>> The issue does not concern firmware, so we leave firmware out of the
>>> discussion - this is purely about hardware capabilities.
>>
>> I don't see how you can leave firmware aside, if the hardware
>> configuration is selected to be based on 24 bits and the firmware
>> generated 32 there's clearly a mismatch.
>>
>> If this is saying that we are adding an option that will never be used,
>> then why bother?
>>
>> Lost in space on this one.
> 
> We are still on planet Earth though. Many codecs present on the market
> support more than just 24/32 format. It is a valid testcase to check if
> indeed the exposed functionality works.

Sure, if you have spare cycles you can test all kinds of things, but the
impact on products will be very limited. No one in their right mind is
going to use 20 bits even if the codec advertises support for it. The
recommended practice is to use the maximum resolution on the host side.

It's not because we *can* use a lower resolution that we *should*.

> In regard to firmware, please note that the AudioDSP firmware has no
> direct access to the HOST space, so it cannot alter SDxFMT and PPLCxFMT
> on its own. Hardcoding particular YYYxFMT value restricts testing
> capabilities. The firmware expects that provided valid and container bit
> depths values (copier's INIT_INSTANCE) match YYYxFMT the software had
> assigned.

what could possibly go wrong here...completely different layers that
need to be joined to reconcile codec-specific information. D'oh.

I am not going to object further to these patches, I just don't see them
as having any material impact on any of the existing/future products.


