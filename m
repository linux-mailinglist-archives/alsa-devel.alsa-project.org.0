Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC039F0B2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 10:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE75169F;
	Tue,  8 Jun 2021 10:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE75169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623140394;
	bh=/qj+f9r9YfOBeyH+MctkZQITOB3fsDxQm5SoLGsJ0IY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3ac5WkqK5Iu8t4vp3EKZz+qPN/Proo+w9CN4KmBZ+8ZcciJUUIEUHX/kX1Quz91v
	 l61qk5n6H9nqToSKVL1NdaxGLhx0WvMsxwTbzADp+x26NemGWijlvvXY3wbMJ7rF5+
	 h8jBDxv4suXrZtCkk+4Rmox0e+NHOAiNcnwSbMZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC4AF80227;
	Tue,  8 Jun 2021 10:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C91F80218; Tue,  8 Jun 2021 10:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B35F8F80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 10:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35F8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Jx+IoV8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623140293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTARsla5mfqeE1qmJSu7fTWJIHgGxj/6ooeEUJDWjTw=;
 b=Jx+IoV8HCFA+uYHVl6MzARMF+m/HIbaqDT1WOYL72XojkQ20oDRbFYfEzBcSwHNXT316VX
 A5K/Ct+cFYOhW2UIdY6mUk1sr/BLXDVr444BXtT5DM3qv8aWuco33AfhQa7mrGUKNHOa2Y
 VuhhoE1e9n87lpHNFIFEXYk46JIJ72M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-5U8rH3krPZuvcdkUIhaP1g-1; Tue, 08 Jun 2021 04:18:11 -0400
X-MC-Unique: 5U8rH3krPZuvcdkUIhaP1g-1
Received: by mail-ej1-f70.google.com with SMTP id
 z15-20020a1709063a0fb029040d43ca6e95so3375984eje.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTARsla5mfqeE1qmJSu7fTWJIHgGxj/6ooeEUJDWjTw=;
 b=WX/f5ZQJWVEAgEwbfw+0GEH4WmKwBv8BIOII8JfgVnC8yDlvKRKkXgv/a6XI+fbV8q
 LDaRS3c4S5AOH7JOLYjvduQkK2EzQmvtwSvDiCmp9hhsYDcMt53TaDPH2IQQNEtNzhUK
 mZuEYE96RSDDckkEHXzIoslFNcQrb2xITrbAU1LmVmIVPUawkWNpPjqFKGq32Pg5w0ZW
 L8ab6HJX+OgLh0TdO8kjFmUyxZZH++RsgAeDXEyalX0RFpXCxvnZ7zwAXVD5KjePK7nA
 fSrGokO4Wcgl6fFrU0BUEszETC8i+HP5srJRso5mZaTIeOPhYrWMMOYUmnnCFb2ln95N
 j3hg==
X-Gm-Message-State: AOAM5318oga141R8WO7WSoo8GZWsYfwezbEIKeJdMCoWAFPujwwgdtNA
 bid2R4ucl1bI0AnTlQ4EaIvZLPPpwDFp5911ca2YQXe3bFrxgQnKNXSCl4Hun/t1i1wowOwoK6j
 BntRXzWIr/14yS9A5AcvlXtI=
X-Received: by 2002:a17:906:6814:: with SMTP id
 k20mr21852199ejr.455.1623140289946; 
 Tue, 08 Jun 2021 01:18:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWSIZKFe7TCZHOUwPwuvYgRMhdwZYKsEGZBI9jJUQH7CUnFuQGmmukj6AKqx5wE4FotXwasQ==
X-Received: by 2002:a17:906:6814:: with SMTP id
 k20mr21852180ejr.455.1623140289707; 
 Tue, 08 Jun 2021 01:18:09 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id c11sm8651272edr.80.2021.06.08.01.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:18:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] ASoC: Intel: boards: use software node API in Atom
 boards
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
 <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e8e01f6-d249-cc3e-2020-f6e5c81a4732@redhat.com>
Date: Tue, 8 Jun 2021 10:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 broonie@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Hi,

