Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6299228CE1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 01:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827741681;
	Wed, 22 Jul 2020 01:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827741681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595375421;
	bh=hR8QIt+3xcJPTtsHdsLlCf/w5pNEnuJNtckP3AcHg3A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojuu1TJdfeb3l5/O7lkq9Rs8plBI8nEDn34LZ7HkeIeYftUFhl9R+AiJweK4gy6nM
	 Km3itRgSyP2MDJJjLChJBIz8RMadgkugVNz4CLnYjY089sBg3vi7sscFUCVDe1unfo
	 kanyWwq9gg5Ngi8LLFijR+Xs3GUptljKhZo9U1bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E66DF802E3;
	Wed, 22 Jul 2020 01:46:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4BDFF802C3; Wed, 22 Jul 2020 01:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E3BF800CE
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E3BF800CE
IronPort-SDR: yoKk1Qc4lJrzFqJgJ28IlTdTB1nQDp586RlXBLAwQAeUX2V4JU65UH7cKlszWTzxLOSFnzUlch
 uk/RalTdUkSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151576930"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="151576930"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:09 -0700
IronPort-SDR: wc+uY8YHF6cpWC1QeyVMOkBN9R/+J1/fj5PVm9xD0XLfPMqH1FhcWst+5zBoliY0UJx0mTrZJ7
 dZW4AaGDOKMQ==
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="362539385"
Received: from krlloyd-mobl.amr.corp.intel.com (HELO [10.255.231.6])
 ([10.255.231.6])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:08 -0700
Subject: Re: [RFC PATCH v2 2/6] ALSA: compress: add new ioctl for setting
 codec parameters
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
 <20200721170007.4554-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ee2dc239-c1a7-f48f-c6f0-ec6e61ccdda6@linux.intel.com>
Date: Tue, 21 Jul 2020 15:05:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721170007.4554-3-srinivas.kandagatla@linaro.org>
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



On 7/21/20 12:00 PM, Srinivas Kandagatla wrote:
> For gapless playback it is possible that each track can have different
> codec profile with same decoder, for example we have WMA album,
> we may have different tracks as WMA v9, WMA v10 and so on
> 
> Or if DSP's like QDSP have abililty to switch decoders on single stream

ability

> for each track, then this call could be used to set new codec parameters.
> 
> Existing code does not allow to change this profile while doing gapless
> playback.
> 
> This patch adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL to allow
> userspace to set this new parameters required for new codec profile.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   .../sound/designs/compress-offload.rst        |  6 ++++
>   include/sound/compress_driver.h               |  5 +++
>   include/uapi/sound/compress_offload.h         |  1 +
>   sound/core/compress_offload.c                 | 34 +++++++++++++++++++
>   4 files changed, 46 insertions(+)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index 935f325dbc77..305ccc7bfdd9 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -128,6 +128,12 @@ set_params
>     cases decoders will ignore other fields, while encoders will strictly
>     comply to the settings
>   
> +set_codec_params
> +  This routine is very much simillar to set_params but exculding stream

typos: similar, excluding

> +  information. Only codec related information is set as part of this.
> +  It is used in gapless playback where its required to change decoder
> +  or its parameters for next track. This is optional.
> +
>   get_params
>     This routines returns the actual settings used by the DSP. Changes to
>     the settings should remain the exception.
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
> index 70cbc5095e72..d9c00bcfce9b 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -93,6 +93,9 @@ struct snd_compr_stream {
>    * @set_params: Sets the compressed stream parameters, mandatory
>    * This can be called in during stream creation only to set codec params
>    * and the stream properties
> + * @set_codec_params: Sets the compressed stream codec parameters, Optional
> + * This can be called in during gapless next track codec change only to set
> + * codec params

Would it be clearer if this was called set_next_codec_params()? or 
set_next_track_codec_params()?

Having set_params() and set_codec_params() is a bit confusing since the 
semantic difference is not captured in the callback name.

