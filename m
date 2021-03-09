Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187363341D7
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 16:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B82E1766;
	Wed, 10 Mar 2021 16:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B82E1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615391171;
	bh=tx/9UbyWP62s1AzeQbD6onnCJC8esk80V93MuzCO9co=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afJCtRp5fGBrzRDWBF269lGG+nbFwzd85J4QifkcbAkIIHFmG/tkDwXfcpMa2fT/v
	 m+KZJXzw7hqfImOiwSYWPh16Edh9cOGhJ1IvuH98IqxoijXonVB9isb2mn8otc4k3y
	 btCFX4v46DIvp+igLGFv2Uw/tL/UHQMb7EBRzf4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E28F8012F;
	Wed, 10 Mar 2021 16:45:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E52AF801ED; Wed, 10 Mar 2021 16:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DATE_IN_PAST_24_48,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7225CF801ED
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 16:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7225CF801ED
IronPort-SDR: R8NmnCqWW6Nsv72rZRI1lzHx70IJgb5jTvdw4pqBhhht+yMPapXR2jYq/ekjGv/unSgFfqBoTa
 guCEcLY47aLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188589622"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="188589622"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:05 -0800
IronPort-SDR: bJoetfJQdo2Mqithq6cYhg1ze7mg1rBC+JgG1QFYsi4XFEuwqitZbMdGDGV7EJ48bglsJ88CBe
 WYC2xm4L8SJg==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="403722124"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84])
 ([10.212.214.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:03 -0800
Subject: Re: [PATCH 2/2] ASoC: intel: atom: Remove 44100 sample-rate from the
 media and deep-buffer DAI descriptions
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210309105520.9185-1-hdegoede@redhat.com>
 <20210309105520.9185-2-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c470f8bc-97de-3f51-2efe-dc1c42119040@linux.intel.com>
Date: Tue, 9 Mar 2021 09:35:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210309105520.9185-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 3/9/21 4:55 AM, Hans de Goede wrote:
> The media and deep-buffer DAIs only support 48000 Hz samplerate,
> remove the 44100 sample-rate from their descriptions.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This only worked when an SRC was added, but I don't think it was ever 
released, so

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index aa5dd590ddd5..4124aa2fc247 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -487,14 +487,14 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>   		.stream_name = "Headset Playback",
>   		.channels_min = SST_STEREO,
>   		.channels_max = SST_STEREO,
> -		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> +		.rates = SNDRV_PCM_RATE_48000,
>   		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   	.capture = {
>   		.stream_name = "Headset Capture",
>   		.channels_min = 1,
>   		.channels_max = 2,
> -		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> +		.rates = SNDRV_PCM_RATE_48000,
>   		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   },
> @@ -505,7 +505,7 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>   		.stream_name = "Deepbuffer Playback",
>   		.channels_min = SST_STEREO,
>   		.channels_max = SST_STEREO,
> -		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> +		.rates = SNDRV_PCM_RATE_48000,
>   		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   },
> 
