Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC9939DE3C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77481674;
	Mon,  7 Jun 2021 15:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77481674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623074413;
	bh=aLToCYkY0XdgCk+l364VK8kFNykE0Cr2lr03QpZXdIE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UzchVXvlDOP1L29aw08nM50OVZxjkEAkPZ2j3EV/SWhqKXqiS17zY6hm0ddvGXnzC
	 DETswTevRxj/1X8NVgfy7BdX+a2PwnZ/CPCxQR5SHkruo7NwKXjnDK8magSyR5RZNI
	 xgSF74jrhb+Bzaml/cwjGO5C3DW+orNmM4xzBO1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0D4F8020D;
	Mon,  7 Jun 2021 15:58:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC06EF8026C; Mon,  7 Jun 2021 15:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBB64F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 15:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB64F800AF
IronPort-SDR: mRQ72P3XjiTpz47hYhTSIp1QG+L6Tmvh4ILWifR+XEKKsqkc+o3Pymjnmz/7WWkPsii7e5Z+6t
 lI1P1ARMOZXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204648912"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204648912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 06:58:28 -0700
IronPort-SDR: +2JcIQujUAtZXpchy2Yp26ILENur1Uhdww+RfZXY1IAef3zIjo7uEHX/170JgI3Fk8m+MBv8hZ
 B5OH74eJ07mA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="401636378"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.209.152.154])
 ([10.209.152.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 06:58:25 -0700
Subject: Re: [PATCH 1/4] ASoC: Intel: sof_cs42l42: support JSL DAI link
 sequence
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-2-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ccdffb1-e905-420e-5144-ebb8356b5518@linux.intel.com>
Date: Mon, 7 Jun 2021 08:32:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210606004102.26190-2-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
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



On 6/5/21 7:40 PM, Brent Lu wrote:
> The backend DAI link sequence of GLK platform is different from the
> sequence of other platforms. We refactor the sof_card_dai_links_create()
> function to support both style.
> 
> GLK: SPK - HP - DMIC - HDMI
> Other: HP - DMIC - HDMI - SPK

I am really confused here.
The dailink sequence is whatever we want it to be. What matters is that 
the dailink ID matches what is in the topology.

Is this saying that the GLK and JSL topologies did not follow any sort 
of convention? Can you elaborate more on what is the issue?

Put differently, why can't we fix the topology instead with a reorder of 
the dailinks?

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/sof_cs42l42.c | 318 ++++++++++++++++++---------
>   1 file changed, 208 insertions(+), 110 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
> index 8919d3ba3c89..e3171242f612 100644
> --- a/sound/soc/intel/boards/sof_cs42l42.c
> +++ b/sound/soc/intel/boards/sof_cs42l42.c
> @@ -259,133 +259,166 @@ static struct snd_soc_dai_link_component dmic_component[] = {
>   	}
>   };
>   
> -static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
> -							  int ssp_codec,
> -							  int ssp_amp,
> -							  int dmic_be_num,
> -							  int hdmi_num)
> +static int create_spk_amp_dai_links(struct device *dev,
> +				    struct snd_soc_dai_link *links,
> +				    struct snd_soc_dai_link_component *cpus,
> +				    int *id, int ssp_amp)
>   {
> -	struct snd_soc_dai_link_component *idisp_components;
> -	struct snd_soc_dai_link_component *cpus;
> -	struct snd_soc_dai_link *links;
> -	int i, id = 0;
> -
> -	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
> -			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
> -	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
> -			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
> -	if (!links || !cpus)
> -		goto devm_err;
> +	int ret = 0;
>   
>   	/* speaker amp */
> -	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT) {
> -		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
> -						"SSP%d-Codec", ssp_amp);
> -		if (!links[id].name)
> -			goto devm_err;
> +	if (!(sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT))
> +		return 0;
>   
> -		links[id].id = id;
> +	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
> +					 ssp_amp);
> +	if (!links[*id].name) {
> +		ret = -ENOMEM;
> +		goto devm_err;
> +	}
>   
> -		if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
> -			max_98357a_dai_link(&links[id]);
> -		} else {
> -			dev_err(dev, "no amp defined\n");
> -			goto devm_err;
> -		}
> +	links[*id].id = *id;
>   
> -		links[id].platforms = platform_component;
> -		links[id].num_platforms = ARRAY_SIZE(platform_component);
> -		links[id].dpcm_playback = 1;
> -		links[id].no_pcm = 1;
> -		links[id].cpus = &cpus[id];
> -		links[id].num_cpus = 1;
> -
> -		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> -							  "SSP%d Pin",
> -							  ssp_amp);
> -		if (!links[id].cpus->dai_name)
> -			goto devm_err;
> +	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
> +		max_98357a_dai_link(&links[*id]);
> +	} else {
> +		dev_err(dev, "no amp defined\n");
> +		ret = -EINVAL;
> +		goto devm_err;
> +	}
>   
> -		id++;
> +	links[*id].platforms = platform_component;
> +	links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +	links[*id].dpcm_playback = 1;
> +	links[*id].no_pcm = 1;
> +	links[*id].cpus = &cpus[*id];
> +	links[*id].num_cpus = 1;
> +
> +	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +						   "SSP%d Pin", ssp_amp);
> +	if (!links[*id].cpus->dai_name) {
> +		ret = -ENOMEM;
> +		goto devm_err;
>   	}
>   
> +	(*id)++;
> +
> +devm_err:
> +	return ret;
> +}
> +
> +static int create_hp_codec_dai_links(struct device *dev,
> +				     struct snd_soc_dai_link *links,
> +				     struct snd_soc_dai_link_component *cpus,
> +				     int *id, int ssp_codec)
> +{
>   	/* codec SSP */
> -	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
> -					"SSP%d-Codec", ssp_codec);
> -	if (!links[id].name)
> +	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
> +					 ssp_codec);
> +	if (!links[*id].name)
>   		goto devm_err;
>   
> -	links[id].id = id;
> -	links[id].codecs = cs42l42_component;
> -	links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
> -	links[id].platforms = platform_component;
> -	links[id].num_platforms = ARRAY_SIZE(platform_component);
> -	links[id].init = sof_cs42l42_init;
> -	links[id].exit = sof_cs42l42_exit;
> -	links[id].ops = &sof_cs42l42_ops;
> -	links[id].dpcm_playback = 1;
> -	links[id].dpcm_capture = 1;
> -	links[id].no_pcm = 1;
> -	links[id].cpus = &cpus[id];
> -	links[id].num_cpus = 1;
> -
> -	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> -						  "SSP%d Pin",
> -						  ssp_codec);
> -	if (!links[id].cpus->dai_name)
> +	links[*id].id = *id;
> +	links[*id].codecs = cs42l42_component;
> +	links[*id].num_codecs = ARRAY_SIZE(cs42l42_component);
> +	links[*id].platforms = platform_component;
> +	links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +	links[*id].init = sof_cs42l42_init;
> +	links[*id].exit = sof_cs42l42_exit;
> +	links[*id].ops = &sof_cs42l42_ops;
> +	links[*id].dpcm_playback = 1;
> +	links[*id].dpcm_capture = 1;
> +	links[*id].no_pcm = 1;
> +	links[*id].cpus = &cpus[*id];
> +	links[*id].num_cpus = 1;
> +
> +	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +						   "SSP%d Pin",
> +						   ssp_codec);
> +	if (!links[*id].cpus->dai_name)
>   		goto devm_err;
>   
> -	id++;
> +	(*id)++;
> +
> +	return 0;
> +
> +devm_err:
> +	return -ENOMEM;
> +}
> +
> +static int create_dmic_dai_links(struct device *dev,
> +				 struct snd_soc_dai_link *links,
> +				 struct snd_soc_dai_link_component *cpus,
> +				 int *id, int dmic_be_num)
> +{
> +	int i;
>   
>   	/* dmic */
> -	if (dmic_be_num > 0) {
> -		/* at least we have dmic01 */
> -		links[id].name = "dmic01";
> -		links[id].cpus = &cpus[id];
> -		links[id].cpus->dai_name = "DMIC01 Pin";
> -		links[id].init = dmic_init;
> -		if (dmic_be_num > 1) {
> -			/* set up 2 BE links at most */
> -			links[id + 1].name = "dmic16k";
> -			links[id + 1].cpus = &cpus[id + 1];
> -			links[id + 1].cpus->dai_name = "DMIC16k Pin";
> -			dmic_be_num = 2;
> -		}
> +	if (dmic_be_num <= 0)
> +		return 0;
> +
> +	/* at least we have dmic01 */
> +	links[*id].name = "dmic01";
> +	links[*id].cpus = &cpus[*id];
> +	links[*id].cpus->dai_name = "DMIC01 Pin";
> +	links[*id].init = dmic_init;
> +	if (dmic_be_num > 1) {
> +		/* set up 2 BE links at most */
> +		links[*id + 1].name = "dmic16k";
> +		links[*id + 1].cpus = &cpus[*id + 1];
> +		links[*id + 1].cpus->dai_name = "DMIC16k Pin";
> +		dmic_be_num = 2;
>   	}
>   
>   	for (i = 0; i < dmic_be_num; i++) {
> -		links[id].id = id;
> -		links[id].num_cpus = 1;
> -		links[id].codecs = dmic_component;
> -		links[id].num_codecs = ARRAY_SIZE(dmic_component);
> -		links[id].platforms = platform_component;
> -		links[id].num_platforms = ARRAY_SIZE(platform_component);
> -		links[id].ignore_suspend = 1;
> -		links[id].dpcm_capture = 1;
> -		links[id].no_pcm = 1;
> -		id++;
> +		links[*id].id = *id;
> +		links[*id].num_cpus = 1;
> +		links[*id].codecs = dmic_component;
> +		links[*id].num_codecs = ARRAY_SIZE(dmic_component);
> +		links[*id].platforms = platform_component;
> +		links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +		links[*id].ignore_suspend = 1;
> +		links[*id].dpcm_capture = 1;
> +		links[*id].no_pcm = 1;
> +
> +		(*id)++;
>   	}
>   
> +	return 0;
> +}
> +
> +static int create_hdmi_dai_links(struct device *dev,
> +				 struct snd_soc_dai_link *links,
> +				 struct snd_soc_dai_link_component *cpus,
> +				 int *id, int hdmi_num)
> +{
> +	struct snd_soc_dai_link_component *idisp_components;
> +	int i;
> +
>   	/* HDMI */
> -	if (hdmi_num > 0) {
> -		idisp_components = devm_kzalloc(dev,
> -						sizeof(struct snd_soc_dai_link_component) *
> -						hdmi_num, GFP_KERNEL);
> -		if (!idisp_components)
> -			goto devm_err;
> -	}
> +	if (hdmi_num <= 0)
> +		return 0;
> +
> +	idisp_components = devm_kzalloc(dev,
> +					sizeof(struct snd_soc_dai_link_component) *
> +					hdmi_num, GFP_KERNEL);
> +	if (!idisp_components)
> +		goto devm_err;
> +
>   	for (i = 1; i <= hdmi_num; i++) {
> -		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
> -						"iDisp%d", i);
> -		if (!links[id].name)
> +		links[*id].name = devm_kasprintf(dev, GFP_KERNEL,
> +						 "iDisp%d", i);
> +		if (!links[*id].name)
>   			goto devm_err;
>   
> -		links[id].id = id;
> -		links[id].cpus = &cpus[id];
> -		links[id].num_cpus = 1;
> -		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> -							  "iDisp%d Pin", i);
> -		if (!links[id].cpus->dai_name)
> +		links[*id].id = *id;
> +		links[*id].cpus = &cpus[*id];
> +		links[*id].num_cpus = 1;
> +		links[*id].cpus->dai_name = devm_kasprintf(dev,
> +							   GFP_KERNEL,
> +							   "iDisp%d Pin",
> +							   i);
> +		if (!links[*id].cpus->dai_name)
>   			goto devm_err;
>   
>   		idisp_components[i - 1].name = "ehdaudio0D2";
> @@ -396,14 +429,79 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>   		if (!idisp_components[i - 1].dai_name)
>   			goto devm_err;
>   
> -		links[id].codecs = &idisp_components[i - 1];
> -		links[id].num_codecs = 1;
> -		links[id].platforms = platform_component;
> -		links[id].num_platforms = ARRAY_SIZE(platform_component);
> -		links[id].init = sof_hdmi_init;
> -		links[id].dpcm_playback = 1;
> -		links[id].no_pcm = 1;
> -		id++;
> +		links[*id].codecs = &idisp_components[i - 1];
> +		links[*id].num_codecs = 1;
> +		links[*id].platforms = platform_component;
> +		links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +		links[*id].init = sof_hdmi_init;
> +		links[*id].dpcm_playback = 1;
> +		links[*id].no_pcm = 1;
> +
> +		(*id)++;
> +	}
> +
> +	return 0;
> +
> +devm_err:
> +	return -ENOMEM;
> +}
> +
> +static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
> +							  int ssp_codec,
> +							  int ssp_amp,
> +							  int dmic_be_num,
> +							  int hdmi_num)
> +{
> +	struct snd_soc_dai_link_component *cpus;
> +	struct snd_soc_dai_link *links;
> +	int ret, id = 0;
> +
> +	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
> +			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
> +	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
> +			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
> +	if (!links || !cpus)
> +		goto devm_err;
> +
> +	if (soc_intel_is_glk()) {
> +		/* gemini lake starts from spk link */
> +		ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
> +		if (ret < 0) {
> +			dev_err(dev, "fail to create spk amp dai links, ret %d\n",
> +				ret);
> +			goto devm_err;
> +		}
> +	}
> +
> +	ret = create_hp_codec_dai_links(dev, links, cpus, &id, ssp_codec);
> +	if (ret < 0) {
> +		dev_err(dev, "fail to create hp codec dai links, ret %d\n",
> +			ret);
> +		goto devm_err;
> +	}
> +
> +	ret = create_dmic_dai_links(dev, links, cpus, &id, dmic_be_num);
> +	if (ret < 0) {
> +		dev_err(dev, "fail to create dmic dai links, ret %d\n",
> +			ret);
> +		goto devm_err;
> +	}
> +
> +	ret = create_hdmi_dai_links(dev, links, cpus, &id, hdmi_num);
> +	if (ret < 0) {
> +		dev_err(dev, "fail to create hdmi dai links, ret %d\n",
> +			ret);
> +		goto devm_err;
> +	}
> +
> +	if (!soc_intel_is_glk()) {
> +		/* other platforms end with spk link */
> +		ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
> +		if (ret < 0) {
> +			dev_err(dev, "fail to create spk amp dai links, ret %d\n",
> +				ret);
> +			goto devm_err;
> +		}
>   	}
>   
>   	return links;
> 
