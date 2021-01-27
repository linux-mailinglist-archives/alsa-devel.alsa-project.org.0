Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BC304F26
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 03:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7099D175E;
	Wed, 27 Jan 2021 03:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7099D175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611713931;
	bh=/O/uvkxRvCPlekPeg25qBSFXsMCwmkoh38bETrJfOvs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CM0kFqbUlmQkhMemSXs6epSjeMMQSWbxpif52PXo4BfHkH/9hVoCn2/SPzkX5QLWx
	 LeAfM1dihBcAEjC2p9CP6XOc+5SWRVeisEVDLn9jwDLEWZu3W4g6j2y53uWB2O6gUo
	 AScgSzk1gbLfhAwTI0IiB/gvU5trD4zpL3JH2QJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E60CF801D8;
	Wed, 27 Jan 2021 03:17:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52E2F8015B; Wed, 27 Jan 2021 03:17:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F495F80130
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 03:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F495F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T6Lo6Ii/"
Received: by mail-ot1-x32e.google.com with SMTP id d7so276499otf.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 18:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6RQrtHgaCb4lMM8fMMEFtRSX9i0mstcMB4wNsJgI/MI=;
 b=T6Lo6Ii/bnJxz2vRaiF2Gti0hvCGinxBzrtBlwrYo4bXEVfvVVpjiPCrFs9/pdbu2c
 7rGnPVQR9bFaaslAIsvoLPhfZEtbU4K265AixqeJ8C+/+l3dlIT1luwdttlDeiY5d0ga
 uIw4XRQ1cQ1jHFTeXsSFNNJvNTdEZ84Ip4V3ZIxjPopth8YVVts2rRtbftVuIZ45jS8g
 rCV4GRV6KI8OkXEKkGLhv/DRESs4HWNySBNhNo4CY9I8+fWWAwwVweHdfJO2v62yyXUr
 efRdqh3U7FP4+F5lkGMraytiEcrqwoG1ziFQ+aHvjd/VARCjEjZKtRAMbNRcGm5/wW+k
 2jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=6RQrtHgaCb4lMM8fMMEFtRSX9i0mstcMB4wNsJgI/MI=;
 b=CwmGoHC3X/hnsHN/3vOB+uocuY7RmejanKv+fyqs5M5+1dozkacarN05BAcaFf5ucL
 ZOT9m4RFsWz2BHVN9TU8sguhgRqLa675ZWFx7yqKL7n2RgMXZNC7kflwhmRxXs6cVuLF
 ePPSANpGzzeRIrcqQP0XMTVLcKPlB6ACjrf79dRScR7krczD+xGGrc47VlY6WNsBMsUn
 Tc7ZdcH7LO9BdZm/6sZ2YMzvQxiGWMTGkAqnYbM1n4NCVo2uPVeAoT2pZUQm4z0v4Kyf
 883X0yA6kAa5ohz2tso39sMj64xO3P+tagEXFPpOE4jhKDyJoDJv0AslaqAG/bPlwycC
 m3pw==
X-Gm-Message-State: AOAM531c5JTIgxMrbDw/MqkdmbLK9Szo2nefCR3GXSFV9zyUKRFOv7BU
 w7VOKSRhKthoXJ74uMJTTSQ=
X-Google-Smtp-Source: ABdhPJyifwvpQ79A0lInOexsJ2UPKtY+Jo11Y/jeVCEYoOuTRlsI5eNy2f6YDNYsG6g4Fj+ErKD5Ow==
X-Received: by 2002:a05:6830:402f:: with SMTP id
 i15mr6023104ots.345.1611713826628; 
 Tue, 26 Jan 2021 18:17:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s69sm173201oih.38.2021.01.26.18.17.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 Jan 2021 18:17:05 -0800 (PST)
Date: Tue, 26 Jan 2021 18:17:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
Message-ID: <20210127021704.GA44695@roeck-us.net>
References: <20210126202317.2914080-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126202317.2914080-1-helgaas@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 Jean Delvare <jdelvare@suse.com>, acpi4asus-user@lists.sourceforge.net,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-spi@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Len Brown <lenb@kernel.org>
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

