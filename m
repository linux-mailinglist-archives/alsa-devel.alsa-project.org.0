Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65377BB04
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08FA83A;
	Mon, 14 Aug 2023 16:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08FA83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692022159;
	bh=IhBv0vdiTlz9m2cF3OBbowsWlswXcwkIf1qXDreG8b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btjbcnKjwZ8rW3+nH9tj4T4D7GLQRlX4qlUw3io/zSlKyA4sJlXPbKVA4wED1A7ET
	 gwKRBzq7wKlqXUrrfIZuiyghhyL881sACO3U/GpTcHcJHSR28Ja+aqNdq5l4hdsNg3
	 aUXKgWEUQTdIJv8cR7PLq/oMFuh2zUmuzVflv2mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3644CF80570; Mon, 14 Aug 2023 16:07:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2420F80568;
	Mon, 14 Aug 2023 16:07:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E04DAF8056F; Mon, 14 Aug 2023 16:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE472F80272
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE472F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KJawqBht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022052; x=1723558052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IhBv0vdiTlz9m2cF3OBbowsWlswXcwkIf1qXDreG8b4=;
  b=KJawqBhtf+YCms60P3MAPjm/j8Sw8+LdOspozWZ4Lrs6EsvDfUQUlWmf
   SXuMfEJt+oX3XhULj6szWA2VafHpQaTZOpPnvvvoMV2bOryFbocnFLJxA
   1NdaECeIshyWlfYpyTOXdEBU3NIbnQMIfeob7O9ejHlDReCUUTVtCkfM8
   9NpplR2LnSmPHFe7sC/Zr8ntaMydC8fTMOHwgq7y4pt3L2leNdMMUHJZq
   fpyuxT8/Ecqh8f+OQFU8pllfNe3/Gun9P1vSeqH7ZSjDNShEDPPBRF8+j
   K//gaq2d7kGbqR68LnClW/IAQZNbmKYG/11OoziEAB9uHfSCiXqZh8rr3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370943697"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="370943697"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798825227"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="798825227"
Received: from ryana2x-mobl.amr.corp.intel.com (HELO [10.212.126.76])
 ([10.212.126.76])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:26 -0700
Message-ID: <389f2953-1463-34f1-b720-92af800aad5d@linux.intel.com>
Date: Mon, 14 Aug 2023 09:01:22 -0500
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fef42075-44f8-c897-c05a-180dd30f5b37@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3IAHQB7WQLNNDDA5Y4G2UDHOMOGZLNNC
X-Message-ID-Hash: 3IAHQB7WQLNNDDA5Y4G2UDHOMOGZLNNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IAHQB7WQLNNDDA5Y4G2UDHOMOGZLNNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/14/23 05:51, Cezary Rojewski wrote:
> On 2023-08-11 8:21 PM, Pierre-Louis Bossart wrote:
>> On 8/11/23 11:48, Cezary Rojewski wrote:
>>> To provide option for selecting different bit-per-sample than just the
>>> maximum one, use the new format calculation mechanism.
>>
>> Can you remind me what the issue is in selecting the maximum resolution?
>>
>> Isn't it a good thing to select the maximum resolution when possible so
>> as to provide more headroom and prevent clipping? Usually we try to make
>> sure the resolution becomes limited when we reach the analog parts. I am
>> not sure I see a compelling reason to reduce the resolution on the host
>> side.
> 
> Maximum resolution is still the default, nothing changes there.
> Moreover, new subformat options are not added to any driver apart from
> the avs-driver.

What's so special about this driver that it needs more capabilities for
a standard interface?

> The patchset provides _an option_ to change bits-per-sample. Right now
> there's no option to do that so the hardware - here, SDxFMT and PPLCxFMT
> - is not tested. We have enough recommended flows already. Frankly there
> is one for SDxFMT for the APL-based platforms (or BXT-based if one
> prefers that naming) present within snd_hda_intel and DSP drivers alike.
> 
>> I am also not sure what this patch actually changes, given that the
>> firmware actually converts everything to the full 32-bit resolution.
> 
> The issue does not concern firmware, so we leave firmware out of the
> discussion - this is purely about hardware capabilities.

I don't see how you can leave firmware aside, if the hardware
configuration is selected to be based on 24 bits and the firmware
generated 32 there's clearly a mismatch.

If this is saying that we are adding an option that will never be used,
then why bother?

Lost in space on this one.

>> I must be missing something on the problem statement.
>>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>   sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/soc/sof/intel/hda-dai-ops.c
>>> b/sound/soc/sof/intel/hda-dai-ops.c
>>> index f3513796c189..00703999e91b 100644
>>> --- a/sound/soc/sof/intel/hda-dai-ops.c
>>> +++ b/sound/soc/sof/intel/hda-dai-ops.c
>>> @@ -194,14 +194,15 @@ static unsigned int
>>> hda_calc_stream_format(struct snd_sof_dev *sdev,
>>>       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>>       unsigned int link_bps;
>>>       unsigned int format_val;
>>> +    unsigned int bps;
>>>         if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>>>           link_bps = codec_dai->driver->playback.sig_bits;
>>>       else
>>>           link_bps = codec_dai->driver->capture.sig_bits;
>>> +    bps = snd_hdac_stream_format_bps(params_format(params),
>>> SNDRV_PCM_SUBFORMAT_STD, link_bps);
>>
>> I can't say I fully understand the difference between 'bps' and
>> 'link_bps'. The naming is far from self-explanatory just by looking at
>> the code.
> 
> There's none. I just didn't reuse the 'link_bps' variable. I can reuse
> it if you like.
> 
>>> -    format_val = snd_hdac_calc_stream_format(params_rate(params),
>>> params_channels(params),
>>> -                         params_format(params), link_bps, 0);
>>> +    format_val = snd_hdac_stream_format(params_channels(params),
>>> bps, params_rate(params));
>>>         dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d,
>>> format=%d\n", format_val,
>>>           params_rate(params), params_channels(params),
>>> params_format(params));
