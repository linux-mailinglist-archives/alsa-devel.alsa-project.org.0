Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFC360BC3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 16:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01431678;
	Thu, 15 Apr 2021 16:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01431678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618496791;
	bh=ODhAMgYgi9zrBUw6OwvQ3zy//ZRG92bBUEyFkcjFKmo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yv9zY3v2zdk1cFIJzGJdwFXXeMS7u8gUo2Jjo5fUuJr1VZ30vcXK/Mzi93fYM1BPu
	 9dLeg/G0YAcz6CKYg7hOKa7tM4UD1X4EJnQGRH1p1Pj16vbYHbUYia35AnCmmqWYnd
	 ZoTi+fPQ7SoSH0xMWMHs+u4ZQ3jSMAmY0TlmPe/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE32F8022B;
	Thu, 15 Apr 2021 16:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC9BF8022B; Thu, 15 Apr 2021 16:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A1DF800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 16:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A1DF800ED
IronPort-SDR: ODWaygZapKD83B/YVtSFYYAWbOSRTxHMcnC39fXZuZQwKAPvpxfoxRRZJ1G7Khxp3FJ/FFmYVM
 TzN4v3pgd4xQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="215367101"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="215367101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 07:24:49 -0700
IronPort-SDR: pKDKQflmVg1fjr500lbZygAhcwhvaDcQaREdvysUl4WeM6ChjHgiUhoUT4ljOeQBl2hJZ5fzGO
 VJ6yiDlb2oSg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="452932231"
Received: from allanagx-mobl.amr.corp.intel.com (HELO [10.213.172.37])
 ([10.213.172.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 07:24:47 -0700
Subject: Re: [PATCH v1] ASoC: Intel: kbl_da7219_max98927: Fix
 kabylake_ssp_fixup function
To: Lukasz Majczak <lma@semihalf.com>, Mark Brown <broonie@kernel.org>,
 Harsha Priya <harshapriya.n@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
References: <20210415124347.475432-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a4c8f5d0-5bc1-1b7e-c7a5-731c9f6f7951@linux.intel.com>
Date: Thu, 15 Apr 2021 09:24:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415124347.475432-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 4/15/21 7:43 AM, Lukasz Majczak wrote:
> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
> codecs DAIs. The HW parameters are changed based on the codec DAI of the
> stream. The earlier approach to get snd_soc_dpcm was using container_of()
> macro on snd_pcm_hw_params.
> 
> The structures have been modified over time and snd_soc_dpcm does not have
> snd_pcm_hw_params as a reference but as a copy. This causes the current
> driver to crash when used.
> 
> This patch changes the way snd_soc_dpcm is extracted. snd_soc_pcm_runtime
> holds 2 dpcm instances (one for playback and one for capture). 2 codecs
> on the SSP are dmic (capture) and speakers (playback). Based on the
> stream direction, snd_soc_dpcm is extracted from snd_soc_pcm_runtime.
> 
> Tested for all use cases of the driver.
> Based on similar fix in kbl_rt5663_rt5514_max98927.c
> from Harsha Priya <harshapriya.n@intel.com> and
> Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> 
> Cc: <stable@vger.kernel.org> # 5.4+
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
> Hi,
> This is basically a cherry-pick of this change:
> https://patchwork.kernel.org/project/alsa-devel/patch/1595432147-11166-1-git-send-email-harshapriya.n@intel.com/
> just applied to the kbl_da7219_max98927.
> Best regards,
> Lukasz

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>   sound/soc/intel/boards/kbl_da7219_max98927.c | 38 +++++++++++++++-----
>   1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
> index 9dfe5bd9180d..4b7b4a044f81 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
> @@ -284,11 +284,33 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	struct snd_interval *chan = hw_param_interval(params,
>   			SNDRV_PCM_HW_PARAM_CHANNELS);
>   	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> -	struct snd_soc_dpcm *dpcm = container_of(
> -			params, struct snd_soc_dpcm, hw_params);
> -	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
> -	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
> +	struct snd_soc_dpcm *dpcm, *rtd_dpcm = NULL;
>   
> +	/*
> +	 * The following loop will be called only for playback stream
> +	 * In this platform, there is only one playback device on every SSP
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
> +		rtd_dpcm = dpcm;
> +		break;
> +	}
> +
> +	/*
> +	 * This following loop will be called only for capture stream
> +	 * In this platform, there is only one capture device on every SSP
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
> +		rtd_dpcm = dpcm;
> +		break;
> +	}
> +
> +	if (!rtd_dpcm)
> +		return -EINVAL;
> +
> +	/*
> +	 * The above 2 loops are mutually exclusive based on the stream direction,
> +	 * thus rtd_dpcm variable will never be overwritten
> +	 */
>   	/*
>   	 * Topology for kblda7219m98373 & kblmax98373 supports only S24_LE,
>   	 * where as kblda7219m98927 & kblmax98927 supports S16_LE by default.
> @@ -311,9 +333,9 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	/*
>   	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
>   	 */
> -	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> +	if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Port") ||
> +	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Headset Playback") ||
> +	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Capture Port")) {
>   		rate->min = rate->max = 48000;
>   		chan->min = chan->max = 2;
>   		snd_mask_none(fmt);
> @@ -324,7 +346,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
>   	 * thus changing the mask here
>   	 */
> -	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> +	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
>   
>   	return 0;
> 
