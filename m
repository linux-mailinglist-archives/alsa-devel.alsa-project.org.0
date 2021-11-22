Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6998459387
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 17:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F151614;
	Mon, 22 Nov 2021 17:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F151614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637600316;
	bh=vWtBkjfjkcOqXswc6taScMYSzTGvzNBkku78Kp0NneM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLF4hqUnGz9HZ7WWOu1YUVlbALgsugJ63lkPo10xKwpT+V8go2ng0hKtPNX/chxg7
	 yTTNMUf9gB6hhh4G2i/Iq8DTYvdJn6gg02nxsyWAiy6bymD6li9s0p6qtYpmlJ96iC
	 +jmCocNEKnQbtg9yYo3xsTrVV4ii/9pp+OPDVndg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E175DF80245;
	Mon, 22 Nov 2021 17:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B95F80212; Mon, 22 Nov 2021 17:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 325A3F80141
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 17:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 325A3F80141
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222046999"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="222046999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:57:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="474411705"
Received: from gavasque-mobl.amr.corp.intel.com (HELO [10.212.2.29])
 ([10.212.2.29])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:57:08 -0800
Subject: Re: [RESEND,v3] ASoC: Intel: boards: add max98390 2/4 speakers support
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20211122125002.3206-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <18529913-3d3f-9dfd-7f27-5672e2300c45@linux.intel.com>
Date: Mon, 22 Nov 2021 10:57:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122125002.3206-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 yang.jie@linux.intel.com, bard.liao@intel.com, kai.vehmanen@linux.intel.com
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

This is technically not a 'RESEND, v3' since it's different from v3.
Please don't do this.

> ---
> changes in resend v3:
>   - use .comp_ids to scan acpi support ALC5682I-VD or ALC5682I-VS

and this indeed shows you modified the code...


> +static const struct snd_soc_acpi_codecs adl_max98390_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"MX98390"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	{
>  		.comp_ids = &adl_rt5682_rt5682s_hp,
> @@ -434,6 +439,22 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.sof_fw_filename = "sof-adl.ri",
>  		.sof_tplg_filename = "sof-adl-nau8825.tplg",
>  	},
> +	{
> +		.comp_ids = &adl_rt5682_rt5682s_hp,
> +		.drv_name = "adl_max98390_rt5682",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98390_amp,
> +		.sof_fw_filename = "sof-adl.ri",
> +		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
> +	},
> +	{
> +		.comp_ids = &adl_rt5682_rt5682s_hp,
> +		.drv_name = "adl_mx98390_rt5682s",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98390_amp,
> +		.sof_fw_filename = "sof-adl.ri",
> +		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
> +	},

I don't follow the last two entries.. They use

the same 'comp_ids':

static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
	.num_codecs = 2,
	.codecs = {"10EC5682", "RTL5682"},
};

the same machine quirk:
snd_soc_acpi_codec_list,

the same quirk_data:
&adl_max98390_amp,

but a different driver.
.drv_name = "adl_max98390_rt5682",
.drv_name = "adl_mx98390_rt5682s",

it looks like the second entry will never be selected.

Can you please explain how this works if it's intentional or
double-check if this is correct. I think it's a copy-paste from the case
where the amplifier is different, but here only the headset codec is
different.

