Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F48215A78
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 17:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02FF1665;
	Mon,  6 Jul 2020 17:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02FF1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594048581;
	bh=4VMU2hJMjXBmEA2WldMBBxKT0ltR4rlSsXZmqi3ncTc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNJ9Ho3jvpbwofoOklZhsWvWkr2ZjgwORpA2aPah2X8a5SBRrDWYv4fWnF0HT1FkC
	 0m1HPtW9EyRl26JXWGj6w8fEuFnhVXO1LKu6dXs3dGspV8bAaGtBzM84d1JUEe8zMY
	 GiUNO/UAbR5ssC4hpj+FYhOGFP7C7AHZSo/bfz+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F41BFF8011F;
	Mon,  6 Jul 2020 17:14:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 036E4F8015A; Mon,  6 Jul 2020 17:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8BA0F8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 17:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8BA0F8011F
IronPort-SDR: J2YqU4GVyvbMjMMiKw49WGc5wDsxvd6tHUQs08VFteLqk6ZtX9SMxLqWm7hk9+DFpqHoW/7u4G
 B2RtN4wvPVEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="212412980"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="212412980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 08:14:32 -0700
IronPort-SDR: jp+xSpM0hz4RXPelb813+eh1Xv2NFOLsPZD+jeKCERs+hs6W1K7rsAx5C6G9hslF567dRAI2gk
 RMVTXLTYELsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="313989791"
Received: from aislam-mobl1.amr.corp.intel.com ([10.212.167.133])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 08:14:31 -0700
Subject: Re: [RFC PATCH] ALSA: compress: add support to change codec profile
 in gapless playback
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, plai@codeaurora.org
References: <20200702111114.32217-1-srinivas.kandagatla@linaro.org>
 <90ed95e0-8b01-6c87-b86b-dfa463181527@linux.intel.com>
 <2444711a-319e-1f9b-1289-7744bb1a2987@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ee34dac9-715c-6e6c-aa33-bb46f0c8261a@linux.intel.com>
Date: Mon, 6 Jul 2020 10:14:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <2444711a-319e-1f9b-1289-7744bb1a2987@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vathota@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, ckeepax@opensource.cirrus.com
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

On 7/3/20 4:47 AM, Srinivas Kandagatla wrote:
> Thanks Pierre for the comments,
> 
> +Adding Patric Lai into loop,
> 
> 
> 
> On 02/07/2020 16:00, Pierre-Louis Bossart wrote:
>>
>>
>> On 7/2/20 6:11 AM, Srinivas Kandagatla wrote:
>>> For gapless playback its possible that each track can have different
>>> codec profile with same decoder, for example we have WMA album,
>>> we may have different tracks as WMA v9, WMA v10 and so on
>>>
>>> Existing code does not allow to change this profile while doing gapless
>>> playback.
>>>
>>> This patch adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL to allow
>>> userspace to set this new parameters required for new codec profile.
>>
>> That does not seem fully correct to me. WMA profiles are actually 
>> different encoding schemes - specifically the WMA 10 LBR.
>>
>> The premise for gapless playback was that the same codec and profile 
>> be used between tracks, so that the same internal delay was used. If 
>> you look at the output data, it's made of zeroes for N samples, and 
>> then you see decoded data. When you change tracks, the first N samples 
>> actually come from the previous track.
>>
>> If you change coding schemes between tracks, you cannot call this 
>> gapless playback. You will both remove the last N samples of the 
>> previous track and insert M zeroes (for the new decoder).
>>
>> If you wanted to support such a mode, you would need to provide an 
>> indication of the delay difference, e.g. by looking at the ID3 tags 
>> and let firmware realign. Unfortunately, you don't send this 
>> information with the new IOCTL? You would also need firmware tricks 
>> for the first decoder to flush out its output and the new decoder to 
>> realign.
>>
>> I also don't see how one might end-up with different profiles for an 
>> album in the first place. The gapless use came mostly from ripping 
>> live music recorded on audio CDs in different tracks, and it would 
>> have taken a twisted mind to select different encodings between tracks.
>>
>> If the 'album' is really a playlist, then the gapless playback as 
>> supported by the ASoC compressed layer is nearly useless. What you 
>> would really want is cross-fade but that's a different use case and 
>> implementation that would be needed.
> 
> Patrick seems to have discussed this topic in detail at one of the audio 
> conf!
> 
> He might want to add more to this discussion.

One more counter-argument I thought of after sending my response. If the 
samples for the previous track and the next track are not generated by 
the *same* filterbank, then you would lose the implicit averaging 
between tracks performed by the filterbank (usually an inverse MDCT), 
which will likely result in sample discontinuities and pop noise on 
transitions. If we have different filterbanks we should really look into 
explicit cross-fading which is a much larger change than what this patch 
suggests.


