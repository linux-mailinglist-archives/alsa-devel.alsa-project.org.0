Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F54350792
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 21:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640EB166D;
	Wed, 31 Mar 2021 21:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640EB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617219843;
	bh=PUb9IqQTAMpbqfDjITUtNFddw+qUF6FHO47wi9lx7lE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W94lnCKNJyQsuBjhA3RGNOPdq0VnfqOGlFrx3SP+ExlknvIQz5Q0F5kfgBix3enyV
	 BSLDLSCDw9J45t7x4MyEtUr+MZJSkVwc8wTthLU7oQTvwSHXiIhkfLz0lXRe29vb+p
	 wT50bsFEnFXlUWpnjYXm1Fp8aa9ueLcWeQ6N+FN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 830DFF8016E;
	Wed, 31 Mar 2021 21:42:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38EC5F80166; Wed, 31 Mar 2021 21:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0DC5F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 21:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0DC5F8013F
IronPort-SDR: MvxzsZvuLAIAK7yyjWs2oALmcvLewhmUSdpk/Ufi099uvlLJDGNIv/8ofmQ04eJfy7uhN2Fjft
 hDiUTeoBvmPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="179612971"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="179612971"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 12:42:20 -0700
IronPort-SDR: wH2ae+bijaKnw+vKgFiTAe7cy3lKPQ5YXggrLo1Po1YOay/7exAlPNlXqfWg+iFsAmcFE4+xf6
 xCGnJCMDftkA==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="607304611"
Received: from tgvanner-mobl1.amr.corp.intel.com (HELO [10.254.114.81])
 ([10.254.114.81])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 12:42:18 -0700
Subject: Re: [PATCH v2 1/2] ASoC: Intel: kbl: Add MST route change to kbl
 machine drivers
To: vamshi.krishna.gopal@intel.com, alsa-devel@alsa-project.org
References: <20210325174325.31802-1-vamshi.krishna.gopal@intel.com>
 <20210325174325.31802-2-vamshi.krishna.gopal@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f1333fc3-afcc-d27b-7f37-17a37e9c5580@linux.intel.com>
Date: Wed, 31 Mar 2021 14:42:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325174325.31802-2-vamshi.krishna.gopal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: harshapriya.n@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, biernacki@google.com,
 pierre-louis.bossart@intel.com
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



On 3/25/21 12:43 PM, vamshi.krishna.gopal@intel.com wrote:
> From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> 
> To support MST hdmi audio, modify the current routes to be
> based on port in kbl_da7219_max98357a, kbl_da7219_max98927 &
> kbl_rt5663_max98927.
> 
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> ---
>   sound/soc/intel/boards/kbl_da7219_max98357a.c | 9 ++++++---
>   sound/soc/intel/boards/kbl_da7219_max98927.c  | 9 ++++++---
>   sound/soc/intel/boards/kbl_rt5663_max98927.c  | 4 ++++
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> index dc3d897ad280..5c371bb01313 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> @@ -91,7 +91,9 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
>   	SND_SOC_DAPM_SPK("Spk", NULL),
>   	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
>   	SND_SOC_DAPM_SPK("DP", NULL),
> -	SND_SOC_DAPM_SPK("HDMI", NULL),

so here you keep the DP but remove HDMI

> +	SND_SOC_DAPM_SPK("HDMI1", NULL),
> +	SND_SOC_DAPM_SPK("HDMI2", NULL),
> +	SND_SOC_DAPM_SPK("HDMI3", NULL),
>   	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
>   			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
>   			SND_SOC_DAPM_POST_PMD),
> @@ -108,8 +110,9 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
>   	{ "MIC", NULL, "Headset Mic" },
>   	{ "DMic", NULL, "SoC DMIC" },
>   
> -	{ "HDMI", NULL, "hif5 Output" },
> -	{ "DP", NULL, "hif6 Output" },

but here you remove both? I guess you forgot to remove DP earlier?

> +	{"HDMI1", NULL, "hif5-0 Output"},
> +	{"HDMI2", NULL, "hif6-0 Output"},
> +	{"HDMI3", NULL, "hif7-0 Output"},
>   
>   	/* CODEC BE connections */
>   	{ "HiFi Playback", NULL, "ssp0 Tx" },
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
> index cc9a2509ace2..e8dc291b1749 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
> @@ -112,7 +112,9 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
>   	SND_SOC_DAPM_SPK("Right Spk", NULL),
>   	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
>   	SND_SOC_DAPM_SPK("DP", NULL),
> -	SND_SOC_DAPM_SPK("HDMI", NULL),
> +	SND_SOC_DAPM_SPK("HDMI1", NULL),
> +	SND_SOC_DAPM_SPK("HDMI2", NULL),
> +	SND_SOC_DAPM_SPK("HDMI3", NULL),
>   	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
>   			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
>   			SND_SOC_DAPM_POST_PMD),
> @@ -126,8 +128,9 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
>   	/* other jacks */
>   	{ "DMic", NULL, "SoC DMIC" },
>   
> -	{ "HDMI", NULL, "hif5 Output" },
> -	{ "DP", NULL, "hif6 Output" },
> +	{"HDMI1", NULL, "hif5-0 Output"},
> +	{"HDMI2", NULL, "hif6-0 Output"},
> +	{"HDMI3", NULL, "hif7-0 Output"},
>   
>   	/* CODEC BE connections */
>   	{ "Left HiFi Playback", NULL, "ssp0 Tx" },
> diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> index 9a4b3d0973f6..cb7990823d35 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
> @@ -151,6 +151,10 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
>   	{ "IN1N", NULL, "Headset Mic" },
>   	{ "DMic", NULL, "SoC DMIC" },
>   
> +	{"HDMI1", NULL, "hif5-0 Output"},
> +	{"HDMI2", NULL, "hif6-0 Output"},
> +	{"HDMI3", NULL, "hif7-0 Output"},
> +
>   	/* CODEC BE connections */
>   	{ "Left HiFi Playback", NULL, "ssp0 Tx" },
>   	{ "Right HiFi Playback", NULL, "ssp0 Tx" },

What about the other routing table?

static const struct snd_soc_dapm_widget kabylake_5663_widgets[] = {
	SND_SOC_DAPM_HP("Headphone Jack", NULL),
	SND_SOC_DAPM_MIC("Headset Mic", NULL),
	SND_SOC_DAPM_SPK("DP", NULL),
	SND_SOC_DAPM_SPK("HDMI", NULL),

static const struct snd_soc_dapm_route kabylake_5663_map[] = {
	{ "Headphone Jack", NULL, "Platform Clock" },
	{ "Headphone Jack", NULL, "HPOL" },
	{ "Headphone Jack", NULL, "HPOR" },

	/* other jacks */
	{ "Headset Mic", NULL, "Platform Clock" },
	{ "IN1P", NULL, "Headset Mic" },
	{ "IN1N", NULL, "Headset Mic" },

	{ "HDMI", NULL, "hif5 Output" },
	{ "DP", NULL, "hif6 Output" },

it'd be good to be consistent, wouldn't it?

