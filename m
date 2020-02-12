Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5515B4B0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 00:28:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709121671;
	Thu, 13 Feb 2020 00:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709121671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581550116;
	bh=oWgvAjrbTEBre5BEUZc90jVVc9B3XmQQ1Xf6ImxD8Io=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9aA5s1HY45VXVDCnTi9bjVQYUAByfew3EugvPPxvu0f1KNjo+KJ0ntfU9m48QoFX
	 MWRQBpkfUb3/L3PCEGflFJPrNBqwx7n9UuuJHEyShI6MP+k99VV5NEX2/zz9D8Z6rK
	 L7En/I48bIplTVHlpPpf3Xu5UtZBKaMeT+rlnmQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E95CF80157;
	Thu, 13 Feb 2020 00:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48600F80157; Thu, 13 Feb 2020 00:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7832F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7832F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 15:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; d="scan'208";a="347613803"
Received: from mrangan-mobl1.amr.corp.intel.com (HELO [10.252.204.72])
 ([10.252.204.72])
 by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2020 15:26:44 -0800
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20200129195907.12197-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1a8475a4-d7d6-7a09-0540-4aa1ceedbe2f@linux.intel.com>
Date: Wed, 12 Feb 2020 17:26:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129195907.12197-1-tiwai@suse.de>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: Fix memory leak at closing a
 stream without hw_free
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



On 1/29/20 1:59 PM, Takashi Iwai wrote:
> ALSA PCM core recently introduced a new managed PCM buffer allocation
> mode that does allocate / free automatically at hw_params and
> hw_free.  However, it overlooked the code path directly calling
> hw_free PCM ops at releasing the PCM substream, and it may result in a
> memory leak as spotted by syzkaller when no buffer preallocation is
> used (e.g. vmalloc buffer).
> 
> This patch papers over it with a slight refactoring.  The hw_free ops
> call and relevant tasks are unified in a new helper function, and call
> it from both places.
> 
> Fixes: 0dba808eae26 ("ALSA: pcm: Introduce managed buffer allocation mode")
> Reported-by: syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Takashi, this patch introduces a regression for our SoundWire work - 
credits to Bard Liao for reporting this the first.

We see the hw_free() being called twice and as a result the SoundWire 
stream state becomes inconsistent, with some memory becoming corrupted:

[  107.864109] sof-audio-pci 0000:00:1f.3: pcm: free stream 0 dir 0
[  107.864324] sof-audio-pci 0000:00:1f.3: ipc tx: 0x80010000: 
GLB_DAI_MSG: CONFIG
[  107.864507] sof-audio-pci 0000:00:1f.3: ipc tx succeeded: 0x80010000: 
GLB_DAI_MSG: CONFIG
[  107.864615] sof-audio-pci 0000:00:1f.3: pcm: free stream 0 dir 0
[  107.864627] sdw_deprepare_stream: \xc0Pjf\xe0\xa3\xff\xff: 
inconsistent state state 6
[  107.864640] int-sdw int-sdw.0: sdw_deprepare_stream: failed -22

we detected this while merging your latest code as part of our weekly 
rebase, then realized the error was already present in v5.6-rc1 and 
continued to narrow the scope to sound-fix-5.6-rc1 and this specific patch.

I can't claim to fully understand the code in this patch, but I am not 
sure why hw_free() ends up being unconditionally called at [1] below

> ---
>   sound/core/pcm_native.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index bb23f5066654..4ac42ee1238c 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -786,10 +786,22 @@ static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
>   	return err;
>   }
>   
> +static int do_hw_free(struct snd_pcm_substream *substream)
> +{
> +	int result = 0;
> +
> +	snd_pcm_sync_stop(substream);
> +	if (substream->ops->hw_free)
> +		result = substream->ops->hw_free(substream);
> +	if (substream->managed_buffer_alloc)
> +		snd_pcm_lib_free_pages(substream);
> +	return result;
> +}
> +
>   static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
>   {
>   	struct snd_pcm_runtime *runtime;
> -	int result = 0;
> +	int result;
>   
>   	if (PCM_RUNTIME_CHECK(substream))
>   		return -ENXIO;
> @@ -806,11 +818,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
>   	snd_pcm_stream_unlock_irq(substream);
>   	if (atomic_read(&substream->mmap_count))
>   		return -EBADFD;
> -	snd_pcm_sync_stop(substream);
> -	if (substream->ops->hw_free)
> -		result = substream->ops->hw_free(substream);
> -	if (substream->managed_buffer_alloc)
> -		snd_pcm_lib_free_pages(substream);
> +	result = do_hw_free(substream);
>   	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
>   	pm_qos_remove_request(&substream->latency_pm_qos_req);
>   	return result;
> @@ -2529,9 +2537,7 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
>   
>   	snd_pcm_drop(substream);
>   	if (substream->hw_opened) {
> -		if (substream->ops->hw_free &&
> -		    substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
> -			substream->ops->hw_free(substream);
> +		do_hw_free(substream);

[1] don't we need to only do the hw_free() when	

substream->runtime->status->state != SNDRV_PCM_STATE_OPEN

e.g. with the following patch?

Or is the expectation that the hw_free() callback be implemented so that 
only the first call has an effect?

Thanks
-Pierre

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 336406bcb59e..051a1f234975 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -787,12 +787,12 @@ static int snd_pcm_hw_params_user(struct 
snd_pcm_substream *substream,
         return err;
  }

-static int do_hw_free(struct snd_pcm_substream *substream)
+static int do_hw_free(struct snd_pcm_substream *substream, bool cond_free)
  {
         int result = 0;

         snd_pcm_sync_stop(substream);
-       if (substream->ops->hw_free)
+       if (cond_free && substream->ops->hw_free)
                 result = substream->ops->hw_free(substream);
         if (substream->managed_buffer_alloc)
                 snd_pcm_lib_free_pages(substream);
@@ -819,7 +819,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream 
*substream)
         snd_pcm_stream_unlock_irq(substream);
         if (atomic_read(&substream->mmap_count))
                 return -EBADFD;
-       result = do_hw_free(substream);
+       result = do_hw_free(substream, true);
         snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
         pm_qos_remove_request(&substream->latency_pm_qos_req);
         return result;
@@ -2594,7 +2594,9 @@ void snd_pcm_release_substream(struct 
snd_pcm_substream *substream)

         snd_pcm_drop(substream);
         if (substream->hw_opened) {
-               do_hw_free(substream);
+               do_hw_free(substream,
+                          substream->runtime->status->state !=
+                          SNDRV_PCM_STATE_OPEN);
                 substream->ops->close(substream);
                 substream->hw_opened = 0;
         }
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
