Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D741052B061
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 04:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E8F3E8;
	Wed, 18 May 2022 04:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E8F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652839410;
	bh=almMh+rawZyDIurcC/W3RqRQ1DnO9aJ3BbcGwirhOhs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YneS/pYLgjQFxA0k15tyPM8eoSXcO7vjET8CZtyiDPEd+sOCGtGuf2GlBbPQEsdsM
	 ziUvVSWH28KzeY97HIYRQRFIoTrNRn42SrXm8nJgtPEVJXANSUJkD7gcnmRnTrWn3i
	 32+34bKty1TmaRmWt/r2uw+IcSCecoH2+8PMIO38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F5AF80279;
	Wed, 18 May 2022 04:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10348F8023B; Wed, 18 May 2022 04:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0506F800E1
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 04:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0506F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LPqWu5aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652839346; x=1684375346;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=almMh+rawZyDIurcC/W3RqRQ1DnO9aJ3BbcGwirhOhs=;
 b=LPqWu5aNmR90YvsbMHGHCJbWrpCuwpryxr/aUmve2nvHiLY6W0BAN2bN
 J/m05pCxe5cEHouBrCSyJGrWuI/TR6EjjAKuzEd3AmgWEXndcToaHKwdi
 kZYPlcnI/s6ji5RP32S3mV6eMAZn72iksgnfCnZwXkBwhCtTlaEvdjK6c
 VSXZDVfPlYw1ktvViw8pHTSJbWXkryP8D3vJBf+AjlHy49A2LOUTnt/gT
 5ExrlcW85w/bCAm1AWGNHuQ1V7DE41m+6LspAyPY7xLyKqTZ0FN2vzK6n
 rZzNflaF/sy5vQJ98wOEn4STJ8/hPP9dbQHNmlXsQ1VokGzbd5DnMjmHq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271375627"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271375627"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 19:02:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="673153516"
Received: from sfilary-mobl.amr.corp.intel.com (HELO [10.209.67.235])
 ([10.209.67.235])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 19:02:15 -0700
Message-ID: <00e58668-ca30-0048-6cd1-b2dd4ad66d7a@linux.intel.com>
Date: Tue, 17 May 2022 21:02:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [v6] FROMLIST: ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Content-Language: en-US
To: Terry Chen <terry_chen@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20220518013140.1467326-1-terry_chen@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220518013140.1467326-1-terry_chen@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, casey.g.bowman@intel.com,
 yang.jie@linux.intel.com, tiwai@suse.com,
 mark_hsieh@wistron.corp-partner.google.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, seanpaul@chromium.org,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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



On 5/17/22 20:31, Terry Chen wrote:
> To be able to do  driver data for adl_mx98360a_cs4242 which supports
> two max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec
> on SSP0 running on ADL platform. Also add the capability to machine driver
> of creating DAI Link for BT offload. Although BT offload always uses SSP2
> port but we reserve the flexibility to assign the port number in macro.
> 
> Signed-off-by: Terry Chen <terry_chen@wistron.corp-partner.google.com>
> (am from https://patchwork.kernel.org/patch/12845884/)
> (also found at https://lore.kernel.org/r/20220511075522.1764114-1-terry_chen@wistron.corp-partner.google.com)

not sure what this is about, what's the point of adding information on
the v5 in the v6 patch?

> 
> ---
>  sound/soc/intel/boards/sof_cs42l42.c          | 92 ++++++++++++++++++-
>  .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++
>  2 files changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
> index ce78c18798876..2efffc7933479 100644
> --- a/sound/soc/intel/boards/sof_cs42l42.c
> +++ b/sound/soc/intel/boards/sof_cs42l42.c
> @@ -41,8 +41,13 @@
>  #define SOF_CS42L42_DAILINK_MASK		(GENMASK(24, 10))
>  #define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
>  	((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
> -#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(25)
> -#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(26)
> +#define SOF_BT_OFFLOAD_PRESENT			BIT(25)
> +#define SOF_CS42L42_SSP_BT_SHIFT		26
> +#define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
> +#define SOF_CS42L42_SSP_BT(quirk)	\
> +	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
> +#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(29)
> +#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(30)
>  
>  enum {
>  	LINK_NONE = 0,
> @@ -50,6 +55,7 @@ enum {
>  	LINK_SPK = 2,
>  	LINK_DMIC = 3,
>  	LINK_HDMI = 4,
> +	LINK_BT = 5,
>  };
>  
>  /* Default: SSP2 */
> @@ -278,6 +284,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
>  	}
>  };
>  
> +static struct snd_soc_dai_link_component dummy_component[] = {
> +	{
> +		.name = "snd-soc-dummy",
> +		.dai_name = "snd-soc-dummy-dai",
> +	}
> +};
> +
>  static int create_spk_amp_dai_links(struct device *dev,
>  				    struct snd_soc_dai_link *links,
>  				    struct snd_soc_dai_link_component *cpus,
> @@ -467,9 +480,56 @@ static int create_hdmi_dai_links(struct device *dev,
>  	return -ENOMEM;
>  }
>  
> +static int create_bt_offload_dai_links(struct device *dev,
> +				       struct snd_soc_dai_link *links,
> +				       struct snd_soc_dai_link_component *cpus,
> +				       int *id, int ssp_bt)
> +{
> +	int ret = 0;

either you remove this useless init...

> +
> +	/* bt offload */
> +	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
> +		return 0;
> +
> +	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
> +					 ssp_bt);
> +	if (!links[*id].name) {
> +		ret = -ENOMEM;
> +		goto devm_err;
> +	}
> +
> +	links[*id].id = *id;
> +	links[*id].codecs = dummy_component;
> +	links[*id].num_codecs = ARRAY_SIZE(dummy_component);
> +	links[*id].platforms = platform_component;
> +	links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +
> +	links[*id].dpcm_playback = 1;
> +	links[*id].dpcm_capture = 1;
> +	links[*id].no_pcm = 1;
> +	links[*id].cpus = &cpus[*id];
> +	links[*id].num_cpus = 1;
> +
> +	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +						   "SSP%d Pin",
> +						   ssp_bt);
> +	if (!links[*id].cpus->dai_name) {
> +		ret = -ENOMEM;
> +		goto devm_err;
> +	}
> +
> +	(*id)++;
> +
> +	return 0;

... or you remove the return 0;

pick one.

> +
> +devm_err:
> +	return ret;
> +}
> +

>  	},
> +	{
> +		.id = "10134242",
> +		.drv_name = "adl_mx98360a_cs4242",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98360a_amp,
> +		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",

No, I've told this before in previous reviews: do not use a topology
name that was designed for a different platform, this is not
maintainable. If the topologies happen to be the same, either generate
them twice or use a symlink.
