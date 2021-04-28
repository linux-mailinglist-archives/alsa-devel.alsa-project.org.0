Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E136DB1E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 17:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03B9116AA;
	Wed, 28 Apr 2021 17:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03B9116AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619623161;
	bh=KdbXhLENEctAM1A6cuOswYAhpjeyxefr9/m/9SiOQ/w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0zYoSRms6/Zqd5AQQ2Ec2fhLrziL5DwzTc9XmmR9x/14ncxt+kmquuPTHJX4rOU5
	 Jn8CIMwqCki17p3P16G9Kj6n6LJ9RY+lzKmLugtnqdQqXTm1pOezRSENziVsP8CMLF
	 bhC7uCtGcs9819tUkgAH8nAcOGw5OKZzx0mIvQCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72EB1F80130;
	Wed, 28 Apr 2021 17:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25236F8012A; Wed, 28 Apr 2021 17:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8734BF8012A
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 17:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8734BF8012A
IronPort-SDR: oVY5TDhWwlnhxCoJ5zpyM2U2BYXGyKrIT9mVHD79uZi1YPDu4cAjnnmbf+IvBOUGW5EUVYh2lk
 ZwznVCZ9Cqpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196873813"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="196873813"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 08:17:38 -0700
IronPort-SDR: v7aXp3XAG64N5KnxOone90boPMhRuHAx6C1pPUPFr8uHerT0fLoM1+VX/WGeRvFfVJTSiCoxZ6
 mHbc9/4mFgCw==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="619348552"
Received: from sachanta-mobl.amr.corp.intel.com (HELO [10.209.170.35])
 ([10.209.170.35])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 08:17:37 -0700
Subject: Re: [PATCH 2/2] ASoC: da7219: do not request a new clock consummer
 reference
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20210428122632.46244-1-jbrunet@baylibre.com>
 <20210428122632.46244-3-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ddf546e9-e160-d865-0a49-a25a1ea4ca96@linux.intel.com>
Date: Wed, 28 Apr 2021 10:17:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428122632.46244-3-jbrunet@baylibre.com>
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



On 4/28/21 7:26 AM, Jerome Brunet wrote:
> This reverts commit 12f8127fe9e6154dd4197df97e44f3fd67583071.
> 
> There is problem with clk_hw_get_hw(). Using it pins the clock provider to
> itself, making it impossible to remove the module.
> 
> Revert commit 12f8127fe9e6 ("ASoC: da7219: properly get clk from the
> provider") until this gets sorted out.
> 
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I added this patch in the SOF tree and the CI results are back to 
normal: https://sof-ci.01.org/linuxpr/PR2879/build5689/devicetest/

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Jerome, this was a surprising/hard-to-detect side effect.

> ---
>   sound/soc/codecs/da7219.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index bd3c523a8617..13009d08b09a 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2181,10 +2181,7 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
>   				 ret);
>   			goto err;
>   		}
> -
> -		da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, dai_clk_hw, NULL);
> -		if (IS_ERR(da7219->dai_clks[i]))
> -			return PTR_ERR(da7219->dai_clks[i]);
> +		da7219->dai_clks[i] = dai_clk_hw->clk;
>   
>   		/* For DT setup onecell data, otherwise create lookup */
>   		if (np) {
> 
