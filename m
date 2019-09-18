Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B93B5F61
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 10:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CFF1677;
	Wed, 18 Sep 2019 10:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CFF1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568796257;
	bh=wX4VjUtyLE3g7WuRFDgEV25RePZ2oLqhxVlQXUv3cIk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nix4DP+1RxS9Jb1l2d11s/59+EfHE0PksDzlYsY00qboD1dg7VUOUbgOli4x7OILh
	 Alaw/XsBnh6VkT/xgSJzbnCfA52AAjm66hDSpf7DqQCQIiWkoqF8Trlce66TN5Xigh
	 HNrPSI2M3bo0wTvm1W/NE8cP2VeC4Pcy7ZYaNHMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFBBF80506;
	Wed, 18 Sep 2019 10:42:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D1EEF80506; Wed, 18 Sep 2019 10:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 806DCF800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 806DCF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="DpdX/e9E"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d81edf10000>; Wed, 18 Sep 2019 01:42:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 01:42:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 01:42:23 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:42:23 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:42:21 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
Date: Wed, 18 Sep 2019 09:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-2-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568796145; bh=4tKrQ8C++wUwX0Xp7kO+PpkJ4ueviUyOJuuDCkO6Wrg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DpdX/e9EXJGfjsnKPu1sk/9fRwQclh2PCsMEdOpznO3BiBhCqFCpIhNRlL1V8QYfs
 Z4KLFGabuoEcn+5n3uLgM03VdU4HDibPM+aLjMEE1C3xOdoLgsbXmXn7PUQA2uJzh2
 Wy04G2u1qmRhgW0dm2t8S7ujqLjEAnsdUmQ9SvHGQrHDJBebLuelJvGx6j9nobx/PX
 i/H2KUmXTcK30TW5cv+ZcSiwCX2IqSZi4RRcn9thT7qrHSwp7VklIK2pwBzFYBEfNR
 xk4/JLuR2eoWEBhQix7xj5AFxcOsHuV5f7rtP+c6LYJdK6D6GO/rg2iUAEuqGjXjMh
 0bhqev7lkgGBw==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
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


On 17/09/2019 19:12, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
> driver.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index ac6983c6bd72..d36b4662b420 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  	return 0;
>  }
>  
> +/*
> + * Set up TDM
> + */
> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
> +			       unsigned int tx_mask, unsigned int rx_mask,
> +			       int slots, int slot_width)
> +{
> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask = 0, val = 0;
> +
> +	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x "

dev_dbg() please. Also I don't think it is necessary to print both the
function name and 'setting TDM', the function name should be sufficient.

> +		 "slots: 0x%08x " "width: %d\n",

Why are there extra quotes here?

> +		 __func__, tx_mask, rx_mask, slots, slot_width)> +
> +	/* Set up slots and tx/rx masks */
> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
> +
> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
> +
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
> +
> +	/* Set FSYNC width */
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
> +		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);

What happens if there is only one slot? The fsync will be the width of
the slot. Typically, TDM is used with DSP-A/B formats and although the
driver does not appear to program the fsync width, it probably should
during the tegra30_i2s_set_fmt() depending on the format used rather
than here.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
