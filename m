Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906D15C1C0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F4A16AF;
	Thu, 13 Feb 2020 16:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F4A16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581607597;
	bh=V1bXtJqCZ5H1da+tVPIR5ISXTmfWMxZvLIgGVyqZinM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XueGBLyyf2S32ydlD6W2abtZjP/ZZT4Yrd/WRI8lwQb+nuqIDUHLM9QiPbT+w5qm8
	 AwSMI6nM/gunibP4xDx45m4XtkB2y+d7SqT8/iwHNM+BZkdD3UZt/1nhvkaROTtN3j
	 GM1G76GrjqsT3JcnEhCfZtxD//viDtT8qYnGB0dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3D3F80146;
	Thu, 13 Feb 2020 16:24:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E55CEF800F0; Thu, 13 Feb 2020 16:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34734F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34734F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 07:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; d="scan'208";a="227116947"
Received: from lmbraun-mobl.amr.corp.intel.com (HELO [10.255.84.93])
 ([10.255.84.93])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2020 07:24:43 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200129195907.12197-1-tiwai@suse.de>
 <1a8475a4-d7d6-7a09-0540-4aa1ceedbe2f@linux.intel.com>
 <s5hd0ajyprg.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <37dbe098-6545-bf4d-6457-bd06c5638450@linux.intel.com>
Date: Thu, 13 Feb 2020 09:24:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hd0ajyprg.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: pcm: Fix double hw_free calls
> 
> The commit 66f2d19f8116 ("ALSA: pcm: Fix memory leak at closing a
> stream without hw_free") tried to fix the regression wrt the missing
> hw_free call at closing without SNDRV_PCM_IOCTL_HW_FREE ioctl.
> However, the code change dropped mistakenly the state check, resulting
> in calling hw_free twice when SNDRV_PCM_IOCTL_HW_FRE got called
> beforehand.  For most drivers, this is almost harmless, but the
> drivers like SOF show another regression now.
> 
> This patch adds the state condition check before calling do_hw_free()
> at releasing the stream for avoiding the double hw_free calls.
> 
> Fixes: 66f2d19f8116 ("ALSA: pcm: Fix memory leak at closing a stream without hw_free")
> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Takashi!

> ---
>   sound/core/pcm_native.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 336406bcb59e..d5443eeb8b63 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2594,7 +2594,8 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
>   
>   	snd_pcm_drop(substream);
>   	if (substream->hw_opened) {
> -		do_hw_free(substream);
> +		if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
> +			do_hw_free(substream);
>   		substream->ops->close(substream);
>   		substream->hw_opened = 0;
>   	}
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
