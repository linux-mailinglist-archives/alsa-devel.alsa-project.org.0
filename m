Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A530B1D8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 22:05:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E6D91741;
	Mon,  1 Feb 2021 22:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E6D91741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612213512;
	bh=ztXIVFwTRaK6xzBOrrZAiTo5MD304P7b7AyWI9Tfld4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGCwoCJrI6TeGoTWPfnG0V9x2dOGQ5OanO7C1TIDrJnFMDPNW4l3Xy/0xZuguqiTc
	 q9vof03xHH+RXG9x3iV8fTZJkwlz4h5ejEpZfIuEZ89B0o/diQTDlYGfZFo3YOfFoM
	 mu71T8ILxwUkcVc5ADUjDjuthQo2oL8kU7D+Yz5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9779F800E9;
	Mon,  1 Feb 2021 22:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C804F80153; Mon,  1 Feb 2021 22:03:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2A4EF80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 22:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A4EF80151
IronPort-SDR: BBCn+/Ges6+84ic0tE2Dz/LZSHYfqkd+zvAmAEVF8Xe5pyKQXJ6mzu7dPMEcIR2SfOd+1VvgPw
 Hcdk2UVJUhaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265584577"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="265584577"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 13:03:07 -0800
IronPort-SDR: EeMcGpsK8a4WXBQnfF2gIr9r5pBNhA59Ldx84FRM6gZw4bgPX8N11Yn4ozZScjVCtQzoMTNkEZ
 D2ET/79A2yQA==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="391135495"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.23.187])
 ([10.213.23.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 13:03:04 -0800
Subject: Re: [PATCH] ASoC: Intel: catpt: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>, perex@perex.cz
References: <1612166481-121376-1-git-send-email-yang.lee@linux.alibaba.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <fb3dd21b-dde6-d9f7-e497-a443f60e7493@intel.com>
Date: Mon, 1 Feb 2021 22:03:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1612166481-121376-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On 2021-02-01 9:01 AM, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./sound/soc/intel/catpt/pcm.c:355:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   sound/soc/intel/catpt/pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
> index e5d54bb..88a0879 100644
> --- a/sound/soc/intel/catpt/pcm.c
> +++ b/sound/soc/intel/catpt/pcm.c
> @@ -352,7 +352,7 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>   		break;
>   	default:
>   		return 0;
> -	};
> +	}
>   
>   	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
>   		if (pos->private_data == component &&
> 

Hello Yang,

Your patch is much appreciated.

I noticed that more mistakes such as this have been made in the code. 
Could you please also update switch-statements in other parts of catpt 
(from what I've found, pcm.c has 2 occurrences while loader.c has 1)?

Regards,
Czarek
