Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F372260EA74
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 22:43:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4DF386D;
	Wed, 26 Oct 2022 22:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4DF386D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666817017;
	bh=mOfBCf6XTP3bipjZJg8e50uIHjhKswePx13nDq9hHWY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=udUXel5yitIW5Vp8I18/85q8Uwlq0eDHsaRc2dhHIsfySi8TBUBUC3FBBlLPoYCi9
	 xUZgbH9p2iWJBleK4GIS6zJvjDtf1YWPg1I3MM7a72YGuuM8IlVLIaoC4TmH3KOX3Z
	 FMKqRlU5D15eNdtOSfXARxsjJR1TYSJ8l9cfo3go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92B5F80100;
	Wed, 26 Oct 2022 22:42:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFBCEF80100; Wed, 26 Oct 2022 22:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6023FF80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 22:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6023FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eXOzyNhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666816935; x=1698352935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mOfBCf6XTP3bipjZJg8e50uIHjhKswePx13nDq9hHWY=;
 b=eXOzyNhWb2z/wtxff2tyG9r4+VKdaZC2aFDjpVgh4HkYYTqTfs0jJfyQ
 kMEga9iceau5JGC9xHmTdiu8zU3SqczjQ5UUkm60+PIOSZEvo2VX7V6RP
 b1kHDOZs7Vr0RPKA6YM7/RtYLc0184oCMSYxVdEnXGiK+BeL2EV+Zl6D0
 brLCvv0zIus9u8/rgGf5ck4lGsE+J+Y2ZlV8yUhT3EPXhQvgyiLti0BpC
 SvKWr2gWLo14PVbAesSgEdBUZIQTyIClm0WCPNB7hK3UBxIwXXDnPgu8z
 H5HA39o6As+k29DQXoaYu5J0Uc0H//gq3JO9f0DVEFM2aB7t6QP2g1lge Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308048946"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="308048946"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610103325"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610103325"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197])
 ([10.209.189.197])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:00 -0700
Message-ID: <6916c126-c710-330a-ffcd-50dd3cdc47d3@linux.intel.com>
Date: Wed, 26 Oct 2022 15:34:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_rt5682: quirk auto detection
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20221026071409.3235144-1-brent.lu@intel.com>
 <20221026071409.3235144-3-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221026071409.3235144-3-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mac Chiang <mac.chiang@intel.com>, Rander Wang <rander.wang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Chao Song <chao.song@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>
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



On 10/26/22 02:14, Brent Lu wrote:
> To get rid of increasing board_ids array with similar quirks for every
> new platform, we implement a special board config 'sof_rt5682_auto' to
> compose quirk value at runtime. It detects SoC and amplifier type to
> determine the quirk value.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c           | 173 +++++++-----------
>  .../intel/common/soc-acpi-intel-adl-match.c   |  12 +-
>  .../intel/common/soc-acpi-intel-jsl-match.c   |   6 +-
>  .../intel/common/soc-acpi-intel-tgl-match.c   |   6 +-
>  4 files changed, 77 insertions(+), 120 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 2358be208c1f..2dfccbaae53c 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -60,6 +60,7 @@
>  #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
>  #define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
>  #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
> +#define SOF_RT5682_AUTO_DETECT	BIT(27)
>  
>  
>  /* Default: MCLK on, MCLK 19.2M, SSP0  */
> @@ -838,6 +839,65 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  	return NULL;
>  }
>  
> +static const struct {
> +	const u8 id[ACPI_ID_LEN];
> +	unsigned long quirk;
> +} spk_quirk_map[] = {
> +	{.id = "10EC1011", .quirk = SOF_RT1011_SPEAKER_AMP_PRESENT},
> +	{.id = "10EC1015", .quirk = SOF_RT1015_SPEAKER_AMP_PRESENT},
> +	{.id = "RTL1015", .quirk = SOF_RT1015P_SPEAKER_AMP_PRESENT},
> +	{.id = "RTL1019", .quirk = SOF_RT1019_SPEAKER_AMP_PRESENT},
> +	{.id = "MX98357A", .quirk = 0},
> +	{.id = "MX98360A", .quirk = SOF_MAX98360A_SPEAKER_AMP_PRESENT},
> +	{.id = "MX98373", .quirk = SOF_MAX98373_SPEAKER_AMP_PRESENT},
> +	{.id = "MX98390", .quirk = SOF_MAX98390_SPEAKER_AMP_PRESENT},
> +};
> +
> +static unsigned long sof_audio_auto_detect(struct device *dev)
> +{
> +	unsigned long quirk = 0;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(spk_quirk_map); i++) {
> +		if (!acpi_dev_present(spk_quirk_map[i].id, NULL, -1))
> +			continue;
> +
> +		dev_dbg(dev, "%s detected\n", spk_quirk_map[i].id);
> +		quirk |= spk_quirk_map[i].quirk;
> +		quirk |= SOF_SPEAKER_AMP_PRESENT;
> +		break;
> +	}
> +
> +	if (soc_intel_is_jsl()) {
> +		quirk |= SOF_RT5682_MCLK_EN |
> +			 SOF_RT5682_MCLK_24MHZ |
> +			 SOF_RT5682_NUM_HDMIDEV(3) |
> +			 SOF_RT5682_SSP_CODEC(0);
> +
> +		if (quirk & SOF_SPEAKER_AMP_PRESENT)
> +			quirk |= SOF_RT5682_SSP_AMP(1);
> +	} else if (soc_intel_is_tgl()) {
> +		quirk |= SOF_RT5682_MCLK_EN |
> +			 SOF_RT5682_NUM_HDMIDEV(4) |
> +			 SOF_RT5682_SSP_CODEC(0);
> +
> +		if (quirk & SOF_SPEAKER_AMP_PRESENT)
> +			quirk |= SOF_RT5682_SSP_AMP(1);

This is a bit confusing: this quirk does not work for Volteer

	{
		.callback = sof_rt5682_quirk_cb,
		.matches = {
			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Volteer"),
			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98373_ALC5682I_I2S_UP4"),
		},
		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
					SOF_RT5682_SSP_CODEC(0) |
					SOF_SPEAKER_AMP_PRESENT |
					SOF_MAX98373_SPEAKER_AMP_PRESENT |
					SOF_RT5682_SSP_AMP(2) |
					SOF_RT5682_NUM_HDMIDEV(4)),
	},

Same for Brya and all usages of SSP_AMP(2)


> -	{
> -		.name = "adl_rt1019_rt5682s",
> -		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> -					SOF_RT5682_SSP_CODEC(0) |
> -					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |

and HEADPHONE_CODEC_PRESENT is not handled either.

> -					SOF_SPEAKER_AMP_PRESENT |
> -					SOF_RT1019_SPEAKER_AMP_PRESENT |
> -					SOF_RT5682_SSP_AMP(1) |
> -					SOF_RT5682_NUM_HDMIDEV(4)),
> -	},

Overall I doubt that the SOC alone can tell you what the quirk is.

Maybe it's a default to avoid repeats of the same baseline
configuration, but there's not much else that can be infer from an SOC
definition in light of the creativity of our hardware friends who
routinely swap interfaces.
