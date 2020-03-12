Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E4B182FB3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100FB16E2;
	Thu, 12 Mar 2020 12:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100FB16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584014333;
	bh=0sQFFwPxLieJhWd0FSTs5MIBKzMK0dGAY2FIZAHJmGs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvoSrwmhlYwKeoN2PG2yu8QuRmOZ4fE0hFKRLVhS+D+CKCm/YF/dvpWqo4ttWD4st
	 kcf6PsWEdCEcSOOcGTSAkd9Ahw5igpqds8U7vzo2Pw5Gh0p7044qhrXh0PshzT7ML+
	 mD3IgA4hlHp/5U3TzMU+kmnIT0xwSqktPHq6WgCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40ACBF800BE;
	Thu, 12 Mar 2020 12:57:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2760EF8020C; Thu, 12 Mar 2020 12:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED765F800BE
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 12:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED765F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="242999052"
Received: from swaydand-mobl1.amr.corp.intel.com (HELO [10.255.230.33])
 ([10.255.230.33])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 04:57:00 -0700
Subject: Re: [PATCH v2] ASoC: SOF: Intel: Fix stream cleanup on pcm close
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200312114654.14260-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8af7a50f-402b-a066-1336-0e7a719884f4@linux.intel.com>
Date: Thu, 12 Mar 2020 06:56:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312114654.14260-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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



On 3/12/20 6:46 AM, Cezary Rojewski wrote:
> Field "substream" gets assigned during stream setup in
> hda_dsp_pcm_hw_params() but it is never cleared afterwards during
> cleanup procedure. Now, any non-pcm operation e.g.: compress can
> mistakenly make use of that pointer as it's bypassing all
> "if (s->substream)" checks.
> 
> Nulling the pointer during close operation ensures no wild pointers are
> left behind.
> 
> Fixes: cdae3b9a47aa ("ASoC: SOF: Intel: Add Intel specific HDA PCM operations")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> Changes in v2:
> - relocated stream->substream assignment from _pcm_close() to _hw_free()

nit-pick: both the commit title and message still refer to pcm close, 
maybe worth of a v3?

Sounds good otherwise so please add my

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


>   sound/soc/sof/intel/hda-stream.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
> index 7daa913dbde0..5d386956906f 100644
> --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -547,6 +547,8 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
>   					SOF_HDA_REG_PP_PPCTL, mask, 0);
>   	spin_unlock_irq(&bus->reg_lock);
>   
> +	stream->substream = NULL;
> +
>   	return 0;
>   }
>   
> 
