Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DA3E4F01
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 00:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73C315E2;
	Tue, 10 Aug 2021 00:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73C315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628547135;
	bh=XbSRdFt0Eeb4/p68xDKBu+aui1H2reWABOW7o8aox0M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqkg+2/t+sajFs7KLWXHscQOpcsHRWA+gLJzimY8xr0HCDK5EBjavMcLeWzsBCaz8
	 GRmFi+PTuqKx+xD5Ohnd7D7l4QF9SZRcBiULnMuiM4/tnBs/DAjPjj4734MkWDTiCH
	 mG1oKJAsgTGpJm5IHg2Zf1zEEvI7pYTdmnABtYk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E72F8032D;
	Tue, 10 Aug 2021 00:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26327F802D2; Tue, 10 Aug 2021 00:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7B0F800FD
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 00:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7B0F800FD
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="201963751"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="201963751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 15:10:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="505589284"
Received: from jsmalone-mobl1.amr.corp.intel.com (HELO [10.212.48.42])
 ([10.212.48.42])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 15:10:26 -0700
Subject: Re: [PATCH v2] ASoC: Intel: Fix platform ID matching
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20210809213544.1682444-1-cujomalainey@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad11b564-6c50-1762-91d3-b1c0483f28bb@linux.intel.com>
Date: Mon, 9 Aug 2021 17:10:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809213544.1682444-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lukasz Majczak <lma@semihalf.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Matt Davis <mattedavis@google.com>, Brent Lu <brent.lu@intel.com>
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



On 8/9/21 4:35 PM, Curtis Malainey wrote:
> Sparse warnings triggered truncating the IDs of some platform device
> tables. Unfortunately some of the IDs in the match tables were missed
> which breaks audio. The KBL change has been verified to fix audio, the
> CML change was not tested as it was found through grepping the broken
> changes and found to match the same situation in anticipation that it
> should also be fixed.
> 
> Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
> Fixes: 24e46fb811e9 ("ASoC: Intel: bxt_da7219_max98357a: shrink platform_id below 20 characters")
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Tested-by: Matt Davis <mattedavis@google.com>

Thanks Curtis, this is exactly what I suggested in my earlier review of
Lukasz Majczak's "[PATCH v1] ASoC: Intel: kbl_da7219_max98357a: fix
drv_name"

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Sorry about these misses...

> ---
>  sound/soc/intel/common/soc-acpi-intel-cml-match.c | 2 +-
>  sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> index 42ef51c3fb4f..b591c6fd13fd 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> @@ -75,7 +75,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
>  	},
>  	{
>  		.id = "DLGS7219",
> -		.drv_name = "cml_da7219_max98357a",
> +		.drv_name = "cml_da7219_mx98357a",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &max98390_spk_codecs,
>  		.sof_fw_filename = "sof-cml.ri",
> diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> index ba5ff468c265..741bf2f9e081 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> @@ -87,7 +87,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
>  	},
>  	{
>  		.id = "DLGS7219",
> -		.drv_name = "kbl_da7219_max98357a",
> +		.drv_name = "kbl_da7219_mx98357a",
>  		.fw_filename = "intel/dsp_fw_kbl.bin",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &kbl_7219_98357_codecs,
> 
