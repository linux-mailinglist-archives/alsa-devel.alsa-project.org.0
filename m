Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCE162CBF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 18:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20A516A2;
	Tue, 18 Feb 2020 18:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20A516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582046922;
	bh=g0V4b0pJ0LlkiBfUjj1wlZr36OObR4o21820ltW6MO8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYqdq4COulsjG+DeHhGKSUtUiXVEQB/eCd1rAjvLWPfNnybjwNqB0DLPwPc4rIkOW
	 iDhoJ3P5IHRi6DyFJ655NgE6zfyT39kG+qgV3+zZi4gTExc4aa0Gd4amnnIkSEjNIs
	 vqhxj7CaGkP36l6V2clCHJfaDNBAu9W9eEjbPXXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2059FF8028B;
	Tue, 18 Feb 2020 18:24:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486C5F80137; Tue, 18 Feb 2020 18:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FCF7F80148
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 18:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FCF7F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 09:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="408136628"
Received: from bmerugul-mobl1.amr.corp.intel.com (HELO [10.251.159.61])
 ([10.251.159.61])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2020 09:24:29 -0800
Subject: Re: [PATCH] ASoC: SOF: Intel: Fix stream cleanup on pcm close
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200218141013.7290-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <63adf568-74f4-2c01-8257-955d5aa51420@linux.intel.com>
Date: Tue, 18 Feb 2020 10:45:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218141013.7290-1-cezary.rojewski@intel.com>
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



On 2/18/20 8:10 AM, Cezary Rojewski wrote:
> Field "substream" gets assigned during stream setup in
> hda_dsp_pcm_hw_params() but it is never cleared afterwards during
> hda_dsp_pcm_close(). Now, any non-pcm operation e.g.: compress can
> mistakenly make use of that pointer as it's bypassing all
> "if (s->substream)" checks.
> 
> Nulling the pointer during close operation ensures no wild pointers are
> left behind.
> 
> Fixes: cdae3b9a47aa ("ASoC: SOF: Intel: Add Intel specific HDA PCM operations")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/sof/intel/hda-pcm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
> index a46a6baa1c3f..4b3a89cf20e7 100644
> --- a/sound/soc/sof/intel/hda-pcm.c
> +++ b/sound/soc/sof/intel/hda-pcm.c
> @@ -246,5 +246,6 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
>   
>   	/* unbinding pcm substream to hda stream */
>   	substream->runtime->private_data = NULL;
> +	hstream->substream = NULL;
>   	return 0;
>   }


Humm, yes we should clean this, but wondering if the close() operation 
is the right place. Doing this is hda_dsp_stream_hw_free() sounds more 
logical to me?
