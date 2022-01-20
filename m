Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8A49526C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 17:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2A62EB2;
	Thu, 20 Jan 2022 17:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2A62EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642696339;
	bh=oFeiF7Cexm+DGwcmr6PH6WXwtAWTRld8gmbiy4z7PR0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZVxwbOdR7ht82g8PRzcxPJLziur99v5sGYgqu4rtwizkPM1y+PrrTuhHB95cuKir
	 X2ExXWErMZsV80S10lswG7A/j2JG86nnnq9Qj+KdDEuh0m5eFv26Vsyy3EuC8cPPl0
	 hH8a+hlblDytk4QwRlV7XBoMcR0kMDuA83nSXb7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23227F80508;
	Thu, 20 Jan 2022 17:31:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F57F80507; Thu, 20 Jan 2022 17:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F78F80423
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 17:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F78F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EmRMGuOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642696270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HG4KxWhwtWwNTvvRLfsMu7xjc8q7j8EF/CkudyE8uX0=;
 b=EmRMGuOvimX2dUzdo+0A/inwC5jOTjzTErhzJwTvVENh7YWBDO+b2dsmOOTAG6bgKHNg0s
 DY6+a5X3Lc6hMaPKpJUlkhm8/IeyilN76TKkgQ//UJyDoSYlfC8vFDvFZUugaeRWNJNH0j
 sSmpgxKiNw7KQScakoTrlWCsgNY0yDY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464--aMAhF4gNg67_43mWuCrIQ-1; Thu, 20 Jan 2022 11:31:08 -0500
X-MC-Unique: -aMAhF4gNg67_43mWuCrIQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c11-20020a056402120b00b0040321cea9d4so6367885edw.23
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 08:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HG4KxWhwtWwNTvvRLfsMu7xjc8q7j8EF/CkudyE8uX0=;
 b=nSitNvoq4FiEh6YnAfyL2U1GI3g+rH/6aT+5ccClUikXoJuS9Tq635bWhivvhi9QKa
 dgapWmfdOzJVtzsZeyfKQl2m5tVsFEYCSuAjs82m6K57VjtNeh7RdKNddt8JCp0+WIyR
 9C8yLTmoHcN0owUuJ82QovLTCc9VEXwypVBOr6+3m0vE9zHj5nAQ8KKzY0jBt3o2Fwln
 z/ypsVsOXagLYBio/qRMkYUGcrmPVkHv73xXkltGEixjukZzuY+ElOU9NDnOmFrQCKDy
 Cq2klzQvGMagx5JcC8FM7p4v8CYUW+TKS9UZ5dsRI6ShI5eUZZLRAPHgnh8Z+wCT6+QF
 E4UQ==
X-Gm-Message-State: AOAM532S/SK+/gRZTdu7ttPo590HGJXcSp3f7SfPuO6NzgkF/RwwUY7u
 pBKGhDECOyiv/69xNMc8oCSiS509RayrKLeriExaSQPJAFQ6Eg9qRJ8ESlh9naQtlmzjMjqaUA2
 mv/qrI1dcjBQb2GYjLdj8IxU=
X-Received: by 2002:a50:9d48:: with SMTP id j8mr37489599edk.192.1642696267501; 
 Thu, 20 Jan 2022 08:31:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDfvucpGU9m/OqAkslPe7xRB1r1l5bfzYpyd7TKbIdzsNby116Ajn4L3Y5Opjls/YVVi/ksg==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr37489573edk.192.1642696267353; 
 Thu, 20 Jan 2022 08:31:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id y17sm1206649ejw.172.2022.01.20.08.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:31:06 -0800 (PST)
Message-ID: <87c61164-47bf-c560-4e4d-78105a84531e@redhat.com>
Date: Thu, 20 Jan 2022 17:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 9/9] ACPI / scan: Create platform device for CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-10-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-10-sbinding@opensource.cirrus.com>
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
> The ACPI device with CSC3551 or CLSA0100 are sound cards
> with multiple instances of CS35L41 connectec by I2C or SPI
> to the main CPU.
> 
> We add an ID to the ignore_serial_bus_ids list to enumerate
> all I2C or SPI devices correctly.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/acpi/scan.c                          |  3 +++
>  drivers/platform/x86/bus-multi-instantiate.c | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 4fd1346d6e1f..2f2210c969c8 100644
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
> diff --git a/drivers/platform/x86/bus-multi-instantiate.c b/drivers/platform/x86/bus-multi-instantiate.c
> index 05bc941a38fd..7a394b671f5a 100644
> --- a/drivers/platform/x86/bus-multi-instantiate.c
> +++ b/drivers/platform/x86/bus-multi-instantiate.c
> @@ -328,6 +328,17 @@ static const struct bmi_node int3515_data = {
>  	.bus_type = BMI_I2C,
>  };
>  
> +static const struct bmi_node cs35l41_hda = {
> +	.instances = {
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{}
> +	},
> +	.bus_type = BMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to bus_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -336,6 +347,9 @@ static const struct acpi_device_id bmi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)&bsg1160_data },
>  	{ "BSG2150", (unsigned long)&bsg2150_data },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "CSC3551", (unsigned long)&cs35l41_hda },
> +	/* Non-conforming _HID for Cirrus Logic already released */
> +	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, bmi_acpi_ids);
> 

