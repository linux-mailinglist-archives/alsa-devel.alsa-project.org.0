Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03C53E4ED
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 15:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 143B61708;
	Mon,  6 Jun 2022 15:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 143B61708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654523941;
	bh=b+PF5aqHgJJTDHN5fE4LyMnovYfvDt2lXMkfoCrHbs0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cB3yMH5S+bXW7oKqlG9qo2icgfK3t7iVsqqCmRFnxuzO/ChK3gtIc9VKIy+0kC5JK
	 k6Sxn70NG7i08qHau7F9SlsJ0/js3N9MZYc+heA3vQamHa5R4jmXDe/M6Zx7fWrnNq
	 eQsQfTrW8lZJYLszR2URW9BhlW8kEKjw9OIl8mfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92982F80310;
	Mon,  6 Jun 2022 15:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79ADF801D8; Mon,  6 Jun 2022 15:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75134F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 15:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75134F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MvywN9hY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654523876; x=1686059876;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b+PF5aqHgJJTDHN5fE4LyMnovYfvDt2lXMkfoCrHbs0=;
 b=MvywN9hYHF/OWsA+VoRE8GG22HLKie8vc3/VTqz7vp/U5KCwTvQ1c/gB
 MoJCU8Dnnp+cjUiBSnSqdwjxgikLrO9yddOl05WDqexmmm5yEMrN9wExa
 YHwlzddcyZv+qx+RaT/RvlZHo67Grig2QeENBIupnO+eLBEWq5y5MKIMJ
 euLW0E2m4VSd2q64NajKQAjTH2EuumYL4ge068L8wRDiZhhxRYNomEiKN
 PuCxjAIFW8pI3QN7xBP7w25yktqu6qQJsd/KDigMtRc31RUjwvjuK9MWp
 aOaW3PJ+P3ruxoCXcUO7b/avdOYGFe0AtdmlR8ad5vFwByeT/bGkBVwPl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276696834"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276696834"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 06:57:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="583652043"
Received: from bylee-mobl1.amr.corp.intel.com (HELO [10.212.115.14])
 ([10.212.115.14])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 06:57:49 -0700
Message-ID: <2174656e-e96d-753e-5eeb-2a4ccf69bb94@linux.intel.com>
Date: Mon, 6 Jun 2022 08:45:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: Intel: broadwell: Make broadwell_disable_jack()
 return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20220605153904.26921-1-u.kleine-koenig@pengutronix.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220605153904.26921-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
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



On 6/5/22 10:39, Uwe Kleine-König wrote:
> broadwell_disable_jack() returns zero unconditionally. Letting it
> return void instead makes it easier to see in the callers that there is no
> error to handle.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/broadwell.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
> index d37c74fd1a3c..280e84bbe185 100644
> --- a/sound/soc/intel/boards/broadwell.c
> +++ b/sound/soc/intel/boards/broadwell.c
> @@ -227,7 +227,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
>  	},
>  };
>  
> -static int broadwell_disable_jack(struct snd_soc_card *card)
> +static void broadwell_disable_jack(struct snd_soc_card *card)
>  {
>  	struct snd_soc_component *component;
>  
> @@ -239,13 +239,13 @@ static int broadwell_disable_jack(struct snd_soc_card *card)
>  			break;
>  		}
>  	}
> -
> -	return 0;
>  }
>  
>  static int broadwell_suspend(struct snd_soc_card *card)
>  {
> -	return broadwell_disable_jack(card);
> +	broadwell_disable_jack(card);
> +
> +	return 0;
>  }
>  
>  static int broadwell_resume(struct snd_soc_card *card){
> @@ -315,7 +315,9 @@ static int broadwell_audio_remove(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card = platform_get_drvdata(pdev);
>  
> -	return broadwell_disable_jack(card);
> +	broadwell_disable_jack(card);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver broadwell_audio = {
> 
> base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
