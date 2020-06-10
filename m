Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14C1F56A7
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 16:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C58166D;
	Wed, 10 Jun 2020 16:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C58166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591798497;
	bh=SKjYSMyhMk/KfMQALV4t8Rgr6OC7zA2wtp0LNxPKgI4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqKawXQsslEkhGm5o1L/yaqzZ93Hjx13nd4X5TMTtRBoXuiR5VrSLysAkVBDSHak/
	 s61N7+qW/0ks4sHwvaVcYutX6ZgZI/D53vSXPLITfO/CPavedTW4OKi0cA2IbE0lmN
	 5MU4Sr5deMvcH2wUyjSruVcbu3thwkhtbSLfmRII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ADC8F80252;
	Wed, 10 Jun 2020 16:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E21A1F8024A; Wed, 10 Jun 2020 16:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95ABAF80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 16:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ABAF80058
IronPort-SDR: 8RjnLnjdGbFWSFhO7/igpT8rXQkXpd6/5KdEvxaJQukwBnHGupIWi5F6iENOAIS1PgweVNohPp
 l39cmC0d/GxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 07:12:39 -0700
IronPort-SDR: fKrJXsTqhlPXdaj5uo+Plq6f24Ee0V34xRBDERFPAU1oT+dwqd1TjgEWVneFvEOvOqdcHz0O1c
 x2BU4QuL/X4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; d="scan'208";a="473350013"
Received: from opolat-mobl.amr.corp.intel.com (HELO [10.251.2.3])
 ([10.251.2.3])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2020 07:12:38 -0700
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <694dd437-3453-7328-f544-28106c1c366d@linux.intel.com>
Date: Wed, 10 Jun 2020 07:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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



On 6/10/20 5:07 AM, Srinivas Kandagatla wrote:
> For gapless playback call to snd_compr_drain_notify() after
> partial drain should put the state to SNDRV_PCM_STATE_RUNNING
> rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
> process the buffers for new track.
> 
> With existing code, if we are playing 3 tracks in gapless, after

The gapless playback only deals with transitions between two tracks of 
identical format. I am not sure what the reference to 3 tracks means.

> partial drain finished on previous track 1 the state is set to
> SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
> after data write. With this state calls to snd_compr_next_track() and
> few other calls will fail as they expect the state to be in
> SNDRV_PCM_STATE_RUNNING.
> 
> Here is the sequence of events and state transitions:
> 
> 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
> 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
> 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
> 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
> 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
> 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
> 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
> 8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
> 9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING
> 
> Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other compress functions (v6)")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> I wonder who did gapless work on upstream so far?

IIRC the only users of gapless playback are Android platforms, where the 
HAL deals with the transitions. I am not aware of any plain vanilla 
Linux solution.

> 
>   include/sound/compress_driver.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
> index 6ce8effa0b12..eabac33864c2 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -182,7 +182,7 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
>   	if (snd_BUG_ON(!stream))
>   		return;
>   
> -	stream->runtime->state = SNDRV_PCM_STATE_SETUP;
> +	stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>   
>   	wake_up(&stream->runtime->sleep);
>   }
> 
