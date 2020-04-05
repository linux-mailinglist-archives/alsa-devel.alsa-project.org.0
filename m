Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9119EEB3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 01:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E11D1683;
	Mon,  6 Apr 2020 01:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E11D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586130811;
	bh=mbaiy0lsMEpKpeCN6k3U9qxGEEwiPT9uEYlhmJvLMF0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BD1x1+deLdfkU8DTrBv8RTOi8tY0aRi+PaUmrHrU8tZC1F4jUj5bY9irtSuoE4TkS
	 KwPMWI/5aVeu64CD0oLBopNWRnpU+ww9b7aUho66FSBvmmyh1V8HQZAN48u5N39KeY
	 puahBy3aMmF3N6LQicd/Mm3wUKuQPhv2FcGBd9q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2A6F80229;
	Mon,  6 Apr 2020 01:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA49F80213; Mon,  6 Apr 2020 01:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D2E9F800E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 01:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D2E9F800E4
IronPort-SDR: JQ3LmOQ8akR+isOQzFTOQ70iWk7uhdbsGlVMHifUjDxND5nDiVXGjW7EenT0j2pFr4cF6a4dEl
 hmUbi0sHxC7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 16:50:51 -0700
IronPort-SDR: XKreq45w3WuCrO4UPWxmUy7CINTEiNdVtEx+N/XqKdo+6FzU7N+IoQD00z+uWDFvpVvGok6Rtx
 3wZQB2GVlCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; d="scan'208";a="253949526"
Received: from tecook-mobl1.amr.corp.intel.com (HELO [10.212.185.245])
 ([10.212.185.245])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2020 16:50:50 -0700
Subject: Re: [PATCH v3] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN
 MPWIN895CL tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com, Oder Chiou <oder_chiou@realtek.com>
References: <20200405133726.24154-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0b7cfac8-857c-c4c1-0f79-7ce6522e073e@linux.intel.com>
Date: Sun, 5 Apr 2020 17:55:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200405133726.24154-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 4/5/20 8:37 AM, Hans de Goede wrote:
> The MPMAN MPWIN895CL tablet almost fully works with out default settings.
> The only problem is that it has only 1 speaker so any sounds only playing
> on the right channel get lost.
> 
> Add a quirk for this model using the default settings + MONO_SPEAKER.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 6bd9ae813be2..d14d5f7db168 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -591,6 +591,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_SSP0_AIF1 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{
> +		/* MPMAN MPWIN895CL */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MPMAN"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MPWIN8900CL"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_MONO_SPEAKER |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{	/* MSI S100 tablet */
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> 
