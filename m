Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834921A6412
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31CB916D8;
	Mon, 13 Apr 2020 10:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31CB916D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586766393;
	bh=wSNu/Tuvnh4j0eFpEUS8HciuBpfp5S3XtIHXITwW+Qg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0OIK6CebafY3VSM52eaMRw4vM9K5N9DUPTE0xXKhRLdgntJopsOpF/JBzhTLzL6M
	 /GGzZY7Sj9HP7GPyeFu1iEGUmL1V+YypwEOY/07g57vOHxj1id4Irn1vkCdAhgK4p6
	 hrdj+NTJVNMqjA2GSDkedGIxL0i7MEgqgJYojcuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB6A9F8025F;
	Mon, 13 Apr 2020 10:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7DBF80245; Mon, 13 Apr 2020 10:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB77F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB77F800B9
IronPort-SDR: 8zFZFGc4BgyLHzMsGIpfyrNDcdULRoBZXyWyjjepojidgWv/x+o3HnEH1vP7CEN07MLp2x4K8G
 XpBX5JE1lHRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 01:24:48 -0700
IronPort-SDR: 89OuDTtVm7GFv4SzRRMrenZSTb2zYhZCJ/a2q2ZWqGGEak0vg31sUCDLb6kKpDrKjcybHD+WQC
 xQNibDVPwHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="454141300"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2020 01:24:44 -0700
Subject: Re: [PATCH] ASoC: bdw-rt5650: incorrect rate of PCM data
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1586765358-18474-1-git-send-email-brent.lu@intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <751b03e3-c4de-cbcb-e1b6-dc6f3f572aab@linux.intel.com>
Date: Mon, 13 Apr 2020 16:35:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1586765358-18474-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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


On 2020/4/13 下午4:09, Brent Lu wrote:
> Implement a constrain to exclude 3-channel capture since only 2 and 4
> channel capture are supported on the platform.

The patch looks good to me, except that the subject seems unrelated? you 
are changing the channel number, not the sample rate?

Thanks,
~Keyon

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/bdw-rt5650.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
> index af2f502..eedbdad 100644
> --- a/sound/soc/intel/boards/bdw-rt5650.c
> +++ b/sound/soc/intel/boards/bdw-rt5650.c
> @@ -83,6 +83,36 @@ static struct snd_soc_jack_pin mic_jack_pin = {
>   	.mask	= SND_JACK_MICROPHONE,
>   };
>   
> +static const unsigned int channels[] = {
> +	2, 4,
> +};
> +
> +static const struct snd_pcm_hw_constraint_list constraints_channels = {
> +	.count = ARRAY_SIZE(channels),
> +	.list = channels,
> +	.mask = 0,
> +};
> +
> +static int bdw_fe_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	/*
> +	 * On this platform for PCM device we support,
> +	 * 2 or 4 channel capture
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		snd_pcm_hw_constraint_list(runtime, 0,
> +					   SNDRV_PCM_HW_PARAM_CHANNELS,
> +					   &constraints_channels);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_ops bdw_rt5650_fe_ops = {
> +	.startup = bdw_fe_startup,
> +};
> +
>   static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
>   			struct snd_pcm_hw_params *params)
>   {
> @@ -234,6 +264,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
>   		.name = "System PCM",
>   		.stream_name = "System Playback",
>   		.dynamic = 1,
> +		.ops = &bdw_rt5650_fe_ops,
>   #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
>   		.init = bdw_rt5650_rtd_init,
>   #endif
> 
