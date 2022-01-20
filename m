Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF844950F2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 16:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5B32E35;
	Thu, 20 Jan 2022 16:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5B32E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642691120;
	bh=Awg3WbWYVx3eJs4/sqUMf1ktdGcwRMQnN4ZNPhRLAH8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyKnSi6lDGTNXd8G0Xnl/wJycIjOSDNgPnwwfht7odcbohMyZB+PcW7aoiMi6QGPE
	 LMPrfwFmoi8BymUz5oHOtVauRSBdKigwcpiG3lxoac2bRwVUgiPCc3A+/pMCYy08Q1
	 UOKC1H9mp2qQQjnsrRinx3750bSzp/qN+MneCkso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 820FAF80134;
	Thu, 20 Jan 2022 16:04:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C07F8012E; Thu, 20 Jan 2022 16:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E3D8F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 16:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E3D8F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AzPUDh2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642691042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV9vXTR8rHUpOxnAQ5Xc1luOAt9DLySsRNgp0on3KmI=;
 b=AzPUDh2ldw7gGIGORhUyLqSl64s3jUiankpvrcdK/qFSCRKp/pSCUggOobDhsCv8U/qK2X
 JsyWwmPV9XDrucf0625clHz6cCcmRGr+XdLNKrq58av5L1ezlL4Nfdb4ABlPAXoxXhv0WQ
 QVAhSLfgic3HCdGpvQhhYPCEVLE37yQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-9APvbhj6PDmgjlgj3QtIcg-1; Thu, 20 Jan 2022 10:04:00 -0500
X-MC-Unique: 9APvbhj6PDmgjlgj3QtIcg-1
Received: by mail-ed1-f72.google.com with SMTP id
 t11-20020aa7d70b000000b004017521782dso6088869edq.19
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 07:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XV9vXTR8rHUpOxnAQ5Xc1luOAt9DLySsRNgp0on3KmI=;
 b=pN5oWpvCyZma+U5OCQrqhikJ7im7o3C0XbBeUIb1FLSXqf23CbGDL4BEaErEAqhbH5
 Lj7iOpwEmCmhoL6oLR74az6z7LHZnAhpqaJOwfRXzqVR5zaLIxiOC4BBh7o3dK5VeEIo
 FRuHDlw9kbTZdrv/z/18ZOC7VjVdu+lSa7MEMwJTWHFYyiqz5tFlKi54GpBoIsbQHKcb
 1SwvelUZ08TIyFVCu8gtZB3zvpix2QPd3PNecuATgqJ0OBkDjse8DOoYoLVhXp/5xGO+
 0QbLbofERIWuJnauhO89rL5WMwdhXoK3L9OqyVpej0bAQ/wy3ONayRnPWsJf/LwwGZPC
 FFLQ==
X-Gm-Message-State: AOAM531anQTj0YNvZGZKu0MMLKKzpiEKqix0LnqXJlbKLV3TDt/cw3h+
 MPc1SQLIgI+ETTYuhWbcrrz2HWNv/vwx0ArzoQPWcL8wLzI8QoPJNzdjqQbF39QfzUBLAxcpvXV
 9LbghZtJafUxUg6CWJSVkfMM=
X-Received: by 2002:a05:6402:50c9:: with SMTP id
 h9mr18098066edb.210.1642691038696; 
 Thu, 20 Jan 2022 07:03:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi/6rqFNxM9rnEHki02qPDGfKXeWhIbd/04xooCgBAG2VkDALdGcq1NOBPUedDbJufuz128Q==
X-Received: by 2002:a05:6402:50c9:: with SMTP id
 h9mr18098033edb.210.1642691038391; 
 Thu, 20 Jan 2022 07:03:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id i6sm1127721eja.132.2022.01.20.07.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:03:57 -0800 (PST)
Message-ID: <8beb2de0-8b5a-ea58-595d-2fcb38d5ee8b@redhat.com>
Date: Thu, 20 Jan 2022 16:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/9] spi: Support selection of the index of the ACPI
 Spi Resource before alloc
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-4-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-4-sbinding@opensource.cirrus.com>
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

Hi Stefan,

