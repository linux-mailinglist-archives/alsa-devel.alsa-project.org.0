Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F2DE080
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 22:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4AAA1666;
	Sun, 20 Oct 2019 22:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4AAA1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571604036;
	bh=J8Ct/Mn+AMAYTxUHhT7wpPidqlPYKwjT2WcV08usUrc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7NvlIXPu4vhQdncrIaLR6GAWUKKO5LHHgib0mVQfNsl+lgVgQAligQp2cWaYujmO
	 DDb8bAceOVfa2F9jb/L/Gk4DvHNu0XqNwa47Z+QDOULo9aYXdf/A5BmzBgd9pNZneo
	 Fo2oWPN3rWLlnuZza1tNHagziCe3ng3PT7ZdYcEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B925F802FB;
	Sun, 20 Oct 2019 22:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8DCAF802FB; Sun, 20 Oct 2019 22:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F3DF800C0
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 22:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F3DF800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 13:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,320,1566889200"; d="scan'208";a="227112525"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.18.15])
 ([10.252.18.15])
 by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2019 13:38:35 -0700
To: Curtis Malainey <cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
 <20191018200449.141123-12-cujomalainey@chromium.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6be89c8d-e3d4-311f-667c-8e7096f76fab@intel.com>
Date: Sun, 20 Oct 2019 22:38:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018200449.141123-12-cujomalainey@chromium.org>
Content-Language: en-US
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 11/12] ASoC: rt5677: Set ADC clock to
 use PLL and enable ASRC
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

On 2019-10-18 22:04, Curtis Malainey wrote:
> Use the PLL to kept the correct 24M clock rate so frequency shift does
> not occur when using the DSP VAD.
> 

> +static int bdw_rt5677_dsp_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	int ret;
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 24576000,
> +		SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
> +		return ret;
> +	}
> +	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
> +		24000000, 24576000);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec pll configuration\n");
> +		return ret;

nitpick: you may skip "return ret" here and drop parenthesis as 
function's final line does the job.

> +	}
> +
> +	return ret;

If you decide to stick with leaving above as is, explicitly returning 0 
would be preferred.

> +}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
