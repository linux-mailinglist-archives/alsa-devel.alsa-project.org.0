Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF314F7877
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A9A170D;
	Thu,  7 Apr 2022 09:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A9A170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649318398;
	bh=2OplKaOUvt4/BrYiGUVPn09DHMsIm1uis2qwqILWRcM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZiKLcwOFh7zUfNavJ40YomnrPKptUaRj1OejdHFQtlcuATHFNjeOOARUMl9V/BLc
	 aNU0fNwLTonoiBQJZrRgBcWCUoA1s3AspckJq33QxeKjKxJwmHIRKTlMhmieGtbC3S
	 LAqMsGeGUKe7xBQDR2d11bUnzW+88tBk3AVtj10k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 163E8F8012A;
	Thu,  7 Apr 2022 09:59:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8670F8012A; Thu,  7 Apr 2022 09:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA24BF80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA24BF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MmYxDHqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649318333; x=1680854333;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2OplKaOUvt4/BrYiGUVPn09DHMsIm1uis2qwqILWRcM=;
 b=MmYxDHqM0/HKB4J7ECox7e0dInJf7ymU38d32Yd2SkE6EQzezhLBpsii
 4Ey+48dmNl+8g6NstPyH7veKdMRXcFvMCc8HkpeECVRuHtw5Ovc9EcAaG
 8yHQnBOyF00PwwjMZLHXwH64wN0Vdj7n0Dp1frm8dAY96UwJWQ4NEYeK4
 75yCk4jszT9uu/Kmr4Kdx3fLNT+AQFrPZkjfkPoV0bV2VsX68OpZjBjTP
 Vtb7IhkVASzuRFNRaM46HfdJfK6TzCCYdJjQSV/miRSliMvu2cHpLwpmL
 0K1m68wIS8b3kILMzgyhYp+lJFUNw5E0T898GTustHRZ+60LvJfcmulsH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248780712"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="248780712"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:58:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="658969023"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.90])
 ([10.99.241.90])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:58:43 -0700
Message-ID: <bf8b2067-3d5d-c368-68b0-f5ab58d9c5b7@linux.intel.com>
Date: Thu, 7 Apr 2022 09:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
 <20220406190056.233481-2-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220406190056.233481-2-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 4/6/2022 9:00 PM, Pierre-Louis Bossart wrote:
> Commit 3aa1e96a2b95 ("ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE")
> did not modify the existing logic and kept the same logic for the following
> transition
> 
>      play FE1    -> BE state is START
>      pause FE1   -> BE state is PAUSED
>      play FE2    -> BE state is START
>      stop FE2    -> BE state is STOP <<< !!
>      release FE1 -> BE state is START
>      stop FE1    -> BE state is STOP
> 
> At the time it was identified by reviewers that a better solution
> might consist in
> 
>      play FE1    -> BE state is START
>      pause FE1   -> BE state is PAUSED
>      play FE2    -> BE state is START
>      stop FE2    -> BE state is PAUSE <<< !!
>      release FE1 -> BE state is START
>      stop FE1    -> BE state is STOP
> 
> This patch suggest a transition to PAUSE when all the 'active' streams
> are paused. This would allow for a more consistent resource management
> for platforms where PAUSE and STOP are handled differently.
> 
> To track the special case of an FE going from PAUSE_PUSH to STOP, we
> add a state variable for each FE context. This 'fe_pause' boolean is
> set on PAUSE_PUSH and cleared on either PAUSE_RELEASE and STOP
> triggers.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   include/sound/soc-dpcm.h |  2 ++
>   sound/soc/soc-pcm.c      | 31 ++++++++++++++++++++++++++++---
>   2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
> index 75b92d883976..5b689c663290 100644
> --- a/include/sound/soc-dpcm.h
> +++ b/include/sound/soc-dpcm.h
> @@ -103,6 +103,8 @@ struct snd_soc_dpcm_runtime {
>   	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
>   
>   	int be_start; /* refcount protected by BE stream pcm lock */
> +	int be_pause; /* refcount protected by BE stream pcm lock */
> +	bool fe_pause; /* used to track STOP after PAUSE */
>   };
>   
>   #define for_each_dpcm_fe(be, stream, _dpcm)				\
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 11c9853e9e80..e8700dd1839f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2090,6 +2090,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   			       int cmd)
>   {
>   	struct snd_soc_pcm_runtime *be;
> +	bool pause_stop_transition;
>   	struct snd_soc_dpcm *dpcm;
>   	unsigned long flags;
>   	int ret = 0;
> @@ -2148,10 +2149,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>   			if (!be->dpcm[stream].be_start &&
>   			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
> -			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
>   			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>   				goto next;
>   
> +			fe->dpcm[stream].fe_pause = false;
> +			be->dpcm[stream].be_pause--;
> +
>   			be->dpcm[stream].be_start++;
>   			if (be->dpcm[stream].be_start != 1)
>   				goto next;
> @@ -2175,14 +2178,33 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   			if (be->dpcm[stream].be_start != 0)
>   				goto next;
>   
> -			ret = soc_pcm_trigger(be_substream, cmd);
> +			pause_stop_transition = false;
> +			if (fe->dpcm[stream].fe_pause) {

As you access fe here anyway, any chance something like
if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_PAUSED)
can be used here instead of adding fe_pause to snd_soc_dpcm_runtime?

> +				pause_stop_transition = true;
> +				fe->dpcm[stream].fe_pause = false;
> +				be->dpcm[stream].be_pause--;
> +			}
> +
> +			if (be->dpcm[stream].be_pause != 0)
> +				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
> +			else
> +				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_STOP);
> +
>   			if (ret) {
>   				if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
>   					be->dpcm[stream].be_start++;
> +				if (pause_stop_transition) {
> +					fe->dpcm[stream].fe_pause = true;
> +					be->dpcm[stream].be_pause++;
> +				}
>   				goto next;
>   			}
>   
> -			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
> +			if (be->dpcm[stream].be_pause != 0)
> +				be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
> +			else
> +				be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
> +
>   			break;
>   		case SNDRV_PCM_TRIGGER_SUSPEND:
>   			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
> @@ -2204,6 +2226,9 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>   				goto next;
>   
> +			fe->dpcm[stream].fe_pause = true;
> +			be->dpcm[stream].be_pause++;
> +
>   			be->dpcm[stream].be_start--;
>   			if (be->dpcm[stream].be_start != 0)
>   				goto next;

