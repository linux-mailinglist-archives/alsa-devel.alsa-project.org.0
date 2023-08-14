Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F4A77BB00
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5521F1;
	Mon, 14 Aug 2023 16:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5521F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692022109;
	bh=T6NLn5YIRVWjwgZevUuqpYxYLKGf+XO+f3CSLZhvDPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uSBEd32k+BaWmBgkFZrkybOgAw/nBaT92TYJK2W5oabIFCnlSgEtZxzz4K9yymesj
	 xavSQ5AkEsSYzva5zzpj4YheEprNnubY39uHKI0tR5hFgOWddwRk4OqddxPNgTWAKf
	 NnfptGXCWmpUoh0iSi3Ivd4oRNV91NLRqyCFl0Hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB152F80290; Mon, 14 Aug 2023 16:07:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A71F8025F;
	Mon, 14 Aug 2023 16:07:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 310EFF80510; Mon, 14 Aug 2023 16:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20EA1F801EB
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20EA1F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c88CGZRI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022047; x=1723558047;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T6NLn5YIRVWjwgZevUuqpYxYLKGf+XO+f3CSLZhvDPE=;
  b=c88CGZRI8+Zi9JxFKonJbBPQuYws2cNsfdmjzogKUz0eravk1c+Uw6is
   tgnlo0hz9QVtRQQ5n7rfi5zrRqETHbGZEuhP4Wq/8kgwG/KcXwWB6WThm
   fjbgsvy+anqAZ5KxsjWWPX+LyNafjHvFVtn6O7NVexPLR94b1bbjkhXii
   LyoonjoVJUsqy/+10bU5NdAbJXH2prvG9VMIdjKbkTiKnne3twKDiDgPb
   tIckSvDZX4XmlYwIHo5ue05sdnmEz+YYUYfqqOJueywdme16i94/mWjE+
   exBHsLJaDK4hVSXFz2SmYQ36DXLrw5H6o4AyeafBQDuLq41gDLXsmxdDJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370943660"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="370943660"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798825217"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="798825217"
Received: from ryana2x-mobl.amr.corp.intel.com (HELO [10.212.126.76])
 ([10.212.126.76])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:07:22 -0700
Message-ID: <6c05170c-046f-84af-bed1-7c11801b938a@linux.intel.com>
Date: Mon, 14 Aug 2023 08:48:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v1] ASoC: Intel: Add rpl_nau8318_8825 driver
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Yong Zhi <yong.zhi@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Libin Yang <libin.yang@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, David Lin <CTLIN0@nuvoton.com>,
 Brent Lu <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Terry Cheong <htcheong@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Gongjun Song <gongjun.song@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 apoorv <apoorv@intel.com>, alsa-devel@alsa-project.org
References: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FGQWX5QAMK5LDUZGPVUTUYQNZBAMFTQ6
X-Message-ID-Hash: FGQWX5QAMK5LDUZGPVUTUYQNZBAMFTQ6
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGQWX5QAMK5LDUZGPVUTUYQNZBAMFTQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/4/23 03:56, Ajye Huang wrote:
> Boards were using this in older kernels before adl and rpl ids were
> split. Add this back to maintain support.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Sorry, missed this.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  sound/soc/intel/boards/sof_nau8825.c              | 10 ++++++++++
>  sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
> index 4fc6e1c6aef3..46b7ecf6f9f1 100644
> --- a/sound/soc/intel/boards/sof_nau8825.c
> +++ b/sound/soc/intel/boards/sof_nau8825.c
> @@ -684,6 +684,16 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_BT_OFFLOAD_SSP(2) |
>  					SOF_SSP_BT_OFFLOAD_PRESENT),
>  	},
> +	{
> +		.name = "rpl_nau8318_8825",
> +		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_NAU8318_SPEAKER_AMP_PRESENT |
> +					SOF_NAU8825_SSP_AMP(1) |
> +					SOF_NAU8825_NUM_HDMIDEV(4) |
> +					SOF_BT_OFFLOAD_SSP(2) |
> +					SOF_SSP_BT_OFFLOAD_PRESENT),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
> index 4eefdb2dd45c..1dd699181765 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
> @@ -351,6 +351,11 @@ static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
>  	.codecs = {"RTL1019"}
>  };
>  
> +static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"NVTN2012"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
>  	{
>  		.comp_ids = &rpl_rt5682_hp,
> @@ -373,6 +378,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
>  		.quirk_data = &rpl_max98373_amp,
>  		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
>  	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "rpl_nau8318_8825",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &rpl_nau8318_amp,
> +		.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
> +	},
>  	{
>  		.comp_ids = &rpl_rt5682_hp,
>  		.drv_name = "rpl_rt1019_rt5682",
