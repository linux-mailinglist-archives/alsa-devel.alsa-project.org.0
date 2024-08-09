Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234C94CB94
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 09:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98DE0E97;
	Fri,  9 Aug 2024 09:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98DE0E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723189398;
	bh=EZEmD9DuOTren8Yb/4Eh1tc1aNVW50mWaRZilWNBwi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KO5rn0h4HjfAzwyaOEkuchNk4j7+xzmnuhs4O71Uzs1eDjrWZ7lYSKyEt2NkYnOOL
	 pfa5dby3/NdG3sTyek0UQF1dCmubScTij4xj6w+TnGPB2W0JCP1BGSMEtKO8Rd/nbd
	 t6CsdCJF7EyXhWIg5nwA3RmrLt864iGfCmXaqoXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F77EF805B3; Fri,  9 Aug 2024 09:42:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BBFF80448;
	Fri,  9 Aug 2024 09:42:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2946CF802DB; Fri,  9 Aug 2024 09:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BEA8F800B0
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 09:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEA8F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gNfLeF35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723188358; x=1754724358;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EZEmD9DuOTren8Yb/4Eh1tc1aNVW50mWaRZilWNBwi8=;
  b=gNfLeF35K4ky/W1qrs3bZyaUe/UTwSncN7sc/wJ2L3OExc/3oc7hgO7J
   vTRd1lTg17GcenfOIlH74yOuY9hXcycpzihEKc27CxrUfL2rk+0Y+CZTm
   +hM17VqYg2MeHG9XWVj/yT1gnsO3vyddP8CyzLz7VoHdxaBWJHevCgoF8
   x6TulcaFGBoQz+Q/oEHHubYAJpHUA/kOXdOYZLw6KvVr+AkNuxIBN/yMW
   NoHZxBOW32PS0+0wRxALHmJ9WOXFvlXsKUh7FdB8T6H7I5076Jz7zNiK4
   6I2oOK+nyX7y5aOhqeIXHLngOPO0hfg/ldnC6HU6jrknzmGcrgvB9rJH+
   A==;
X-CSE-ConnectionGUID: I1eW9Xz6Q+uwT9Ht7hVcCA==
X-CSE-MsgGUID: FOrWV6rvQpqMhVftkocSEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12929855"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800";
   d="scan'208";a="12929855"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 00:25:50 -0700
X-CSE-ConnectionGUID: gLUemNmQTBu18Mf1kZVGHQ==
X-CSE-MsgGUID: Q8VA64rwRrKZxNZdPwAWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800";
   d="scan'208";a="57360819"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249])
 ([10.245.246.249])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 00:25:45 -0700
Message-ID: <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
Date: Fri, 9 Aug 2024 09:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IGH5NXFEGFETHYW2MQPGMC2MWYIJFPH6
X-Message-ID-Hash: IGH5NXFEGFETHYW2MQPGMC2MWYIJFPH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGH5NXFEGFETHYW2MQPGMC2MWYIJFPH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> Then there's the issue of parameters, we chose to only add parameters
>>>> for standard encoders/decoders. Post-processing is highly specific and
>>>> the parameter definitions varies from one implementation to another -
>>>> and usually parameters are handled in an opaque way with binary
>>>> controls. This is best handled with a UUID that needs to be known only
>>>> to applications and low-level firmware/hardware, the kernel code should
>>>> not have to be modified for each and every processing and to add new
>>>> parameters. It just does not scale and it's unmaintainable.
>>>>
>>>> At the very least if you really want to use this compress API,
>>>> extend it
>>>> to use a non-descript "UUID-defined" type and an opaque set of
>>>> parameters with this UUID passed in a header.
>>>
>>> We don't need to use UUID-defined scheme for simple (A)SRC
>>> implementation. As I noted, the specific runtime controls may use
>>> existing ALSA control API.
>>
>> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
>> performance, and how the drift estimator is handled. There's nothing
>> simple if you look under the hood. The SOF implementation has for
>> example those parameters:
>>
>> uint32_t source_rate;           /**< Define fixed source rate or */
>>                 /**< use 0 to indicate need to get */
>>                 /**< the rate from stream */
>> uint32_t sink_rate;             /**< Define fixed sink rate or */
>>                 /**< use 0 to indicate need to get */
>>                 /**< the rate from stream */
>> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
>>                 /**< When 1 the ASRC tracks and */
>>                 /**< compensates for drift. */
>> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the */
>>                 /**< ASRC consumes a defined number */
>>                 /**< of frames at input, with varying */
>>                 /**< number of frames at output. */
>>                 /**< In pull mode the ASRC outputs */
>>                 /**< a defined number of frames while */
>>                 /**< number of input frames varies. */
>>
>> They are clearly different from what is suggested above with a 'ratio-
>> mod'.
> 
> I don't think so. The proposed (A)SRC for compress-accel is just one
> case for the above configs where the input is known and output is
> controlled by the requested rate. The I/O mechanism is abstracted enough
> in this case and the driver/hardware/firmware must follow it.

ASRC is usually added when the nominal rates are known but the clock
sources differ and the drift needs to be estimated at run-time and the
coefficients or interpolation modified dynamically

If the ratio is known exactly and there's no clock drift, then it's a
different problem where the filter coefficients are constant.

>> Same if you have a 'simple EQ'. there are dozens of ways to implement
>> the functionality with FIR, IIR or a combination of the two, and
>> multiple bands.
>>
>> The point is that you have to think upfront about a generic way to pass
>> parameters. We didn't have to do it for encoders/decoders because we
>> only catered to well-documented standard solutions only. By choosing to
>> support PCM processing, a new can of worms is now open.
>>
>> I repeat: please do not make the mistake of listing all processing with
>> an enum and a new structure for parameters every time someone needs a
>> specific transform in their pipeline. We made that mistake with SOF and
>> had to backtrack rather quickly. The only way to scale is an identifier
>> that is NOT included in the kernel code but is known to higher and
>> lower-levels only.
> 
> There are two ways - black box (UUID - as you suggested) - or well
> defined purpose (abstraction). For your example 'simple EQ', the
> parameters should be the band (frequency range) volume values. It's
> abstract and the real filters (resp. implementation) used behind may
> depend on the hardware/driver capabilities.

Indeed there is a possibility that the parameters are high-level, but
that would require firmware or hardware to be able to generate actual
coefficients from those parameters. That usually requires some advanced
math which isn't necessarily obvious to implement with fixed-point hardware.

> From my view, the really special cases may be handled as black box, but
> others like (A)SRC should follow some well-defined abstraction IMHO to
> not force user space to handle all special cases.

I am not against the high-level abstractions, e.g. along the lines of
what Android defined:
https://developer.android.com/reference/android/media/audiofx/AudioEffect

That's not sufficient however, we also need to make sure there's an
ability to provide pre-computed coefficients in an opaque manner for
processing that doesn't fit in the well-defined cases. In practice there
are very few 3rd party IP that fits in well-defined cases, everyone has
secret-sauce parameters and options.
