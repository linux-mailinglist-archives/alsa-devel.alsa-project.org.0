Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4AD4A5E80
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:43:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CFB11781;
	Tue,  1 Feb 2022 15:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CFB11781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643726609;
	bh=HTHlcbzAOIIu5QRosE9I1oqrO9vjA4TE6gRCqciQSos=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BdjynBwyiX5lVGpQWwgI0TDV0SMT4TFTHWe7bQ1v8RbCDu/leJA3Ujn7IrdAhdNbg
	 4fUnmr8YDF+zo6In+fvO6b2NvUAS59XJQpkKcT8inRa/E9uOJCh8IaMrKXtaEzl/f8
	 jCsbJ/aldjNwssDvDUM6hguQqHNWK64RRF2z7lh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AE2F80089;
	Tue,  1 Feb 2022 15:42:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE8C1F80130; Tue,  1 Feb 2022 15:42:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3073F80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3073F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Kus3AhED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjzDEqkfJ2N8210XIx7ybjZjd9nnlt1goBZyP/z8PRo=;
 b=Kus3AhEDZaTME6nz/GW1WGxfjNUvNEGhAaFcVNUPV9V+xRgyc3IMP5fEC5iiZ/yiHByfVw
 souxnsAV7cwM35S2tuJMfV4kw7FvbbaMm3wrapRwUvosd0x62MXDQkBoThkLsvxAPRuMTx
 Ky4SbKlgS13P7+/aeC4+jWImAJwEwfk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-Bnd2tW5YMRKrV7gjgJ8EQw-1; Tue, 01 Feb 2022 09:42:11 -0500
X-MC-Unique: Bnd2tW5YMRKrV7gjgJ8EQw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q10-20020a5085ca000000b0040e3ecf0ec2so943306edh.14
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjzDEqkfJ2N8210XIx7ybjZjd9nnlt1goBZyP/z8PRo=;
 b=8K8O9vrGSXMe/KKVomkiTRQPt9TQZJApFIKyG+LwVJq/Y+2uNiMsvAMsIKOWbYW2mY
 bV1cIltn5mXovCbpk30rb2ibBFAvAkht7Jqn0j7FwTDIE0otK31CvoIQmvCotEszCkLf
 Va/v1+H0Za4rLCyvTdoUaQgV+d2zSf6GFA5qEhUV5VvhuO1xTtqY8gQlSEeZU7AnowLr
 RJsbudeO6m4ZaUfXEk8ubDcyVjotfuZnzoZ6++moIp1M/rN6INA0I6TtBgQFxOoHcEBS
 0F7Dnd+u0blz/QUYWle/AypSY+ykg/knT+MGfxVxEWlMBobGcjzh65LhPYvmTGaV7M6k
 9zwQ==
X-Gm-Message-State: AOAM532AvXvjBBK/O9XEbSZy5jXOssE6pTXIS7QnFXPgambXuNoEV5dE
 guS771OziKPxcIjgtOwspWRP2MF594TPt2bA0Wv53+pqRfGIy+JOGHU+7weknfm+atSgLuudTwy
 EGmoYMhINff2Z2G8UPJEw0NU=
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr12816422ejy.340.1643726530726; 
 Tue, 01 Feb 2022 06:42:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNDyANDY0zMYuTljWq11CTgp0bQzqb3WikdoyniZiPHEGU+6ua6ezX3gvJIdSHcNSeP5gfIQ==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr12816408ejy.340.1643726530531; 
 Tue, 01 Feb 2022 06:42:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id h16sm3616306ejj.56.2022.02.01.06.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:42:09 -0800 (PST)
Message-ID: <8cc4190e-f6ec-dc23-c487-4f0c4c7126e8@redhat.com>
Date: Tue, 1 Feb 2022 15:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 4/9] spi: Add API to count spi acpi resources
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-5-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-5-sbinding@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org
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

On 1/21/22 18:24, Stefan Binding wrote:
> Some ACPI nodes may have more than one Spi Resource.
> To be able to handle these case, its necessary to have
> a way of counting these resources.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/spi/spi.c       | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/spi/spi.h |  1 +
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 06c0a308b38b..ec9f2ed579e3 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2324,6 +2324,46 @@ struct acpi_spi_lookup {
>  	int			index;
>  };
>  
> +static int acpi_spi_count(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_spi_serialbus *sb;
> +	int *count = data;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
> +		return 1;
> +
> +	sb = &ares->data.spi_serial_bus;
> +	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_SPI)
> +		return 1;
> +
> +	*count = *count + 1;
> +
> +	return 1;
> +}
> +
> +/**
> + * acpi_spi_count_resources - Count the number of SpiSerialBus resources
> + * @adev:	ACPI device
> + *
> + * Returns the number of SpiSerialBus resources in the ACPI-device's
> + * resource-list; or a negative error code.
> + */
> +int acpi_spi_count_resources(struct acpi_device *adev)
> +{
> +	LIST_HEAD(r);
> +	int count = 0;
> +	int ret;
> +
> +	ret = acpi_dev_get_resources(adev, &r, acpi_spi_count, &count);
> +	if (ret < 0)
> +		return ret;
> +
> +	acpi_dev_free_resource_list(&r);
> +
> +	return count;
> +}
> +EXPORT_SYMBOL_GPL(acpi_spi_count_resources);
> +
>  static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
>  					    struct acpi_spi_lookup *lookup)
>  {
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index e5bbb9cbd3d7..394b4241d989 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -764,6 +764,7 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  						struct acpi_device *adev,
>  						int index);
> +int acpi_spi_count_resources(struct acpi_device *adev);
>  #endif
>  
>  /*
> 

