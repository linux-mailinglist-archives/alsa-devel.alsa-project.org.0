Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF721FBF2E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 21:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E22C166C;
	Tue, 16 Jun 2020 21:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E22C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592336695;
	bh=qt8eq8Yb/g5/CafW5KXzLCn+lFvYU5TR8zlZyqvgzSc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lheh9Jy0Mnp1u3zdCwODcXv3YZIzzCVyGDpZMV2MbHaZ6NQut51ZgUsUpuR2xD9IW
	 l4Y5Rul17l7dIL3Flo1/z8pca18MZYkiE5wK0KIQdr8ccFm/eoUB0lCj8Hlhaes7VO
	 vBn/76Mdlz9lLmej+nPS9kndjMfjlmjRvPp12diE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B65F80217;
	Tue, 16 Jun 2020 21:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF82F8022B; Tue, 16 Jun 2020 21:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 743ADF80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 21:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743ADF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fanpFU30"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee920940000>; Tue, 16 Jun 2020 12:42:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 16 Jun 2020 12:43:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 12:43:01 -0700
Received: from [10.26.75.222] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 19:42:53 +0000
Subject: Re: [PATCH] ASoC: tegra: Fix reference count leaks.
To: <wu000273@umn.edu>, <kjlu@umn.edu>
References: <20200613204422.24484-1-wu000273@umn.edu>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9492fa91-067b-f74f-1a52-a2622d8f28d6@nvidia.com>
Date: Tue, 16 Jun 2020 20:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200613204422.24484-1-wu000273@umn.edu>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592336532; bh=Dp/0r6Nw2uRw3rP0FQK/EUznQLmj2KVDZ1kdtwhRPqg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fanpFU3012dPk+RxNw8Z8OH9a8yVg3Ep2EZFgySPCXu7I7bateQDqSJXuqeMK5XXM
 b7ltzhNCUAFQ8kjhZVL73eUgCoRh2ze1h/gKVYGUmvPjwmNO4+LMqe5hLv+WOOXIP0
 rfFqnxn1y3pd9GuzXpP4Fqpbg+YD3DQvt+FaPJgxy7MEOdHnExRlZwiZ9p5vIgz2Hj
 vuy3qreGl0kkuJXyEIxd21POD/SvJPIIOsVmjyJleSeY6GBbfZxR6OTFhJPENrRQ05
 c2LxeDWz8GsTOVXRiw43JYE8vYMaHMZ+GoaawdaJOxFOcVR1XAxzezJQvJjA40L/fV
 0V4lObTvqbCeg==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>,
 linux-tegra@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
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


On 13/06/2020 21:44, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.
> 
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 4 +++-
>  sound/soc/tegra/tegra30_i2s.c  | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 635eacbd28d4..156e3b9d613c 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -643,8 +643,10 @@ static int tegra30_ahub_resume(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		return ret;
> +	}
>  	ret = regcache_sync(ahub->regmap_ahub);
>  	ret |= regcache_sync(ahub->regmap_apbif);
>  	pm_runtime_put(dev);
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index d59882ec48f1..db5a8587bfa4 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -567,8 +567,10 @@ static int tegra30_i2s_resume(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		return ret;
> +	}
>  	ret = regcache_sync(i2s->regmap);
>  	pm_runtime_put(dev);

Thanks.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
