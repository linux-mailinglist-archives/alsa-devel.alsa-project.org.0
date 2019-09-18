Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17FB5F98
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 10:52:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79619166F;
	Wed, 18 Sep 2019 10:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79619166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568796744;
	bh=2ZmgW++5eJvxpbF2Hhmet4Lwbo3IilLJj1/kKkSzuu4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fs3uYU36F9l4OHZHlMgnGKSZVK0eBDf/EczB38K32XTSUx9pjccdVaOXh7nZRqRBj
	 tUJe1JVLOsTkT0Nxbtyqa87sSlU1LUm85w1akI02Ws8Mhi9l55T1hiPFQJmwfZdbDi
	 R1XYc6wqLxluE3z1iEP7K1Sb2CHPWTrQ5tFq0nIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 095EAF80534;
	Wed, 18 Sep 2019 10:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F7B9F80506; Wed, 18 Sep 2019 10:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 663D9F800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 663D9F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OxHAR5k9"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d81efdd0000>; Wed, 18 Sep 2019 01:50:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 01:50:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Sep 2019 01:50:31 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:50:31 +0000
Received: from [10.21.132.148] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:50:29 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-4-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
Date: Wed, 18 Sep 2019 09:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-4-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568796637; bh=v7Q5B0cHsJ3ThW91VfNXX137Ea4Q7m990IesFmcHlY4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OxHAR5k93bXlDiP0tzZC62eLx0PKprR4+BQvJgfIPaPq9W07g9m+JKvx31W1x6Sya
 vvCVkw/1dv6Pu8i7kS6zvFfuBOCudXetNLmGuoPHLsAVHNbG61yg6inJKJyQwmEMfu
 gOdwQXARI52Aho2ZInFcX35hzzpRatGxClO1TW1Ri4kKfviQ21uG3HTFHWlxPzK0N4
 i15M5lgWg4Eu1CoU3OFwk1dhsttFhA2bSm4wmfmHtfrsIOiJ7SWipfDmxAXBxF7UAE
 KsvQ261Kas+3kmYgj1H1zLOyQrLXxbTxiVHKicZq8wXURDbAar8UtO7RMQP1EebAis
 sroQn80GSdQiw==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH 3/8] ASoC: tegra: i2s: Add support for more
 than 2 channels
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
> The CIF configuration and clock setting is currently hard coded for 2
> channels. Since the hardware is capable of supporting 1-8 channels add
> support for reading the channel count from the supplied parameters to
> allow for better TDM support. It seems the original implementation of this
> driver was fixed at 2 channels for simplicity, and not implementing TDM.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
> ---
>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>  sound/soc/tegra/tegra30_i2s.h |  1 +
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index b5372839f672..40bcc05a9dbb 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -86,14 +86,17 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		return -EINVAL;
>  	}
>  
> +	i2s->is_tdm = false;
>  	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>  	case SND_SOC_DAIFMT_DSP_A:
> +		i2s->is_tdm = true;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_B:
> +		i2s->is_tdm = true;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>  		break;
> @@ -127,10 +130,13 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct device *dev = dai->dev;
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val, reg;
> -	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
> -	if (params_channels(params) != 2)
> +	channels = params_channels(params);
> +	if (channels > 8)
> +		return -EINVAL;
> +	if (channels != 2 && !i2s->is_tdm)

I don't think that this additional test is really necessary. I would
just drop this 'is_tdm' variable.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
