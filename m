Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C961703B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 23:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64392162F;
	Wed,  2 Nov 2022 23:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64392162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667426780;
	bh=FS4e9nhVtW6hkotHWpM6LTMoaYsDhDQveLHvBrHl6HM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fEj2NNCWnaaC1XL4opTiF1+7BLOcmsISxNZAoJtWTu1FtJk7H33/kJ6l0s/OBsMg/
	 WBXy/O3pGarRz0WGzi3qmwqdGTVr19AW+4NPQJ2iuilTV+faaxp5vqCG34/xpz6aXe
	 P77BQm8+K6gIDDV0pCOkbn/0TMcQSPvJ0xnrL7fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C49C8F80155;
	Wed,  2 Nov 2022 23:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12008F8026D; Wed,  2 Nov 2022 23:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE9E1F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 23:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE9E1F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AQ4DdkJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667426721; x=1698962721;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FS4e9nhVtW6hkotHWpM6LTMoaYsDhDQveLHvBrHl6HM=;
 b=AQ4DdkJ1lUItMKHb4qNuhyu13m2vH+yUSWlfnYgjRHpAzH70VRqceGVp
 lr3SUx7Vc+b2AoibBMT5DnLKDmMSY58YuLJr1f88DetlJ5Uwf9qwql1fX
 h7GE5rSfLU6DodjKNmOaxOxuxw0BZRf7gK6i4eJBdNtx/W7Fbjft1gzGD
 E4Yhrs0f9wL0yiMv9tVkMfkjnEi/reYXKAHJ6DmL19JOYCHzgMPNJX74I
 VY0OByRyImL+4fHX6RwxF/l0l7oFgD5CKgbVk3YI9wsvyC5zztyHhQKkF
 gko0vF0nw2RU2C5vRuH/lQxpYmdgEQh/TUNbR4N1bTX/zcvkxDA5Gv3Ar Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="371625931"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="371625931"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 15:05:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585556710"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="585556710"
Received: from xuehongy-mobl1.amr.corp.intel.com (HELO [10.212.18.5])
 ([10.212.18.5])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 15:05:16 -0700
Message-ID: <2bbe7bed-21d4-018a-8957-10d9dbe0c661@linux.intel.com>
Date: Wed, 2 Nov 2022 18:05:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
To: Jason Montleon <jmontleo@redhat.com>, regressions@lists.linux.dev,
 oder_chiou@realtek.com, cezary.rojewski@intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20221102200527.4174076-1-jmontleo@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221102200527.4174076-1-jmontleo@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/2/22 16:05, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
> 
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending

Thanks for reporting this regression, much appreciated.

a) you need to CC: maintainers Mark Brown and Takashi Iwai
b) the commit title should be something like "ASoC: rt5514: fix legacy
dai naming".
c) it's not clear if this is actually enough. there's no
legacy_dai_naming for e.g. rt5663 and the .endianness member is not set.

Adding Charles Keepax for comments.

> ---
>  sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
> index 1a25a3787935..362663abcb89 100644
> --- a/sound/soc/codecs/rt5514-spi.c
> +++ b/sound/soc/codecs/rt5514-spi.c
> @@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
>  }
>  
>  static const struct snd_soc_component_driver rt5514_spi_component = {
> -	.name		= DRV_NAME,
> -	.probe		= rt5514_spi_pcm_probe,
> -	.open		= rt5514_spi_pcm_open,
> -	.hw_params	= rt5514_spi_hw_params,
> -	.hw_free	= rt5514_spi_hw_free,
> -	.pointer	= rt5514_spi_pcm_pointer,
> -	.pcm_construct	= rt5514_spi_pcm_new,
> +	.name			= DRV_NAME,
> +	.probe			= rt5514_spi_pcm_probe,
> +	.open			= rt5514_spi_pcm_open,
> +	.hw_params		= rt5514_spi_hw_params,
> +	.hw_free		= rt5514_spi_hw_free,
> +	.pointer		= rt5514_spi_pcm_pointer,
> +	.pcm_construct		= rt5514_spi_pcm_new,
> +	.legacy_dai_naming	= 1,
>  };
>  
>  /**
