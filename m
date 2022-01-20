Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D949506F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 15:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD352ED7;
	Thu, 20 Jan 2022 15:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD352ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642689648;
	bh=gKoSr3gg0f43DOdJprKUnEmkNmcijIrTMowd6Gxi36Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXYa5eDVcvgydaEogGHUIYlxZgYwPvI7VifuduQ9dbucDEJAFL80bNtTdL6cmdzIr
	 F97uTFy8x+v4hUhsVR5XJRdo6pPfqARDTeXwj2zf0cAL3QkHSU5Lw8Ca2uHPp6Nple
	 fCvrKgpR+NgeX/XV8bT1BBHvD1ArUSI88ZHp5piQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D94F80248;
	Thu, 20 Jan 2022 15:39:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D304DF80423; Thu, 20 Jan 2022 15:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0879EF80134
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 15:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0879EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RddBG8ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642689589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6QJQxwpqs/8UeUwXAKCD+lQ9KYdKmTM83V8hAlwFAc=;
 b=RddBG8ikzET2EIIrc6Zbzmwo0FpgMq+mYWGjz2QIy3jjT4Mdud6YG24xr3GZi5Hx96SUwl
 ktf5LPJGHnRCoNtNH253BDEhdHYUahPOSeC/bfGeeIzy1ZxrhkiK47XMAK27Aos1uXAkCT
 C38S7nFeiCLcleKn5lz2ekewm5joiqg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-UctQY7ieMFijyfqQQz6M8Q-1; Thu, 20 Jan 2022 09:39:42 -0500
X-MC-Unique: UctQY7ieMFijyfqQQz6M8Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 p17-20020aa7c891000000b004052d1936a5so1728018eds.7
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 06:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U6QJQxwpqs/8UeUwXAKCD+lQ9KYdKmTM83V8hAlwFAc=;
 b=O1d7mQB05KXp5qTojm+I3tNslR+HaMLjREHBcVjsLh1ANRKVW7E7ek5uQGtwEV2OLl
 Oc6Bzy4lu22G05+BZLSEjNEAlEQ3KVHlvxlk4Luhj9Uo+8ch+Y+OMW6opYjAYapAanbz
 t8gQJXWGMCnn/jRSPZF01BlAogu0puQLVLDDzBJZgUHo8t63jEBPWD9JeTbteqkw8GAE
 gpnsvDpy0qEzKQVoLdgdJy9IfaCiudMPx2+IOGUxCTzGk/d7Gr0vJlghDvAqPjPRM8qM
 YiK4Q/1YCvdEQfhBgkNQS5Pzr2UAv//Mvko1Je5WFKNw1c538dFMfOUBlZuZTIzcP7Lq
 NlBQ==
X-Gm-Message-State: AOAM531S7BPWjCvJni4jBJ+xOliFycbI1KjyUAirUkgJkBOcFjydzBLE
 BlLL6ceHyVtom1L91GnYylBIERP9DO8WnC3iPhK+Exo5EQP9DX1U3oAgB+v0kDhHYbLGfrQonYp
 RLfxaVQ/ehKYcL/motPFSBTM=
X-Received: by 2002:a05:6402:2d4:: with SMTP id
 b20mr8449563edx.98.1642689581196; 
 Thu, 20 Jan 2022 06:39:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7QsHN5sY6fK7Vbj+K5/OavxogCBIliNExc9shQzj9qCMxf2il3s8jvjaw8aZ+7DIdD8rq1w==
X-Received: by 2002:a05:6402:2d4:: with SMTP id
 b20mr8449533edx.98.1642689581020; 
 Thu, 20 Jan 2022 06:39:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id cr8sm1386979edb.47.2022.01.20.06.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 06:39:40 -0800 (PST)
Message-ID: <1ff8954c-9894-b0cd-a261-afc30ff02e6b@redhat.com>
Date: Thu, 20 Jan 2022 15:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 4/9] spi: Add API to count spi acpi resources
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-5-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-5-sbinding@opensource.cirrus.com>
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

On 1/20/22 14:43, Stefan Binding wrote:
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
>  include/linux/spi/spi.h |  6 ++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 898cc9931490..8c0c2e26609a 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2325,6 +2325,46 @@ struct acpi_spi_lookup {
>  	int			irq_index;
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
> index 1a34fd0f6ca2..25a82729f8da 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -764,6 +764,7 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  						struct acpi_device *adev,
>  						int index, int irq_index);
> +int acpi_spi_count_resources(struct acpi_device *adev);
>  #else
>  static inline struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  						       struct acpi_device *adev,
> @@ -771,6 +772,11 @@ static inline struct spi_device *acpi_spi_device_alloc(struct spi_controller *ct
>  {
>  	return ERR_PTR(-EOPNOTSUPP);
>  }
> +
> +int acpi_spi_count_resources(struct acpi_device *adev)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif
>  
>  /*
> 

