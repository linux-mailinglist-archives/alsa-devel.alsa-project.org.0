Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A091894BD3D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 14:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B78783B;
	Thu,  8 Aug 2024 14:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B78783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723119552;
	bh=VmB/6QS1FQ+RUMXWz253lu/uSyqhXxIJWMc4iBtGTIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=au6WRLqAOb1YhZg18m+oFd2ZMf6x/GqTSL8oe5iy5fs1n1DsJ/WLIkPgLaDnNuK8k
	 Ah3LQPmtBjq6xvtR8fApmUTWlIRVN9i2+9O8PXAdBH2mSccJfQ5tO/0L6Bff9N3XwJ
	 YNW+FYKrEeVEnpsFyUyhxtZgj4g3t4mFQE06eP1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED396F805C2; Thu,  8 Aug 2024 14:18:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7AEF80589;
	Thu,  8 Aug 2024 14:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78FD6F800B0; Thu,  8 Aug 2024 13:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52819F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 13:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52819F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V68pMAlP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723116463; x=1754652463;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VmB/6QS1FQ+RUMXWz253lu/uSyqhXxIJWMc4iBtGTIA=;
  b=V68pMAlPTZ3xbmthgsHkwLGA0G+f3p9jjRweppw1chbpNWO85ejI/OYW
   Fur+9JdH60+1HA4ecjB6V9m+PDZNJ3AM2P6Vs2RqF9bAUr7gL9KMBA7BW
   Erzv9Mvxj/qSZmIyNbgal2sKKYdT0I3t8fYn+V/3aiAcjO0cdkUeKHwVj
   vdhlcbFfDMvu1cAN6hdWfiS99C8twhJXYCN6SBwqA3TkSRbu6uOhFJO6j
   LysbWmhUxnUZFTiJXLKwxAbsedPGpAR5UVQPlePLQO2mFObbGj8i0unhK
   qFI2scWvtcDDO5CCDa3jG3bXK2uX2nF4eA9ymGHOCeMl70U3FG1MtyBPQ
   Q==;
X-CSE-ConnectionGUID: WQtL2+ivQdqYlaVSkZrz5g==
X-CSE-MsgGUID: IN18TyMCRJmae8FtsmUiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38742178"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800";
   d="scan'208";a="38742178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:27:36 -0700
X-CSE-ConnectionGUID: CU7zVrCdQxe/FdISjC4yqQ==
X-CSE-MsgGUID: oN5J9gC0QvOy35eh/N/PBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800";
   d="scan'208";a="61575228"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.169])
 ([10.245.246.169])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:27:32 -0700
Message-ID: <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
Date: Thu, 8 Aug 2024 13:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QESXSGCJB5275CWJBYSTCSWOW4MFSH7W
X-Message-ID-Hash: QESXSGCJB5275CWJBYSTCSWOW4MFSH7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QESXSGCJB5275CWJBYSTCSWOW4MFSH7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/8/24 11:17, Shengjiu Wang wrote:
> On Tue, Aug 6, 2024 at 7:25 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 8/6/24 12:26, Shengjiu Wang wrote:
>>> Add Sample Rate Converter(SRC) codec support, define the output
>>> format and rate for SRC.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  include/uapi/sound/compress_offload.h | 2 ++
>>>  include/uapi/sound/compress_params.h  | 9 ++++++++-
>>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>>> index 98772b0cbcb7..8b2b72f94e26 100644
>>> --- a/include/uapi/sound/compress_offload.h
>>> +++ b/include/uapi/sound/compress_offload.h
>>> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>>>   * end of the track
>>>   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
>>>   * beginning of the track
>>> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample rate converter
>>>   */
>>>  enum sndrv_compress_encoder {
>>>       SNDRV_COMPRESS_ENCODER_PADDING = 1,
>>>       SNDRV_COMPRESS_ENCODER_DELAY = 2,
>>> +     SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>>>  };
>>
>> this sounds wrong to me. The sample rate converter is not an "encoder",
>> and the properties for padding/delay are totally specific to an encoder
>> function.
> 
> There is only decoder and encoder definition for compress,  I know
> it is difficult to add SRC to encoder or decoder classification,
> SRC is a Post Processing.  I hope you can have a recommandation

I don't. I think we're blurring layers in a really odd way.

The main reason why the compress API was added is to remove the
byte-to-time conversions. But that's clearly not useful for a
post-processing of PCM data, where the bitrate is constant. It really
feels like we're adding this memory-to-memory API to the compress
framework because we don't have anything else available, not because it
makes sense to do so.

Then there's the issue of parameters, we chose to only add parameters
for standard encoders/decoders. Post-processing is highly specific and
the parameter definitions varies from one implementation to another -
and usually parameters are handled in an opaque way with binary
controls. This is best handled with a UUID that needs to be known only
to applications and low-level firmware/hardware, the kernel code should
not have to be modified for each and every processing and to add new
parameters. It just does not scale and it's unmaintainable.

At the very least if you really want to use this compress API, extend it
to use a non-descript "UUID-defined" type and an opaque set of
parameters with this UUID passed in a header.
