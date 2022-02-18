Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2A4BBF09
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 19:08:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FA617DD;
	Fri, 18 Feb 2022 19:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FA617DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645207737;
	bh=P61hqkigcCXUA+lnv8eaEqIDmAf64Sj27hqBQtZm8c0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9tXfEzQFaExXkoBX5k4xRsi6cPd8bO0DePmfzrJyNQV9DRkvaJBgoTuuddO3IX+/
	 Whj9UV9Hb1hcDEOxdxc7AoQtxW13youI0nM+iiwuFmR7Fhn/5PgW/9o/4nz4FiJlnE
	 jwg3GHIE+y7+gZJseJIstBunknMcM3WNok2O0tws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0177EF80154;
	Fri, 18 Feb 2022 19:07:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E8BF8013C; Fri, 18 Feb 2022 19:07:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D3DDF800CE;
 Fri, 18 Feb 2022 19:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D3DDF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RrGj0YQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645207662; x=1676743662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P61hqkigcCXUA+lnv8eaEqIDmAf64Sj27hqBQtZm8c0=;
 b=RrGj0YQdG24MWQvwxXaf0PTF1C7FiT0OK7UoQ3Ur0bjVHvzxq2BgB+Zm
 l7LfdhfdnK0yoyxP6+gV5scmNUnXrvfPE5sKcGggIGbIFSIb0h+aGR9yV
 vgQaUL8eeBDZi6DyVGwYN5DKmLRHhcnoOGSKS85JJIdD6EnzMpkfc3eLz
 Q/kOcfvSi1ILvKq+fsVDXr+rxZvkxkBVHKkxBLQL4+4GbWWSlg10XvKU2
 l/hDR6e1PmJSRpo5dmHk4JGMRj1P7kPVKUdQaVSAMyPdovNOm2c0Rn/Ri
 fjoSSuie0/WYJF/3RXWJxUFoYanYlzRqTquskHBwLMZ5PvlOjRQkob89Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="231164241"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="231164241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:07:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="504079848"
Received: from ryanflyn-mobl.amr.corp.intel.com (HELO [10.212.54.106])
 ([10.212.54.106])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:07:32 -0800
Message-ID: <2267504d-37cc-9a6e-5c4a-6051df95773c@linux.intel.com>
Date: Fri, 18 Feb 2022 12:07:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Add topology overwrite for Felwinter
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220218082741.1707209-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220218082741.1707209-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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



On 2/18/22 02:27, Brent Lu wrote:
> From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> 
> The Felwinter uses four max98360a amplifiers on corresponding CH0~CH3.
> There are four amps on the board connecting to headphone to SSP0 port,
> amp to SSP1,and the DAI format would be DSP_A,8-slots, 32 bit slot-width.
> 
> CH0: L(Woofer), CH1:R(Woofer), CH2:L(Tweeter), CH3:R(Tweeter)
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

This patch is already in the SOF tree and for some reason I didn't send
it, sorry about the delay.

Here are the tags we collected during the reviews.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/sof-pci-dev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 20c6ca37dbc4..61f2afd54c3e 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -67,6 +67,14 @@ static const struct dmi_system_id sof_tplg_table[] = {
>  		},
>  		.driver_data = "sof-adl-max98390-ssp2-rt5682-ssp0.tplg",
>  	},
> +	{
> +		.callback = sof_tplg_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO_AMP-MAX98360_ALC5682VS_I2S_2WAY"),
> +		},
> +		.driver_data = "sof-adl-max98360a-rt5682-2way.tplg",
> +	},
>  
>  	{}
>  };
