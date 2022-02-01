Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B24A5E52
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42EA917CA;
	Tue,  1 Feb 2022 15:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42EA917CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643725851;
	bh=3m+DEL2HUqJYsxf2IriaeoDVkUgRaS/f0+3yO+AZVV4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIBvkLVljgh7tGmF7VMwUxna/d86RICokauoxaQ6wsSc5ubrv1cpncqECRaTWOtrA
	 bSTwoaSKCcVcFsqA6nA3JnTRUCl41eXcC6txrreJBgsZcdtzCjvzGwnmRDKFhSztgA
	 npuLqC/c5tFSok7SslewPis6P+kf5ZfKpHceqyWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF679F80166;
	Tue,  1 Feb 2022 15:30:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EFD5F8012C; Tue,  1 Feb 2022 15:29:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC1D5F8012C
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1D5F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OjtrnLU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643725777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TODHypD7aG0BLPnolnBTqp3Mq2JcY03pG43pCd3OAwU=;
 b=OjtrnLU+MG7mUrJVvgrhgBs39l/vN8jvr3rzwenoR8dYJQKvxaqaVh9V0WCpP0JZiPVDvM
 WOrcPyxmLQEyn17J6aj5S1c/ONMquKnBybtdToPq+c/EFQa4VVR1njLRkwxh4H01+jsMbA
 XbAQ279sqbxpHZPbKXOyuVnVPM9m1HA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-66ijVWyCM1KfgsFJ_u2o0Q-1; Tue, 01 Feb 2022 09:29:35 -0500
X-MC-Unique: 66ijVWyCM1KfgsFJ_u2o0Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 o4-20020a170906768400b006a981625756so6666461ejm.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TODHypD7aG0BLPnolnBTqp3Mq2JcY03pG43pCd3OAwU=;
 b=F5cAvYC5+9KcK30sYZUR69kx8TQspzrTuK7t82oGaNBATCKY7snEmWAGprYaNBlKPd
 7j+cCf6G9oTNTDbahr0fr9rejDi54Oq9MwjYXbQA2XV+L1f/rG7hz/pXxjysHHFwq3NZ
 /D9BesgQ3sX+H73Ylg6i4JZCvnUP2wXiiYZngZ80SP3Cz5K3PJu5458FWRuHV3lDiZIT
 G1cCWnM9bqR7fX76Q8zTfoPMKhFKsLJ3LMfymPC5TvKQIrsfjH1EZ9wzlYgVaMpdChV+
 IYhlIWfJFBoKnzTf27Cb1urh/cFxNLuyLyQBe6WuxMBlxDmHjdqZsMzzmpDWdbZEAiiu
 wPPQ==
X-Gm-Message-State: AOAM5314VfXCIIfvRG72U9CDN7PUSQw+ZZsOOxU8tdnh7MQ4jXH/pd+b
 QjanIYqF0XL3xbLx0mMNd9IlHuB18QLMUkO5bivGb5mRC8JFAvmljmI4+vJ/cvEtmQHi0XinhHq
 txh2DLpkJ/4NwuOjHEaPsqVY=
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr21320723ejc.112.1643725774691; 
 Tue, 01 Feb 2022 06:29:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx41AxR9vZSMwMuewG3JWzv5v/+m/CXL2SskUIk4WHgBfEGT64NzWU3J0cWGeMv5O8Db8khPg==
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr21320693ejc.112.1643725774454; 
 Tue, 01 Feb 2022 06:29:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id t22sm1352103edv.105.2022.02.01.06.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:29:33 -0800 (PST)
