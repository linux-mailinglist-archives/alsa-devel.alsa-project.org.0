Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF273AB710
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401341766;
	Thu, 17 Jun 2021 17:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401341766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942685;
	bh=jw4k15xH4jAiSnd7YuJMvtF5Bm/0lCP6HhVNnkMLHxs=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gs6/HF5KoqjIQ05PukCXF5SgJ4OccdIl49YOyq/LQrWcYlR7AFirr4g1+sKJauwJy
	 tqbRJImtteVscwPv9keGjh1U7FY4AYjAndZEceKdFoeJcq9hDcimxg2xpAxcoCJMoE
	 Tu6zDE82TXQoXpJ04RuckQz23U2U41qGRCuK0hY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE73AF80171;
	Thu, 17 Jun 2021 17:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C76ABF8025A; Thu, 17 Jun 2021 17:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4811EF80088
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4811EF80088
IronPort-SDR: 1dbDes9hBP5rW4gHSAUQ19bndy2hsiiET7szuGqt3Pgb/nZ1w4KXS+LOmoByd5hw0YsFsGROJf
 Idlym9Y9DIdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204559715"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="204559715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 08:09:46 -0700
IronPort-SDR: Vo0yhlzEoE7iZl4sIZKV+4QYJn/f0m0ECPz0+UGRkZZ0OG0zg8gS44nzTydw2h4Cmnp2EUxWpt
 cQ0RR6bjzAdg==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="485321278"
Received: from changwh-mobl1.amr.corp.intel.com (HELO [10.212.5.22])
 ([10.212.5.22])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 08:09:42 -0700
Subject: Re: [PATCH 1/1] ASoC: Intel: bdw-rt5677: remove unnecessary oom
 message
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <20210617103538.1818-1-thunder.leizhen@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fd1ab3c0-3a00-e810-b1de-656556222db0@linux.intel.com>
Date: Thu, 17 Jun 2021 09:09:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617103538.1818-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 6/17/21 5:35 AM, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bdw-rt5677.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 021bc59aac80..e01b7a90ca6c 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -423,10 +423,8 @@ static int bdw_rt5677_probe(struct platform_device *pdev)
>  	/* Allocate driver private struct */
>  	bdw_rt5677 = devm_kzalloc(&pdev->dev, sizeof(struct bdw_rt5677_priv),
>  		GFP_KERNEL);
> -	if (!bdw_rt5677) {
> -		dev_err(&pdev->dev, "Can't allocate bdw_rt5677\n");
> +	if (!bdw_rt5677)
>  		return -ENOMEM;
> -	}
>  
>  	/* override plaform name, if required */
>  	mach = pdev->dev.platform_data;
> 
