Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9063B0F88
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 15:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FFEE174B;
	Thu, 12 Sep 2019 15:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FFEE174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568293497;
	bh=wXkZoAgXjAsFzXzAiQWAdn5txHW8x79MIikIPHVM058=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwXd+33ctPjrj7jka7RLhta+LVMXh8gi7lK1jvLd4xqxKmnkQUcaD2qrKShugL9oU
	 fQbwgY65oLTvQqA7muZdS3MVEL+Hy5lyCy24pzqV2Sf+DkDv7vbg5OUh5cYcxWlnYP
	 TLhrkeOLxF9SxvbnzO931iWxjAL5j0GBSpCT10yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B1A9F80393;
	Thu, 12 Sep 2019 15:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AFEAF80368; Thu, 12 Sep 2019 15:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5A29F801ED
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 15:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A29F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 06:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,497,1559545200"; d="scan'208";a="215037563"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2019 06:02:43 -0700
Received: from vjyoung-mobl.amr.corp.intel.com (unknown [10.251.12.73])
 by linux.intel.com (Postfix) with ESMTP id 3F784580862;
 Thu, 12 Sep 2019 06:02:42 -0700 (PDT)
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20190912022740.161798-1-yuhsuan@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
Date: Thu, 12 Sep 2019 08:02:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912022740.161798-1-yuhsuan@chromium.org>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927:
 Add dmic format constraint
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

On 9/11/19 9:27 PM, Yu-Hsuan Hsu wrote:
> 24 bits recording from DMIC is not supported for KBL platform because
> the TDM slot between PCH and codec is 16 bits only. We should add a
> constraint to remove that unsupported format.

Humm, when you use DMICs they are directly connected to the PCH with a 
standard 1-bit PDM. There is no notion of TDM or slot.

It could very well be that the firmware/topology only support 16 bit (I 
vaguely recall another case where 24 bits was added), but the 
description in the commit message would need to be modified to make the 
reason for this change clearer.

> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>   sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index 74dda8784f1a01..67b276a65a8d2d 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -400,6 +400,9 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
>   	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
>   			dmic_constraints);
>   
> +	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
> +
>   	return snd_pcm_hw_constraint_list(substream->runtime, 0,
>   			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
>   }
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
