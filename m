Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F193242F2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 18:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3189C167A;
	Wed, 24 Feb 2021 18:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3189C167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614186740;
	bh=lVfMh/INjor1GQAJsE8+FmHyK7xwYC5OAGFUKoI83YA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWbYa+s6+ssq5jawrmYt4adRFi3VSmJ7ecKGj8ekVvFvRRNVnIK65Y+6b4yt91oHv
	 JGYl77xuSJGa+NqFGTFWX38gyMUrHnroiUvDzGj8hwTUQVe/NrRdBSfzkQG+RUwQYu
	 Uljm620bjOaYc33Ld1gVdzQsnOzUAIbDp9aRNACo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D8DF8016C;
	Wed, 24 Feb 2021 18:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00AD9F80161; Wed, 24 Feb 2021 18:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 298C4F800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 18:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 298C4F800F2
IronPort-SDR: yMRfwFgrpSTDxhw6eqA9CrFYA0sH9w1LAgNgA/axdjjIWB1OsSmj/9/UtJXNeS/zezJK2ZHD8q
 zgrtrLWxKE8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="270204876"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="270204876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 09:10:33 -0800
IronPort-SDR: J/or1WpcgFaM6aLvFWr+efQg706VREtO8d3d71rtm4wQpmYCgieNvouIPY8gstL1ODhoy8H9QR
 fTEA0D5z1ZLw==
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="431749325"
Received: from kariher1-mobl.amr.corp.intel.com (HELO [10.212.84.196])
 ([10.212.84.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 09:10:32 -0800
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX
 OVCD current threshold
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210224105052.42116-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <11e374a6-6de4-a989-a330-6173668af0b3@linux.intel.com>
Date: Wed, 24 Feb 2021 08:50:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224105052.42116-1-hdegoede@redhat.com>
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



On 2/24/21 4:50 AM, Hans de Goede wrote:
> When I added the quirk for the "HP Pavilion x2 10-p0XX" I copied the
> byt_rt5640_quirk_table[] entry for the HP Pavilion x2 10-k0XX / 10-n0XX
> models since these use almost the same settings.
> 
> While doing this I accidentally also copied and kept the non-standard
> OVCD_TH_1500UA setting used on those models. This too low threshold is
> causing headsets to often be seen as headphones (without a headset-mic)
> and when correctly identified it is causing ghost play/pause
> button-presses to get detected.
> 
> Correct the HP Pavilion x2 10-p0XX quirk to use the default OVCD_TH_2000UA
> setting, fixing these problems.
> 
> Fixes: fbdae7d6d04d ("ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 Detachable quirks")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 24ced8e4a574..1f6a636571c2 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -581,7 +581,7 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   		},
>   		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
>   					BYT_RT5640_JD_SRC_JD1_IN4P |
> -					BYT_RT5640_OVCD_TH_1500UA |
> +					BYT_RT5640_OVCD_TH_2000UA |
>   					BYT_RT5640_OVCD_SF_0P75 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> 
