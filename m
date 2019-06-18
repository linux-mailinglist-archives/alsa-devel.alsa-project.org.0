Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358449BAD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 10:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBB516F3;
	Tue, 18 Jun 2019 10:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBB516F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560845093;
	bh=rFnTNGWH+Dc/hQd+0S36XqftGs3b70CPIAlbfpqZgZY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PBKEnhoNzlze1aKfUx+yth4zrLNBrzBPrSQQmaNnfa9RbAcmfSrkDAxy5W8cqbUNL
	 peKQeg8NNvwRQWK0nyApgto8Dveo2d/8H2CRAnfqJQ8pb0lxeNCpJwoatdAJ7wUfw8
	 huvR3P+OZbrxsAdDoVzQPhgNtqWzP6BRm6y/9z10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57340F896DB;
	Tue, 18 Jun 2019 10:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DFC0F896F4; Tue, 18 Jun 2019 10:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B3DF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 10:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B3DF89682
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 01:03:01 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 18 Jun 2019 01:03:00 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 028A258028E;
 Tue, 18 Jun 2019 01:02:58 -0700 (PDT)
To: bgoswami@codeaurora.org, vkoul@kernel.org
References: <1560843846-4631-1-git-send-email-bgoswami@codeaurora.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <18a6f0ec-d34c-e45b-9db8-2950f4ab95d6@linux.intel.com>
Date: Tue, 18 Jun 2019 10:02:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560843846-4631-1-git-send-email-bgoswami@codeaurora.org>
Content-Language: en-US
Cc: Dhananjay Kumar <dhakumar@codeaurora.org>, alsa-devel@alsa-project.org,
 srinivas.kandagatla@linaro.org, plai@codeaurora.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ALSA: compress: avoid integer overflow for
 long duration offload playback
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/18/19 9:44 AM, bgoswami@codeaurora.org wrote:
> From: Banajit Goswami <bgoswami@codeaurora.org>
> 
> Currently a 32 bit variable is used for storing number of bytes
> copied to DSP, which can overflow when playback continues for a long
> duration.
> Change data type for this variable to __u64 to prevent overflow.

This clearly looks like a bug, the number of bytes transferred is stored 
as u64 in the runtime. I have no memories of this being intentional.

That said, it seems odd to me that you have an overflow on the number of 
bytes but not on the number of PCM frames. Shouldn't both the pcm_frames 
and pcm_io_frames fields also be changed to u64 while we are at it?

And the second issue is that this may impact apps. This is a ABI change, 
isn't it?

> 
> Signed-off-by: Dhananjay Kumar <dhakumar@codeaurora.org>
> Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
> ---
>   include/uapi/sound/compress_offload.h | 2 +-
>   sound/core/compress_offload.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index 56d9567..db5edf3 100644
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
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index a1a6fd7..2d0a709 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -184,7 +184,7 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
>   	if (!stream->ops->pointer)
>   		return -ENOTSUPP;
>   	stream->ops->pointer(stream, tstamp);
> -	pr_debug("dsp consumed till %d total %d bytes\n",
> +	pr_debug("dsp consumed till %d total %llu bytes\n",
>   		tstamp->byte_offset, tstamp->copied_total);
>   	if (stream->direction == SND_COMPRESS_PLAYBACK)
>   		stream->runtime->total_bytes_transferred = tstamp->copied_total;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
