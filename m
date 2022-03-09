Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD94D3148
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 15:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF565173C;
	Wed,  9 Mar 2022 15:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF565173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646837554;
	bh=mQpK9Al/CtmcglF/+fe/dahXKGKv7EP/7LIopBJNDQs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVvs/P2hWKL6tuOYRSiJSiEINUNQwyF3Xeb0Zd/vxWpUlzhvQ6C19I+WY8hkJ2R5N
	 VqmUt5AGD+AlahjBh8Xr2yWQPG/+O5eeMpJiI6MKiY4SH50swFWRlOchAtEQ/2W3N1
	 T3rEI0YBndp1WvMIJTgAHSRG9/5zMW16xF9+beF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A3E3F80236;
	Wed,  9 Mar 2022 15:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B059F8016C; Wed,  9 Mar 2022 15:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9D7F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 15:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9D7F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n3Tw0iUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646837479; x=1678373479;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mQpK9Al/CtmcglF/+fe/dahXKGKv7EP/7LIopBJNDQs=;
 b=n3Tw0iUKHh6gX7+UNVlhHfbBg+BSoBBooZ2KeQ2jtzR323VjgBaGiKQs
 uFUMTpZ9St/mD8mEuOuktECvQwgOy4MZ+gMhxt/rno0rBywOohPmZWZuq
 GDd2q2qWCnt6+KJF57PjZecsTPinfksbfiJCgR4dl8v0OV4fnwDEI4Hf4
 z5DgKbjLJkckZb27KJLecSHAIFP8s4sz4WV8FruAK8znSrb6Y15BaU5sd
 JEXW09SZkEUtTwvfusUfC14GIJ08hYEJsWzE0zfbIXj4qoXnjRBymKPpy
 UKoFqBSjnQK0XPN21MqS4d4DsGLQbMxKMGKwfqiuY8H7EiO48l64n4VqX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="318215503"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="318215503"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 06:51:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="513543953"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.241])
 ([10.99.241.241])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 06:51:12 -0800
Message-ID: <37933410-1bc7-3e27-50e8-3da03e8b5603@linux.intel.com>
Date: Wed, 9 Mar 2022 15:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V0 1/1] ASoC: msm: fix integer overflow for long duration
 offload playback
Content-Language: en-US
To: Raghu Bankapur <quic_rbankapu@quicinc.com>, Vinod Koul
 <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <cover.1646835508.git.quic_rbankapu@quicinc.com>
 <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quiinc.com>
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

On 3/9/2022 3:22 PM, Raghu Bankapur wrote:
> From: Raghu Bankapur <quic_rbankapu@quiinc.com>
> 
> 32 bit variable is used for storing number of bytes copied to DSP,
> which can overflow when playback duration goes beyond 24 hours.
> Change data type for this variable to uint64_t to prevent overflow
> and related playback anomaly.
> 
> Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
> ---
>   include/uapi/sound/compress_offload.h | 2 +-
>   sound/core/compress_offload.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index 9555f31c8425..57d24d89b2f4 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -67,7 +67,7 @@ struct snd_compr_params {
>    */
>   struct snd_compr_tstamp {
>   	__u32 byte_offset;
> -	__u32 copied_total;
> +	__u64 copied_total;
>   	__u32 pcm_frames;
>   	__u32 pcm_io_frames;
>   	__u32 sampling_rate;

I don't think this patch should be merged as is. It changes UAPI header, 
most likely breaking existing user space tools. Can't overflow be 
handled somehow instead?

Although having looked around, it makes a bit of sense, as 
snd_compr_update_tstamp() copies tstamp->copied_total to 64 bit variables...

Perhaps raise protocol version? ( 
https://elixir.bootlin.com/linux/latest/source/include/uapi/sound/compress_offload.h#L34 
)

> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index de514ec8c83d..068376b586be 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -169,7 +169,7 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
>   	if (!stream->ops->pointer)
>   		return -ENOTSUPP;
>   	stream->ops->pointer(stream, tstamp);
> -	pr_debug("dsp consumed till %d total %d bytes\n",
> +	pr_debug("dsp consumed till %d total %llu bytes\n",
>   		tstamp->byte_offset, tstamp->copied_total);
>   	if (stream->direction == SND_COMPRESS_PLAYBACK)
>   		stream->runtime->total_bytes_transferred = tstamp->copied_total;

