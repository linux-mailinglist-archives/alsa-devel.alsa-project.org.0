Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595F2EA84D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 11:14:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 228CF1673;
	Tue,  5 Jan 2021 11:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 228CF1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609841657;
	bh=ol0qc4MPB3SFpaiSyVW08AmP6gwNZq7C1zQIeFgHV8o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvjYxLeoxO4Dw5KEIz1F1SFqQHIBG48K8UBikDRwDpLA+LTb/7rYCPuv8wADJq2JI
	 M+IoNvbQDw8DCmE3KPsYdMFHfiMLgqctBWTtSPEYfFYRB4Sfl4Xo5i6qLveuRWb7a+
	 QXPAv9PpzRN4kptl+4XDfnWt8i/NPGBlXMozs91k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C636F8015B;
	Tue,  5 Jan 2021 11:12:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D004CF80258; Tue,  5 Jan 2021 11:12:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4581F800FD
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 11:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4581F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fK760iSg"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff43b8b0001>; Tue, 05 Jan 2021 02:12:27 -0800
Received: from [10.26.72.150] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 10:12:23 +0000
Subject: Re: [PATCH 1/2] clk: tegra30: Add hda clock default rates to clock
 driver
To: Peter Geis <pgwipeout@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Peter De
 Schrijver" <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan Kumar
 <mkumard@nvidia.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
 <20201225012025.507803-2-pgwipeout@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bcf7326a-37dc-afdc-82c6-58175e97f7d9@nvidia.com>
Date: Tue, 5 Jan 2021 10:12:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201225012025.507803-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609841547; bh=gYOyUlnAGiNfPiqs6BiSy7QAqM9dPQZMRYM5DfEygxk=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=fK760iSgSh3XodQJ9/CrvYqzAPZk+ZI93qyb1QZrNWR1uQAPpW+LZwZhnM/AFsA3n
 FyriI80PBYkbrNSnQe9Sz85qgVfbPgmBifTD2EEXxT4577woLHSW95lgjpNaTh+OzI
 qKF+ApgxxWTiP1+2eMJquLWZHobORR6iqdQP+gN8DAy+SQtCDJhOd+TZYLAXjUxBNL
 VBYvj+AeoDXjG4ICyWjVoxJbzFstjcleCFz2v3LoKrYhlqDvjxOtXWsE/1C0Ery4Vv
 tNYaqwltuXnS7BdH0dOoms1fJdHwQWr6mMlcAJmA+YV0j1HOdfXwNBJ8gAhIm3UsPZ
 ahwBdesM3TKAw==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Ion Agorria <ion@agorria.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
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


On 25/12/2020 01:20, Peter Geis wrote:
> Current implementation defaults the hda clocks to clk_m.
> This causes hda to run too slow to operate correctly.
> Fix this by defaulting to pll_p and setting the frequency to the correct rate.
> 
> This matches upstream t124 and downstream t30.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index 37244a7e68c2..9cf249c344d9 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1256,6 +1256,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA30_CLK_I2S3_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
>  	{ TEGRA30_CLK_I2S4_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
>  	{ TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
> +	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> +	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>  };


This looks good to me. So ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
