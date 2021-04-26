Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCB36B8C0
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 20:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C7416FC;
	Mon, 26 Apr 2021 20:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C7416FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619460742;
	bh=I6+mQJavSn8QU8ZYke8MLy6feHtOtTMeqxuui/tbvs8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpUcf3qniVF6EB5wmT6gQLxJNttB8m0CwiVv+X/mPTV4ADvI84NAdJ3RCmiSg9R9b
	 ekPssx4SRPFeM90sPV7c4xQ2gP62Ik0vih+INXeUOTT/gSFQq2GLvlHMbtBAKyKPHy
	 rgn41WUwj4bdH5YEfXNOMxxsrLIotS1MNHvrvwUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE818F80171;
	Mon, 26 Apr 2021 20:10:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 431F3F800F0; Mon, 26 Apr 2021 20:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7101EF800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 20:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7101EF800F0
IronPort-SDR: n+0Gr3il0Hqex6t0WxX+QSIeB7qDgC6TgdMmcqG51eg/nkA3zT+T0jzUUUBp72fP6BKCunPUqr
 oAfoSvkBWrqg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="193195462"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="193195462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 11:10:38 -0700
IronPort-SDR: K72HWpNsFCd9TOfs43j9Odj/ZvFi2zNZSVWmmvIHxJHOmsIvAH0TBpzbK166BtHyvVtB7i/k6E
 SInRtm+FY+DA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="403006760"
Received: from fdubuc-mobl1.amr.corp.intel.com (HELO [10.212.41.8])
 ([10.212.41.8])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 11:10:37 -0700
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
Date: Mon, 26 Apr 2021 13:10:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421120512.413057-6-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 4/21/21 7:05 AM, Jerome Brunet wrote:
> Instead of using the clk embedded in the clk_hw (which is meant to go
> away), a clock provider which need to interact with its own clock should
> request clk reference through the clock provider API.
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

This patch seems to introduce a regression in our modprobe/rmmod tests

https://github.com/thesofproject/linux/pull/2870

RMMOD	snd_soc_da7219
rmmod: ERROR: Module snd_soc_da7219 is in use

Reverting this patch restores the ability to remove the module.

Wondering if devm_ increases a module/device refcount somehow?

> ---
>   sound/soc/codecs/da7219.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 13009d08b09a..bd3c523a8617 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2181,7 +2181,10 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
>   				 ret);
>   			goto err;
>   		}
> -		da7219->dai_clks[i] = dai_clk_hw->clk;
> +
> +		da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, dai_clk_hw, NULL);
> +		if (IS_ERR(da7219->dai_clks[i]))
> +			return PTR_ERR(da7219->dai_clks[i]);
>   
>   		/* For DT setup onecell data, otherwise create lookup */
>   		if (np) {
> 
