Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156F1027F2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 16:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D370B1693;
	Tue, 19 Nov 2019 16:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D370B1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574176805;
	bh=tw3LispxNb7vZfJd/NjLuaUcL1BnYO20og/Nb1oTJWA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dI8rP54RRzYl2YaYf2+9HAD9CPMtzvc035kOckVpECoh6en3o5/w452v0K+q8iFcD
	 kY6qOiPPKO5uehOxwj3WbWBQQASBm7+WGar5mXZEvNxP1QTWadRZrf9veIRzX7R7sv
	 8NeXSGDlgcbsUF+KCcP3xpGVxy2HDb2hS+cWrokU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033E8F80138;
	Tue, 19 Nov 2019 16:18:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A41F9F80138; Tue, 19 Nov 2019 16:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A19EF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 16:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A19EF800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 07:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="215558399"
Received: from trgallx-mobl.amr.corp.intel.com (HELO [10.251.154.79])
 ([10.251.154.79])
 by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2019 07:18:11 -0800
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20191119145138.59162-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5bc9c467-8c3b-da01-d48e-eac63f7e3b0e@linux.intel.com>
Date: Tue, 19 Nov 2019 09:18:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191119145138.59162-1-hdegoede@redhat.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5640: Update quirk
 for Acer Switch 10 SW5-012 2-in-1
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



On 11/19/19 8:51 AM, Hans de Goede wrote:
> When the Acer Switch 10 SW5-012 quirk was added we did not have
> jack-detection support yet; and the builtin microphone selection of
> the original quirk is wrong too.
> 
> Fix the microphone-input quirk and add jack-detection info so that the
> internal-microphone and headphone/set jack on the Switch 10 work properly.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks Hans,

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 9c1aa4ec9cba..dd2b5ad08659 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -405,10 +405,12 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire SW5-012"),
>   		},
> -		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
> -						 BYT_RT5640_MCLK_EN |
> -						 BYT_RT5640_SSP0_AIF1),
> -
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD2_IN4N |
> +					BYT_RT5640_OVCD_TH_2000UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
>   	},
>   	{
>   		.matches = {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
