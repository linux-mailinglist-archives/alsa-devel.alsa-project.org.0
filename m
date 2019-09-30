Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF804C2760
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 22:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622361616;
	Mon, 30 Sep 2019 22:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622361616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569876852;
	bh=VJgC4EV8D0wr0STCq6C3dON89RcsLQREQw+qa21DsxU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8gVAdfLInYmmbLtkdAF1CHMRMBmBY2QDldTSN+/xlmSRVfKpjDcJTywFdB6iB6KE
	 DPA5zznMKTLZSYaiMgsOUuIAFVNDumv+RBZbwlbWAqPzI4rVQO5RFOzi+YjkxB5PgS
	 d9adwby/pC4Bo5Mz7HaV8h4FF4xFc+02it4xdg6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7730F800DE;
	Mon, 30 Sep 2019 22:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0ACF80391; Mon, 30 Sep 2019 22:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 905E6F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 22:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905E6F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="FsZqusXs"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d926b0b0005>; Mon, 30 Sep 2019 13:52:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 30 Sep 2019 13:52:20 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 30 Sep 2019 13:52:20 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 20:52:19 +0000
Received: from [10.26.11.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 20:52:17 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
Date: Mon, 30 Sep 2019 21:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930165130.10642-6-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569876748; bh=B+bOA/1BEdGMiJVQNxtEh1S0E93VcCLi3h/Sq2DhnuM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FsZqusXsLoQaD1YLlaEduilpt2gDH4p4wYckHHXcAnS4i9zhQxl5smZoojlUG9jlU
 tg3iHOMhLxStwM/RtWE7dkJN0nsumgoByusz+YiLGBwl/nc8EA520pU+GGiK3IQoDb
 cKXeCpbZpWKkzRQ7+gBwS78k71KzHYnEhQlwA5ZGWLymn0tTVP4MlfJi3+M5sbgBEm
 4HE5Yb+y7zPKyXh9gr5ZiyEzvstdDWQ3JxZHWVeUqKk2GgYjFdcr7Euc3+ZKORfYbM
 W0P/OLAxkVsIQZ05ltkTrWndQQ6Q8b7lRrJpz75R2HJHy+eYFJwVAyeKnpaMyhXwK8
 v4Ok4iNnI4qHw==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0
	for tdm
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



On 30/09/2019 17:51, Ben Dooks wrote:
> Set the offset to 0 for TDM mode, as per the current setup. Note we also
> move the data offset programming to the i2s hw_parameters call as per
> the suggestion from Jon Hunter.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
>  - fix the review comments and move the i2s offset setting
> ---
>  sound/soc/tegra/tegra30_i2s.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index c573151da341..a03692b0afc3 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  				unsigned int fmt)
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> -	unsigned int mask = 0, val = 0;
> +	unsigned int mask = 0, val = 0, data_offset = 1;
>  	unsigned int ch_mask, ch_val = 0;
>  
>  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> @@ -95,11 +95,13 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
> +		data_offset = 0;
>  		break;
>  	case SND_SOC_DAIFMT_DSP_B:
>  		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
> +		data_offset = 0;

My understanding is that the difference between dsp-a and dsp-b is that
dsp-a has an offset of 1 and dsp-b has an offset of 0.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
