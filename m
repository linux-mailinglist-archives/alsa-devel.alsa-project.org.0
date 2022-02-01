Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EE4A5E3C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C936A1683;
	Tue,  1 Feb 2022 15:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C936A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643725667;
	bh=U/E0pR6Xiop748mpaxZ2GL8yHk03dDQYrF7YtUTyyqY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtFF+CCGEgjElyvvAJ8H5Omz2XcOFqhqDNezVgLcQrq1yILoTdycG85e8UHLK83/k
	 6QUWUgcduxYvotDoXgtC9Ys2+VT5X7Epf7Q3sbkJPtiMqx2smbnjgNptO1pbehmVi0
	 8fS+kwVyz4xcrtl4gU7VA40T+dWZ2Jze2uA1CH18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA23F800F8;
	Tue,  1 Feb 2022 15:26:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F34F80130; Tue,  1 Feb 2022 15:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ECB9F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ECB9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="T2+f3U/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643725564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPLhPOdNSB7PJok3SKPVCTJi2bZZQJ/Ip1kdffjANMc=;
 b=T2+f3U/XK/O1yNl7SdPedniBDrW1Q4f+k8t730aoBuBOGT5GkLD2qMcSzsUiaPUmxCUT/Q
 6FxcXLtkbjuRLJyMS3eYidRjr2fIU5EhOQIqtplACOU0fZDwsAcVD6TJACd/TRSS+OT3ZT
 eaZMsckRxa1CapEk2gOPpR79t385OV0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-7jPW3DIcNO6mTGKCsd3z_g-1; Tue, 01 Feb 2022 09:26:02 -0500
X-MC-Unique: 7jPW3DIcNO6mTGKCsd3z_g-1
Received: by mail-ej1-f70.google.com with SMTP id
 q21-20020a17090622d500b006bb15a59a68so4687455eja.18
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rPLhPOdNSB7PJok3SKPVCTJi2bZZQJ/Ip1kdffjANMc=;
 b=0PwfeHto4RU16cuESWmclBJzFGJQvAov/Nn5Y3FvSDcw74u5s8E1kU7IAHSE+bACAz
 qC/29zwy350uINjav6dNxIIc8kgFOY9jhdo1dcKeD2z3nFH4ZHfkW6DxDPVikXY08aKA
 23LneE9mN8NkjitUADjG8Y1I7iFbI027cDcJO7g9MnOLLb0346kSELZNE66Ypb9ILxVD
 ALjkZwTciGDqt3VnkgBSfKPDZ10NGzSVEkdb+Vvt6OK3K8jRd4v2tqIZUQPbZx92G6uy
 dMIyIhSZcqH4q58PEEKy1eKyWjRz4Mratya9nEr9qVz/qtGzhKYWDjFa2cdfY/+C7FbP
 0tYA==
X-Gm-Message-State: AOAM532gy8gvfQCPIg46J2+dBI7dMDgQxoIFmaxB7gYUoGNCapLWYJso
 8HdgqEiwcwjqkiQLmAkz3kdvgEImvxMLWkxcSCAIojXZ5lUkoXHckCn1760+am/P3JL3R+9yWjw
 n/gLHX7LLxpkPVEz2210Pf6Y=
X-Received: by 2002:aa7:d312:: with SMTP id p18mr24728921edq.49.1643725561651; 
 Tue, 01 Feb 2022 06:26:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQcDKGpASKFAHDWC+uv1+s0squ1+FRZAslqH6LoVgn8BgVh44QX+sA2dPzucd6pM4miRcZ0g==
X-Received: by 2002:aa7:d312:: with SMTP id p18mr24728900edq.49.1643725561429; 
 Tue, 01 Feb 2022 06:26:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id op20sm14709161ejb.68.2022.02.01.06.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:25:58 -0800 (PST)
Message-ID: <f8d94992-67a7-30c0-f59b-f4d2b448260e@redhat.com>
Date: Tue, 1 Feb 2022 15:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 0/9] Support Spi in i2c-multi-instantiate driver
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
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

On 1/21/22 18:24, Stefan Binding wrote:
> Add support for SPI bus in the i2c-multi-instantiate driver as
> upcoming laptops will need to multi instantiate SPI devices from
> a single device node, which has multiple SpiSerialBus entries at
> the ACPI table.
> 
> With the new SPI support, i2c-multi-instantiate becomes
> bus-multi-instantiate and is moved to the ACPI folder.
> 
> The intention is to support the SPI bus by re-using the current
> I2C multi instantiate, instead of creating a new SPI multi
> instantiate, to make it possible for peripherals that can be
> controlled by I2C or SPI to have the same HID at the ACPI table.
> 
> The new driver (serial multi instantiate, smi) checks for the
> hard-coded bus type and returns -ENODEV in case of zero devices
> found for that bus. In the case of automatic bus detection, 
> the driver will give preference to I2C.
> 
> The expectation is for a device node in the ACPI table to have
> multiple I2cSerialBus only or multiple SpiSerialBus only, not
> a mix of both; and for the case where there are both entries in
> one device node, only the I2C ones would be probed.
> 
> This new serial multi instantiate will be used in CS35L41 HDA new
> driver.
> 
> Changes since V5:
>  - comment, commit message and Kconfig description fixes
>  - minor fixes in serial-multi-instantiate
>  - use lowercase for SSIDs in patch_realtek.c

Thank you for the new versions.

I gave a bunch of:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

tags for v4, unless you make big changes, you are supposed to
collect this tag and add it to newer versions of the
patch-set (just above your own S-o-b).

I'll resend the Reviewed-by-s for this version, please
collect them for the next version (I noticed there are
still some small issues, sorry).

Regards,

Hans



> 
> Lucas Tanure (4):
>   platform/x86: i2c-multi-instantiate: Rename it for a generic serial
>     driver name
>   platform/x86: serial-multi-instantiate: Reorganize I2C functions
>   ALSA: hda/realtek: Add support for HP Laptops
>   ACPI / scan: Create platform device for CS35L41
> 
> Stefan Binding (5):
>   spi: Make spi_alloc_device and spi_add_device public again
>   spi: Create helper API to lookup ACPI info for spi device
>   spi: Support selection of the index of the ACPI Spi Resource before
>     alloc
>   spi: Add API to count spi acpi resources
>   platform/x86: serial-multi-instantiate: Add SPI support
> 
>  MAINTAINERS                                   |   4 +-
>  drivers/acpi/scan.c                           |  16 +-
>  drivers/platform/x86/Kconfig                  |  12 +-
>  drivers/platform/x86/Makefile                 |   2 +-
>  drivers/platform/x86/i2c-multi-instantiate.c  | 174 ---------
>  .../platform/x86/serial-multi-instantiate.c   | 349 ++++++++++++++++++
>  drivers/spi/spi.c                             | 137 ++++++-
>  include/linux/spi/spi.h                       |  20 +
>  sound/pci/hda/patch_realtek.c                 |  43 ++-
>  9 files changed, 551 insertions(+), 206 deletions(-)
>  delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c
>  create mode 100644 drivers/platform/x86/serial-multi-instantiate.c
> 

