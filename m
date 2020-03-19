Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC618C2E1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 23:16:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307D017C1;
	Thu, 19 Mar 2020 23:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307D017C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584656213;
	bh=5EbMIh3HMJ2LkkLSER90/nlQqsHsgDQLM7WLpueZ04g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzzoLV596lCvwmez5D1KcxsDqMawUroJk3bWcMTsScVSGPuRdm/ASb05+oAcSa0fg
	 uWpeqhpMvyaMGzruKuIMXKSoC9JofQ3nbCglkXG+zbtcbRmyyFUh6c6gMREkRNVk3H
	 mAYaRcV1+T1y5FvkWOlYbkTNhkxs+d94XJxWQboo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA3EF80232;
	Thu, 19 Mar 2020 23:15:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8D0FF8022B; Thu, 19 Mar 2020 23:15:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C98F8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 23:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C98F8012F
IronPort-SDR: OehT5WA6ku+nW79d3IcwZ7jK9nie4az2EfUaqokWWGgTgdLB6blBb5t1lpikhghNg0M6uQVk9z
 4Gqz4hTide7w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 15:14:57 -0700
IronPort-SDR: SRdwGa9UsFtD7gNi+Cn3EgwiJZCF5dH845IhdG+wXOEO3XV5wxPpbwuo4AFnqNFII2wBs0nsNZ
 MCPcmc8T7rWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="391952068"
Received: from skesavan-mobl1.amr.corp.intel.com (HELO [10.255.32.52])
 ([10.255.32.52])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2020 15:14:56 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
Date: Thu, 19 Mar 2020 17:14:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319204947.18963-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org, broonie@kernel.org,
 Ben Zhang <benzh@google.com>
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



On 3/19/20 3:49 PM, Cezary Rojewski wrote:
> As of commit:
> ASoC: soc-core: care .ignore_suspend for Component suspend
> 
> function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
> flag for dai links. While BE dai link for System Pin is
> supposed to follow standard suspend-resume flow, appended
> 'ignore_suspend' flag disturbs that flow and causes audio to break
> right after resume. Remove the flag to address this.
> 
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

we should ask Ben and Curtis @ Google if the changes related to suspend 
interfere with the wake-on-voice support?

Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so 
wondering if additional devices are broken, or if there's something off 
about Broadwell in general. Hans, have you heard of any regressions on 
Baytrail devices?

> ---
>   sound/soc/intel/boards/bdw-rt5677.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index a94f498388e1..713ef48b36a8 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -343,7 +343,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   		.no_pcm = 1,
>   		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>   			SND_SOC_DAIFMT_CBS_CFS,
> -		.ignore_suspend = 1,
>   		.ignore_pmdown_time = 1,
>   		.be_hw_params_fixup = broadwell_ssp0_fixup,
>   		.ops = &bdw_rt5677_ops,
> 
