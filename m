Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1BE3743
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 17:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD9E1706;
	Thu, 24 Oct 2019 17:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD9E1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571932574;
	bh=5Yg02LfobZ5Z0B7Gjf3QwYxVpxwusNz1mQlVUB+xA9w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTgUWVv/rpvaPMHn/NuPYyq/pF7zesa55Qhm/G2JOCG0W92ZFNkAmnQnLiQpmiM0b
	 Njsq9Xou2wn028qSKddivnC4TRqyFm4Vi914Pt4LS4ZnndSl+WxxyQ2GP2WYO+KzUJ
	 IRCz+1AmPVMeMbT/Uvq7mAr+XJskYhhU1D2JheOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33721F80367;
	Thu, 24 Oct 2019 17:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A3AEF8036B; Thu, 24 Oct 2019 17:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C69F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 17:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C69F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="E/CWYyiS"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db1c9380000>; Thu, 24 Oct 2019 08:54:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 24 Oct 2019 08:54:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 24 Oct 2019 08:54:23 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:54:22 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:54:20 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3914d620-ee0e-436f-1375-dfa0fba11273@nvidia.com>
Date: Thu, 24 Oct 2019 16:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571932472; bh=yji9VOcrGGH6ms19QSO3a0XnX588QP5FzhKEVmTxpk8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=E/CWYyiSjAnLCZ7mNPBEGTt+lEC1w30ZdTn1oxsyPFelAgrZO66HLtqVNyH6fRxb2
 1FJcm9GNJD8Xq/7couJ1yPSduzJJGVTYVjx3uUKM5zhpvod5vEzuS6e+bPsbC+sOa3
 tYfrWDdxfKIWtGUy6a2kDV0u5RC0qkHOOe75b7IJnlUi00w27k7vLcu6KG2oUuWO0q
 iEvuT3lsfcl2ttzpLr+vVnvkjcnRZnM1aZQ6m6+YYuM4G3GQYW6Vob7S4AFrKmYUSl
 frATpcuU+nWls1GLE4os9LHaL5DZROI5V8zv/T9fr0ThO+11fsw4cM4gY1iHpvjxAU
 lhxbMLWjHD+iw==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> The tegra3 audio can support 24 and 32 bit sample sizes so add the
> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
> formats when requested.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> 
> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
> ---
>  sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 73f0dddeaef3..063f34c882af 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	struct device *dev = dai->dev;
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>  	unsigned int mask, val, reg;
> -	int ret, sample_size, srate, i2sclock, bitcnt;
> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>  	struct tegra30_ahub_cif_conf cif_conf;
>  
>  	if (params_channels(params) != 2)
> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	switch (params_format(params)) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>  		sample_size = 16;
>  		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
> +		sample_size = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
> +		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
> +		sample_size = 32;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
>  	cif_conf.threshold = 0;
>  	cif_conf.audio_channels = 2;
>  	cif_conf.client_channels = 2;
> -	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
> -	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
> +	cif_conf.audio_bits = audio_bits;
> +	cif_conf.client_bits = audio_bits;
>  	cif_conf.expand = 0;
>  	cif_conf.stereo_conv = 0;
>  	cif_conf.replicate = 0;
> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.capture = {
>  		.stream_name = "Capture",
>  		.channels_min = 2,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
> +			   SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S16_LE,
>  	},
>  	.ops = &tegra30_i2s_dai_ops,
>  	.symmetric_rates = 1,

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
