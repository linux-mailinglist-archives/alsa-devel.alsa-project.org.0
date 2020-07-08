Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB0218928
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE50167C;
	Wed,  8 Jul 2020 15:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE50167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594215245;
	bh=k9yEvZWF82P/ZW8C1fASHcEBrQtDL3VN44vG/M6C1vs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UocnAEUfmsKz1j72y8WD0wCfhSjP8v5K2vtBV2ngUUH2T3KHwKtaBdqnlyQT0HM3P
	 Ma2IfFWdfq9e5HDG0yDm+JwJnPSf8P2OmkV5TnqgeKDl0WO04KspPvshx1s/T/HFTV
	 tgLWczl/Oc7ZErT+E6+z10ZUTaQWGqlZqaX/mC10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD7BF800AE;
	Wed,  8 Jul 2020 15:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACB9AF80150; Wed,  8 Jul 2020 15:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17339F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17339F800AE
IronPort-SDR: i9H6NT1uubN1sZUDKvv2sy0ZH3s5ycvUDu8YcdbZIIXm04PjDT8BDtadEOdPbGwXk5r8fJ8K79
 CkmEKEWjYLzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212731851"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="212731851"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:32:04 -0700
IronPort-SDR: JpZagW8MXgMBvYL2D8nB9CPV8hqSBf7SjbpT5EbikngkLv4RhwnVp/V/1aWGE07okKPQTvc2KL
 8xAPSOsMJkdw==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="306046990"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:32:03 -0700
Subject: Re: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
 <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
 <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
Date: Wed, 8 Jul 2020 08:32:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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


>>> Add support to gapless playback by implementing metadata,
>>> next_track, drain and partial drain support.
>>>
>>> Gapless on Q6ASM is implemented by opening 2 streams in a single asm 
>>> stream
>>
>> What does 'in a single asm stream' means?
> 
> 
> So in QDSP6 ASM (Audio Stream Manager) terminology we have something 
> called "asm session" for each ASoC FE DAI, Each asm session can be 
> connected with multiple streams (upto 8 I think). However there will be 
> only one active stream at anytime. Also there only single data buffer 
> associated with each asm session.
> 
> For Gapless usecase, we can keep two streams open for one asm-session, 
> allowing us to fill in data on second stream while first stream is playing.

Ah, that's interesting, thanks for the details. So you have one DMA 
transfer and the data from the previous and next track are provided in 
consecutive bytes in a ring buffer, but at the DSP level you have a 
switch that will feed data for the previous and next tracks into 
different decoders, yes?

If that is the case, indeed the extension you suggested earlier to 
change the profile is valid. You could even change the format I guess.

To avoid confusion I believe the capabilities would need to be extended 
so that applications know that gapless playback is supported across 
unrelated profiles/formats. The point is that you don't want a 
traditional implementation to use a capability that isn't supported in 
hardware or will lead to audio issues.

>>> and toggling them on next track.
>>
>> It really seems to me that you have two streams at the lowest level, 
>> along with the knowledge of how many samples to remove/insert and 
>> hence could do a much better job - including gapless support between 
>> unrelated profiles and cross-fading - without the partial drain and 
>> next_track mechanism that was defined assuming a single stream/profile.
> At the end of the day its a single session with one data buffer but with 
> multiple streams.
> 
> Achieving cross fade should be easy with this design.

looks like it indeed.

> We need those hooks for partial drain and next track to allow us to 
> switch between streams and pass silence information to respective stream 
> ids.

right, but the key point is 'switch between streams'. That means a more 
complex/capable implementation that should be advertised as such to 
applications. This is not the default behavior assumed initially: to 
allow for minimal implementations in memory-constrained devices, we 
assumed gapless was supported with a single decoder.

Maybe the right way to do this is extend the snd_compr_caps structure:

/**
  * struct snd_compr_caps - caps descriptor
  * @codecs: pointer to array of codecs
  * @direction: direction supported. Of type snd_compr_direction
  * @min_fragment_size: minimum fragment supported by DSP
  * @max_fragment_size: maximum fragment supported by DSP
  * @min_fragments: min fragments supported by DSP
  * @max_fragments: max fragments supported by DSP
  * @num_codecs: number of codecs supported
  * @reserved: reserved field
  */
struct snd_compr_caps {
	__u32 num_codecs;
	__u32 direction;
	__u32 min_fragment_size;
	__u32 max_fragment_size;
	__u32 min_fragments;
	__u32 max_fragments;
	__u32 codecs[MAX_NUM_CODECS];
	__u32 reserved[11];
} __attribute__((packed, aligned(4)));


and use a reserved field to provide info on capabilities, and filter the 
set_codec_params() addition based this capability - i.e. return -ENOTSUP 
in 'traditional' implementations based on a single 'stream'/decoder 
instance.
