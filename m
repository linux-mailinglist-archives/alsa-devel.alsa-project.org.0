Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C26E495128
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 16:14:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA9E2ED3;
	Thu, 20 Jan 2022 16:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA9E2ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642691662;
	bh=3YbFFj8EvgfpL4sQvGcwZK5Jy5qJ2rFuBkakW4WmXEo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQFKqwWua4i72B+tV+k5TvDQ5A5muhgpAs5Eu1B8CRc0s5OKzZRv+TUn7YTkLW6oJ
	 0jbcqXtk2ZtHIDviQUoheiZ/s6qMLsAcauOIqqa6J4/19MiFwGUD6AuelaseqPEIls
	 q+a8gTpkhlkRz4ZS5SSHEdFFqxYpwHqDPupfZqqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66975F80134;
	Thu, 20 Jan 2022 16:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA76F8012E; Thu, 20 Jan 2022 16:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B94F8007E
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 16:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B94F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="djbQcAQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642691590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dif+C+Zl6QCjPSy2Dh/zytGlPwVdgsHB7fsGJyn6IXs=;
 b=djbQcAQFqCGfSUSSCUxlCyksMnsNSfvvBRa50L7xjjHiIjV0Xl1LlVmWhYvff08xu/W+YY
 TwOBdvlmr+hG6Cqsdm1R5/2V4pwqeg8TH+T5ldWOlTDySW4dqRQIO9LeC577Qx3Zc1FlIe
 mBB50YFLg7Fe+VsZTjyIzhjUH7PA4q8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-RMdWoBlROOCXv8gXnW07RA-1; Thu, 20 Jan 2022 10:13:08 -0500
X-MC-Unique: RMdWoBlROOCXv8gXnW07RA-1
Received: by mail-ed1-f72.google.com with SMTP id
 p17-20020aa7c891000000b004052d1936a5so1825336eds.7
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 07:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dif+C+Zl6QCjPSy2Dh/zytGlPwVdgsHB7fsGJyn6IXs=;
 b=GE7PVO24jwgOk3hcGYBHvqo1DHjCrI6LdXP73WSsQY4BrtT9Tp319zM7SYFKM8qSgt
 ScUURKMTWRqskLI8+0+lQNACSn5LdqrZ2Elwn2Km0oYKsIXGeb3ey5hHLiRAuHe1CGPw
 Risv9HQ/NqFqcC3EtIkp6/1DHA6nFeOZs8T/nfF9maK1nsh5kXNcgBjYrK+citebmBvd
 irE9e4WS3ckxyMPrCp5/CQabbGEpPHflGFrcHtJbeWGilS35Vg8n5qHigJ+ea/G9u+so
 tVCE6BFlnALCOSmn5yYVTeN7NxzqvbAWWRfFI/7KeiK8fTb0BA9tB4iin2UV9jptMme1
 0ctg==
X-Gm-Message-State: AOAM531ScJiq1RdSfurFgdC+b1Czk8Nlp9oo+rcwtmqk0os95zpwawuH
 HHkE4gu0d2IiAkoUZtlJa6dAhcOrOqvhsWrtbgAiY8xPbNwO1EbxnsZGdoEokdTyl+sWb19XeiG
 88Hr7BfkR0YH0KkvhAar96s4=
X-Received: by 2002:a17:906:7e10:: with SMTP id
 e16mr10110213ejr.143.1642691586628; 
 Thu, 20 Jan 2022 07:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA9MtA8PkrxZUaZhliWBp4mWn1OrnfF9QzPn7Bnf6gLEWy17zIpjFboW+vz49FINJDp1CFLA==
X-Received: by 2002:a17:906:7e10:: with SMTP id
 e16mr10110190ejr.143.1642691586364; 
 Thu, 20 Jan 2022 07:13:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id g24sm1122075ejx.11.2022.01.20.07.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:13:05 -0800 (PST)
