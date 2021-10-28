Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4410543E3C2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E095116FD;
	Thu, 28 Oct 2021 16:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E095116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635431447;
	bh=htSn5hHm3pr+E3/nIig15aoYpJcqkbZiZjXh8H2VS/8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9IsSveGnZ4JzR/OQxnf0K9Eb2VYaEQQK8N7jHdx/BlwcKdLSq95ccn5rxKiLvPDc
	 ARBifxMAGt8E8e8qHGwdqDj62yFQ0tMQMorPzSD3/tl4o9dEJifd5xVwSX5A8BXZnm
	 rsDUNsf5/MxDezcBmUqwNd9LFI4Yhusid/nM2t2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B05F800D1;
	Thu, 28 Oct 2021 16:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A220BF802C8; Thu, 28 Oct 2021 16:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFCDF8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 16:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFCDF8010A
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230682549"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="230682549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:28:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="573766217"
Received: from sjsanghv-mobl.amr.corp.intel.com (HELO [10.212.61.51])
 ([10.212.61.51])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:28:50 -0700
Subject: Re: [PATCH] ASoC: Intel: add sof-nau8825 machine driver
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20211028061930.25273-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <822b390f-0afb-6565-ad64-b07833cdfb1d@linux.intel.com>
Date: Thu, 28 Oct 2021 09:28:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028061930.25273-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@linux.intel.com, liam.r.girdwood@linux.intel.com,
 CTLIN0@nuvoton.com, bard.liao@intel.com, sathya.prakash.m.r@intel.com,
 vamshi.krishna.gopal@intel.com
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



On 10/28/21 1:19 AM, Mac Chiang wrote:
> From: David Lin <CTLIN0@nuvoton.com>
> 
> The machine driver is a generic machine driver for SOF with nau8825
> codec w or w/o speaker additionally. Depending on the SOC
> HDMI, DMIC, Bluetooth offload support are added dynamically.
> 
> Only add information related to SOF since the machine driver was
> only tested with SOF.
> 
> There are currently 4 i2s machine variants of ADL.
> This supports the headphone NUA8825(SSP0) alone or with smart or dumb
> speakers.
> Board 2,3,4 use SSP2 for Bluetooth offload support except board 1.
> 
> Board 1 : NAU8825 + RT1019P(SSP2)
> Board 2 : NAU8825 + MAX98373(SSP1)
> Board 3 : NAU8825 + MAX98360A(SSP1)
> Board 4 : NAU8825
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>

The code looks mostly good, just a couple of minor things to update, see
below

> +struct sof_card_private {
> +	struct clk *mclk;
> +	struct snd_soc_jack sof_headset;
> +	struct list_head hdmi_pcm_list;
> +	bool common_hdmi_codec_drv;

we no longer need this 'common_hdmi_codec_drv' for new drivers, this was
a transition step that we've removed for newer machine drivers.

Please look at the sof_es8336 example.

> +static int sof_card_late_probe(struct snd_soc_card *card)
> +{
> +	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_component *component = NULL;
> +	struct snd_soc_dapm_context *dapm = &card->dapm;
> +	char jack_name[NAME_SIZE];
> +	struct sof_hdmi_pcm *pcm;
> +	int err;
> +	int i = 0;
> +
> +	if (list_empty(&ctx->hdmi_pcm_list))
> +		return -EINVAL;
> +
> +	if (ctx->common_hdmi_codec_drv) {
> +		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
> +				       head);
> +		component = pcm->codec_dai->component;
> +		return hda_dsp_hdmi_build_controls(card, component);
> +	}

no longer needed.

> +	/* speaker amp */
> +	if (sof_nau8825_quirk & SOF_SPEAKER_AMP_PRESENT) {
> +		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
> +						"SSP%d-Codec", ssp_amp);
> +		if (!links[id].name)
> +			goto devm_err;
> +
> +		links[id].id = id;
> +		if (sof_nau8825_quirk & SOF_RT1019P_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = rt1019p_component;
> +			links[id].num_codecs = ARRAY_SIZE(rt1019p_component);
> +			links[id].init = speaker_codec_init;
> +		} else if (sof_nau8825_quirk &
> +				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = max_98373_components;
> +			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
> +			links[id].init = max_98373_spk_codec_init;
> +			links[id].ops = &max_98373_ops;
> +			/* feedback stream */
> +			links[id].dpcm_capture = 1;
> +		} else if (sof_nau8825_quirk &
> +				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
> +			max_98360a_dai_link(&links[id]);
> +		} else {
> +			max_98360a_dai_link(&links[id]);
> +		}

cppcheck complains that the two last branches are identical.

> +
> +		links[id].platforms = platform_component;
> +		links[id].num_platforms = ARRAY_SIZE(platform_component);
> +		links[id].dpcm_playback = 1;
> +		links[id].no_pcm = 1;
> +		links[id].cpus = &cpus[id];
> +		links[id].num_cpus = 1;
> +		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +							  "SSP%d Pin",
> +							  ssp_amp);
> +		if (!links[id].cpus->dai_name)
> +			goto devm_err;
> +		id++;
> +	}
> +
> +	/* BT audio offload */
> +	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
> +		int port = (sof_nau8825_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
> +				SOF_BT_OFFLOAD_SSP_SHIFT;
> +
> +		links[id].id = id;
> +		links[id].cpus = &cpus[id];
> +		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +							  "SSP%d Pin", port);
> +		if (!links[id].cpus->dai_name)
> +			goto devm_err;
> +		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
> +		if (!links[id].name)
> +			goto devm_err;
> +		links[id].codecs = dummy_component;
> +		links[id].num_codecs = ARRAY_SIZE(dummy_component);
> +		links[id].platforms = platform_component;
> +		links[id].num_platforms = ARRAY_SIZE(platform_component);
> +		links[id].dpcm_playback = 1;
> +		links[id].dpcm_capture = 1;
> +		links[id].no_pcm = 1;
> +		links[id].num_cpus = 1;
> +	}
> +
> +	return links;
> +devm_err:
> +	return NULL;
> +}

[...]

> +
> +	/* set platform name for each dailink */
> +	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_nau8825,
> +						    mach->mach_params.platform);
> +	if (ret)
> +		return ret;
> +
> +	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;

not needed.

> +
> +	snd_soc_card_set_drvdata(&sof_audio_card_nau8825, ctx);
> +
> +	return devm_snd_soc_register_card(&pdev->dev,
> +					  &sof_audio_card_nau8825);
> +}

> +MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
> +MODULE_LICENSE("GPL v2");

"GPL"


