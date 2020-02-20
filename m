Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498316580E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 07:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A342416B8;
	Thu, 20 Feb 2020 07:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A342416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582181765;
	bh=YF3D1QzKA3nM1VZK/X7huSfywYAcQOo16nLyosOONDA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akoE6lhkILOCYKGhCXkP4s3SNgDcTui4LK3FqClQo+GnusFMJtH/X0raoeBXN1Px9
	 Uy/SElC7UxFvfDR8np7f+YtcfbxqWco1KwHDPF7d78KOHbzVZjoHmrttYWknJGFdpA
	 TPOvvaiSTpAcX3d49oKAzVWomXx8p+vILYQC7R84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6512F80114;
	Thu, 20 Feb 2020 07:54:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE91F80148; Thu, 20 Feb 2020 07:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19BCDF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 07:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19BCDF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="lZ5xeet0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=N6Y4X8NSWL8athov5DaRus71oPlYgxNzXlT3x3CYpJw=; b=lZ5xeet0RLigxecSB9KYyHQpRQ
 5UlTfYal8IDX5QJGKxMfR+c9RZ+d0CB5vBOIzNZa5NLW5qPiV0yMpG+Egghh8dyYIWNh2OSWxMMsX
 HN91aols/73muEKc+7pnu5jiiMZK8J56eLbD/KSn9aEnffJPdYu7pwQc9SH9pWeiHHDf4En0wni0u
 37V1DqHhA/w+0hPEnm+p7/njclbSIo82PUWVuZNzTo8/4XNIzXHPNyNU8Kl9rHRC4I0vMkWx4s8Kl
 LksWxdriWllBuJxtZfNg1J4iEZjwOFLBa7CO1BYx+kiXx5jy4oMU2jmD/EHQ/OlcwXquXI8T/FKdl
 1QLtyjfw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4fic-0006wI-Nl; Thu, 20 Feb 2020 06:53:54 +0000
Subject: Re: [PATCH v3 06/10] ASoC: tegra: add Tegra186 based DSPK driver
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-7-git-send-email-spujar@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6f8d0b45-025e-e03f-7478-c4c08bf61cbb@infradead.org>
Date: Wed, 19 Feb 2020 22:53:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-7-git-send-email-spujar@nvidia.com>
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
> index 0c07f63..fb77df3 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -93,6 +93,19 @@ config SND_SOC_TEGRA210_I2S
>            compatible devices.
>            Say Y or M if you want to add support for Tegra210 I2S module.
>  
> +config SND_SOC_TEGRA186_DSPK
> +        tristate "Tegra186 DSPK module"
> +        depends on SND_SOC_TEGRA
> +        help
> +          Config to enable the Digital Speaker Controller (DSPK) which
> +          converts the multi-bit Pulse Code Modulation (PCM) audio input to
> +          oversampled 1-bit Pulse Desnity Modulation (PDM) output. From the

                                     Density

> +          signal flow perspective DSPK can be viewed as a PDM transmitter
> +          that up-samples the input to the desired sampling rate by
> +          interpolation and then converts the oversampled PCM input to
> +          the desired 1-bit output via Delta Sigma Modulation (DSM).
> +          Say Y or M if you want to add support for Tegra186 DSPK module.

Please fix indentation according to coding style.
Thanks.

> +
>  config SND_SOC_TEGRA_RT5640
>  	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>  	depends on SND_SOC_TEGRA && I2C && GPIOLIB


-- 
~Randy

