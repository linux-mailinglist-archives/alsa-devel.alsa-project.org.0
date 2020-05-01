Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967061C1E4B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 22:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAA816BA;
	Fri,  1 May 2020 22:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAA816BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588364309;
	bh=DN9HjXtyNPMNzV33tIb75OYQOuAzSYlobJjZO16qERw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuyNR3HjNXVnTdPcF6lUuFSTQ0dx3JzDlnwTZVRINefhyVh4QUA6mqnar2GsBOsMT
	 adiZkRfVuqw5RgluKqDCKauRI5prsOp46jQwGsZDWUUo2+atA91bhT3pnMVI0Fj4q4
	 FtxWlbcDgdNzZ1uQLdzqd26BJpN7HMrfmfGMpnN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEEC6F80217;
	Fri,  1 May 2020 22:16:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9588F8022B; Fri,  1 May 2020 22:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D779F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 22:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D779F800B6
IronPort-SDR: j0AIjFIhykOvblOETk10pFt/5DLu8pG6fCb/rehpFmP4nccjmupMQ3liU+Df0DLP403h9kPIRt
 RCOfCiNFyiyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 13:16:37 -0700
IronPort-SDR: 1GzbZ0PLz8ewGXbhrI0UK885C79CRjvVf7gZORcwqO/LIVMBQf1s9CM8kxn22edyQqKkH8TQnh
 F4Um4u0bLAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; d="scan'208";a="276914737"
Received: from srodrig5-mobl2.amr.corp.intel.com (HELO [10.254.111.158])
 ([10.254.111.158])
 by orsmga002.jf.intel.com with ESMTP; 01 May 2020 13:16:35 -0700
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Radoslaw Biernacki <rad@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200501193141.30293-1-rad@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
Date: Fri, 1 May 2020 15:16:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501193141.30293-1-rad@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 Alex Levin <levinale@google.com>, John Hsu <KCHSU0@nuvoton.com>,
 linux-kernel@vger.kernel.org, michal.sienkiewicz@intel.com,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 5/1/20 2:31 PM, Radoslaw Biernacki wrote:
> This single fix address two issues on machines with nau88125:
> 1) Audio distortion, due to lack of required clock rate on MCLK line
> 2) Loud audible "pops" on headphones if there is no sysclk during nau8825
>     playback power up sequence
> 
> Explanation for:
> 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
>     rate (it can be only connected to XTAL parent clk). The BCLK pin
>     can be driven by dividers and therefore FW is able to set it to rate
>     required by chosen audio format. According to nau8825 datasheet, 256*FS
>     sysclk gives the best audio quality and the only way to achieve this
>     (taking into account the above limitations) its to regenerate the MCLK
>     from BCLK on nau8825 side by FFL. Without required clk rate, audio is
>     distorted by added harmonics.

The BCLK is going to be a multiple of 50 * Fs due to clocking 
restrictions. Can the codec regenerate a good-enough sysclk from this?
> 
> 2) Currently Skylake does not output MCLK/FS when the back-end DAI op
>     hw_param is called, so we cannot switch to MCLK/FS in hw_param.  This
>     patch reduces pop by letting nau8825 keep using its internal VCO clock
>     during widget power up sequence, until SNDRV_PCM_TRIGGER_START when
>     MCLK/FS is available. Once device resumes, the system will only enable
>     power sequence for playback without doing hardware parameter, audio
>     format, and PLL configure. In the mean time, the jack detecion sequence
>     has changed PLL parameters and switched to internal clock. Thus, the
>     playback signal distorted without correct PLL parameters.  That is why
>     we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME case.

IIRC the FS can be controlled with the clk_ api with the Skylake driver, 
as done for some KBL platforms. Or is this not supported by the firmware 
used by this machine?

> -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
> -	struct snd_pcm_hw_params *params)
> +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_pcm_runtime *runtime = substream->runtime;
>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> -	int ret;
> -
> -	ret = snd_soc_dai_set_sysclk(codec_dai,
> -			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> +	int ret = 0;
>   
> -	if (ret < 0)
> -		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
> +			break;
> +		}
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> +					  runtime->rate * 256);
> +		if (ret < 0)
> +			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> +		break;
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> +					  runtime->rate * 256);
> +		if (ret < 0)
> +			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> +		msleep(20);

is there a reason why you'd need a msleep for resume and not for start?
