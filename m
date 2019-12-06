Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647A116ABA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:17:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27BA51661;
	Mon,  9 Dec 2019 11:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27BA51661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886625;
	bh=ttgc3XDGZCm+TdF1yj+1WlcbzRJi05uzLS2/VI8IYQQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyrTiwwZEjtDd2Yh3Q0fJkSuLZv0dC0ibbhCzVLCljdnCIa679g6xqsmG1aTB6Gc+
	 UMRgrgfgOMrOdTpkB6yyadCm6Tyyb/ap3vM9J8JSnmXjvNcwhrIOgzBk/oMuPZFf6K
	 /o0ahIP7dg39DT0W1Klj3zqZbu9/NgWy4wQCzWH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 435BCF802FB;
	Mon,  9 Dec 2019 10:52:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EE5F801EC; Fri,  6 Dec 2019 18:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD209F8010F
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 18:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD209F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="cBmImDjj"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dea94be0000>; Fri, 06 Dec 2019 09:49:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 06 Dec 2019 09:49:55 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 06 Dec 2019 09:49:55 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 17:49:55 +0000
Received: from [10.2.168.155] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec 2019
 17:49:53 +0000
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <digetx@gmail.com>,
 <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>, <sboyd@kernel.org>,
 <tglx@linutronix.de>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
From: Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e94e56bc-2b4c-5d95-002a-073c9272537d@nvidia.com>
Date: Fri, 6 Dec 2019 09:49:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575654591; bh=YAKMdzUBMPWAB8WxEd9kdEtmiQZK+fcXFtpn3WK3zFI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=cBmImDjj+dyCqtopez7WVPM/iJlu/l28OHqHjZChjD+Mp3OVTNm+RP4BLaBZxlohg
 jFLvRr6hs8CbAP4rCu9sBsol/cIJ+dbyjva75W8ULSHpS/Rvjq5GzesL+Mkyv4naYx
 kyfjyPy/qUh3C0V+QFgUfjGznstU32zWVzd63IucFk7Ur1IT6eBYp9mDP9u4hw8KP8
 VZ3xpAjo5jE+VbRZYIm7dbXZ0Dd74f3QkSWOl74lw+OfiDrxBRHjVctdtn1Ci5s/pk
 nJbKMH+1enbKMJpfYA9EsGB4KExgGuhOBCDBDNSX/4wJsj7F46XH41pBmMyIuTOlUm
 fcDubePTSjzBA==
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:51:21 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: Re: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for
	audio mclk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Greg.

Sorry, Will send this patch separately (out of this series) with stable 
tag to get this applied to stable kernels once review is done for this 
series.

On 12/5/19 6:48 PM, Sowjanya Komatineni wrote:
> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
> are moved to Tegra PMC driver with pmc as clock provider and using pmc
> clock ids.
>
> New device tree uses clk_out_1 from pmc clock provider.
>
> So, this patch adds fallback to extern1 in case of retrieving mclk fails
> to be backward compatible of new device tree with older kernels.
>
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>   sound/soc/tegra/tegra_asoc_utils.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
> index 8e3a3740df7c..f7408d5240c0 100644
> --- a/sound/soc/tegra/tegra_asoc_utils.c
> +++ b/sound/soc/tegra/tegra_asoc_utils.c
> @@ -211,8 +211,14 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>   	data->clk_cdev1 = clk_get(dev, "mclk");
>   	if (IS_ERR(data->clk_cdev1)) {
>   		dev_err(data->dev, "Can't retrieve clk cdev1\n");
> -		ret = PTR_ERR(data->clk_cdev1);
> -		goto err_put_pll_a_out0;
> +		data->clk_cdev1 = clk_get_sys("clk_out_1", "extern1");
> +		if (IS_ERR(data->clk_cdev1)) {
> +			dev_err(data->dev, "Can't retrieve clk extern1\n");
> +			ret = PTR_ERR(data->clk_cdev1);
> +			goto err_put_pll_a_out0;
> +		}
> +
> +		dev_err(data->dev, "Falling back to extern1\n");
>   	}
>   
>   	/*
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
