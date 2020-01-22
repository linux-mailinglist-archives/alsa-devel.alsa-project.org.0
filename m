Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFB145CC7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 20:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06D516A0;
	Wed, 22 Jan 2020 20:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06D516A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579723073;
	bh=zpbOudgzmIlt89SGxR7wWNQJK/b9W7F7wXRX1YxY3KM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvDL1kRt4O7hny/OL3te0samiIL17hCs7g6h+fPmUkwKQCACurok+2zqJ8Y7VrRRe
	 v+0YVHaQ/jizTxr0f2w8oOtHOjLiMjacCUYutHvfHwmcN3hrV9bD+PDGCema0EBUVh
	 Y6uaYVbqT60AGkemq7aYbz0KW7bxBN2tNprtfG5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6E3F80229;
	Wed, 22 Jan 2020 20:56:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3930BF800E7; Wed, 22 Jan 2020 20:56:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7593F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 20:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7593F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 11:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="250734792"
Received: from jovercas-mobl1.amr.corp.intel.com (HELO [10.254.105.26])
 ([10.254.105.26])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2020 11:55:58 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
Date: Wed, 22 Jan 2020 13:55:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122181254.22801-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 lgirdwood@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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



On 1/22/20 12:12 PM, Cezary Rojewski wrote:
> Definitions for idisp snd_soc_dai_links within skl_hda_dsp_common are
> missing platform component. Add it to address following bug reported by
> KASAN:
> 
> [   10.538502] BUG: KASAN: global-out-of-bounds in skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
> [   10.538509] Write of size 8 at addr ffffffffc0606840 by task systemd-udevd/299
> (...)

You could probably skip the call trace, it doesn't really provide much 
information.

Kai and Ranjani, do you think this impacts SOF as well? Or does our BE 
override somehow suppresses the problem?

>   sound/soc/intel/boards/skl_hda_dsp_common.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
> index eb419e1ec42b..78ff5f24c40e 100644
> --- a/sound/soc/intel/boards/skl_hda_dsp_common.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
> @@ -41,16 +41,19 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
>   	return 0;
>   }
>   
> -SND_SOC_DAILINK_DEFS(idisp1,
> -	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")),
> +SND_SOC_DAILINK_DEF(idisp1_cpu,
> +	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
> +SND_SOC_DAILINK_DEF(idisp1_codec,
>   	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
>   
> -SND_SOC_DAILINK_DEFS(idisp2,
> -	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")),
> +SND_SOC_DAILINK_DEF(idisp2_cpu,
> +	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
> +SND_SOC_DAILINK_DEF(idisp2_codec,
>   	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
>   
> -SND_SOC_DAILINK_DEFS(idisp3,
> -	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")),
> +SND_SOC_DAILINK_DEF(idisp3_cpu,
> +	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
> +SND_SOC_DAILINK_DEF(idisp3_codec,
>   	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
>   
>   SND_SOC_DAILINK_DEF(analog_cpu,
> @@ -83,21 +86,21 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
>   		.id = 1,
>   		.dpcm_playback = 1,
>   		.no_pcm = 1,
> -		SND_SOC_DAILINK_REG(idisp1),
> +		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
>   	},
>   	{
>   		.name = "iDisp2",
>   		.id = 2,
>   		.dpcm_playback = 1,
>   		.no_pcm = 1,
> -		SND_SOC_DAILINK_REG(idisp2),
> +		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
>   	},
>   	{
>   		.name = "iDisp3",
>   		.id = 3,
>   		.dpcm_playback = 1,
>   		.no_pcm = 1,
> -		SND_SOC_DAILINK_REG(idisp3),
> +		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
>   	},
>   	{
>   		.name = "Analog Playback and Capture",
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
