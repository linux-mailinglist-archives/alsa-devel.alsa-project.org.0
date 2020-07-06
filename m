Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47829215A85
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 17:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF2E1665;
	Mon,  6 Jul 2020 17:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF2E1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594048705;
	bh=QNWUBlpL7U3ZSiH1XRVBpy6VXJLUfJfXU4dpyjhRj1c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHQ2hoyuIub9boRlAMLpLMD+4zfBI8NA5G4Mm33WH2JIITTVb4Y57kbPVw6XLkf4J
	 JG7gAeoefuWWOUZVj006OtU/onBdOA3VCth/9EZQMKQGiSX/loLt5tm1e1AcA7QE74
	 NcUb1xZKVrS6etylgALY2F88gF1COSodADBwlq3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C2BFF8015C;
	Mon,  6 Jul 2020 17:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5CCEF8015A; Mon,  6 Jul 2020 17:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62051F80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 17:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62051F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="d6OFUJ0p"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f033fe70000>; Mon, 06 Jul 2020 08:14:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 06 Jul 2020 08:16:32 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 06 Jul 2020 08:16:32 -0700
Received: from [10.26.72.33] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jul
 2020 15:16:20 +0000
Subject: Re: [PATCH 7/8] ASoC: tegra: tegra20_das: remove always-true
 comparison
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <20200702165901.164100-8-pierre-louis.bossart@linux.intel.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1a7c7025-7689-54a0-dbc0-00b5c1fcd0f1@nvidia.com>
Date: Mon, 6 Jul 2020 16:16:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702165901.164100-8-pierre-louis.bossart@linux.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594048487; bh=S3qOsW4jy3ZymnO+RQ9II2XOQKKoroUl5+GuXsnukfU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=d6OFUJ0pQtg6JQNVFCgkn/XX5QvOjZQA7YGkzOh5jeFI1EEr9d+9uXjmZBMHygc7i
 +fMiz5QaZP2St9MCr/wjAiDsGA3nMwV9kXM12bX28umi38ousxAkAwYFukFs2+qr9m
 DCXLZZuViVo6JARF8034PM2zUKb1ihpLn+de3tmDU2jrBRyOr0vEwRg86NdPauItf4
 lMLsoErnsyCo6EWjSVqqgECpya2Upq1awjOuxQRTSbpVVcDhRZ3bb7a3UXdcX1futz
 EbIQZhihEllFEKDsBgXLOX++Y4glQJTFP9jMsvK+dVkDw0Ou1BJJiDy1U19xd9q99L
 6MUUXS/P0jwUQ==
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
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


On 02/07/2020 17:59, Pierre-Louis Bossart wrote:
> Fix W=1 warning:
> 
> sound/soc//tegra/tegra20_das.c:101:11: warning:
> comparison of unsigned expression >= 0 is always true [-Wtype-limits]
>   101 |  if ((reg >= TEGRA20_DAS_DAP_CTRL_SEL) &&
>       |           ^~
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/tegra/tegra20_das.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
> index 1070b2710d5e..79dba878d854 100644
> --- a/sound/soc/tegra/tegra20_das.c
> +++ b/sound/soc/tegra/tegra20_das.c
> @@ -98,8 +98,7 @@ EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
>  
>  static bool tegra20_das_wr_rd_reg(struct device *dev, unsigned int reg)
>  {
> -	if ((reg >= TEGRA20_DAS_DAP_CTRL_SEL) &&
> -	    (reg <= LAST_REG(DAP_CTRL_SEL)))
> +	if (reg <= LAST_REG(DAP_CTRL_SEL))
>  		return true;
>  	if ((reg >= TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL) &&
>  	    (reg <= LAST_REG(DAC_INPUT_DATA_CLK_SEL)))
> 

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
