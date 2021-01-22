Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF02FFC43
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 06:28:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5779C1A00;
	Fri, 22 Jan 2021 06:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5779C1A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611293300;
	bh=UX7+HMUsZpJdU81APX2zHmnMKosf5Vsowq/SK1uyEQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FD8kjTMwR0va/BNq/hVVJDkOho8Kblx0trCOIr8lT+KH/uJ4mEIfn6XDb7sEhI1zH
	 sPxYJZB8B2ULtOMZHD+tLXlBqIVMY4ynUVDwdsMM1Rv+yGg/7Lgxscg822LmkTL3D2
	 fXMcen4mMF4XGmrK5Dp2rFPzsHqbSA2PXCW5twNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75868F8019B;
	Fri, 22 Jan 2021 06:26:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0B69F8016E; Fri, 22 Jan 2021 06:26:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 185BDF80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 06:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 185BDF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WFq05fx+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C902023122;
 Fri, 22 Jan 2021 05:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611293185;
 bh=UX7+HMUsZpJdU81APX2zHmnMKosf5Vsowq/SK1uyEQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFq05fx+JSBMMoISPxgjHxuiwb3DiYylih5P1SP9TexlIIgBHGzlfEEzDx7VWPP65
 Hr2ssce4Xx+JO1xJfoJmC8J4yjVlig1du7EDYY2FOYgil1MSv2e5K+35W/gMJtffui
 VTpqQ9WTFaMzSoYHJT359sTvVf+DQ42KYCFiluG1z2a7z6dAr9Lm+mvh9dXektEXaj
 44t9aKyqx+uXev7Cdj2ajvYMQagO5Ty0a+FmO2RLavnSiSHlpbXFqplm9Ttkrwv+DY
 eqx8SSe5McjqTZs5AW8RitzC88r8eFgqrjj1PkcNwIm96snKiVa7zvIpqZDeSLHX4i
 /hi2AKE3XwG7w==
Date: Fri, 22 Jan 2021 10:56:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
Message-ID: <20210122052621.GI2771@vkoul-mobl>
References: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
 <20210122005725.94163-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122005725.94163-3-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>
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

On 21-01-21, 18:57, Pierre-Louis Bossart wrote:
> The sof-pci-dev driver fails to link when built into the kernel
> and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:
> 
> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
> 
> As a temporary fix, use IS_REACHABLE to prevent the problem from
> happening. A more complete solution is to move this code to
> Intel-specific parts, restructure the drivers and Kconfig as discussed
> with Arnd Bergmann and Takashi Iwai.
> 
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/sof/sof-acpi-dev.c | 11 ++++++-----
>  sound/soc/sof/sof-pci-dev.c  | 10 ++++++----
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
> index 2a369c2c6551..cc2e257087e4 100644
> --- a/sound/soc/sof/sof-acpi-dev.c
> +++ b/sound/soc/sof/sof-acpi-dev.c
> @@ -131,12 +131,13 @@ static int sof_acpi_probe(struct platform_device *pdev)
>  	if (!id)
>  		return -ENODEV;
>  
> -	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
> -	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> -		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
> -		return -ENODEV;
> +	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
> +		ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
> +		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> +			dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
> +			return -ENODEV;
> +		}

should the else case be to continue, is the DSP not critical for the
driver to work..?

>  	}
> -

Seems unrelated change

>  	dev_dbg(dev, "ACPI DSP detected");
>  
>  	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 7757463bd81a..388772f9c4d2 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -346,10 +346,12 @@ static int sof_pci_probe(struct pci_dev *pci,
>  	const struct snd_sof_dsp_ops *ops;
>  	int ret;
>  
> -	ret = snd_intel_dsp_driver_probe(pci);
> -	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> -		dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
> -		return -ENODEV;
> +	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
> +		ret = snd_intel_dsp_driver_probe(pci);
> +		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> +			dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
> +			return -ENODEV;
> +		}
>  	}
>  	dev_dbg(&pci->dev, "PCI DSP detected");
>  
> -- 
> 2.25.1

-- 
~Vinod
