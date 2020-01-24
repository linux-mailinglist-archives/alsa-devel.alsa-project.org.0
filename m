Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAE8148F4E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 21:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF50F168A;
	Fri, 24 Jan 2020 21:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF50F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579897561;
	bh=Ey303lb83rcY6KstoS9w4OULLfAkfXMDFk0o02TA798=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t9frCZX6n5e0S9P6eFG6LvJ3JosKiXob3cL8P0oBoiSVIJ3fWj/ZbVISaP3SgCPj4
	 +fufOQq0hY7RFKC+YUQqNISOvdpRzrI8ulxmDGpbaG02+Gxlr0QCJDDeH3BsFZlmVp
	 pXHw0swq2NEw7CxKqP4jZRCJeWLyy+pHDsU41mks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E3BF80245;
	Fri, 24 Jan 2020 21:24:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FFA7F80229; Fri, 24 Jan 2020 21:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64BFBF800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 21:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BFBF800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="400759944"
Received: from iifeduba-mobl1.amr.corp.intel.com (HELO [10.254.110.26])
 ([10.254.110.26])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2020 12:24:05 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-13-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce84001f-7dc3-8393-1203-8a2bcfbefbad@linux.intel.com>
Date: Fri, 24 Jan 2020 13:31:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124190413.18154-13-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 12/12] ASoC: Intel: sof_rt5682: Add
 compress probe DAI links
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/24/20 1:04 PM, Cezary Rojewski wrote:
> Assign probe DAI link to actively used SOF machine boards.
> For current upstream, it is only sof_rt5682.

This patch should really be an example, do we really want this upstream 
as is?
I'd like to have 'clean' support for probes once Ranjani's multi-client 
work is available, without changes to any machine driver.

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/boards/sof_rt5682.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 5d878873a8e0..8c26214b19d3 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -417,6 +417,8 @@ static struct snd_soc_dai_link_component max98357a_component[] = {
>   	}
>   };
>   
> +SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
> +
>   static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>   							  int ssp_codec,
>   							  int ssp_amp,
> @@ -580,8 +582,22 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>   			if (!links[id].cpus->dai_name)
>   				goto devm_err;
>   		}
> +		id++;
>   	}
>   
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
> +	links[id].name = "Compress Probe Capture";
> +	links[id].id = id;
> +	links[id].cpus = &cpus[id];
> +	links[id].num_cpus = 1;
> +	links[id].cpus->dai_name = "Probe Extraction CPU DAI";
> +	links[id].codecs = dummy;
> +	links[id].num_codecs = 1;
> +	links[id].platforms = platform_component;
> +	links[id].num_platforms = ARRAY_SIZE(platform_component);
> +	links[id].nonatomic = 1;
> +#endif
> +
>   	return links;
>   devm_err:
>   	return NULL;
> @@ -656,8 +672,8 @@ static int sof_audio_probe(struct platform_device *pdev)
>   
>   	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
>   
> -	/* compute number of dai links */
> -	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + hdmi_num;
> +	/* account for SSP and probes when computing total dai link count */
> +	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + hdmi_num + 1;
>   
>   	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
>   		sof_audio_card_rt5682.num_links++;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
