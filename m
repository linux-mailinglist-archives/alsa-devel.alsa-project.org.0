Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D73341DC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 16:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15CBE1775;
	Wed, 10 Mar 2021 16:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15CBE1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615391210;
	bh=xxFA1J8CssuXlRu/vxFFbFJZds1v+VFhTjVKhBPqdss=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbAEf/bS55J/gMVk4IU8E6Uf3XsIkH0fqX5bycZp/LwmzJHF55Gif3qmcTuTcEF5x
	 BSSf8CZM8/LFh7Qm8TeAzmjovZZft9Hn08NnL7RT3rkoM3jst3T/e6c/1/mVPV8w3m
	 KgljQh5VMoi0Me3/fA3CQBBFlxSqxUDnohQs2C5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10155F8032C;
	Wed, 10 Mar 2021 16:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D41C3F8020D; Wed, 10 Mar 2021 16:45:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DATE_IN_PAST_24_48,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D7CF8020D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 16:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D7CF8020D
IronPort-SDR: AWRVM9++Yx+C/ViOXE4dkdASavE3Z3v8imObKdsNaI/03nlzMI5A/gfvrdnNbyKMgTt6sY7Pif
 DfVJUVWobF/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188589634"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="188589634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:08 -0800
IronPort-SDR: EBn1OfYcIEnRmTsi2bRxfu/vCk1dJ/f+VsVMYYxw3enRy2DOO4/6dYG2GDIwk7WbTLZvBvQoT4
 VqA32q2iwYYQ==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="403722167"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84])
 ([10.212.214.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:45:07 -0800
Subject: Re: [PATCH 1/2] ASoC: intel: atom: Stop advertising non working S24LE
 support
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210309105520.9185-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e1af1b57-d384-0dce-6362-c39197cf2063@linux.intel.com>
Date: Tue, 9 Mar 2021 09:42:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210309105520.9185-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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
> The SST firmware's media and deep-buffer inputs are hardcoded to
> S16LE, the corresponding DAIs don't have a hw_params callback and
> their prepare callback also does not take the format into account.
> 
> So far the advertising of non working S24LE support has not caused
> issues because pulseaudio defaults to S16LE, but changing pulse-audio's
> config to use S24LE will result in broken sound.
> 
> Pipewire is replacing pulse now and pipewire prefers S24LE over S16LE
> when available, causing the problem of the broken S24LE support to
> come to the surface now.
> 
> Cc: stable@vger.kernel.org
> BugLink: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/866
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Humm, that is strange.
I can't recall such limitations in the firmware, and the SSP support 
does make use of 24 bits.
Please give me a couple of days to double-check what's missing.

> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 9e9b05883557..aa5dd590ddd5 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -488,14 +488,14 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>   		.channels_min = SST_STEREO,
>   		.channels_max = SST_STEREO,
>   		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   	.capture = {
>   		.stream_name = "Headset Capture",
>   		.channels_min = 1,
>   		.channels_max = 2,
>   		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   },
>   {
> @@ -506,7 +506,7 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>   		.channels_min = SST_STEREO,
>   		.channels_max = SST_STEREO,
>   		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>   	},
>   },
>   {
> 
