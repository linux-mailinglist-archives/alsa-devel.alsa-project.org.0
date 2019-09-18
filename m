Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC2B5FA9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 10:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5248482B;
	Wed, 18 Sep 2019 10:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5248482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568796992;
	bh=KY5eP4sVC2Qact22psErcsBZvJKPE4oFUynTffuIXKM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CiRG5WHENNTtAL5krni8w6fhRpdZFxOF0+iNaWkUDDPiYMlhkKA7HpJ57ngZRUzhd
	 LtQA0T+4Rak4k6ZLBv2aOGrjEfkjj00OROA6ARTajISOhzKPV4Wdn4rgZ7bFW+dCBr
	 F90FMkfcnuaMChMYAV2Rdd/LP1eduBSVuL7FlU1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89599F80506;
	Wed, 18 Sep 2019 10:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABFA2F80506; Wed, 18 Sep 2019 10:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034E3F80292
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034E3F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="EdE4HShN"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d81f0d40001>; Wed, 18 Sep 2019 01:54:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 01:54:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 01:54:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:54:39 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 08:54:36 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-6-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
Date: Wed, 18 Sep 2019 09:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-6-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568796884; bh=KNlNBDBlSpS9zqvIkqXCRsuHdeFCNAOwsiyWKAA7L8k=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=EdE4HShNRcemvvfrzrFn4ZyxMgZoaxGznY8BCYyonym7rJg47t9N9jyOMb8BTxm9L
 aMvMDSghMFr0X6qXvaPOtFwnlLfvoGopY0vUmBMEJSbYNuNVIwGR5x2RbA7id1L83T
 qNHYarSZWqH0t7sNKWX6KJtyGiwZfm5FyQWu9a6yeKKmgBZJL18HMzkJxbCebU5ok7
 AHpFe0FqtXmpcyg18aPGoOx48Wg+Q0xaY4nB2Ijy+ANVYWq+wNu8JiPs8vBJnAcvba
 gpbhiRkWE81W0twUx895ilfm9Om605ZNet1a0ipYGvOoynhIo+4OftISWeewbRaCQj
 E5YITiMa7cB4A==
Cc: linux-kernel@lists.codethink.co.uk
Subject: Re: [alsa-devel] [PATCH 5/8] ASoC: tegra: set edge mode for TDM
	correctly
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
> In TDM, use the negative edge to drive data and the positive edge to sample
> data.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 4222839b63bd..d75ce12fe177 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>  	}
>  
>  	pm_runtime_get_sync(dai->dev);
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>  	pm_runtime_put(dai->dev);

I would rather set this in the case statement above where the format is
parsed and again drop this 'is_tdm' variable.

Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
