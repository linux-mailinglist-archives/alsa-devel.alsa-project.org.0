Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D22407AF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 16:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108AA1660;
	Mon, 10 Aug 2020 16:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108AA1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597070207;
	bh=9o90Iokrwl3lCWcUWfunAyH8mRijItwFejwmur7aQoY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLEneWZoU3vDkJuro50FuonLTFxhUOTMcY1cbBx962GibqntwqWjhkx1o9nIHQpJL
	 RZbvWJP2/ttHr8xx+FnD6OvdehRI3oNpcB1Hk8GR8JU5yffgyuz0BKah4HtiP5XItg
	 tPfxhORWOP54fUZ/n3xq8LS4vuz8RyFwbbB9BHwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243C0F8022D;
	Mon, 10 Aug 2020 16:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E61FEF8022B; Mon, 10 Aug 2020 16:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B405CF800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 16:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B405CF800BC
IronPort-SDR: 0tm0TRYwI2nOJVf+Zik9RdJVPwFBJMnufAzqF8uL+yO/+9F2w7nLbO25WahT1/PBwfJUFq0CLb
 sgf15kkbogFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="217879627"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; d="scan'208";a="217879627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 07:34:45 -0700
IronPort-SDR: ykpKHPEA01HVmKLBbnbW7mdEUm3xME9VtWM7RLctOQr0UeMeOk5uXpB4mBa+4PbuJkRnbQaTqF
 ajsOmEu4637Q==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; d="scan'208";a="290367066"
Received: from schen8-mobl.amr.corp.intel.com (HELO [10.212.235.58])
 ([10.212.235.58])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 07:34:44 -0700
Subject: Re: [PATCH] ASoC: intel: Fix memleak in sst_media_open
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
References: <20200809085654.16483-1-dinghao.liu@zju.edu.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bf70ec51-6ee6-6d1e-1e5b-8e7191f08eba@linux.intel.com>
Date: Mon, 10 Aug 2020 09:34:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200809085654.16483-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>
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



On 8/9/20 3:56 AM, Dinghao Liu wrote:
> When power_up_sst() fails, stream needs to be freed
> just like when try_module_get() fails. However, current
> code is returning directly and ends up leaking memory.
> 
> Fixes: 0121327c1a68b ("ASoC: Intel: mfld-pcm: add control for powering up/down dsp")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 49b9f18472bc..79fedf9e3da1 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -330,8 +330,10 @@ static int sst_media_open(struct snd_pcm_substream *substream,
>   	runtime->private_data = stream;
>   
>   	ret_val = power_up_sst(stream);
> -	if (ret_val < 0)
> +	if (ret_val < 0) {
> +		kfree(stream);
>   		return ret_val;
> +	}
>   
>   	/* Make sure, that the period size is always even */
>   	snd_pcm_hw_constraint_step(substream->runtime, 0,
> 

Alternate suggestion to fix this, it's not great when we mix gotos and 
returns.

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c 
b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 49b9f18472bc..b1cac7abdc0a 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -331,7 +331,7 @@ static int sst_media_open(struct snd_pcm_substream 
*substream,

         ret_val = power_up_sst(stream);
         if (ret_val < 0)
-               return ret_val;
+               goto out_power_up;

         /* Make sure, that the period size is always even */
         snd_pcm_hw_constraint_step(substream->runtime, 0,
@@ -340,8 +340,9 @@ static int sst_media_open(struct snd_pcm_substream 
*substream,
         return snd_pcm_hw_constraint_integer(runtime,
                          SNDRV_PCM_HW_PARAM_PERIODS);
  out_ops:
-       kfree(stream);
         mutex_unlock(&sst_lock);
+out_power_up:
+       kfree(stream);
         return ret_val;
  }
