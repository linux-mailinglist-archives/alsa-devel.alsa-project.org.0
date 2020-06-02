Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8FE1EC1A1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 20:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB391657;
	Tue,  2 Jun 2020 20:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB391657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591121394;
	bh=epc0YGgmuZjVvTevtrnHr6sQVyUkzwi7wFACr3cXYOs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dU6obcUyHaauzvBPheXx+2d4qfHb0jmAXX5kR/4th2olwoe0HSjkVGPukSqodMcmB
	 uLPbxj8s86tdsqcFpPkoccow7LFjO3jPxz+2EqVqKe26JNGLngesQrSHycUJMKLa2Q
	 o0GpX64U1KGgDiybmAPHGcjwMaVt8/8CsB7Ejl/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02006F800BC;
	Tue,  2 Jun 2020 20:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 022F6F800BC; Tue,  2 Jun 2020 20:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62B6EF800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 20:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B6EF800BC
IronPort-SDR: hwaUmZ0jYt6TbMLQ/xJ6wMJhXtZRDc8nqOoVdAwP/C5dHEAbhwRReQaa0W7Z4rcxYO2jdqPd4v
 Yi5xZv0NOIjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 11:08:01 -0700
IronPort-SDR: GFgu39VV8mRiSRuso9Tj9Wom8oigVbWKZaJlQ/L5nUG7eBJP0r6qnPvDLj8uo/qw6z7/CWPm1S
 KRaEVyd2IqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="286742690"
Received: from aliang1-mobl1.gar.corp.intel.com (HELO [10.254.103.160])
 ([10.254.103.160])
 by orsmga002.jf.intel.com with ESMTP; 02 Jun 2020 11:08:00 -0700
Subject: Re: Subject: [PATCH v2] ASoC: soc-pcm: fix BE dai not hw_free and
 shutdown during mixer update
To: =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <ALMAWwB5CP9aAcKXCU5FzqqF.1.1590747164172.Hmail.zhucancan@vivo.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <338690ee-a081-054c-36e3-3f5fb3733442@linux.intel.com>
Date: Tue, 2 Jun 2020 11:19:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ALMAWwB5CP9aAcKXCU5FzqqF.1.1590747164172.Hmail.zhucancan@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: kernel <kernel@vivo.com>, =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
 trivial@kernel.org
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



On 5/29/20 5:12 AM, 朱灿灿 wrote:
> FE state is SND_SOC_DPCM_STATE_PREPARE now, BE1 is
> used by FE.
> 
> Later when new BE2 is added to FE by mixer update,
> it will call dpcm_run_update_startup() to update
> BE2's state, but unfortunately BE2 .prepare() meets
> error, it will disconnect all non started BE.
> 
> This make BE1 dai skip .hw_free() and .shutdown(),
> and the BE1 users will never decrease to zero.
> 
> Signed-off-by: zhucancan <zhucancan@vivo.com>
> ---
> re-format patch content v2
> ---
>   sound/soc/soc-pcm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 1f302de44052..df34422bd0dd 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2730,12 +2730,12 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
>   close:
>   	dpcm_be_dai_shutdown(fe, stream);
>   disconnect:
> -	/* disconnect any non started BEs */
> +	/* disconnect any closed BEs */
>   	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>   	for_each_dpcm_be(fe, stream, dpcm) {
>   		struct snd_soc_pcm_runtime *be = dpcm->be;
> -		if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
> -				dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
> +		if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE)
> +			dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
>   	}
>   	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);

This change is quite hard to review, this error handling can be called 
from multiple places.

I *think* it's correct because in all cases where the 
disconnect/close/hw_free labels are reached, the non-shared BEs either 
remain or are put in the DPCM_STATE_CLOSE state before doing this test.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

It really wouldn't hurt though if others double-checked this change...



