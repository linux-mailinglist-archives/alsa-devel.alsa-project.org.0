Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D46CC165FC0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 15:32:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 724F916B6;
	Thu, 20 Feb 2020 15:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 724F916B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582209172;
	bh=9DLhF7D7H36hSNpjKQRBPXBsOXn8QEYrfjx2NI8JeDM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7FEZMcNUKxH9XFVIA9xJZ7yEFh2vG6vewg/ZluiLkjkA65+K9YLk+yNjFPI6UGMO
	 pBmB2eUokbSrGhqXUzzcYlet0S8pUdmcsOhcBW8cFkBzaH9Wr+zt7Meh3pMPdZ729j
	 +jN4093z2Qxsfb9IFCL/ArdEZKPkzOSqRXrWZyUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80CC6F80101;
	Thu, 20 Feb 2020 15:31:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5288EF80148; Thu, 20 Feb 2020 15:31:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA3FBF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 15:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3FBF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="c7akADfr"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4e98040000>; Thu, 20 Feb 2020 06:30:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 06:31:01 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Feb 2020 06:31:01 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 14:30:58 +0000
Subject: Re: [PATCH v3 02/10] ASoC: tegra: add support for CIF programming
To: Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-3-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f930e81b-3635-3b4d-8613-6e8b43e2efaf@nvidia.com>
Date: Thu, 20 Feb 2020 14:30:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-3-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582209028; bh=/2DIXcjbQPQs9k+oNntAmjdAP0LqWcaxt6oAb3yKVVk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=c7akADfrtIbqKyxxIT6045B97kZk7vUa4mFTeI19vX9+I/5R8lOOI91uL4ev5n0dk
 ZLm2KMp0hnhWmRFXqgwCgwoAAwXYl2xZEHPihPlKE+AjKNkzW2m2KT5jcqTF8KRBtl
 jfA1SJujzjrXXhTWYfbOqiEAKvr25vNuZ8H+cnfX3LquqTZ8AI2gLFMEdZJ7u4/e+g
 byP9CfMfcKizZIVtLKre325LUS7atFHQllm6Fp3oaBqeIZ9zgLaBauasM6X1mk3vVK
 PTbsQAzT9rbvd77Y579X7bGSKyzHHsGu4N59yU7pGSoERI4GXttSPt3qnNYl0Unz57
 zy3InnDcDDFOA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


On 20/02/2020 06:34, Sameer Pujar wrote:
> Audio Client Interface (CIF) is a proprietary interface employed to route
> audio samples through Audio Hub (AHUB) components by inter connecting the
> various modules.
> 
> This patch exports an inline function tegra_set_cif() which can be used,
> for now, to program CIF on Tegra210 and later Tegra generations. Later it
> can be extended to include helpers for legacy chips as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/tegra_cif.h | 63 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra_cif.h
> 
> diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
> new file mode 100644
> index 0000000..ecc0850
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_cif.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * tegra_cif.h - TEGRA Audio CIF Programming
> + *
> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> + *
> + */
> +
> +#ifndef __TEGRA_CIF_H__
> +#define __TEGRA_CIF_H__
> +
> +#define TEGRA_ACIF_CTRL_FIFO_TH_SHIFT		24
> +#define TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT		20
> +#define TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT		16
> +#define TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT	12
> +#define TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT	8
> +#define TEGRA_ACIF_CTRL_EXPAND_SHIFT		6
> +#define TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT	4
> +#define TEGRA_ACIF_CTRL_REPLICATE_SHIFT		3
> +#define TEGRA_ACIF_CTRL_TRUNCATE_SHIFT		1
> +#define TEGRA_ACIF_CTRL_MONO_CONV_SHIFT		0
> +
> +/* AUDIO/CLIENT_BITS values */
> +#define TEGRA_ACIF_BITS_8			1
> +#define TEGRA_ACIF_BITS_16			3
> +#define TEGRA_ACIF_BITS_24			5
> +#define TEGRA_ACIF_BITS_32			7
> +
> +#define TEGRA_ACIF_UPDATE_MASK			0x3ffffffb
> +
> +struct tegra_cif_conf {
> +	unsigned int threshold;
> +	unsigned int audio_ch;
> +	unsigned int client_ch;
> +	unsigned int audio_bits;
> +	unsigned int client_bits;
> +	unsigned int expand;
> +	unsigned int stereo_conv;
> +	unsigned int replicate;
> +	unsigned int truncate;
> +	unsigned int mono_conv;
> +};
> +
> +static inline void tegra_set_cif(struct regmap *regmap, unsigned int reg,
> +				 struct tegra_cif_conf *conf)
> +{
> +	unsigned int value;
> +
> +	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
> +		((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
> +		((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
> +		(conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
> +		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
> +		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
> +		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
> +		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
> +		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
> +		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
> +
> +	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
> +}
> +
> +#endif

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
