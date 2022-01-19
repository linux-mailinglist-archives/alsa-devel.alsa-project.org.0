Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A3493EA8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 17:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9221C3167;
	Wed, 19 Jan 2022 17:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9221C3167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642611452;
	bh=hvMNRV+46QTOBIdXa737oX1B+YE6eYwqV4rwsBUiW+k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3lcgyYsmbN2Ss1n6UInrOB9zsasc26ow7YbMrHw4F/07SsGJByuuiBDadazmOE2c
	 348R88vJaGvfOR7Xr5vkiiWLNfqdJADo1gAr2QClfL23F/bm+SyEXm9QfF5mnhYZqc
	 ji1oJmhsBQyYHLoeWWMGPI/GARa14pXr7HqHaTv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B56CFF80212;
	Wed, 19 Jan 2022 17:56:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B92F801F7; Wed, 19 Jan 2022 17:56:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C127CF80128;
 Wed, 19 Jan 2022 17:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C127CF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kHAxpBMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642611383; x=1674147383;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hvMNRV+46QTOBIdXa737oX1B+YE6eYwqV4rwsBUiW+k=;
 b=kHAxpBMpSJPveTFWP5apF+r0juJQAJEBfXXcnHbf2HLPzhdFx9WqfQxk
 z2mtHO32B/Ka5WZPCNhMmAs6gPUsuG2ft8wDJaxzZhlxwn8g1kOkI34vL
 BY9I+PsZvHx3+G2cS9dqREEZyouDEgvLJLQIWHCIzsOPS2wYpO9ZyQh4W
 0Iei04oNNzXNtpVm3uTYxx1Ee5q9rOPvJe+jNGPBNdhpvxTXdUdOL2AGA
 xjglhQ2Fpugo3y2pjecZGqg617g25qbLvA6DjFDq1aGHe+KNFaeS6MxKk
 V+dcInJwFJGbgUG8Q/SsCHnQxnWdb40cnW4cJuZtZSnEjjsOSMv/3XCBE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331463435"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="331463435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:56:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="475193495"
Received: from leechri2-mobl.amr.corp.intel.com (HELO [10.209.179.248])
 ([10.209.179.248])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:56:15 -0800
Subject: Re: [PATCH v2 2/2] ASoC: SOF: compress: Implement get_caps and
 get_codec_caps
To: Daniel Baluta <daniel.baluta@nxp.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20220118212732.281657-1-daniel.baluta@oss.nxp.com>
 <20220118212732.281657-3-daniel.baluta@oss.nxp.com>
 <41ae6093-8e27-01d4-e532-8a28fb1d9cf1@linux.intel.com>
 <8786f0c4-e60c-92ac-ba07-8244c785f75a@nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <729f7a48-0f6e-0569-74a3-f28363d16857@linux.intel.com>
Date: Wed, 19 Jan 2022 10:56:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8786f0c4-e60c-92ac-ba07-8244c785f75a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, paul.olaru@nxp.com,
 sound-open-firmware@alsa-project.org
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


>>>   +static int sof_compr_get_caps(struct snd_soc_component *component,
>>> +                  struct snd_compr_stream *cstream,
>>> +                  struct snd_compr_caps *caps)
>>> +{
>>> +    caps->num_codecs = 3;
>>> +    caps->min_fragment_size = 3840;
>>> +    caps->max_fragment_size = 3840;
>>> +    caps->min_fragments = 2;
>>> +    caps->max_fragments = 2;
>>> +    caps->codecs[0] = SND_AUDIOCODEC_MP3;
>>> +    caps->codecs[1] = SND_AUDIOCODEC_AAC;
>>> +    caps->codecs[2] = SND_AUDIOCODEC_PCM;
>>
>> I don't think you can add this unconditionally for all
>> devices/platforms, clearly this wouldn't be true for Intel for now.
>>
>> If the information is not part of a firmware manifest or topology, then
>> it's likely we have to use an abstraction layer to add this for specific
>> platforms.
>>
>> it's really a bit odd to hard-code all of this at the kernel level, this
>> was not really what I had in mind when we come up with the concept of
>> querying capabilities. I understand though that for testing this is
>> convenient, so maybe this can become a set of fall-back properties in
>> case the firmware doesn't advertise anything.
> 
> I see your point. I think for the moment I will remove this patch
> until I will come with a better solution.
> 
> One important thing is: where do we advertise the supported parameters:
> 
> 1) topology.
> 2) codec component instance (codec adapter) inside FW.
> 3) Linux kernel side based on some info about the current running platform.

I like the topology approach because it doesn't require an IPC to
retrieve the information and it doesn't require additional tables in the
firmware - which would increase the size for no good reason.

The topology also allows to remove support for the compressed path if
there are any concerns with memory/mcps usages in a given platform. DSPs
have finite resources and designers will need to trade off fancy noise
suppression libraries, large SRAM buffers to reduce power and compressed
audio codecs.

I think we need to have something in the firmware manifest that lists
the presence of the codec component in the build or installed libraries,
so that we can verify that topology and firmware are aligned. Otherwise
this will be really error-prone.

We've had this problem for a while now that the topology can refer to
components that are not part of the build, and it's problematic IMHO to
see an IPC error as a result of a firmware/topology mistmatch.

> Unfortunately, most of the existing users of this interface really do
> hardcode supported params:
> 
> e.g
> 
> intel/atom/sst/sst_drv_interface.c
> qcom/qdsp6/q6asm-dai.c
> uniphier/aio-compress.c
> 
> But that's because I think they only support one single platform family
> which has same capabilities.

I think Qualcomm probably has the same problems as us, the firmware can
be modified, so hard-coding in the kernel is far from ideal.

The unifier case is a bit different, IIRC they only support IEC formats
which at the kernel level can be treated as PCM. I am not sure why the
compressed interface was required here, but it's not wrong to use the
compressed interface as a domain-specific transport mechanism. Others do
it was well for audio over SPI and on the Intel side the probes are
based on a custom transport format to multiplex all the PCM data on a
single 'compressed' stream.

