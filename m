Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF13DB9E7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 16:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA721682;
	Fri, 30 Jul 2021 16:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA721682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627653699;
	bh=vJwQUjY9Vmlzmn+SoP8MzwRfQqaTbW9LcWzWsFUsJFQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnE50wbJvJ65qotev20xdzMQUxkYujva0zmo1a7yZWXKpYoW7WYN2vqKSXI3SNdUu
	 e6mEsaIOWuIvvfv1xZi4DvS4HDt3ngsNBfSp4zGGS2C8gX+2UZOEwXR6gsEBSfD8j9
	 vUfpBvDCAfDvPB7s/7zqlCEGi3grQgzxYwxxdZpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1EC2F800ED;
	Fri, 30 Jul 2021 16:00:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2047F80253; Fri, 30 Jul 2021 16:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E199F8019B
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 16:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E199F8019B
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="235011951"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="235011951"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:59:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="508130447"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.24.117])
 ([10.213.24.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:59:56 -0700
Subject: Re: [PATCH] ASoC: intel: skylake: Drop superfluous mmap callback
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210728141930.17740-1-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <0157301f-d0c1-a4a6-ad3f-4e4ad01441f6@intel.com>
Date: Fri, 30 Jul 2021 15:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728141930.17740-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2021-07-28 4:19 PM, Takashi Iwai wrote:
> skl_platform_soc_mmap() just calls the standard mmap helper, hence
> it's superfluous.  Let's drop it.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/soc/intel/skylake/skl-pcm.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index b1ca64d2f7ea..c604200de80e 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -1214,13 +1214,6 @@ static snd_pcm_uframes_t skl_platform_soc_pointer(
>   	return bytes_to_frames(substream->runtime, pos);
>   }
>   
> -static int skl_platform_soc_mmap(struct snd_soc_component *component,
> -				 struct snd_pcm_substream *substream,
> -				 struct vm_area_struct *area)
> -{
> -	return snd_pcm_lib_default_mmap(substream, area);
> -}
> -
>   static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
>   				u64 nsec)
>   {
> @@ -1460,7 +1453,6 @@ static const struct snd_soc_component_driver skl_component  = {
>   	.trigger	= skl_platform_soc_trigger,
>   	.pointer	= skl_platform_soc_pointer,
>   	.get_time_info	= skl_platform_soc_get_time_info,
> -	.mmap		= skl_platform_soc_mmap,
>   	.pcm_construct	= skl_platform_soc_new,
>   	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
>   };
> 

Thanks for the input, Takashi.
While I welcome the change, have two quick questions:

1) Does this impact hw_support_mmap() and its user behavior? i.e. is 
there some implicit behavior change that skylake-users may experience 
along the way?

2) Since snd_pcm_mmap_data() defaults to snd_pcm_lib_default_mmap() why 
not update ops assignment - snd_pcm_set_ops() - in such a way that 
if/else is no longer needed in the former?

Pretty sure other drivers have been updated in similar fashion and my 
two cents should not be blocking integration:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Czarek
