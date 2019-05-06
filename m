Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A414F8D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4411919;
	Mon,  6 May 2019 17:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4411919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155557;
	bh=CvRv+WLKFnSQ2Wk/lmAPnyCVJVZfTex3jVc7P3A4ylA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jtri4B2VjmCTKYLte0Ja1wlpVUtDxpunEnGerQ1cbQmWrmANNii7UrgR9ysMHZDoa
	 6qL6hFGQOkSYuc7EEHEoL2UNg2s5wBX1aLV1vSNQ3fIsJKUL9odgILucEwKqjVGZJ2
	 b/N576NzYXu/rPaUzj7OUI0uS+ZFbJCiPLmtk0Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CAAF89723;
	Mon,  6 May 2019 17:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32075F896FD; Mon,  6 May 2019 17:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E3A1F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E3A1F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="146876079"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 06 May 2019 08:07:32 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 97FCE58010A;
 Mon,  6 May 2019 08:07:31 -0700 (PDT)
To: libin.yang@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org
References: <1557038262-26356-1-git-send-email-libin.yang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1135262a-0488-3261-e8d3-5e538837ba8d@linux.intel.com>
Date: Mon, 6 May 2019 10:07:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557038262-26356-1-git-send-email-libin.yang@intel.com>
Content-Language: en-US
Cc: ranjani.sridharan@intel.com, rander.wang@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-pcm: BE dai needs prepare when
 pause release after resume
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

On 5/5/19 1:37 AM, libin.yang@intel.com wrote:
> From: Libin Yang <libin.yang@intel.com>
> 
> If playback/capture is paused and system enters S3, after system returns
> from suspend, BE dai needs to call prepare() callback when playback/capture
> is released from pause.

Libin, this patch was discussed at length on GitHub [1] and the commit 
message does not convey any of the information we looked into. It's not 
very helpful to send such patches to a larger audience without 
explaining context and goals. I personally still have no idea of the 
state machine and if all solutions need this or if this is only needed 
in the case where the RESUME_INFO flag is not set.

[1] https://github.com/thesofproject/linux/pull/868


> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> ---
>   sound/soc/soc-pcm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d2aa560..0888995 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2471,7 +2471,8 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
>   
>   		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
> -		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
> +		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND) &&
> +		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>   			continue;
>   
>   		dev_dbg(be->dev, "ASoC: prepare BE %s\n",
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
