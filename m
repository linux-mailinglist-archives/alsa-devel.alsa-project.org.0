Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B00795393BE
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0590C205C;
	Tue, 31 May 2022 17:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0590C205C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010201;
	bh=KzVObEc7Veab/GZreg6FyOROGy7YjFcSKS2Z9DBNJis=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OjkxqHECrTZLpbcCAm1/FzgxRVVxnFFLnCE+y/u2GxbuZEDSxhA17uy4Gw3mMuVTa
	 eBTnRE0Z0t4TXwxhiqPuZ8pgJDjCZ46OwiM4R9A2dZcjpOeNH/wN5knvngqDKM2nra
	 MNoMBH4ypMpB9KF0zyto/HhMVtfwk/pUBYz/5SAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AECCEF80524;
	Tue, 31 May 2022 17:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24C17F8019B; Tue, 31 May 2022 17:15:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F9FF8019B
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F9FF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HB0No7rI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654010099; x=1685546099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KzVObEc7Veab/GZreg6FyOROGy7YjFcSKS2Z9DBNJis=;
 b=HB0No7rIHULS+0bi4CSBwE5nzo+CIv1isgjNfy/FiSNjRdS/9i896wZQ
 sY2tuvNknLym7xy4AQ1szZWisbUg0Jx/bU9GNJ2L4lZPXaMS9a8bfbsu1
 pkcoDRGYhwOPp/nUWoJrElPqAmanZWKOV8WdN4WkKUxhVgAs82EESvu7j
 s42x+K7EsbJ8DV9j5pkrR1zXrmbfTOmlRnEk2roL+3u//TGG757QJIlIn
 PBFqWSVXYfQkmIcV2PQ6W+COma4/nlqBWcarfTv6qwiyg9zrsC9r9aq+F
 o5gW8E1yrfl8SeMTnfwKOdM8dRxq+u1vrTG7avePHyG8re++dpb+PM5sD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275369519"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="275369519"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="720349516"
Received: from kmoorti-mobl.amr.corp.intel.com (HELO [10.212.153.18])
 ([10.212.153.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:12 -0700
Message-ID: <8a8a6bd9-aabf-6f27-0422-a47b01556276@linux.intel.com>
Date: Tue, 31 May 2022 09:51:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: cirrus-common: fix incorrect channel mapping
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220530125421.885236-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220530125421.885236-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, xliu <xiang.liu@cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 5/30/22 07:54, Brent Lu wrote:
> From: xliu <xiang.liu@cirrus.com>
> 
> The default mapping of ASPRX1 Slot is left channel. Map the slots of
> right amplifiers (WR and TR) to right channel.
> 
> Signed-off-by: xliu <xiang.liu@cirrus.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_cirrus_common.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
> index e71d74ec1b0b..64ca0e3991dc 100644
> --- a/sound/soc/intel/boards/sof_cirrus_common.c
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -107,6 +107,7 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>  	struct snd_soc_dai *codec_dai;
>  	int clk_freq, i, ret;
> +	int rx_ch[2] = {1, 0};

Should this be 'const'?

I am also not clear on the mapping, how does this select the right
channel? This selects slot0 and the left channel, what am I missing?


>  
>  	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
>  
> @@ -134,6 +135,17 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
>  				ret);
>  			return ret;
>  		}
> +
> +		/* Setup for R channel Slot: WR and TR */
> +		if (i % 2) {
> +			ret = snd_soc_dai_set_channel_map(codec_dai, 0, NULL,
> +							  ARRAY_SIZE(rx_ch), rx_ch);
> +			if (ret < 0) {
> +				dev_err(codec_dai->dev, "fail to set channel map, ret %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}

Should we do this loop for the left channels as well to have an explicit
setting?

>  	}
>  
>  	return 0;
