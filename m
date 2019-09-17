Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E121B5564
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 20:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2EC1669;
	Tue, 17 Sep 2019 20:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2EC1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568745253;
	bh=PBIIhDRAdYa5QnjHy2o9sLGYYul/64bIboXAm6lJLgU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rju9ABs5o8MoNsHSXSM6f8NPekl6RoQrmXOVKQUW04XrdwGHuRV2DbPFDUo3RZEXv
	 mEb6tvrm18gH6TmQx7M0QmPdJBADv12QOHno+CRKf3XhLizhuAAFbquoT/bASSysOQ
	 WL7SuTMO85iHQBbeHBmURyin4Dv5oYDWw+kVwS/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1600F80307;
	Tue, 17 Sep 2019 20:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E77E1F803D6; Tue, 17 Sep 2019 20:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB55F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 20:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB55F80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 11:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; d="scan'208";a="201884173"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2019 11:32:19 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id DAC2A580834;
 Tue, 17 Sep 2019 11:32:18 -0700 (PDT)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27b52556-b0d9-4b5e-11c6-339254661b5d@linux.intel.com>
Date: Tue, 17 Sep 2019 13:22:44 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-2-ben.dooks@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
 callback
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

On 9/17/19 1:12 PM, Ben Dooks wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> Add a callback to configure TDM settings for the Tegra30 I2S ASoC 'platform'
> driver.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> ---
>   sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index ac6983c6bd72..d36b4662b420 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>   	return 0;
>   }
>   
> +/*
> + * Set up TDM
> + */
> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
> +			       unsigned int tx_mask, unsigned int rx_mask,
> +			       int slots, int slot_width)
> +{
> +	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask = 0, val = 0;

initialization is not needed.

> +
> +	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x "
> +		 "slots: 0x%08x " "width: %d\n",
> +		 __func__, tx_mask, rx_mask, slots, slot_width);
> +
> +	/* Set up slots and tx/rx masks */
> +	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
> +	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
> +
> +	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
> +	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
> +	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
> +
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
> +
> +	/* Set FSYNC width */
> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL,
> +		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
> +		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
> +
> +	return 0;
> +}
> +
>   static int tegra30_i2s_probe(struct snd_soc_dai *dai)
>   {
>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> @@ -268,6 +301,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
>   	.set_fmt	= tegra30_i2s_set_fmt,
>   	.hw_params	= tegra30_i2s_hw_params,
>   	.trigger	= tegra30_i2s_trigger,
> +	.set_tdm_slot	= tegra30_i2s_set_tdm,
>   };
>   
>   static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
