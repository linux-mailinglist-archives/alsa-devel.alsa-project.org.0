Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDB4A5EF3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820FF17F7;
	Tue,  1 Feb 2022 16:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820FF17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643727870;
	bh=O5+JvmMXR4p5x++nXG5jv0F7Vdhodhx3hS4yu/0WvtM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czuIdk7t0jpiE75tllhOYqnvA2igabs0+i5cZrPiPbaYtHa44mC9gdj0W+ro8ZJWY
	 MCH+IVFkDiewx5v0X0KSdWwcCi1jAPQ5i9QqPY7WawfJnJPjMrux1PLmMes6fgUtUq
	 cN/O5o9dTHGS5/r1JFFJtxZo4RqR8JThbT4W4bzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61390F800F8;
	Tue,  1 Feb 2022 16:03:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2118F800F8; Tue,  1 Feb 2022 16:03:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64A51F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A51F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WbW9al9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643727798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtI+17/g93ZHkydx3wVerkIz2lCilB6XCltFF3RHwWE=;
 b=WbW9al9M8LrDDkvxSlLxQbDLsAm1AtGuZRe8GEUjkAIJbwRE91YAwEmtt241Ivk4VTWGCT
 9O/oNIxHIGI6ZfujcEVmff1zaFijPaZ+P4HVPafLfgfk97nd4oYdPcrAIkkTQSGt6rk7tS
 334LCPNuyOr+3xVENW5VkuDz1FGR9Po=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-JhJiRhF_OaObKPN3dAqMNw-1; Tue, 01 Feb 2022 10:03:17 -0500
X-MC-Unique: JhJiRhF_OaObKPN3dAqMNw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q10-20020a5085ca000000b0040e3ecf0ec2so977364edh.14
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 07:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rtI+17/g93ZHkydx3wVerkIz2lCilB6XCltFF3RHwWE=;
 b=ey6epG1z6hqMPNOAoNAstGEzoYUyCeetQiLGzffYe9E9fRpGLF2Y4tEiUSNdCXEB1O
 guQib/kzhV2QTCGnHnKCkPk4CX3ZecJ7lOA9I1EPYhuypMM95NLUxb3O6DnZEKllSQsr
 BqprLIuN3K6qSRJrZh/VB6Ho7wgyIoxitaj9onHF+UTnf0Ekt+rG6AadEMAyipI1ssHs
 ZcUOefgqRh8tWASmGgIJxXcV2pyMguHVeb+lILgEL0lyMRzCzmpFyPCL9Aqop6ODoO7R
 SsA0Om7C3/IM6OMQBzlEO++u2ifG+imr4AYci8W7hj5h1wAs14LjbSvX7GYbcbrW0Lym
 FXdg==
X-Gm-Message-State: AOAM531+GX5cCTo3mz605E2SMy1ya14XqX6uwLv1PcRpm0AKCjv/bwaL
 XRvpDbt+Q6EF7do9CJzZM9V8mjFo4RO14fhojduonPqCbc/b25lpGm4g4ADQgehDrd6MJMdFQ8S
 Gx7ri9D2r94VBBEAklVtkbD8=
X-Received: by 2002:a17:906:ae8a:: with SMTP id
 md10mr21791571ejb.726.1643727795755; 
 Tue, 01 Feb 2022 07:03:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGrVV48N+FUq374nh8LyAIR4m925bx4g5hSDNAlEqbx1WtR+fT4wQbdk5cvNtKgnuH0jDmyw==
X-Received: by 2002:a17:906:ae8a:: with SMTP id
 md10mr21791538ejb.726.1643727795475; 
 Tue, 01 Feb 2022 07:03:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id gz12sm14715067ejc.124.2022.02.01.07.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 07:03:15 -0800 (PST)
Message-ID: <c66b7faa-f289-ff93-0d73-d2955f9c5bf0@redhat.com>
Date: Tue, 1 Feb 2022 16:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 9/9] ACPI / scan: Create platform device for CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-10-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-10-sbinding@opensource.cirrus.com>
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

On 1/21/22 18:24, Stefan Binding wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> The ACPI device with CSC3551 or CLSA0100 are sound cards
> with multiple instances of CS35L41 connected by I2C or SPI
> to the main CPU.
> 
> We add an ID to the ignore_serial_bus_ids list to enumerate
> all I2C or SPI devices correctly.
> 
> The same IDs are also added into serial-multi-instantiate
> so that the driver can correctly enumerate the ACPI.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/acpi/scan.c                             |  3 +++
>  drivers/platform/x86/serial-multi-instantiate.c | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 48db5e80c2dc..ebd10af3ff7f 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1744,8 +1744,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  	 */
>  		{"BSG1160", },
>  		{"BSG2150", },
> +		{"CSC3551", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +	/* Non-conforming _HID for Cirrus Logic already released */
> +		{"CLSA0100", },
>  	/*
>  	 * HIDs of device with an UartSerialBusV2 resource for which userspace
>  	 * expects a regular tty cdev to be created (instead of the in kernel
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 3f05385ca2cf..d09f11eac4f8 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -308,6 +308,17 @@ static const struct smi_node int3515_data = {
>  	.bus_type = SMI_I2C,
>  };
>  
> +static const struct smi_node cs35l41_hda = {
> +	.instances = {
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{}
> +	},
> +	.bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to serial_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -316,6 +327,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)&bsg1160_data },
>  	{ "BSG2150", (unsigned long)&bsg2150_data },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "CSC3551", (unsigned long)&cs35l41_hda },
> +	/* Non-conforming _HID for Cirrus Logic already released */
> +	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
> 

