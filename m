Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F165495276
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 17:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A3E2E5A;
	Thu, 20 Jan 2022 17:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A3E2E5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642696543;
	bh=6/uZK27Ism0LmwAIrhr8Z0XYDanCLX/oMrJglFDSShY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQVkc3NMdmDP9kHvNCk4a6vtRyB5H9EqW4J9lH+W5fwVeEd+wW2RfISsiohXX7XcO
	 QfNeia+quZc3BJy1p6WgMiKbFNSQv14neMoS+q2Fec0ztGIFqVkHKFXYX5Rj3rrHbg
	 ydZ76eIuhgY9qM4JwaMlmRC6qvMMBRviuBsWl+FM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0E2F80134;
	Thu, 20 Jan 2022 17:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56992F8012E; Thu, 20 Jan 2022 17:34:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3788F8007E
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 17:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3788F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LdGD6B/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642696472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1sc4JZ0+7MrtJWFMrOPG0iw0Wa1Lhn4BX5CbDefiMM=;
 b=LdGD6B/dQQl4M/ZkdvFi4oa0oue1p9tPJ8RVz7C9Gz84NcJNX1tQ9n/CfS64j6KzZpU2wo
 MURZcNWE2erDG4DUH9+Oid6nt7UkW9Kat2LvEYIrijGx8WG0ofSTdx/KC3DqOwZwO78+Ca
 k94VCBAzy9uYJktBi178I4JYbBkVRH0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-1rOp6jZNOM6QjQhSIsgAlw-1; Thu, 20 Jan 2022 11:34:31 -0500
X-MC-Unique: 1rOp6jZNOM6QjQhSIsgAlw-1
Received: by mail-ed1-f70.google.com with SMTP id
 cf15-20020a0564020b8f00b0040284b671c6so6377026edb.22
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 08:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+1sc4JZ0+7MrtJWFMrOPG0iw0Wa1Lhn4BX5CbDefiMM=;
 b=jNrLkLL3LAmSQ4q28hrb4kjygTjTgXuAP2NQTkKD/8pU4Fnr5IeWJ6cOnCIRGszyqI
 fERkxvHFIRq/X1e6aYOpTHwvcfbPZewLJ6DY98mW21RtT3LuMfMUQFj18kD5tG2gL8wa
 tVN/ATBB7tynYDxtSmBfD9jOV5kwNkU1V46J6sb7xbmLa0gkRXnMXEcZtPIrAhvKKnDk
 J2heOGO9Fik1NMQ8fVf/KXjDbvWLZGK18cwQRXdnD6XRDeQQ2SfWbGspd0JroIUqpFQO
 vCaFz2fPh+hYJAm2vqke2xPFoNUjKd/jJZQHPwjH8y05RAxtvmM/lFK6YTL52t76ju+s
 xRJg==
X-Gm-Message-State: AOAM530do4AxO3/Rgrh0jHE1ag4sFaw4uTlRi5+z+KqBUE/hUcvmbvfQ
 mkqCJG134rpgF4gTDRhufXqykL8kv17PGCCZwQ0naUx+XBrxLU49TVWz4be4ZQiv7bsuSqm/4VC
 5j4Kypt33/eFaxoFRGPemfPM=
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr30574242ejc.132.1642696470218; 
 Thu, 20 Jan 2022 08:34:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF9+NmsBb9KPVuUgSXvv1RUm6gGRw3HsBpgMAdYinUYF2Y/bfZO+s9YZARtMUaHR9LPOCCTg==
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr30574226ejc.132.1642696470043; 
 Thu, 20 Jan 2022 08:34:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id dt15sm1157616ejb.190.2022.01.20.08.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:34:29 -0800 (PST)
Message-ID: <d6958153-7747-bc4b-2de0-57aa3226d984@redhat.com>
Date: Thu, 20 Jan 2022 17:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/9] Support Spi in i2c-multi-instantiate driver
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
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

Hi Mark,

On 1/20/22 14:43, Stefan Binding wrote:
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
> The new driver (Bus multi instantiate, bmi) checks for the
> hard-coded bus type and returns -ENODEV in case of zero devices
> found for that bus. In the case of automatic bus detection, 
> the driver will give preference to I2C.
> 
> The expectation is for a device node in the ACPI table to have
> multiple I2cSerialBus only or multiple SpiSerialBus only, not
> a mix of both; and for the case where there are both entries in
> one device node, only the I2C ones would be probed.
> 
> This new bus multi instantiate will be used in CS35L41 HDA new
> driver.

Mark, since most of my review remarks are small(ish) I expect
the next version of this (except patch 8/9) to be ready for
merging.

I can either merge all patches on top of 5.17-rc1 once released;
and provide an immutable-branch for you to merge for the SPI
bits; or you can merge patches 1-4 (the SPI patches) and then
send me a pull-req for an immutable-branch with those 4,
so that I can merge that and then the rest on top.

Mark, please let me know how you want to proceed with merging this.

Regards,

Hans




> 
> Changes since V2:
>  - Moved bus-multi-instantiate back into platform/x86
> 
> Lucas Tanure (4):
>   platform/x86: i2c-multi-instantiate: Rename it for a generic bus
>     driver name
>   platform/x86: bus-multi-instantiate: Reorganize I2C functions
>   ALSA: hda/realtek: Add support for HP Laptops
>   ACPI / scan: Create platform device for CS35L41
> 
> Stefan Binding (5):
>   spi: Make spi_alloc_device and spi_add_device public again
>   spi: Create helper API to lookup ACPI info for spi device
>   spi: Support selection of the index of the ACPI Spi Resource before
>     alloc
>   spi: Add API to count spi acpi resources
>   platform/x86: bus-multi-instantiate: Add SPI support
> 
>  MAINTAINERS                                  |   4 +-
>  drivers/acpi/scan.c                          |  16 +-
>  drivers/platform/x86/Kconfig                 |  14 +-
>  drivers/platform/x86/Makefile                |   2 +-
>  drivers/platform/x86/bus-multi-instantiate.c | 369 +++++++++++++++++++
>  drivers/platform/x86/i2c-multi-instantiate.c | 174 ---------
>  drivers/spi/spi.c                            | 142 ++++++-
>  include/linux/spi/spi.h                      |  32 ++
>  sound/pci/hda/patch_realtek.c                |  43 ++-
>  9 files changed, 588 insertions(+), 208 deletions(-)
>  create mode 100644 drivers/platform/x86/bus-multi-instantiate.c
>  delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c
> 