On 1/20/22 14:43, Stefan Binding wrote:
> If a node contains more than one Spi Resources, it may be necessary to
> use an index to select which one you want to allocate a spi device for.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/spi/spi.c       | 56 +++++++++++++++++++++++++++++++++++------
>  include/linux/spi/spi.h |  6 +++--
>  2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 13f4701f0694..898cc9931490 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2320,6 +2320,9 @@ struct acpi_spi_lookup {
>  	int			irq;
>  	u8			bits_per_word;
>  	u8			chip_select;
> +	int			n;
> +	int			index;
> +	int			irq_index;
>  };
>  
>  static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
> @@ -2351,6 +2354,8 @@ static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
>  		lookup->mode |= SPI_CPHA;
>  }
>  
> +static struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
> +
>  static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  {
>  	struct acpi_spi_lookup *lookup = data;
> @@ -2364,14 +2369,35 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
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

All of the above looks good to me.

> @@ -2402,7 +2428,7 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>  	} else if (lookup->irq < 0) {
>  		struct resource r;
>  
> -		if (acpi_dev_resource_interrupt(ares, 0, &r))
> +		if (acpi_dev_resource_interrupt(ares, lookup->irq_index, &r))
>  			lookup->irq = r.start;
>  	}
>  

I think that this does not do what you want it to do. Quoting drivers/acpi/resource.c:

bool acpi_dev_resource_interrupt(struct acpi_resource *ares, int index,
                                 struct resource *res)
{
        struct acpi_resource_irq *irq;
        struct acpi_resource_extended_irq *ext_irq;

        switch (ares->type) {
        case ACPI_RESOURCE_TYPE_IRQ:
                /*
                 * Per spec, only one interrupt per descriptor is allowed in
                 * _CRS, but some firmware violates this, so parse them all.
                 */
                irq = &ares->data.irq;
                if (index >= irq->interrupt_count) {
                        irqresource_disabled(res, 0);
                        return false;
                }

So now you are actually adding an index into a single:

                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000008,
                    }

ACPI Resource, which typically (as shown here) only has 1 interrupt, I guess
what you want is the nth resource of type ACPI_RESOURCE_TYPE_IRQ or
ACPI_RESOURCE_TYPE_EXTENDED_IRQ.

So to make this work you should combine this with a separate irq_n
for irq_index, increment that on acpi_dev_resource_interrupt() success
and then only set lookup->irq = r.start; when irq_n == irq_index.

But since the bus-multi-inst code already has its own irq getting code
this is not really necessary, I would just drop the new irq_index field;
and then also drop the "if (spi_dev->irq < 0)" condition for calling
bmi_get_irq() in "[PATCH v4 7/9] platform/x86: bus-multi-instantiate:
Add SPI support"

Note that for the CS35L41 that if is always true already since
that is using a GpioInt resource and acpi_dev_resource_interrupt()
does not support those.

TL;DR: please drop the new irq_index fiels and just leave the
related bits as is.


> @@ -2414,14 +2440,22 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
>   * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
>   * @ctlr: controller to which the spi device belongs
>   * @adev: ACPI Device for the spi device
> + * @index: Index of the spi resource inside the ACPI Node
> + * @irq_index: Index of the GPIO resource for the IRQ inside the ACPI Node
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
> +					 int index, int irq_index)
>  {
>  	acpi_handle parent_handle = NULL;
>  	struct list_head resource_list;
> @@ -2429,8 +2463,14 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
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
> +	lookup.irq_index	= irq_index;
>  
>  	INIT_LIST_HEAD(&resource_list);
>  	ret = acpi_dev_get_resources(adev, &resource_list,
> @@ -2443,7 +2483,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
>  
>  	if (!lookup.max_speed_hz &&
>  	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
> -	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
> +	    ACPI_HANDLE(lookup.ctlr->dev.parent) == parent_handle) {
>  		/* Apple does not use _CRS but nested devices for SPI slaves */
>  		acpi_spi_parse_apple_properties(adev, &lookup);
>  	}
> @@ -2451,9 +2491,9 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
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
> @@ -2478,7 +2518,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>  	    acpi_device_enumerated(adev))
>  		return AE_OK;
>  
> -	spi = acpi_spi_device_alloc(ctlr, adev);
> +	spi = acpi_spi_device_alloc(ctlr, adev, -1, 0);
>  	if (IS_ERR(spi)) {
>  		if (PTR_ERR(spi) == -ENOMEM)
>  			return AE_NO_MEMORY;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 200725692b93..1a34fd0f6ca2 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -762,10 +762,12 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
>  
>  #if IS_ENABLED(CONFIG_ACPI)
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -						struct acpi_device *adev);
> +						struct acpi_device *adev,
> +						int index, int irq_index);
>  #else
>  static inline struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -						       struct acpi_device *adev);
> +						       struct acpi_device *adev,
> +						       int index, int irq_index);
>  {
>  	return ERR_PTR(-EOPNOTSUPP);
>  }
> 


Like with my review of patch 2/9, I don't think we need stubs here.

Regards,

Hans

