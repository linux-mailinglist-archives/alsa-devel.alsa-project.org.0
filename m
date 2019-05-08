Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71917E1B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C36E1AB3;
	Wed,  8 May 2019 18:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C36E1AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557333123;
	bh=AF+l64nBSRdw2U90ufSYD7pyFBMk66cfW63b2LVRJOA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vrwR0TB9bNreVBEsdGJd4DeMYx7uhuqw2SzHVWCZXWmMbkUUDZxr+ILUfrZrnM77n
	 6X1SoM9YJoDeM8pMcnScrbU3zZOKlQ5gh6WUsBCzsgWMTukX/bDEbox66yxHYpVxQS
	 caGlnXIsbPOg4UqId1ZGT85ZDWH+dOAPWgxf9gCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C5EF896FD;
	Wed,  8 May 2019 18:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD20DF896F0; Wed,  8 May 2019 18:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4BD5F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BD5F8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 09:30:10 -0700
X-ExtLoop1: 1
Received: from violetkx-mobl.amr.corp.intel.com ([10.252.193.29])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2019 09:30:09 -0700
Message-ID: <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: libin.yang@intel.com, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Wed, 08 May 2019 09:30:08 -0700
In-Reply-To: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: broonie@kernel.org, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com
Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 2019-05-08 at 10:32 +0800, libin.yang@intel.com wrote:
> From: Libin Yang <libin.yang@intel.com>
> 
> If playback/capture is paused and system enters S3, after system
> returns
> from suspend, BE dai needs to call prepare() callback when
> playback/capture
> is released from pause if RESUME_INFO flag is not set.
Hi Takashi,

This is a question for you. We've run into the problem of not being
able to do a pause-release after the system resumes from S3 after we
removed INFO_RESUME from the SOF driver. 

Apparently, with this flag removed, when the user does a pause release
after resuming from S3, the prepare() callback gets invoked for the FE
but doesnt happen for the the BE. Could you please guide us on whether
this is the right approach and if not, suggest an alternative?

Thanks,
Ranjani
> 
> Currently, the dpcm_be_dai_prepare() function will block calling
> prepare()
> if the pcm is in SND_SOC_DPCM_STATE_PAUSED state. This will cause the
> following test case fail if the pcm uses BE:
> 
> playback -> pause -> S3 suspend -> S3 resume -> pause release
> 
> The playback may exit abnormally when pause is released because the
> BE dai
> prepare() is not called.
> 
> This patch allows dpcm_be_dai_prepare() to call dai prepare()
> callback in
> SND_SOC_DPCM_STATE_PAUSED state.
> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> ---
>  sound/soc/soc-pcm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d2aa560..0888995 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2471,7 +2471,8 @@ int dpcm_be_dai_prepare(struct
> snd_soc_pcm_runtime *fe, int stream)
>  
>  		if ((be->dpcm[stream].state !=
> SND_SOC_DPCM_STATE_HW_PARAMS) &&
>  		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP)
> &&
> -		    (be->dpcm[stream].state !=
> SND_SOC_DPCM_STATE_SUSPEND))
> +		    (be->dpcm[stream].state !=
> SND_SOC_DPCM_STATE_SUSPEND) &&
> +		    (be->dpcm[stream].state !=
> SND_SOC_DPCM_STATE_PAUSED))
>  			continue;
>  
>  		dev_dbg(be->dev, "ASoC: prepare BE %s\n",

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
