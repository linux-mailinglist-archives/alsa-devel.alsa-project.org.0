Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F326377E6
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF35016F1;
	Thu, 24 Nov 2022 12:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF35016F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669290506;
	bh=LKHEa/+ioxNJER8qm6WHjajGIYXFuDXmR49Q0jAnX/E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8o5imMojERGmueAMOBo4OdxvSxLNvIsJwJv93K4DPpUeut4WPkRNPIaqt5i+D8+F
	 xmWDmL7H5ujC8iO5/DmnHFTAEsDOgkYQxAylvXf1P8o5KMNWFFLdw/obAbcPmC7Q52
	 irPY1HIJvUsz0zLsI63TnEa8mz3bpks3pzzjcc+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A155EF80115;
	Thu, 24 Nov 2022 12:47:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB983F80431; Thu, 24 Nov 2022 12:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C67F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C67F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N6m3Dlw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669290441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UKcDxDchtxziI/HIsz5rxDvl8BLvMydht/Ew4gxrpc=;
 b=N6m3Dlw/56VQT4Dg0FSdPzQQJKLe76IjoEx1e6wMz2G046mmr3MN4q3uXmcKKLz6/5zV6k
 21yBeuZf7LDB4Ep8gJgjfFoWX2vyArw8w7yBh9je8+LDSz0sI4POwViXII+iG7kjOMZmWG
 lYrJ3vx8HjC87EYI9PgoJwrmgkS/jTE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-6_LiwvQoNgelplLfwhr2YA-1; Thu, 24 Nov 2022 06:47:20 -0500
X-MC-Unique: 6_LiwvQoNgelplLfwhr2YA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402271400b004630f3a32c3so826803edd.15
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 03:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6UKcDxDchtxziI/HIsz5rxDvl8BLvMydht/Ew4gxrpc=;
 b=3o8u/v4rLRX+KR+EGAqesxTqipWkFWL6vMLUfZAgL0PtQOzC/B/YF/c2An74rOs4Sc
 7Vb500F0C5ZJkWNGLYju20WSt+IZsurhyT4P+tuI+0dUPmRT1qdBTgE2HSCmjuSqRihw
 NylL5C9V7ihSrXZhvgCJvUnWATm2TYSmJcF0uQRGTjJLMckHHH/XPpw756kuGZFeopN0
 unYSDL2+PdKuWksVbQgTQUNb8rFTx31+9SY1S2FaFFH8SKHOcdraGxSzmn4pyp7np7zY
 KYGFVA0iQlX5w0VZjKUtU+mTWsH+wtKeKjBSsGk6a09VBvxuGcDTUhSWap2laielh8/S
 cgcQ==
X-Gm-Message-State: ANoB5pkbg/mQck3gISha1sx7NI1LIm1apnKCS6GaGQYYe6o55356Z3vQ
 lKFJOnQUSBp8iRPSXWULFMO4m1Dq7LNhTTKhpM4JAWcwwdOL2UzByGnhY8LyMGFPtTm3lxm1c4K
 4Bx4R2MMeqdSxAK+UAStdxHI=
X-Received: by 2002:aa7:c9c3:0:b0:461:8f21:5f12 with SMTP id
 i3-20020aa7c9c3000000b004618f215f12mr29994521edt.54.1669290438822; 
 Thu, 24 Nov 2022 03:47:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Lfw2riZ0eO3p/mqdvjpYHj4TuGNzHS07kAgArfyv0j8wdQdThhnIH77ovbJyXoKoinhiJ1A==
X-Received: by 2002:aa7:c9c3:0:b0:461:8f21:5f12 with SMTP id
 i3-20020aa7c9c3000000b004618f215f12mr29994495edt.54.1669290438599; 
 Thu, 24 Nov 2022 03:47:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a056402138400b0046146c730easm416985edv.75.2022.11.24.03.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 03:47:18 -0800 (PST)
Message-ID: <1b548284-baa3-26e0-2e8f-a8d853788e5c@redhat.com>
Date: Thu, 24 Nov 2022 12:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
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

On 11/24/22 12:07, Stefan Binding wrote:
> This allows the i2c driver to obtain the ACPI_COMPANION.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 5362f1a7b77c..15ef2f3c442e 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -194,6 +194,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
>  		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
>  		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
>  		board_info.dev_name = name;
> +		board_info.fwnode = acpi_fwnode_handle(adev);
>  
>  		ret = smi_get_irq(pdev, adev, &inst_array[i]);
>  		if (ret < 0)

I'm afraid that making this change is not as straight forward as it looks.

I know that I have tried to do this in the past and it failed.

IIRC there were 3 problems:

1. I was expecting this to also allow the driver for the instantiated
i2c-client to be able to bind using an acpi_match_table but that
unfortunately does not work. acpi_match_table matches only work for
the first physical_node linked under
/sys/bus/acpi/devices/xxxx:xx/physical_node and that is the platform
device to which serial-multi-instantiate.c binds. The i2c_client becomes
the second physical node.  Note this is not really an issue,
just something to be aware of.


2. This causes the i2c-core to use the first IRQ resource in the ACPI
fwnode as client->irq for any clients for which we do not set an
IRQ when instantiating. Which may very well be wrong. Sometimes that
IRQ is only valid for the first i2c-client which we instantiate; and
not for the others! And sometimes it is a problem because it may
point to an irqchip for which we never wrote a driver leading to
all probes of the i2c-client failing with -EPROBE_DEFER, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d1d84bb95364ed604015c2b788caaf3dbca0262f

Note that patch has been reverted since that specific -EPROBE_DEFER
issue has been solved by making the ACPI core instantiate a
platform_device instead of an i2c_client (in this case we
did not need the actual i2c_client at all).

The current i2c-core code has a (!client-irq) test guarding its
code of trying to use the first ACPI fwnode IRQ resource.

So we could disable this by setting client->irq = -ENOENT in
serial-multi-instantiate.c when (inst->flags & IRQ_RESOURCE_TYPE) ==
IRQ_RESOURCE_NONE). But that will introduce a new problem. Many
i2c-drivers check if there is an IRQ for them to use by doing:
"if (client->irq) request_irq(client->irq, ...)" but then with
error checking/so setting client->irq to -ENOENT will cause
the request_irq to fail, leading the probe to fail.

So before you can write a patch setting client->irq = -ENOENT
when (inst->flags & IRQ_RESOURCE_TYPE) == IRQ_RESOURCE_NONE),
you would first need to patch all i2c-drivers for clients
instantiated through serial-multi-instantiate.c changing:

	if (client->irq) {
		...
	}

to:

	if (client->irq > 0) {
		...
	}

Note this is not as bad as it sounds, since there are only
a few drivers for clients instantiated by serial-multi-instantiate.c .


3. Some drivers may check for an ACPI companion device and then
change their behavior. So all drivers for clients instantiated
through serial-multi-instantiate.c will need to be audited for
this (and a summary of this audit needs to be added to the commit
msg).

Regards,

Hans

