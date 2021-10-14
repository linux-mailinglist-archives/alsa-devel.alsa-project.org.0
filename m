Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD4642DEC9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 18:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79029166E;
	Thu, 14 Oct 2021 18:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79029166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634227255;
	bh=Zq0NHD5Ya4QywpZsdrXnYjjEyRaqJtLP51pyW7D7Fq4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmXZuZuK9cKKHSfs+7kfOPhRNI3Kn1MF6zZaQSa275jWRkQI1mtFvoh4I25t7tqd7
	 8m6Vq5K1eRDloYWPcpyE6K/rNJZrioYH7MP2HNfZnnxGpPqTUKV51w3BYxkL/9KbNA
	 iIhVGXopYJY6z0N8vbRaLt8YI2t5Z0fhuXO3YUD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5F7F80245;
	Thu, 14 Oct 2021 17:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAD7BF80212; Thu, 14 Oct 2021 17:59:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DAFF8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 17:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DAFF8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="251144875"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="251144875"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:59:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461233999"
Received: from ktrimble-mobl.amr.corp.intel.com (HELO [10.209.188.150])
 ([10.209.188.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:59:24 -0700
Subject: Re: [PATCH] ALSA: pcm: Unify snd_pcm_delay() and snd_pcm_hwsync()
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20211014145323.26506-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <08dec63b-4748-e165-73b4-88a5d2db9597@linux.intel.com>
Date: Thu, 14 Oct 2021 10:59:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014145323.26506-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 10/14/21 9:53 AM, Takashi Iwai wrote:
> Both snd_pcm_delay() and snd_pcm_hwsync() do the almost same thing.
> The only difference is that the former calculate the delay, so unify
> them as a code cleanup, and treat NULL delay argument only for hwsync
> operation.
> 
> Also, the patch does a slight code refactoring in snd_pcm_delay().
> The initialization of the delay value is done in the caller side now.

I would have done the opposite change, i.e. keep snd_pcm_hwsync() but
add an optional delay argument/calculation.

'snd_pcm_delay' doesn't really hint at any hwsync operation.

Just a naming difference really.

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/pcm_native.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 46c643db18eb..627b201b6084 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2932,32 +2932,24 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
>  	return ret;
>  }
>  
> -static int snd_pcm_hwsync(struct snd_pcm_substream *substream)
> -{
> -	int err;
> -
> -	snd_pcm_stream_lock_irq(substream);
> -	err = do_pcm_hwsync(substream);
> -	snd_pcm_stream_unlock_irq(substream);
> -	return err;
> -}
> -		
>  static int snd_pcm_delay(struct snd_pcm_substream *substream,
>  			 snd_pcm_sframes_t *delay)
>  {
>  	int err;
> -	snd_pcm_sframes_t n = 0;
>  
>  	snd_pcm_stream_lock_irq(substream);
>  	err = do_pcm_hwsync(substream);
> -	if (!err)
> -		n = snd_pcm_calc_delay(substream);
> +	if (delay && !err)
> +		*delay = snd_pcm_calc_delay(substream);
>  	snd_pcm_stream_unlock_irq(substream);
> -	if (!err)
> -		*delay = n;
>  	return err;
>  }
>  		
> +static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
> +{
> +	return snd_pcm_delay(substream, NULL);
> +}
> +
>  static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
>  			    struct snd_pcm_sync_ptr __user *_sync_ptr)
>  {
> @@ -3275,7 +3267,7 @@ static int snd_pcm_common_ioctl(struct file *file,
>  		return snd_pcm_hwsync(substream);
>  	case SNDRV_PCM_IOCTL_DELAY:
>  	{
> -		snd_pcm_sframes_t delay;
> +		snd_pcm_sframes_t delay = 0;
>  		snd_pcm_sframes_t __user *res = arg;
>  		int err;
>  
> 
