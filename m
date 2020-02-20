Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC146165811
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 07:56:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7248D1690;
	Thu, 20 Feb 2020 07:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7248D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582181809;
	bh=tGCW1bbQebU9Mdp3Iw2CvyuoFECjFMQoqfuWylVt/Mg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrN3GDWhPVmleOi7JZ8WRxnng+Pb+KGOWwjpNpsxY3uowLTsZ6KvjlfkYn9JcNlIz
	 FYSG5XwiFnlCg4EJMCZo05zkvvbCqJxaCWYa3g+WLLUb+qE1ofrX5bps8UllJih6uN
	 p8mzAc1oEVuN9Yfu4cIG3+tGfzVUQybgzGsO0qmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED6A4F80150;
	Thu, 20 Feb 2020 07:55:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D438CF8014C; Thu, 20 Feb 2020 07:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1E7F8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 07:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1E7F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="NWIQAfgM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=w/FCWhEq53cMrrGLxY1ndQsJq77PgtJX7MNJzE4p3/w=; b=NWIQAfgMR9X8cjViPjDr/dAhSz
 qhxOc6hiDBERt8z4uhbFOfPxvP7mZqG713mrnh6fFIaIyd35vSiQtY1xi7EifWh82xVHguLosKrg5
 ASiiwK9b6jDqD/BIBuGWORQyM+n4qQQU8PeE/oFfWApw3c253cSG6QrFhOLsdc85Rak+1LR0ejxH2
 rcTbfrbngCKsII4eB4nE9q213VNx6CoyxRmU950fkvNDFcsZpLIp4bkOjKj5fKBmvWhEfkJnF4wyb
 rCDrt4/AcQzM+8K3vdDIly8az9ofADZ9oXp4qq65NHZs3hGhH+DOBjTUo53sZ3+qzBaKHkDNL9xX6
 blId2gsA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4fk3-0008Dc-5F; Thu, 20 Feb 2020 06:55:23 +0000
Subject: Re: [PATCH v3 07/10] ASoC: tegra: add Tegra210 based ADMAIF driver
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-8-git-send-email-spujar@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c1871939-ebf9-150e-1786-96a7f6bd6522@infradead.org>
Date: Wed, 19 Feb 2020 22:55:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-8-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

On 2/19/20 10:34 PM, Sameer Pujar wrote:
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index fb77df3..c0a5f0b 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -106,6 +106,18 @@ config SND_SOC_TEGRA186_DSPK
>            the desired 1-bit output via Delta Sigma Modulation (DSM).
>            Say Y or M if you want to add support for Tegra186 DSPK module.
>  
> +config SND_SOC_TEGRA210_ADMAIF
> +        tristate "Tegra210 ADMAIF module"
> +        depends on SND_SOC_TEGRA
> +        help
> +          Config to enable ADMAIF which is the interface between ADMA and
> +          Audio Hub (AHUB). Each ADMA channel that sends/receives data to/
> +          from AHUB must interface through an ADMAIF channel. ADMA channel
> +          sending data to AHUB pairs with an ADMAIF Tx channel, where as
> +          ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
> +          channel. Buffer size is confiigurable for each ADMAIIF channel.

                                     configurable

> +          Say Y or M if you want to add support for Tegra210 ADMAIF module.

Please fix indentation according to coding style.

> +
>  config SND_SOC_TEGRA_RT5640
>  	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>  	depends on SND_SOC_TEGRA && I2C && GPIOLIB


-- 
~Randy

