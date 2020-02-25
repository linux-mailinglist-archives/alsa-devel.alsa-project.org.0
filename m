Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E400916F27C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 23:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37BE2168D;
	Tue, 25 Feb 2020 23:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37BE2168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582668892;
	bh=MhNmvQbW+vghvzkuDj8h3c/6YB3oBskm7VEsd1ld9AA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVG1knUwWPbpJQu7dDsYrsupCIx3CAI8/LeOjecPo8wAqo2xna3e+A/X1vIYwY91t
	 n6/NzPpz+fLh88dkDmTPGj9XYVcLjgbq2VWAoK/svdnq1t19vIGY3sZQBmC21ICndN
	 h9Iv2Rc4mbYLrCKOVMrFeqeGmxvMG/fA+IwKASMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E09F80096;
	Tue, 25 Feb 2020 23:13:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30562F800AD; Tue, 25 Feb 2020 23:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDFC2F800AD
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 23:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDFC2F800AD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 14:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="256101945"
Received: from jcastell-mobl1.amr.corp.intel.com (HELO [10.251.141.17])
 ([10.251.141.17])
 by orsmga002.jf.intel.com with ESMTP; 25 Feb 2020 14:13:01 -0800
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1015: add rt1015 amplifier driver
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20200114025628.4241-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <754ef0d7-d265-00a2-218a-072f086c3e02@linux.intel.com>
Date: Tue, 25 Feb 2020 16:08:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114025628.4241-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, mingjane_hsieh@realtek.com, flove@realtek.com
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

Now that we have a machine driver based on this rt1015 amplifier, our 
sparse checks report two minor issues with this driver:

> +struct snd_soc_dai_ops rt1015_aif_dai_ops = {
> +	.hw_params = rt1015_hw_params,
> +	.set_fmt = rt1015_set_dai_fmt,
> +};

This structure is not defined so could be static, but doing so shows 
it's not used either?

> +struct snd_soc_dai_driver rt1015_dai[] = {
> +	{
> +		.name = "rt1015-aif",
> +		.id = 0,
> +		.playback = {
> +			.stream_name = "AIF Playback",
> +			.channels_min = 1,
> +			.channels_max = 4,
> +			.rates = RT1015_STEREO_RATES,
> +			.formats = RT1015_FORMATS,
> +		},
> +	}
> +};

This should be declared as static.

see logs below for reference.

  CHECK   sound/soc/codecs/rt1015.c
/soc/codecs/rt1015.c:844:24: warning: symbol 'rt1015_aif_dai_ops' was 
not declared. Should it be static?
sound/soc/codecs/rt1015.c:849:27: warning: symbol 'rt1015_dai' was not 
declared. Should it be static?

  CC [M]  sound/soc/codecs/rt1015.o
sound/soc/codecs/rt1015.c:844:31: warning: ‘rt1015_aif_dai_ops’ defined 
but not used [-Wunused-variable]
   844 | static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
       |

Thanks!
