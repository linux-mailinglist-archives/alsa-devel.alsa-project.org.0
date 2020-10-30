Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662572A0AFE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 17:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D32165E;
	Fri, 30 Oct 2020 17:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D32165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604074840;
	bh=QUKUogSFsvj7/EX9tM6wKOY2MhgYF+Vqg/7uNskpi9s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNmge20RkQQ4MkpstjyRhSvSsVJwHef/bl4KWPaMBoouWbwbDgpBcwfM/hYKCUB1v
	 CVIGhhSkWWCs1aCZxgzEjzaKLPHOBJWUAAsDAXxr1WlOK67M9WQEF3rXt3pZYSrJZP
	 unW6V//qyqwu5GoWE7e4RDbN8DoFDSpqQF61/rDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66901F800FF;
	Fri, 30 Oct 2020 17:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F2ABF80212; Fri, 30 Oct 2020 17:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C87A2F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 17:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C87A2F800FF
IronPort-SDR: 9XO0zGkPZVZUegfJINQVvc/Zd2E9t/MJXNUFNOaUnh33qIQkPrCy+N4NQAzJRg9k+YK9p+CJaR
 abQKJ5ZgbhvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="148485507"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="148485507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 09:18:55 -0700
IronPort-SDR: 4V+oBVfVfMxQcsh23dOEWukp6Eehl2L0agOFjNOCS8wxqVHaAjV6Rr+CStfFRW0L1/wYRGKgIQ
 l4l0BWoQD5SQ==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="469569446"
Received: from rdchavez-mobl2.amr.corp.intel.com (HELO [10.212.91.180])
 ([10.212.91.180])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 09:18:54 -0700
Subject: Re: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20201030063654.25877-1-brent.lu@intel.com>
 <20201030063654.25877-3-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c83b3f20-2afd-12da-c349-31f35f8f6aa5@linux.intel.com>
Date: Fri, 30 Oct 2020 10:32:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030063654.25877-3-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 10/30/20 1:36 AM, Brent Lu wrote:
> This DMI product family string of this board is "Google_Hatch" so the
> DMI quirk will take place. However, this board is using rt1015 speaker
> amp instead of max98357a specified in the quirk. Therefore, we need an
> new DMI quirk for this board.

Do you actually need a DMI quirk for this platform?

the .driver_data below uses the exact same settings as what you would 
use with the generic solution based on ACPI IDs, see below.

Wondering if patch1 would be enough?

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/sof_rt5682.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 7701957e0eb7..dfcdf6d4b6c8 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -100,6 +100,20 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
>   					SOF_RT5682_MCLK_24MHZ |
>   					SOF_RT5682_SSP_CODEC(1)),
>   	},
> +	{
> +		.callback = sof_rt5682_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dooly"),
> +		},
> +		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_MCLK_24MHZ |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_RT1015_SPEAKER_AMP_PRESENT |
> +					SOF_RT1015_SPEAKER_AMP_100FS |
> +					SOF_RT5682_SSP_AMP(1)),
> +	},

is this really needed? it's the same as the .driver_data below:

@@ -875,6 +901,16 @@ static const struct platform_device_id board_ids[] = {
  					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
  					SOF_RT5682_SSP_AMP(1)),
  	},
+	{
+		.name = "cml_rt1015_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_100FS |
+					SOF_RT5682_SSP_AMP(1)),
+	},


