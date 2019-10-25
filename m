Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7057E462A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 10:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803411777;
	Fri, 25 Oct 2019 10:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803411777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571993372;
	bh=uAUP7vW8tAca/8BI5K07aGAcBYl7uYlNy9dN72wRCHs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWo5XK+eoOr8/iTMSksiiXdebYlr0qeXdRFQt+MwgLTjSP+2DW6TozfS2MwaAafQK
	 ObIe3eTf5WCbkqZP2MkSD2cvFoHdyByUhftEV3jaDpNKnoLc/8ellqJ4JlKFq0shcV
	 GBif1frxI6i95MPNcBAxNyfDmfnVJbpypjYza1h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0C4F8036F;
	Fri, 25 Oct 2019 10:47:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD71F8036F; Fri, 25 Oct 2019 10:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCF4F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 10:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCF4F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="gBMQkcb9"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db2b6b40002>; Fri, 25 Oct 2019 01:47:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 25 Oct 2019 01:47:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 25 Oct 2019 01:47:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:47:39 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 08:47:37 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-8-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ab8211ea-d4ed-85dc-51f4-ab9c2e134378@nvidia.com>
Date: Fri, 25 Oct 2019 09:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-8-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571993268; bh=KnJpJjddREUP29pxiWq2xGT5kBre372ihH0Mi2/QMR8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=gBMQkcb9hWJ1w5qxyEXr4tKLbxLJT+vWuwj2fGq9ZDzCy5GSzfF/SWR6OAEC0nXkQ
 Sv42J0op5kPbyd/kJvdhQIhJifnf67yEaVO/tBnh8grUVTsew+kxj5AWxJova7/JxI
 FRxPjhtAHpZd5C8Ql4TQr87vPSX63bf9GPxs3UxQIbHTgOmdK/MuKl941ahV1Zaz1a
 89GAx0704HCyTg/aTO99ofhBfs72BoNki8OPY7aQzqdtaZq/Seb9qVhL/KlSwpWgjc
 UjLTI6sZ8ienDCLsgupF1NhCxGlt64g0ub2GiH5JTnkj0pQqbiaFOJuTme6b10j5sV
 KCdxzRJlsG95g==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH v5 7/7] ASoC: tegra: take packing settings
 from the audio cif_config
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
> If the CIF is not configured as 16 or 8 bit, then the
> packing for 8/16 bits should not be enabled as the
> hardware only supports 8 or 16 bit packing.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 24bc03428b45..0768c6b6dc25 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -96,10 +96,17 @@ int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_8_4;
> +
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
> @@ -203,10 +210,16 @@ int tegra30_ahub_setup_tx_fifo(enum tegra30_ahub_txcif txcif,
>  	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
>  	val = tegra30_apbif_read(reg);
>  	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_MASK |
> -		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK);
> -	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT) |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN |
> -	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_TX_THRESHOLD_SHIFT);
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16 ||
> +	    cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_EN;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_16)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
> +	if (cif_conf->audio_bits == TEGRA30_AUDIOCIF_BITS_8)
> +		val |= TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_8_4;
>  	tegra30_apbif_write(reg, val);
>  
>  	cif_conf->direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
> 

Looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
