Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF239DE3D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A211686;
	Mon,  7 Jun 2021 15:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A211686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623074427;
	bh=vbMFp47uv+/ahRMqv73KSTj8V5VUZWqmy9YisQd8gX4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c00v3pRbasyjj6WX72RZHg4vSoKcNnsy0argMg2NlNdVb5JCeQgj/sEo033QwfC4L
	 pnr++Ae43rqkdvGssn9S0+pkB/WwuOr7FfXB7kL9L13w1XV/cq/+gUMM1ITOCb49rJ
	 r1T9/eZD64l2Aj0RLekAUjJA4weStVsdkuboaS1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99EFF802DF;
	Mon,  7 Jun 2021 15:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0851FF800DF; Mon,  7 Jun 2021 15:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3531FF8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 15:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3531FF8020D
IronPort-SDR: q5tWb4ATSvjh0ElGF5LF9i8Ot+vXjKhqUAiAD9gFxkiz3+Wbsnuv9c3BHEzLmTwrYjIQl9zn8k
 sYwXQ63QIZTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204648923"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204648923"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 06:58:32 -0700
IronPort-SDR: PMgHgFA2Pq/OzjyuHeOKRoET1itANVY6jX8ucvGI1shsQ8DmFZ0LxBPMfR/smLxxJFrKaSPKU/
 Bogf+fx4AIKQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="401636390"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.209.152.154])
 ([10.209.152.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 06:58:29 -0700
Subject: Re: [PATCH 3/4] ASoC: intel: sof_cs42l42: add support for
 jsl_cs4242_mx98360a
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-4-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <505c7e46-316c-9fa1-feaa-115f4561ed19@linux.intel.com>
Date: Mon, 7 Jun 2021 08:40:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210606004102.26190-4-brent.lu@intel.com>
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



On 6/5/21 7:41 PM, Brent Lu wrote:
> This patch adds driver data for jsl_cs4242_mx98360a which supports two
> max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec on
> SSP0 running on JSL platform. DAI format is leveraged from sof_rt5682
> machine driver to reuse the topology.

This also looks like we have two topologies configuring the same DAIs 
differently on different platforms.

Why can't we pick one configuration that would work in all cases?

> Also use module device table to replace module alias.

Humm, this looks like a missing dependency, I modified this a while ago.

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/sof_cs42l42.c          | 22 +++++++++++++++----
>   .../intel/common/soc-acpi-intel-jsl-match.c   |  8 +++++++
>   2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
> index e3171242f612..d712cfb91fd1 100644
> --- a/sound/soc/intel/boards/sof_cs42l42.c
> +++ b/sound/soc/intel/boards/sof_cs42l42.c
> @@ -36,7 +36,9 @@
>   #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
>   #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
>   	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
> -#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(10)
> +#define SOF_CS42L42_BCLK_2400000		BIT(10)
> +#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(11)
> +#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(12)
>   
>   /* Default: SSP2 */
>   static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
> @@ -122,7 +124,10 @@ static int sof_cs42l42_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>   	int clk_freq, ret;
>   
> -	clk_freq = 3072000; /* BCLK freq */
> +	if (sof_cs42l42_quirk & SOF_CS42L42_BCLK_2400000)
> +		clk_freq = 2400000; /* BCLK freq */
> +	else
> +		clk_freq = 3072000; /* BCLK freq */
>   
>   	/* Configure sysclk for codec */
>   	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
> @@ -281,6 +286,8 @@ static int create_spk_amp_dai_links(struct device *dev,
>   
>   	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
>   		max_98357a_dai_link(&links[*id]);
> +	} else if (sof_cs42l42_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
> +		max_98360a_dai_link(&links[*id]);
>   	} else {
>   		dev_err(dev, "no amp defined\n");
>   		ret = -EINVAL;
> @@ -584,8 +591,17 @@ static const struct platform_device_id board_ids[] = {
>   					SOF_MAX98357A_SPEAKER_AMP_PRESENT |
>   					SOF_CS42L42_SSP_AMP(1)),
>   	},
> +	{
> +		.name = "jsl_cs4242_mx98360a",
> +		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> +					SOF_CS42L42_SSP_AMP(1)) |
> +					SOF_CS42L42_BCLK_2400000,
> +	},
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(platform, board_ids);
>   
>   static struct platform_driver sof_audio = {
>   	.probe = sof_audio_probe,
> @@ -601,7 +617,5 @@ module_platform_driver(sof_audio)
>   MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
>   MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:sof_cs42l42");
> -MODULE_ALIAS("platform:glk_cs4242_max98357a");
>   MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
>   MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> index 73fe4f89a82d..8e86476d48de 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> @@ -73,6 +73,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>   		.quirk_data = &mx98360a_spk,
>   		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
>   	},
> +	{
> +		.id = "10134242",
> +		.drv_name = "jsl_cs4242_mx98360a",
> +		.sof_fw_filename = "sof-jsl.ri",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &mx98360a_spk,
> +		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
> +	},
>   	{},
>   };
>   EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
> 
