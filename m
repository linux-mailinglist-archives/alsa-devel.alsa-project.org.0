Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4786534A9
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 18:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DCA16A4;
	Wed, 21 Dec 2022 18:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DCA16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671642700;
	bh=qLAXeL3HhqFbAsfoXNwMUX1DkaYJt2fY2Wes9uDuZW4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rEaXIJa7tLn0PAuS2lIKl8JqWc3vCAnqSL7i/IblNAanZoQ7VRO+aAseGJLx8voST
	 7sGxabgSE8znTS4PwrMJuITqZ49kFfHYxMXj3dKi7TfnXFbcZRVnO+Sqf8n/0vYO2U
	 U85KABY9HSZyR5pWruMTAgcCMXlKT4+Enyk0swAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6380F8024D;
	Wed, 21 Dec 2022 18:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C02FF8047B; Wed, 21 Dec 2022 18:10:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74DCBF8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 18:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74DCBF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X5DrdHRX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671642641; x=1703178641;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qLAXeL3HhqFbAsfoXNwMUX1DkaYJt2fY2Wes9uDuZW4=;
 b=X5DrdHRXry3gXkWvXTeebMI9kG/yUA1eH1H6LM4935VWfXnJ6FyHvAEc
 fRtLgkEnLIrZWQnChbVqkRiH4NRE2jicQtUiswZIN4iORYi719oWlnqZv
 EQXfQUtoEejG0JUJkudw/0FFVPsp9RGrrreSfmTKDaOa0ujqC1EJv2M5a
 eOTBLPH0a6koLVeXEHrZk+a4evLpV3cSPYD8n5+s2ShrsLPv89EiooT0W
 zxK3Mv2IyKMYoHRVylIj1OitxMWRlFTF0iB3pspntrdmAgHMiBAIklZfk
 rryhpRG0d2jgO0pX01KV9iUQutKuMK8p95pYlsP9X62eK86UmTCBiymid w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="317562101"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="317562101"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:08:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="720009111"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="720009111"
Received: from sgeiser-mobl.amr.corp.intel.com (HELO [10.212.42.29])
 ([10.212.42.29])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:08:37 -0800
Message-ID: <9c9c5739-ee6b-a66e-481b-9032d4a52568@linux.intel.com>
Date: Wed, 21 Dec 2022 09:41:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: sof-nau8825: fix module alias overflow
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20221221132515.2363276-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221221132515.2363276-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, ye xingchen <ye.xingchen@zte.com.cn>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/21/22 07:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The maximum name length for a platform_device_id entry is 20 characters
> including the trailing NUL byte. The sof_nau8825.c file exceeds that,
> which causes an obscure error message:
> 
> sound/soc/intel/boards/snd-soc-sof_nau8825.mod.c:35:45: error: illegal character encoding in string literal [-Werror,-Winvalid-source-encoding]
> MODULE_ALIAS("platform:adl_max98373_nau8825<U+0018><AA>");
>                                                    ^~~~
> include/linux/module.h:168:49: note: expanded from macro 'MODULE_ALIAS'
>                                                 ^~~~~~
> include/linux/module.h:165:56: note: expanded from macro 'MODULE_INFO'
>                                                        ^~~~
> include/linux/moduleparam.h:26:47: note: expanded from macro '__MODULE_INFO'
>                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
> 
> I could not figure out how to make the module handling robust enough
> to handle this better, but as a quick fix, using slightly shorter
> names that are still unique avoids the build issue.
> 
> Fixes: 8d0872f6239f ("ASoC: Intel: add sof-nau8825 machine driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, yes unfortunately that keeps on happening. We cleaned-up a
bunch of Chromebook platforms but newer ones have the same long name
issue obviously.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_nau8825.c              | 8 ++++----
>  sound/soc/intel/common/soc-acpi-intel-adl-match.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
> index 27880224359d..009a41fbefa1 100644
> --- a/sound/soc/intel/boards/sof_nau8825.c
> +++ b/sound/soc/intel/boards/sof_nau8825.c
> @@ -618,7 +618,7 @@ static const struct platform_device_id board_ids[] = {
>  
>  	},
>  	{
> -		.name = "adl_rt1019p_nau8825",
> +		.name = "adl_rt1019p_8825",
>  		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
>  					SOF_SPEAKER_AMP_PRESENT |
>  					SOF_RT1019P_SPEAKER_AMP_PRESENT |
> @@ -626,7 +626,7 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_NAU8825_NUM_HDMIDEV(4)),
>  	},
>  	{
> -		.name = "adl_max98373_nau8825",
> +		.name = "adl_max98373_8825",
>  		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
>  					SOF_SPEAKER_AMP_PRESENT |
>  					SOF_MAX98373_SPEAKER_AMP_PRESENT |
> @@ -637,7 +637,7 @@ static const struct platform_device_id board_ids[] = {
>  	},
>  	{
>  		/* The limitation of length of char array, shorten the name */
> -		.name = "adl_mx98360a_nau8825",
> +		.name = "adl_mx98360a_8825",
>  		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
>  					SOF_SPEAKER_AMP_PRESENT |
>  					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> @@ -648,7 +648,7 @@ static const struct platform_device_id board_ids[] = {
>  
>  	},
>  	{
> -		.name = "adl_rt1015p_nau8825",
> +		.name = "adl_rt1015p_8825",
>  		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
>  					SOF_SPEAKER_AMP_PRESENT |
>  					SOF_RT1015P_SPEAKER_AMP_PRESENT |
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index 60aee56f94bd..1f79fef600ac 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -474,21 +474,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	},
>  	{
>  		.id = "10508825",
> -		.drv_name = "adl_rt1019p_nau8825",
> +		.drv_name = "adl_rt1019p_8825",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_rt1019p_amp,
>  		.sof_tplg_filename = "sof-adl-rt1019-nau8825.tplg",
>  	},
>  	{
>  		.id = "10508825",
> -		.drv_name = "adl_max98373_nau8825",
> +		.drv_name = "adl_max98373_8825",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98373_amp,
>  		.sof_tplg_filename = "sof-adl-max98373-nau8825.tplg",
>  	},
>  	{
>  		.id = "10508825",
> -		.drv_name = "adl_mx98360a_nau8825",
> +		.drv_name = "adl_mx98360a_8825",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98360a_amp,
>  		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
> @@ -502,7 +502,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	},
>  	{
>  		.id = "10508825",
> -		.drv_name = "adl_rt1015p_nau8825",
> +		.drv_name = "adl_rt1015p_8825",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_rt1015p_amp,
>  		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