On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> Replace it with "if (ACPI_SUCCESS(status))".
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
> 
> This isn't really an ACPI patch, but I'm sending it to you, Rafael, since
> it seems easier to just apply these all at once.  But I'd be happy to split
> them up into individual patches if you'd rather.
> 
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_bios.c     | 4 ++--
>  drivers/hwmon/acpi_power_meter.c         | 4 ++--

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  drivers/platform/x86/asus-laptop.c       | 6 +++---
>  drivers/spi/spi.c                        | 2 +-
>  sound/pci/hda/hda_intel.c                | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> index 6333cada1e09..055f600eeed8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -291,7 +291,7 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
>  			continue;
>  
>  		status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
> -		if (!ACPI_FAILURE(status)) {
> +		if (ACPI_SUCCESS(status)) {
>  			found = true;
>  			break;
>  		}
> @@ -304,7 +304,7 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
>  				continue;
>  
>  			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
> -			if (!ACPI_FAILURE(status)) {
> +			if (ACPI_SUCCESS(status)) {
>  				found = true;
>  				break;
>  			}
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index bb29cf02974d..43bbbfd6ade8 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -205,7 +205,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
>  			continue;
>  
>  		status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
> -		if (!ACPI_FAILURE(status)) {
> +		if (ACPI_SUCCESS(status)) {
>  			found = true;
>  			break;
>  		}
> @@ -218,7 +218,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
>  				continue;
>  
>  			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
> -			if (!ACPI_FAILURE(status)) {
> +			if (ACPI_SUCCESS(status)) {
>  				found = true;
>  				break;
>  			}
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 848718ab7312..7d3ddcba34ce 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -161,7 +161,7 @@ static ssize_t set_avg_interval(struct device *dev,
>  	mutex_lock(&resource->lock);
>  	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PAI",
>  				       &args, &data);
> -	if (!ACPI_FAILURE(status))
> +	if (ACPI_SUCCESS(status))
>  		resource->avg_interval = temp;
>  	mutex_unlock(&resource->lock);
>  
> @@ -232,7 +232,7 @@ static ssize_t set_cap(struct device *dev, struct device_attribute *devattr,
>  	mutex_lock(&resource->lock);
>  	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_SHL",
>  				       &args, &data);
> -	if (!ACPI_FAILURE(status))
> +	if (ACPI_SUCCESS(status))
>  		resource->cap = temp;
>  	mutex_unlock(&resource->lock);
>  
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 0edafe687fa9..bfea656e910c 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -861,7 +861,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 * The significance of others is yet to be found.
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "SFUN", NULL, &temp);
> -	if (!ACPI_FAILURE(rv))
> +	if (ACPI_SUCCESS(rv))
>  		len += sprintf(page + len, "SFUN value         : %#x\n",
>  			       (uint) temp);
>  	/*
> @@ -873,7 +873,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 * takes several seconds to run on some systems.
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "HWRS", NULL, &temp);
> -	if (!ACPI_FAILURE(rv))
> +	if (ACPI_SUCCESS(rv))
>  		len += sprintf(page + len, "HWRS value         : %#x\n",
>  			       (uint) temp);
>  	/*
> @@ -884,7 +884,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
>  	 * silently ignored.
>  	 */
>  	rv = acpi_evaluate_integer(asus->handle, "ASYM", NULL, &temp);
> -	if (!ACPI_FAILURE(rv))
> +	if (ACPI_SUCCESS(rv))
>  		len += sprintf(page + len, "ASYM value         : %#x\n",
>  			       (uint) temp);
>  	if (asus->dsdt_info) {
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 720ab34784c1..801d8b499788 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2210,7 +2210,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>  		return AE_OK;
>  
>  	if (!lookup.max_speed_hz &&
> -	    !ACPI_FAILURE(acpi_get_parent(adev->handle, &parent_handle)) &&
> +	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
>  	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
>  		/* Apple does not use _CRS but nested devices for SPI slaves */
>  		acpi_spi_parse_apple_properties(adev, &lookup);
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 770ad25f1907..fe8049cd2765 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1444,7 +1444,7 @@ static bool atpx_present(void)
>  		dhandle = ACPI_HANDLE(&pdev->dev);
>  		if (dhandle) {
>  			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
> -			if (!ACPI_FAILURE(status)) {
> +			if (ACPI_SUCCESS(status)) {
>  				pci_dev_put(pdev);
>  				return true;
>  			}
> @@ -1454,7 +1454,7 @@ static bool atpx_present(void)
>  		dhandle = ACPI_HANDLE(&pdev->dev);
>  		if (dhandle) {
>  			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
> -			if (!ACPI_FAILURE(status)) {
> +			if (ACPI_SUCCESS(status)) {
>  				pci_dev_put(pdev);
>  				return true;
>  			}
> -- 
> 2.25.1
> 
