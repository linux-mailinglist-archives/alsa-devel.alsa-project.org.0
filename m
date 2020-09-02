Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5525ABE9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 15:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF631807;
	Wed,  2 Sep 2020 15:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF631807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599052598;
	bh=RwZIu+7xg11zmf4AxRurBy5XFxEMlMWOwuQJyEv9dSs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWjV5JLQu/YRFd9HBVgZqxJu72DxXoKeWBvAMYY7/mdM5Y1dL3ZAXzrPpraMlbPhs
	 WE5xoWvwvH65pHveGb86NDVXXBLopaJHNEKhOWraq5UbKEdomqNddW+xNanApWlq+x
	 59dyPdI3E+WCTzruM7TPZG3Bd4FIcPDujJfc6+VI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA78F800BA;
	Wed,  2 Sep 2020 15:14:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB821F80212; Wed,  2 Sep 2020 15:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9500F800F3;
 Wed,  2 Sep 2020 15:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9500F800F3
IronPort-SDR: Fhzk5dHfdtM/o4q7srWIY+fXQCQfR6M4Y4GZGH/tdI2vK3yo+qs0MUc4azQdOeYGk23uJK+lxT
 u8fueZgbAbPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="175430258"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
 d="scan'208,217";a="175430258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:14:45 -0700
IronPort-SDR: tOTzcspjGKx8YHGcF5C0Hoy7oeui2A/RVzj+WvqjIIYnB7FPuDfJ+PUvH2+3b0NyH4hSXIbvaa
 PmS36kFgi9pA==
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
 d="scan'208,217";a="446522021"
Received: from pharlozi-mobl.ger.corp.intel.com (HELO [10.213.23.197])
 ([10.213.23.197])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:14:37 -0700
Subject: Re: [PATCH] ALSA: hda: Refactor calculating SDnFMT according to
 specification
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20200824100034.3129-1-pawel.harlozinski@linux.intel.com>
 <alpine.DEB.2.22.394.2008241434310.3186@eliteleevi.tm.intel.com>
 <s5h5z976siz.wl-tiwai@suse.de>
From: "Harlozinski, Pawel" <pawel.harlozinski@linux.intel.com>
Message-ID: <2dbc0b8b-2ea3-19e5-cc19-ad2f59b213c1@linux.intel.com>
Date: Wed, 2 Sep 2020 15:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <s5h5z976siz.wl-tiwai@suse.de>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

Hey!

Thanks for Your input!

I've created that patch because our validation is actually checking if 
values
in SDnFMT are matching their expectations, and they've found  it 
indicates 32 bits in 32 container while playing 24 bits in 32 container.
This could be fixed without touching checks of maxbps:

	switch (snd_pcm_format_width(format)) {
	case 8:
		val |= AC_FMT_BITS_8;
		break;
	case 16:
		val |= AC_FMT_BITS_16;
		break;
	case 20:
		val |= AC_FMT_BITS_20;
		break;
	case 24:
		if (maxbps >= 24)
			val |= AC_FMT_BITS_24;
		else
			val |= AC_FMT_BITS_20;
		break;
	case 32:
		if (maxbps >= 32 || format == SNDRV_PCM_FORMAT_FLOAT_LE)
			val |= AC_FMT_BITS_32;
		else if (maxbps >= 24)
			val |= AC_FMT_BITS_24;
		else
			val |= AC_FMT_BITS_20;
		break;
	default:
		return 0;
	}


I've simplified that because maxbps seems redundant here - thansk for 
catching Kai!
Although reason of  usage maxbps is still not clear (at least for me).

On 8/25/2020 10:25 AM, Takashi Iwai wrote:

> On Mon, 24 Aug 2020 14:16:26 +0200,
> Kai Vehmanen wrote:
>> Hey,
>>
>> On Mon, 24 Aug 2020, Pawel Harlozinski wrote:
>>
>>> Set SDnFMT depending on which format was given, as maxbps only describes container size.
>> hmm, I'm not entirely sure that is correct. Usage may be a bit varied, but
>> most places in existing code, "maxbps" is treated as number of significant
>> bits, not the container size. E.g. in hdac_hda.c:
>>
>> »       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> »       »       maxbps = dai->driver->playback.sig_bits;
>> »       else
>> »       »       maxbps = dai->driver->capture.sig_bits;
>>
>> It would seem "maxbps" is a bit superfluous given the same information can
>> be relayed in "format" as well. But currently it's still used. E.g. if you
>> look at snd_hdac_query_supported_pcm(), if codec reports 24bit support,
>> format is always set to SNDRV_PCM_FMTBIT_S32_LE even if only 24bit are valid.
So, for me looks like place where we can align with actual format, right ?
>>   So snd_pcm_format_width() will not return the expected significant
>> bits info, but you have to use "maxbps". So original code seems correct
>> (or at least you'd need to update both places).

> Hm, we need to check the call pattern, then.  The maxbps passed to
> this function was supposed to be the value obtained from
> snd_hdac_query_supported_pcm(), i.e. the codec capability.
Here I'm also not sure if we should just "cut" format  in 
snd_hdac_calc_stream_format (eg. 32 to 24) if codec does not support 32?

> But, basically this patch wouldn't change any practical behavior.  In
> the current code, snd_pcm_format_width() can be never 20 or 24,
> because the 24 and 24bit supports are also with SNDRV_PCM_FMT_S32_LE.
> That is, the cases 20 and 24 there are superfluous from the
> beginning (although the checks of maxbps are still needed
>
> Instead, what we could improve is:
> - Set up the proper msbits hw_constraint to reflect the maxbps value
> - Choose the right AC_FMT_BITS_* depending on the hw_params msbitsWe may change the query function not to return a single maxbps value
> but rather storing the raw PCM parameter value (AC_SUPPCM_*), and pass
> it at re-encoding the format value, too, if we want to make
>
> thanks,
>
> Takashi
