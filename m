Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA037B2DB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 02:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3906E18B5;
	Wed, 12 May 2021 02:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3906E18B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620777665;
	bh=afzF/N4YfPd88GysaqG5InbnuS315uB7uJ/K+8FfnGk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBQUcRZevTna/GruHjp5s2oy0xWO1ypMSE2jfNXaLOc556JDZUFuE7pwtR0r/iNFj
	 6ItQfkh6Nws+5xnwsN0Mw0Q7j9y8DA5wNsKZSs8wKYqz3yuUBvASlqBzR47kjkFL2q
	 fGrKIWVCtI/xgMnS0k6WMqehd3j4zByxUKjmqatk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB0BF80129;
	Wed, 12 May 2021 01:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C103F80163; Wed, 12 May 2021 01:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03389F80129
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 01:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03389F80129
IronPort-SDR: bXaNyKGLvGXrvNMVq+9C08A911DSwRgvjakQbZjb6xWxayrQhx7Y3Nb9ffsOwuKwFmCz00B1S9
 jjreosYicb7w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="285075813"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="285075813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 16:59:14 -0700
IronPort-SDR: 1eg3/2jd0+0DWVZfQ1eOU/0pXex7QZOMt/fx23NVoygDZx2OkyFF0Dc2xVeUtXWxU1gYxTGPkO
 Rark/uWRdDUw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="537227989"
Received: from shase-mobl2.amr.corp.intel.com (HELO [10.209.160.43])
 ([10.209.160.43])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 16:59:14 -0700
Subject: Re: [PATCH] ASoC: soc-dai.h: Align the word of comment for
 SND_SOC_DAIFMT_CBC_CFC
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <8735usc1gr.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d8b5bf2b-ded7-1d9f-bd64-9c2758968dcd@linux.intel.com>
Date: Tue, 11 May 2021 18:59:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735usc1gr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 5/11/21 6:09 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Let's use "consumer" instead of "follower".
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Mark
> 
> I think this is just typo.

yes, it's my mistake. This was changed in 'ASoC: topology: use inclusive 
language for bclk and fsync', the first version used frame follower and 
this line was somehow not updated. Thanks for spotting this!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> 
>   include/sound/soc-dai.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 1358a0ceb4d0..0bc29c4516e7 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -81,7 +81,7 @@ struct snd_compr_stream;
>   #define SND_SOC_DAIFMT_CBP_CFP		(1 << 12) /* codec clk provider & frame provider */
>   #define SND_SOC_DAIFMT_CBC_CFP		(2 << 12) /* codec clk consumer & frame provider */
>   #define SND_SOC_DAIFMT_CBP_CFC		(3 << 12) /* codec clk provider & frame consumer */
> -#define SND_SOC_DAIFMT_CBC_CFC		(4 << 12) /* codec clk consumer & frame follower */
> +#define SND_SOC_DAIFMT_CBC_CFC		(4 << 12) /* codec clk consumer & frame consumer */
>   
>   /* previous definitions kept for backwards-compatibility, do not use in new contributions */
>   #define SND_SOC_DAIFMT_CBM_CFM		SND_SOC_DAIFMT_CBP_CFP
> 