Message-ID: <faec4efb-de43-c35c-cc68-23a226440712@redhat.com>
Date: Thu, 20 Jan 2022 16:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 6/9] platform/x86: bus-multi-instantiate: Reorganize
 I2C functions
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-7-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-7-sbinding@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-spi@vger.kernel.org
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

On 1/20/22 14:43, Stefan Binding wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Reorganize I2C functions to accommodate SPI support
> Split the probe and factor out parts of the code
> that will be used in the SPI support
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/platform/x86/bus-multi-instantiate.c | 150 ++++++++++++-------
>  1 file changed, 96 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/platform/x86/bus-multi-instantiate.c b/drivers/platform/x86/bus-multi-instantiate.c
> index 982dfecfd27c..50f1540762e9 100644
> --- a/drivers/platform/x86/bus-multi-instantiate.c
> +++ b/drivers/platform/x86/bus-multi-instantiate.c
> @@ -29,85 +29,129 @@ struct bmi_instance {
>  
>  struct bmi {
>  	int i2c_num;
> -	struct i2c_client *i2c_devs[];
> +	struct i2c_client **i2c_devs;
>  };
>  
> -static int bmi_probe(struct platform_device *pdev)
> +static int bmi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
> +		       const struct bmi_instance *inst)
> +{
> +	int ret;
> +
> +	switch (inst->flags & IRQ_RESOURCE_TYPE) {
> +	case IRQ_RESOURCE_GPIO:
> +		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
> +		break;
> +	case IRQ_RESOURCE_APIC:
> +		ret = platform_get_irq(pdev, inst->irq_idx);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	if (ret < 0)
> +		dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d: %d\n",
> +			      inst->irq_idx, ret);
> +
> +	return ret;
> +}
> +
> +static void bmi_devs_unregister(struct bmi *bmi)
> +{
> +	while (bmi->i2c_num > 0)
> +		i2c_unregister_device(bmi->i2c_devs[--bmi->i2c_num]);
> +}
> +
> +/**
> + * bmi_i2c_probe - Instantiate multiple I2C devices from inst array
> + * @pdev:	Platform device
> + * @adev:	ACPI device
> + * @bmi:	Internal struct for Bus multi instantiate driver
> + * @inst:	Array of instances to probe
> + *
> + * Returns the number of I2C devices instantiate, Zero if none is found or a negative error code.
> + */
> +static int bmi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev, struct bmi *bmi,
> +			 const struct bmi_instance *inst_array)
>  {
>  	struct i2c_board_info board_info = {};
> -	const struct bmi_instance *inst;
>  	struct device *dev = &pdev->dev;
> -	struct acpi_device *adev;
> -	struct bmi *bmi;
>  	char name[32];
> -	int i, ret;
> +	int i, ret = 0, count;

Nitpick no need to init ret to 0 here since you re-assing
it immediately afterwards.

>  
> -	inst = device_get_match_data(dev);
> -	if (!inst) {
> -		dev_err(dev, "Error ACPI match data is missing\n");
> -		return -ENODEV;
> -	}
> -
> -	adev = ACPI_COMPANION(dev);
> -
> -	/* Count number of clients to instantiate */
>  	ret = i2c_acpi_client_count(adev);
> -	if (ret < 0)
> +	if (ret <= 0)
>  		return ret;
> +	count = ret;
>  
> -	bmi = devm_kmalloc(dev, struct_size(bmi, i2c_devs, ret), GFP_KERNEL);
> -	if (!bmi)
> +	bmi->i2c_devs = devm_kcalloc(dev, count, sizeof(*bmi->i2c_devs), GFP_KERNEL);
> +	if (!bmi->i2c_devs)
>  		return -ENOMEM;
>  
> -	bmi->i2c_num = ret;
> -
> -	for (i = 0; i < bmi->i2c_num && inst[i].type; i++) {
> +	for (i = 0; i < count && inst_array[i].type; i++) {
>  		memset(&board_info, 0, sizeof(board_info));
> -		strlcpy(board_info.type, inst[i].type, I2C_NAME_SIZE);
> -		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst[i].type, i);
> +		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
> +		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
>  		board_info.dev_name = name;
> -		switch (inst[i].flags & IRQ_RESOURCE_TYPE) {
> -		case IRQ_RESOURCE_GPIO:
> -			ret = acpi_dev_gpio_irq_get(adev, inst[i].irq_idx);
> -			if (ret < 0) {
> -				dev_err(dev, "Error requesting irq at index %d: %d\n",
> -						inst[i].irq_idx, ret);
> -				goto error;
> -			}
> -			board_info.irq = ret;
> -			break;
> -		case IRQ_RESOURCE_APIC:
> -			ret = platform_get_irq(pdev, inst[i].irq_idx);
> -			if (ret < 0) {
> -				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
> -					inst[i].irq_idx, ret);
> -				goto error;
> -			}
> -			board_info.irq = ret;
> -			break;
> -		default:
> -			board_info.irq = 0;
> -			break;
> -		}
> +
> +		ret = bmi_get_irq(pdev, adev, &inst_array[i]);
> +		if (ret < 0)
> +			goto error;
> +		board_info.irq = ret;
> +
>  		bmi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
>  		if (IS_ERR(bmi->i2c_devs[i])) {
>  			ret = dev_err_probe(dev, PTR_ERR(bmi->i2c_devs[i]),
>  					    "Error creating i2c-client, idx %d\n", i);
>  			goto error;
>  		}
> +		bmi->i2c_num++;
>  	}
> -	if (i < bmi->i2c_num) {
> +	if (bmi->i2c_num < count) {
>  		dev_err(dev, "Error finding driver, idx %d\n", i);
>  		ret = -ENODEV;
>  		goto error;
>  	}
>  
> -	platform_set_drvdata(pdev, bmi);
> -	return 0;
> +	dev_info(dev, "Instantiate %d I2C devices.\n", bmi->i2c_num);
>  
> +	return bmi->i2c_num;
>  error:
> -	while (--i >= 0)
> -		i2c_unregister_device(bmi->i2c_devs[i]);
> +	dev_err_probe(dev, ret, "I2C error %d\n", ret);

All the ways to get here already log a better error msg,
please drop this.

> +	bmi_devs_unregister(bmi);
> +
> +	return ret;
> +}
> +
> +static int bmi_probe(struct platform_device *pdev)
> +{
> +	const struct bmi_instance *inst_array;
> +	struct device *dev = &pdev->dev;
> +	struct acpi_device *adev;
> +	struct bmi *bmi;
> +	int ret;
> +
> +	inst_array = device_get_match_data(dev);
> +	if (!inst_array) {
> +		dev_err(dev, "Error ACPI match data is missing\n");
> +		return -ENODEV;
> +	}
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return -ENODEV;
> +
> +	bmi = devm_kzalloc(dev, sizeof(*bmi), GFP_KERNEL);
> +	if (!bmi)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, bmi);
> +
> +	ret = bmi_i2c_probe(pdev, adev, bmi, inst_array);
> +	if (ret > 0)
> +		return 0;
> +	if (ret == 0)
> +		ret = -ENODEV;
>  
>  	return ret;
>  }
> @@ -115,10 +159,8 @@ static int bmi_probe(struct platform_device *pdev)
>  static int bmi_remove(struct platform_device *pdev)
>  {
>  	struct bmi *bmi = platform_get_drvdata(pdev);
> -	int i;
>  
> -	for (i = 0; i < bmi->i2c_num; i++)
> -		i2c_unregister_device(bmi->i2c_devs[i]);
> +	bmi_devs_unregister(bmi);
>  
>  	return 0;
>  }
> 

Otherwise this looks good to me, with my 2 minor
remarsk addressed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

