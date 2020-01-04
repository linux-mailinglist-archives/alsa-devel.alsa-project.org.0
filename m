Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B513001E
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 03:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C8A1179B;
	Sat,  4 Jan 2020 03:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C8A1179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578105076;
	bh=vzjhD0/tmEzyLYsIyg5F8ZiWRa2GzooVLjr9d/X6NIA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lbzdm8z/H8kzDN1Ia1ywf28E2rvMa4jeTmFWlqrOEiIsh+Yj/H8yDBWwwqOeFl4PF
	 7K3TTNQcyRl+uvRQgvdxRWC1so6zlLDaQko9UkCTaNDwC5+/OZYUis1J67lKaURN2d
	 eYFWygX4wKj/z7fZqMokNVx+IaArBIhKNq6PmLyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CED8F8020B;
	Sat,  4 Jan 2020 03:29:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C5F4F80157; Sat,  4 Jan 2020 03:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 880F6F80100
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 03:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 880F6F80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 18:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,393,1571727600"; d="scan'208";a="221781424"
Received: from dwedney-mobl2.amr.corp.intel.com (HELO [10.251.140.10])
 ([10.251.140.10])
 by orsmga006.jf.intel.com with ESMTP; 03 Jan 2020 18:29:21 -0800
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20200103233401.160654-1-cujomalainey@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f7420fdd-2591-225e-55e4-34e69ac5292c@linux.intel.com>
Date: Fri, 3 Jan 2020 20:29:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103233401.160654-1-cujomalainey@chromium.org>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: add spi driver compile
 switches
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



On 1/3/20 5:34 PM, Curtis Malainey wrote:
> If the SPI driver is not compiled in then the RT5677_SPI driver will not
> be included as well which will cause the bdw-rt5677 driver to fail to
> probe since the DSP components are managed by the RT5677_SPI driver. The
> solution is to remove them when the driver is not present as part of the
> build.

it should be the other way around, this machine driver should have a 
dependency on SPI and select RT5677_SPI?

That said, even with this fix, I still see issues, somehow the 
spi-RT5677AA component does not probe/register, see 
https://github.com/thesofproject/linux/pull/1659

There must be an additional issue with SPI support here.

> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> CC: Pan Xiuli <xiuli.pan@linux.intel.com>
> ---
>   sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 2af8e5a62da84..d5ded2c545d2c 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -74,11 +74,13 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
>   	/* CODEC BE connections */
>   	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
>   	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
>   	{"DSP Capture", NULL, "DSP Buffer"},
>   
>   	/* DSP Clock Connections */
>   	{ "DSP Buffer", NULL, "SSP0 CODEC IN" },
>   	{ "SSP0 CODEC IN", NULL, "DSPTX" },
> +#endif
>   };
>   
>   static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
> @@ -319,6 +321,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   		SND_SOC_DAILINK_REG(fe, dummy, platform),
>   	},
>   
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
>   	/* Non-DPCM links */
>   	{
>   		.name = "Codec DSP",
> @@ -326,6 +329,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   		.ops = &bdw_rt5677_dsp_ops,
>   		SND_SOC_DAILINK_REG(dsp),
>   	},
> +#endif
>   
>   	/* Back End DAI links */
>   	{
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