Message-ID: <9cc5b24d-7a4e-073e-f7a4-124f76d44d77@redhat.com>
Date: Tue, 1 Feb 2022 15:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 3/9] spi: Support selection of the index of the ACPI
 Spi Resource before alloc
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-4-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-4-sbinding@opensource.cirrus.com>
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
> If a node contains more than one Spi Resources, it may be necessary to
> use an index to select which one you want to allocate a spi device for.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/spi/spi.c       | 51 +++++++++++++++++++++++++++++++++++------
>  include/linux/spi/spi.h |  3 ++-
>  2 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 13f4701f0694..06c0a308b38b 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2320,6 +2320,8 @@ struct acpi_spi_lookup {
>  	int			irq;
>  	u8			bits_per_word;
>  	u8			chip_select;
> +	int			n;
> +	int			index;
>  };
>  
>  static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
> @@ -2351,6 +2353,8 @@ static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
>  		lookup->mode |= SPI_CPHA;
>  }
>  
> +static struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
> +
>  static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  {
>  	struct acpi_spi_lookup *lookup = data;
> @@ -2364,14 +2368,35 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  		sb = &ares->data.spi_serial_bus;
>  		if (sb->type == ACPI_RESOURCE_SERIAL_TYPE_SPI) {
>  
> +			if (lookup->index != -1 && lookup->n++ != lookup->index)
> +				return 1;
> +
> +			if (lookup->index == -1 && !ctlr)
> +				return -ENODEV;
> +
>  			status = acpi_get_handle(NULL,
>  						 sb->resource_source.string_ptr,
>  						 &parent_handle);
>  
> -			if (ACPI_FAILURE(status) ||
> -			    ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
> +			if (ACPI_FAILURE(status))
>  				return -ENODEV;
>  
> +			if (ctlr) {
> +				if (ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
> +					return -ENODEV;
> +			} else {
> +				struct acpi_device *adev;
> +
> +				if (acpi_bus_get_device(parent_handle, &adev))
> +					return -ENODEV;
> +
> +				ctlr = acpi_spi_find_controller_by_adev(adev);
> +				if (!ctlr)
> +					return -ENODEV;
> +
> +				lookup->ctlr = ctlr;
> +			}
> +
>  			/*
>  			 * ACPI DeviceSelection numbering is handled by the
>  			 * host controller driver in Windows and can vary
> @@ -2414,14 +2439,21 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>   * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
>   * @ctlr: controller to which the spi device belongs
>   * @adev: ACPI Device for the spi device
> + * @index: Index of the spi resource inside the ACPI Node
>   *
>   * This should be used to allocate a new spi device from and ACPI Node.
>   * The caller is responsible for calling spi_add_device to register the spi device.
>   *
> + * If ctlr is set to NULL, the Controller for the spi device will be looked up
> + * using the resource.
> + * If index is set to -1, index is not used.
> + * Note: If index is -1, ctlr must be set.
> + *
>   * Return: a pointer to the new device, or ERR_PTR on error.
>   */
>  struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -					 struct acpi_device *adev)
> +					 struct acpi_device *adev,
> +					 int index)
>  {
>  	acpi_handle parent_handle = NULL;
>  	struct list_head resource_list;
> @@ -2429,8 +2461,13 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  	struct spi_device *spi;
>  	int ret;
>  
> +	if (!ctlr && index == -1)
> +		return ERR_PTR(-EINVAL);
> +
>  	lookup.ctlr		= ctlr;
>  	lookup.irq		= -1;
> +	lookup.index		= index;
> +	lookup.n		= 0;
>  
>  	INIT_LIST_HEAD(&resource_list);
>  	ret = acpi_dev_get_resources(adev, &resource_list,
> @@ -2443,7 +2480,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  
>  	if (!lookup.max_speed_hz &&
>  	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
> -	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
> +	    ACPI_HANDLE(lookup.ctlr->dev.parent) == parent_handle) {
>  		/* Apple does not use _CRS but nested devices for SPI slaves */
>  		acpi_spi_parse_apple_properties(adev, &lookup);
>  	}
> @@ -2451,9 +2488,9 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  	if (!lookup.max_speed_hz)
>  		return ERR_PTR(-ENODEV);
>  
> -	spi = spi_alloc_device(ctlr);
> +	spi = spi_alloc_device(lookup.ctlr);
>  	if (!spi) {
> -		dev_err(&ctlr->dev, "failed to allocate SPI device for %s\n",
> +		dev_err(&lookup.ctlr->dev, "failed to allocate SPI device for %s\n",
>  			dev_name(&adev->dev));
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -2478,7 +2515,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>  	    acpi_device_enumerated(adev))
>  		return AE_OK;
>  
> -	spi = acpi_spi_device_alloc(ctlr, adev);
> +	spi = acpi_spi_device_alloc(ctlr, adev, -1);
>  	if (IS_ERR(spi)) {
>  		if (PTR_ERR(spi) == -ENOMEM)
>  			return AE_NO_MEMORY;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index d159cef12f1a..e5bbb9cbd3d7 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -762,7 +762,8 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
>  
>  #if IS_ENABLED(CONFIG_ACPI)
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -						struct acpi_device *adev);
> +						struct acpi_device *adev,
> +						int index);
>  #endif
>  
>  /*
> 

