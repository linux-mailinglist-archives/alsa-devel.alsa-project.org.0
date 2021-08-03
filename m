Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8D3DEF4B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 15:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7361C17CD;
	Tue,  3 Aug 2021 15:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7361C17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627998584;
	bh=wclyE3s2r4OT9RrapYBbSbi2P8jgDGf7tAn1UvSNhj0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p731qL4vQMPKzIb5Hg/BYSe/xECV8ppDfOdj58zp05FvU66rKQiPODvPEuMUjuiPE
	 QaL/bd6GPwKlToBjYSVe21fq4IezjTTX6YE/ZRArg7naqWdHjkSQKioSsQNYL6T7yf
	 G+dlV1MGSnEMI6GN3QFxz/nScdIfvv/WRQmMYw3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD4FF80095;
	Tue,  3 Aug 2021 15:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57AFDF802E8; Tue,  3 Aug 2021 15:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0574CF80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 15:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0574CF80082
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="277453576"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="277453576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:47:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="521256824"
Received: from vmustya-mobl1.amr.corp.intel.com (HELO [10.213.171.71])
 ([10.213.171.71])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:47:58 -0700
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp
To: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210803083035.342889-1-malik_hsu@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a81fab45-689a-63b9-efbd-143d925b6658@linux.intel.com>
Date: Tue, 3 Aug 2021 08:43:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803083035.342889-1-malik_hsu@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@linux.intel.com, yang.jie@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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



On 8/3/21 3:30 AM, Malik_Hsu wrote:

missing commit message?

> Signed-off-by: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
>  sound/soc/intel/common/soc-acpi-intel-adl-match.c | 13 +++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 39217223d50c..8d727dd37f12 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -1043,6 +1043,15 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.name = "adl_max98360a_rt5682",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(2) |
> +					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_NUM_HDMIDEV(4)),

Can you clarify why BT offload is missing?

if it's supported in hardware, it doesn't hurt to add a capability in
the machine driver, you can always disable it in the topology file.

> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index a0f6a69c7038..6855c9e65236 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
>  	.codecs = {"MX98357A"}
>  };
>  
> +static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"MX98360A"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	{
>  		.id = "10EC5682",
> @@ -297,6 +302,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.sof_fw_filename = "sof-adl.ri",
>  		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
>  	},
> +	{
> +		.id = "10EC5682",
> +		.drv_name = "adl_max98360a_rt5682",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98360a_amp,
> +		.sof_fw_filename = "sof-adl.ri",
> +		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
> 
