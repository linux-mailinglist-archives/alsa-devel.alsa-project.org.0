Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D603EDD40
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891D716BD;
	Mon, 16 Aug 2021 20:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891D716BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629139280;
	bh=aiX5AZ3RzXmqjrqvyt16zpZF1I7GHi6hFkhb4f60hhg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cW7VRNtCp6dC6EyizFAVjaIAoaxJPzK8SZnW0iVHtNF5nfKfAyI+nDrRGZIuqISk0
	 M+kQiRx8LrWcO+R7TY7psnduRCB1SI/Xq+y2p56dMXSI6cEVdRyG1MkN2zQ7pc5gA7
	 F27P+znkWWPok5RaS3igt60ycO7zoWreTBb+qa7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1DAF80425;
	Mon, 16 Aug 2021 20:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41D63F802BE; Mon, 16 Aug 2021 20:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 760B6F80249
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760B6F80249
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195501386"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="195501386"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 11:39:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="470893275"
Received: from vmartin1-mobl1.amr.corp.intel.com (HELO [10.212.120.166])
 ([10.212.120.166])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 11:39:40 -0700
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for HP Elite
 Pad 1000G2 jack-detect
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210815154935.101178-1-hdegoede@redhat.com>
 <20210815154935.101178-6-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f29d3c63-05ef-73f6-760c-e1b715d96651@linux.intel.com>
Date: Mon, 16 Aug 2021 08:31:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210815154935.101178-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

Hi Hans,
I am a bit confused by the use of acpi_dev_add_driver_gpios(). You call
it from the dailink .init function, and you call
acpi_dev_remove_driver_gpios() from the .exit function.

> @@ -1172,9 +1250,60 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
>  		snd_soc_component_set_jack(component, &priv->jack, NULL);
>  	}
>  
> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
> +		ret = snd_soc_card_jack_new(card, "Headset",
> +					    SND_JACK_HEADSET,
> +					    &priv->jack, rt5640_pins,
> +					    ARRAY_SIZE(rt5640_pins));
> +		if (ret)
> +			return ret;
> +
> +		ret = snd_soc_card_jack_new(card, "Headset 2",
> +					    SND_JACK_HEADSET,
> +					    &priv->jack2, rt5640_pins2,
> +					    ARRAY_SIZE(rt5640_pins2));
> +		if (ret)
> +			return ret;
> +
> +		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
> +					  byt_rt5640_hp_elitepad_1000g2_gpios);
> +
> +		rt5640_jack_gpio.data = priv;
> +		rt5640_jack_gpio.gpiod_dev = priv->codec_dev;
> +		rt5640_jack_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack1_check;
> +		ret = snd_soc_jack_add_gpios(&priv->jack, 1, &rt5640_jack_gpio);
> +		if (ret) {
> +			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
> +			return ret;
> +		}
> +
> +		rt5640_set_ovcd_params(component);
> +		rt5640_jack2_gpio.data = component;
> +		rt5640_jack2_gpio.gpiod_dev = priv->codec_dev;
> +		rt5640_jack2_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack2_check;
> +		ret = snd_soc_jack_add_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
> +		if (ret) {
> +			snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
> +			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> +static void byt_rt5640_exit(struct snd_soc_pcm_runtime *runtime)
> +{
> +	struct snd_soc_card *card = runtime->card;
> +	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
> +
> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
> +		snd_soc_jack_free_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
> +		snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
> +		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
> +	}
> +}

so far so good, but you also add/remove gpios in the machine driver probe

> @@ -1490,6 +1620,20 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  		return -EPROBE_DEFER;
>  	priv->codec_dev = get_device(codec_dev);
>  
> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
> +		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
> +					  byt_rt5640_hp_elitepad_1000g2_gpios);
> +		priv->hsmic_detect = devm_fwnode_gpiod_get(&pdev->dev, codec_dev->fwnode,
> +							   "headset-mic-detect", GPIOD_IN,
> +							   "headset-mic-detect");
> +		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
> +		if (IS_ERR(priv->hsmic_detect)) {
> +			ret_val = PTR_ERR(priv->hsmic_detect);
> +			dev_err_probe(&pdev->dev, ret_val, "getting hsmic-detect GPIO\n");
> +			goto err_device;
> +		}
> +	}
Does this part need to be part of the machine driver probe, or could it
be moved in the dailink .init function? Is this because you wanted to
use devm_ function?
