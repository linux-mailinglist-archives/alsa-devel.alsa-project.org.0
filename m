Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E7407975
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Sep 2021 18:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 229D315DC;
	Sat, 11 Sep 2021 18:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 229D315DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631376388;
	bh=8Oy5wfOm4wOYSTovPAQXPAKkzbeBwKK3mgI8j3u1RH4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sJkQ6Tn0EqEOzkH7gyPEFQbSVf3PEpgoZnn0psAJDK5zwhTcq/15nesV8zVuZ2Ocf
	 ZombQypfQBrUn67P4APja3VbxrJMQkpPmZuqg0hOIxRaxbhu06/s96DfedEfPJ/UBe
	 jVJsHPUwvrrUTlHUbPvKVIcVSr712EU1XTKvXASw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 823C4F80253;
	Sat, 11 Sep 2021 18:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44F6F80224; Sat, 11 Sep 2021 18:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83FC7F800AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Sep 2021 18:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FC7F800AE
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A5560F9C;
 Sat, 11 Sep 2021 16:04:52 +0000 (UTC)
Date: Sat, 11 Sep 2021 17:08:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 4/7] iio: adc: stm32-adc: add support of generic
 channels binding
Message-ID: <20210911170823.292aa672@jic23-huawei>
In-Reply-To: <20210908155452.25458-5-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-5-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 8 Sep 2021 17:54:49 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add support of generic IIO channel binding:
> ./devicetree/bindings/iio/adc/adc.yaml
> Keep support of st,adc-channels and st,adc-diff-channels
> for backward compatibility.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Hi Olivier,

A few minor things inline.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc.c | 99 +++++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 2f137d14f141..ae4a314854f7 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -35,7 +35,7 @@
>  #define STM32H7_BOOST_CLKRATE		20000000UL
>  
>  #define STM32_ADC_CH_MAX		20	/* max number of channels */
> -#define STM32_ADC_CH_SZ			10	/* max channel name size */
> +#define STM32_ADC_CH_SZ			16	/* max channel name size */
>  #define STM32_ADC_MAX_SQ		16	/* SQ1..SQ16 */
>  #define STM32_ADC_MAX_SMP		7	/* SMPx range is [0..7] */
>  #define STM32_ADC_TIMEOUT_US		100000
> @@ -1732,6 +1732,11 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
>  		num_channels += ret;
>  	}
>  
> +	if (!num_channels) {
> +		dev_err(indio_dev->dev.parent, "No channel found\n");
> +		return -ENODATA;

I'd return 0 and handle this at the caller.   Both because it makes this
patch more readable and because a count of 0 isn't an error of the function
reading how many they are, but rather at a higher level.

> +	}
> +
>  	return num_channels;
>  }
>  
> @@ -1792,6 +1797,73 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>  	return scan_index;
>  }
>  
> +static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
> +				       struct stm32_adc *adc,
> +				       struct iio_chan_spec *channels)
> +{
> +	struct device_node *node = indio_dev->dev.of_node;
> +	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
> +	struct device_node *child;
> +	const char *name;
> +	int val, scan_index = 0, ret;
> +	bool differential;
> +	u32 vin[2];
> +
> +	for_each_available_child_of_node(node, child) {
> +		ret = of_property_read_u32(child, "reg", &val);
> +		if (ret) {
> +			dev_err(&indio_dev->dev, "Missing channel index %d\n", ret);
> +			goto err;
> +		}
> +
> +		ret = of_property_read_string(child, "label", &name);
> +		/* label is optional */
> +		if (!ret) {
> +			if (strlen(name) >= STM32_ADC_CH_SZ) {
> +				dev_err(&indio_dev->dev, "Label %s exceeds %d characters\n",
> +					name, STM32_ADC_CH_SZ);
> +				return -EINVAL;
> +			}
> +			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
> +		} else if (ret != -EINVAL) {
> +			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (val >= adc_info->max_channels) {
> +			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		differential = false;
> +		ret = of_property_read_u32_array(child, "diff-channels", vin, 2);
> +		/* diff-channels is optional */
> +		if (!ret) {
> +			differential = true;
> +			if (vin[0] != val || vin[1] >= adc_info->max_channels) {
> +				dev_err(&indio_dev->dev, "Invalid channel in%d-in%d\n",
> +					vin[0], vin[1]);
> +				goto err;
> +			}
> +		} else if (ret != -EINVAL) {
> +			dev_err(&indio_dev->dev, "Invalid diff-channels property %d\n", ret);
> +			goto err;
> +		}
> +
> +		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
> +					vin[1], scan_index, differential);
> +		scan_index++;
> +	}
> +
> +	return scan_index;
> +
> +err:
> +	of_node_put(child);
> +
> +	return ret;
> +}
> +
>  static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  {
>  	struct device_node *node = indio_dev->dev.of_node;
> @@ -1800,15 +1872,21 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  	struct iio_chan_spec *channels;
>  	int scan_index = 0, num_channels = 0, ret, i;
>  	u32 smp = 0;
> +	bool legacy = false;
>  
> -	ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
> -	if (ret < 0)
> -		return ret;
> -	num_channels = ret;
> -
> +	num_channels = of_get_available_child_count(node);
> +	/*
> +	 * If no channels have been found, fallback to channels legacy properties.
> +	 * Legacy channel properties will be ignored, if some channels are

drop the ,

Legacy channel properties will be ignored if some channels...


> +	 * already defined using the standard binding.
> +	 */
>  	if (!num_channels) {
> -		dev_err(&indio_dev->dev, "No channels configured\n");
> -		return -ENODATA;
> +		ret = stm32_adc_get_legacy_chan_count(indio_dev, adc);
> +		if (ret < 0)
> +			return ret;
> +
> +		legacy = true;

Trivial but I would set legacy at top of this if block so it is nearer the comment.

> +		num_channels = ret;
>  	}
>  
>  	if (num_channels > adc_info->max_channels) {
> @@ -1832,7 +1910,10 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  	if (!channels)
>  		return -ENOMEM;
>  
> -	ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
> +	if (legacy)
> +		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels);
> +	else
> +		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
>  	if (ret < 0)
>  		return ret;
>  	scan_index = ret;

