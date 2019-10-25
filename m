Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A6E457A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 10:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EEF61780;
	Fri, 25 Oct 2019 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EEF61780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571991650;
	bh=s7Ae0EZq2JK0atGRa2og3O7+6BMVNp6adsykXWvYzsw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZdXj0d1zb0mhPYR4j95kWkc9QGySUyCWNh9aPqIlM8q2BW+Q6MPrc10aG3kfiU81r
	 YTeVe/zHvlf+ctL8hsEHehiJ3co/EU4XLpk00oTkU69fZvMNXESxfKlIsD685STyVs
	 8CwxxTTk2nuCkW+IUrnZYrKB2eXccnnvP9p3m9I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA9BF8036F;
	Fri, 25 Oct 2019 10:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26709F8036F; Fri, 25 Oct 2019 10:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31FF3F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 10:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FF3F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="VxZqx/H8"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db2affb0000>; Fri, 25 Oct 2019 01:19:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 25 Oct 2019 01:18:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 25 Oct 2019 01:18:58 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:18:51 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:18:49 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-7-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c88664c5-74ac-d03f-02b4-477f10a27401@nvidia.com>
Date: Fri, 25 Oct 2019 09:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-7-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571991547; bh=A76D4qQ0zEUGrlp/BYvvuV2JNWOm7Ihmd2Zf8mEBYu8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=VxZqx/H8yYjW+O+zUg8r8X/waNKGwpt2Z51nFOXW0d3ll0wz7QikNXqepKpmSZfjV
 aHBDBKcabx06PBnRGYSe+rgMptOg2MChHApvDhIH152RUXljCnkooI9/uaIOHqoOT1
 peF49h7VEqnWXZlGdWYTrQ6uOeDZMyNmIaEkltYTRd2jLZJ1o4uEE7aGK88znjDdfI
 6/d15Y90o9okLwBP8jGMi0fYW09NtPm9C27exKIULmWR+x7KZn9yzje6OXp2geTZyI
 dRCPtgMkfvTI9ORb+k1Ly6HJ4pyqlT9PCvvZ570unqXhIpY1eYranWn6jdFY4+eDvl
 XbCyziTw0Uqmg==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH v5 6/7] ASoC: tegra: config fifos on
	hw_param changes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 18/10/2019 16:48, Ben Dooks wrote:
> If the hw_params uses a different bit or channel count, then we
> need to change both the I2S unit's CIF configuration as well as
> the APBIF one.
> 
> To allow changing the APBIF, add a call to reconfigure the RX or
> TX FIFO without changing the DMA or allocation, and get the I2S
> driver to call it once the hw params have been calculate.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 115 ++++++++++++++++++---------------
>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>  3 files changed, 69 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 952381260dc3..24bc03428b45 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
> +			       struct tegra30_ahub_cif_conf *cif_conf)
> +{
> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
> +	u32 reg, val;
> +
> +	pm_runtime_get_sync(ahub->dev);
> +
> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> +	val = tegra30_apbif_read(reg);
> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	tegra30_apbif_write(reg, val);
> +
> +	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> +
> +	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> +	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> +	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, cif_conf);
> +
> +	pm_runtime_put(ahub->dev);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
> +
>  int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  				  char *dmachan, int dmachan_len,
>  				  dma_addr_t *fiforeg)
>  {
>  	int channel;
> -	u32 reg, val;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	channel = find_first_zero_bit(ahub->rx_usage,
> @@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
>  	*fiforeg = ahub->apbif_addr + TEGRA30_AHUB_CHANNEL_RXFIFO +
>  		   (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
>  
> -	pm_runtime_get_sync(ahub->dev);
> +	memset(&cif_conf, 0, sizeof(cif_conf));
>  
> -	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> -	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> -	val = tegra30_apbif_read(reg);
> -	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> -	tegra30_apbif_write(reg, val);
> -
> -	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
>  	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.expand = 0;
> -	cif_conf.stereo_conv = 0;
> -	cif_conf.replicate = 0;
> -	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> -	cif_conf.truncate = 0;
> -	cif_conf.mono_conv = 0;
> -
> -	reg = TEGRA30_AHUB_CIF_RX_CTRL +
> -	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
> -	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
> -
> -	pm_runtime_put(ahub->dev);
>  
> -	return 0;
> +	return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf);

I am not sure why it is necessary to call this here now because this is
called everytime you call hw_params() right? It seems redundant to me.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
