Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45115957F0F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 09:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBDF7B70;
	Tue, 20 Aug 2024 09:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBDF7B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724137715;
	bh=NcREdHOzn6eEuhanW6i690bjb9VwRs6u8txLft1j9/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YUD5X1vdE1OkrDJMEZSAaR5LVc2CyXC7O7xmswnjsTAqwB7mtrofR8PHEeA/EyM+i
	 vZWunt3M8zJgb/iEf92fT7PRB5/iJVNYwx5fN/Lg7TYW6Jdlm05xn0C5N/J0DOjez0
	 yuDVLV8mG4m4scewLEwTCKSP5WFhfyM4TgX42XwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0673CF805B4; Tue, 20 Aug 2024 09:08:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A642F805AE;
	Tue, 20 Aug 2024 09:08:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A8FF80494; Tue, 20 Aug 2024 09:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFE61F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 08:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE61F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qx4HLjql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724137156; x=1755673156;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NcREdHOzn6eEuhanW6i690bjb9VwRs6u8txLft1j9/Q=;
  b=Qx4HLjql67pXMf+YO034HeAuBIfo+3gEbiGFkPy7+D6GKQnWgpXfNK1a
   5qJ7pqmp3y2btzjaaHNrIo5UkIkOqXldExw3qN7QV8QX8mcDjHStZ62P/
   OYrrm0lh2omDIxl9R3cWhAIi5ZSPjzhugMSBZplVsfHHJVbrukCi2fu3X
   q8Df16+jWFdQAY8R32BhSxy5SR4ucNjRoy8xc6ZIxV1/5CTryug9gS0rD
   yvgzRJR+WDLV3fq9gQjvXLXhw2immK3gFF7WU9n2+0G3u14B3UMOf0kLG
   YdyrkSylE3X8PgOi1IAxQJ8N5/B4MSy1DSpHDpFNaW+qrT8cHM9L+uQ5U
   Q==;
X-CSE-ConnectionGUID: oDggG5IxSoi7WLufvUFHDQ==
X-CSE-MsgGUID: oTRon8/sSgCBrNUN0+D7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="25317856"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="25317856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 23:59:10 -0700
X-CSE-ConnectionGUID: HkwFrFwHTIadBOLDMsLoOQ==
X-CSE-MsgGUID: kQY+sT18QaiAKg8czy5lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="61179403"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176])
 ([10.245.246.176])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 23:59:07 -0700
Message-ID: <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
Date: Tue, 20 Aug 2024 08:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HM72IGR7K2FCCXCNKLODJ5XRCWANLFDI
X-Message-ID-Hash: HM72IGR7K2FCCXCNKLODJ5XRCWANLFDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HM72IGR7K2FCCXCNKLODJ5XRCWANLFDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/20/24 04:53, Shengjiu Wang wrote:
> On Mon, Aug 19, 2024 at 3:42 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 8/16/24 12:42, Shengjiu Wang wrote:
>>> Implement the ASRC memory to memory function using
>>> the compress framework, user can use this function with
>>> compress ioctl interface.
>>>
>>> Define below private metadata key value for output
>>> format, output rate and ratio modifier configuration.
>>> ASRC_OUTPUT_FORMAT 0x80000001
>>> ASRC_OUTPUT_RATE   0x80000002
>>> ASRC_RATIO_MOD     0x80000003
>>
>> Can the output format/rate change at run-time?
> 
> Seldom I think.
> 
>>
>> If no, then these parameters should be moved somewhere else - e.g.
>> hw_params or something.
> 
> This means I will do some changes in compress_params.h, add
> output format and output rate definition, follow Jaroslav's example
> right?

yes, having parameters for the PCM case would make sense.

>> I am still not very clear on the expanding the SET_METADATA ioctl to
>> deal with the ratio changes. This isn't linked to the control layer as
>> suggested before, and there's no precedent of calling it multiple times
>> during streaming.
> 
> Which control layer? if you means the snd_kcontrol_new?  it is bound
> with sound card,  but in my case,  I need to the control bind with
> the snd_compr_stream to support multi streams/instances.

I can only quote Jaroslav's previous answer:

"
This argument is not valid. The controls are bound to the card, but the
element identifiers have already iface (interface), device and subdevice
numbers. We are using controls for PCM devices for example. The binding
is straight.

Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
device number in the 'struct snd_ctl_elem_id'.
"

>> I also wonder how it was tested since tinycompress does not support this?
> 
> I wrote a unit test to test these ASRC M2M functions.

This should be shared IMHO, usually when we add/extend a new interface
it's best to have a userspace test program that can be used by others.

>>> +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
>>> +                                     struct snd_compr_codec_caps *codec)
>>> +{
>>> +     struct fsl_asrc_m2m_cap cap;
>>> +     __u32 rates[MAX_NUM_BITRATES];
>>> +     snd_pcm_format_t k;
>>> +     int i = 0, j = 0;
>>> +     int ret;
>>> +
>>> +     ret = asrc->m2m_get_cap(&cap);
>>> +     if (ret)
>>> +             return -EINVAL;
>>> +
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_5512)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_5512);
>>
>> this doesn't sound compatible with the patch2 definitions?
>>
>> cap->rate_in = SNDRV_PCM_RATE_8000_768000;
> 
> This ASRC M2M driver is designed for two kinds of hw ASRC modules.
> 
> one cap is : cap->rate_in = SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5512;
> another is : cap->rate_in = SNDRV_PCM_RATE_8000_768000;
> they are in patch2 and patch3
> 
> 
>>
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_8000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_8000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_11025)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11025);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_16000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_22050)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22050);
>>
>> missing 24 kHz
> 
> There is no SNDRV_PCM_RATE_24000 in ALSA.

Right, but that doesn't mean 24kHz cannot be supported. We use
constraints in those cases. see quote from Takashi found with a 2s
Google search

https://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/069356.html

"
CONTINUOUS means that any rate between the specified min and max is
fine, if no min or max is specified any rate is fine. KNOT means there
are rates supported other than the standard rates defines by ALSA, but
the other rates are enumerable. You'd typically specify them by
explicitly listing them all and use a list constraint or you'd use one
of the ratio constraints.
"

>>> +     if (cap.rate_in & SNDRV_PCM_RATE_32000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_44100)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44100);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_48000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48000);
>>
>> missing 64kHz
> 
> Yes, will add it.