On 6/8/21 12:35 AM, Pierre-Louis Bossart wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The function device_add_properties() is going to be removed.
> Replacing it with software node API equivalents.
> 
> Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  sound/soc/intel/boards/bytcht_es8316.c | 25 ++++++++++++--
>  sound/soc/intel/boards/bytcr_rt5640.c  | 42 +++++++++++++++++++----
>  sound/soc/intel/boards/bytcr_rt5651.c  | 47 +++++++++++++++++++++-----
>  3 files changed, 97 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index a0af91580184..ef8ed3ff53af 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -38,6 +38,7 @@ struct byt_cht_es8316_private {
>  	struct snd_soc_jack jack;
>  	struct gpio_desc *speaker_en_gpio;
>  	bool speaker_en;
> +	struct device *codec_dev;
>  };
>  
>  enum {
> @@ -461,6 +462,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  	const struct dmi_system_id *dmi_id;
>  	struct device *dev = &pdev->dev;
>  	struct snd_soc_acpi_mach *mach;
> +	struct fwnode_handle *fwnode;
>  	const char *platform_name;
>  	struct acpi_device *adev;
>  	struct device *codec_dev;
> @@ -543,7 +545,16 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
>  
>  	if (cnt) {
> -		ret = device_add_properties(codec_dev, props);
> +		fwnode = fwnode_create_software_node(props, NULL);
> +		if (IS_ERR(fwnode)) {
> +			put_device(codec_dev);
> +			return PTR_ERR(fwnode);
> +		}
> +
> +		ret = device_add_software_node(codec_dev, to_software_node(fwnode));
> +
> +		fwnode_handle_put(fwnode);
> +
>  		if (ret) {
>  			put_device(codec_dev);
>  			return ret;
> @@ -556,6 +567,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  				/* see comment in byt_cht_es8316_resume */
>  				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>  	put_device(codec_dev);
> +	priv->codec_dev = codec_dev;
>  
>  	if (IS_ERR(priv->speaker_en_gpio)) {
>  		ret = PTR_ERR(priv->speaker_en_gpio);
> @@ -567,7 +579,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  			dev_err(dev, "get speaker GPIO failed: %d\n", ret);
>  			fallthrough;
>  		case -EPROBE_DEFER:
> -			return ret;
> +			goto err;
>  		}
>  	}
>  
> @@ -605,10 +617,15 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  	if (ret) {
>  		gpiod_put(priv->speaker_en_gpio);
>  		dev_err(dev, "snd_soc_register_card failed: %d\n", ret);
> -		return ret;
> +		goto err;
>  	}
>  	platform_set_drvdata(pdev, &byt_cht_es8316_card);
>  	return 0;
> +
> +err:
> +	device_remove_software_node(priv->codec_dev);
> +
> +	return ret;
>  }
>  
>  static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
> @@ -617,6 +634,8 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
>  	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
>  
>  	gpiod_put(priv->speaker_en_gpio);
> +	device_remove_software_node(priv->codec_dev);

This is a problem, nothing guarantees codec_dev not going away before
snd_byt_cht_es8316_mc_remove() runs. Although the only thing which I can come up
with where this happens is unbinding the i2c-controller driver I still would like
us to take this scenario into account.

I think it would be better to use device_create_managed_software_node() to tie
the lifetime of the swnode to the lifetime of the device, this also removes
the need for all the goto err cases (and introducing a remove function in
the bytcr_rt5640.c case).

This does mean that we could end up calling device_create_managed_software_node()
on the same device twice, when the machine driver gets unbound + rebound, but
that is an already existing issue with our current device_add_properties() usage.

We could fix this (in a separate commit since it is an already existing issue)
by adding a PROPERTY_ENTRY_BOOL("cht_es8316,swnode-created") property to the
properties and checking for that being set with
device_property_read_bool(codec, "cht_es8316,swnode-created")

Or we could move the device_put(codec_dev) to snd_byt_cht_es8316_mc_remove().

I've a slight preference for using device_create_managed_software_node() +
some mechanism to avoid a double adding of the properties, since I would like
to try and avoid the "goto err" additions.

Ideally device_create_managed_software_node() would detect the double-add
itself and it would return -EEXISTS. Heikki, would that be feasible ?

Regards,

Hans





> +
>  	return 0;
>  }
>  
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 91a6d712eb58..b3597b0f6836 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -87,6 +87,7 @@ enum {
>  struct byt_rt5640_private {
>  	struct snd_soc_jack jack;
>  	struct clk *mclk;
> +	struct device *codec_dev;
>  };
>  static bool is_bytcr;
>  
> @@ -912,9 +913,11 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   * Note this MUST be called before snd_soc_register_card(), so that the props
>   * are in place before the codec component driver's probe function parses them.
>   */
> -static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
> +static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name,
> +					     struct byt_rt5640_private *priv)
>  {
>  	struct property_entry props[MAX_NO_PROPS] = {};
> +	struct fwnode_handle *fwnode;
>  	struct device *i2c_dev;
>  	int ret, cnt = 0;
>  
> @@ -960,7 +963,18 @@ static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
>  	if (byt_rt5640_quirk & BYT_RT5640_JD_NOT_INV)
>  		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
>  
> -	ret = device_add_properties(i2c_dev, props);
> +	fwnode = fwnode_create_software_node(props, NULL);
> +	if (IS_ERR(fwnode)) {
> +		/* put_device() is not handled in caller */
> +		put_device(i2c_dev);
> +		return PTR_ERR(fwnode);
> +	}
> +
> +	ret = device_add_software_node(i2c_dev, to_software_node(fwnode));
> +
> +	fwnode_handle_put(fwnode);
> +	priv->codec_dev = i2c_dev;
> +
>  	put_device(i2c_dev);
>  
>  	return ret;
> @@ -1401,7 +1415,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Must be called before register_card, also see declaration comment. */
> -	ret_val = byt_rt5640_add_codec_device_props(byt_rt5640_codec_name);
> +	ret_val = byt_rt5640_add_codec_device_props(byt_rt5640_codec_name, priv);
>  	if (ret_val)
>  		return ret_val;
>  
> @@ -1434,7 +1448,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  			 * for all other errors, including -EPROBE_DEFER
>  			 */
>  			if (ret_val != -ENOENT)
> -				return ret_val;
> +				goto err;
>  			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
>  		}
>  	}
> @@ -1467,7 +1481,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5640_card,
>  							platform_name);
>  	if (ret_val)
> -		return ret_val;
> +		goto err;
>  
>  	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
>  
> @@ -1489,10 +1503,25 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  	if (ret_val) {
>  		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
>  			ret_val);
> -		return ret_val;
> +		goto err;
>  	}
>  	platform_set_drvdata(pdev, &byt_rt5640_card);
>  	return ret_val;
> +
> +err:
> +	device_remove_software_node(priv->codec_dev);
> +
> +	return ret_val;
> +}
> +
> +static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
> +
> +	device_remove_software_node(priv->codec_dev);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver snd_byt_rt5640_mc_driver = {
> @@ -1500,6 +1529,7 @@ static struct platform_driver snd_byt_rt5640_mc_driver = {
>  		.name = "bytcr_rt5640",
>  	},
>  	.probe = snd_byt_rt5640_mc_probe,
> +	.remove = snd_byt_rt5640_mc_remove
>  };
>  
>  module_platform_driver(snd_byt_rt5640_mc_driver);
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index e13c0c63a949..3066d00f3466 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -85,6 +85,7 @@ struct byt_rt5651_private {
>  	struct gpio_desc *ext_amp_gpio;
>  	struct gpio_desc *hp_detect;
>  	struct snd_soc_jack jack;
> +	struct device *codec_dev;
>  };
>  
>  static const struct acpi_gpio_mapping *byt_rt5651_gpios;
> @@ -527,10 +528,13 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
>   * Note this MUST be called before snd_soc_register_card(), so that the props
>   * are in place before the codec component driver's probe function parses them.
>   */
> -static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
> +static int byt_rt5651_add_codec_device_props(struct device *i2c_dev,
> +					     struct byt_rt5651_private *priv)
>  {
>  	struct property_entry props[MAX_NO_PROPS] = {};
> +	struct fwnode_handle *fwnode;
>  	int cnt = 0;
> +	int ret;
>  
>  	props[cnt++] = PROPERTY_ENTRY_U32("realtek,jack-detect-source",
>  				BYT_RT5651_JDSRC(byt_rt5651_quirk));
> @@ -547,7 +551,18 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
>  	if (byt_rt5651_quirk & BYT_RT5651_JD_NOT_INV)
>  		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
>  
> -	return device_add_properties(i2c_dev, props);
> +	fwnode = fwnode_create_software_node(props, NULL);
> +	if (IS_ERR(fwnode)) {
> +		/* put_device(i2c_dev) is handled in caller */
> +		return PTR_ERR(fwnode);
> +	}
> +
> +	ret = device_add_software_node(i2c_dev, to_software_node(fwnode));
> +
> +	fwnode_handle_put(fwnode);
> +	priv->codec_dev = i2c_dev;
> +
> +	return ret;
>  }
>  
>  static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
> @@ -994,7 +1009,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Must be called before register_card, also see declaration comment. */
> -	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
> +	ret_val = byt_rt5651_add_codec_device_props(codec_dev, priv);
>  	if (ret_val) {
>  		put_device(codec_dev);
>  		return ret_val;
> @@ -1023,7 +1038,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  				fallthrough;
>  			case -EPROBE_DEFER:
>  				put_device(codec_dev);
> -				return ret_val;
> +				goto err;
>  			}
>  		}
>  		priv->hp_detect = devm_fwnode_gpiod_get(&pdev->dev,
> @@ -1043,7 +1058,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  				fallthrough;
>  			case -EPROBE_DEFER:
>  				put_device(codec_dev);
> -				return ret_val;
> +				goto err;
>  			}
>  		}
>  	}
> @@ -1073,7 +1088,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  			 * for all other errors, including -EPROBE_DEFER
>  			 */
>  			if (ret_val != -ENOENT)
> -				return ret_val;
> +				goto err;
>  			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
>  		}
>  	}
> @@ -1102,7 +1117,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5651_card,
>  							platform_name);
>  	if (ret_val)
> -		return ret_val;
> +		goto err;
>  
>  	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
>  
> @@ -1124,10 +1139,25 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  	if (ret_val) {
>  		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
>  			ret_val);
> -		return ret_val;
> +		goto err;
>  	}
>  	platform_set_drvdata(pdev, &byt_rt5651_card);
>  	return ret_val;
> +
> +err:
> +	device_remove_software_node(priv->codec_dev);
> +
> +	return ret_val;
> +}
> +
> +static int snd_byt_rt5651_mc_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
> +
> +	device_remove_software_node(priv->codec_dev);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver snd_byt_rt5651_mc_driver = {
> @@ -1135,6 +1165,7 @@ static struct platform_driver snd_byt_rt5651_mc_driver = {
>  		.name = "bytcr_rt5651",
>  	},
>  	.probe = snd_byt_rt5651_mc_probe,
> +	.remove = snd_byt_rt5651_mc_remove,
>  };
>  
>  module_platform_driver(snd_byt_rt5651_mc_driver);
> 

