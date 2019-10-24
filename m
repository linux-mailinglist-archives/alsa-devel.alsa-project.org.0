Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56CFE3708
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 17:52:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638E216B3;
	Thu, 24 Oct 2019 17:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638E216B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571932376;
	bh=X80UtcDUM1mbDdeShA0SheSZPyMaL32yXkNqAqEz2SM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7MonCTL58lboR5AReJxCTx1DIDsgFJ2It9Y8n1YVQ9ckO6WQTGirKg7YnAcG6vhL
	 tFInuGtpXzgZNWGappNqNskXSiNquLHPiZIr2IqGYUxJtQEFRvq7yioPfhEQf+X2U2
	 +T4ejU8nloyc8Yf5rMmyMsKcMQ2IsFIdtV3vPmBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D30F80112;
	Thu, 24 Oct 2019 17:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD93AF8036B; Thu, 24 Oct 2019 17:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29076F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 17:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29076F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="PTqJzAC8"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db1c86c0004>; Thu, 24 Oct 2019 08:51:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 24 Oct 2019 08:51:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 24 Oct 2019 08:51:03 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:51:03 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 15:51:00 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-2-ben.dooks@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c02a1328-b5e9-d664-83e0-846c597c747e@nvidia.com>
Date: Thu, 24 Oct 2019 16:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-2-ben.dooks@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571932269; bh=/UMnG3zbDJ6aRhIhuPU8fUT/YKNZXu5bwGROSc+RF/M=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=PTqJzAC8ylpld4HbRa5hfXBrp24LwpA+VjHptHpsN1+gkgFDw/gcem+JUSiAhgEq6
 frflg3woY6g5MtQ4AfHjCdXDZQuSmskcZLce/Hiy37Cz82rYybKd7QPhNd4gtGkxUK
 Pmj8usx9DVkpTTnx8wzVzPI1rmYgd+QcpOnitRBLJzUIrlM76CihfAyY/bUpL03Xk8
 xM1+esr3ujauUxBE/SdKpg2wkgAJgls8TKCg1uIKt/p2oge5IpFTWkHrFP6lB64PvF
 oNSlzNfPsiY26o7Hdr36JKlFDkrDyaxGxqiNKIwQ+mye5bQgRral2mTOTd1Lv2pZzx
 cxhu9aF5yF8cQ==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 1/7] ASoC: tegra: add a TDM
	configuration callback
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
> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
> driver.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> [ben.dooks@codethink.co.uk: merge fix for power management]
> [ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index ac6983c6bd72..73f0dddeaef3 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -254,6 +254,34 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  	return 0;
>  }
>  
> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
> +			       unsigned int tx_mask, unsigned int rx_mask,
> +			       int slots, int slot_width)
> +{
> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask, val;
> +
> +	dev_dbg(dai->dev, "%s: txmask=0x%08x rxmask=0x%08x slots=%d width=%d\n",
> +		 __func__, tx_mask, rx_mask, slots, slot_width);
> +
> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
> +
> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
> +
> +	pm_runtime_get_sync(dai->dev);
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
> +	/* set the fsync width to minimum of 1 clock width */
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
> +			   TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK, 0x0);
> +	pm_runtime_put(dai->dev);
> +
> +	return 0;
> +}
> +
>  static int tegra30_i2s_probe(struct snd_soc_dai *dai)
>  {
>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> @@ -268,6 +296,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
>  	.set_fmt	= tegra30_i2s_set_fmt,
>  	.hw_params	= tegra30_i2s_hw_params,
>  	.trigger	= tegra30_i2s_trigger,
> +	.set_tdm_slot	= tegra30_i2s_set_tdm,
>  };
>  
>  static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {

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
