Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70075EBC00
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 09:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46F20850;
	Tue, 27 Sep 2022 09:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46F20850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664265184;
	bh=rPV9Jaa6aRhKTfWgBwKJ5PnntUWNGwm2KhocZIEEi/g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWROeuUtJ600+edZVxaZYta+JR9PqtSPcy5jaT2b5vJsXau/lj8XxaO/CQoAnQORV
	 yF1UKsnqa+XfijMHX1+rdbQdXSMWUhO/mGZv59Tu3QZfJpp9HWCN8P4b36IOVJTZn9
	 I1qQ4zJKuPb6C2utQRwtRLDdCqgZaMe6pBhaxhFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B723CF800AA;
	Tue, 27 Sep 2022 09:52:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D5B0F8025E; Tue, 27 Sep 2022 09:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31BACF800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 09:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31BACF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lv0w26Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664265121; x=1695801121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rPV9Jaa6aRhKTfWgBwKJ5PnntUWNGwm2KhocZIEEi/g=;
 b=lv0w26QvlKObN6mgVkWFDbKBBOtKYpq64FuccCZBh+bMNQA2RscLqtf2
 hCnsOEpLAXf0lxnru1altKqv1G51OebSdhjtD7jGOp0kTSnZdFxG2Kue/
 z0Xd+nTi5Dn61c2Mkwzmy5z//RMg0+CIggX9Nzyj6ebrsZFxPBBnsD0XH
 aTjN4/OMIqEaFHykDw/dGU0FCHHe82M/8ZOwdvtPp+4JCe0xe2W7qmxrS
 w4GHQQBqXhlrsQJ1fMUrh2uwk3w8InVKOWX5IjNpeh3cmQZO6K0HutuGn
 ly0gp9qdRy4rlKwdWrYah1myAj5Xj2pTggKDRmy52vHZAFL/vLx1wPCDP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284377390"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="284377390"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:51:52 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="866475014"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="866475014"
Received: from patils-mobl1.ger.corp.intel.com (HELO [10.252.36.213])
 ([10.252.36.213])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:51:48 -0700
Message-ID: <bdf56f23-1019-b4c8-a11a-3934db432cf1@linux.intel.com>
Date: Tue, 27 Sep 2022 09:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Content-Language: en-US
To: Eugeniu Rosca <erosca@de.adit-jv.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 Zhang Yanmin <yanmin.zhang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ramesh Babu <ramesh.babu@intel.com>, Dean Jenkins <Dean_Jenkins@mentor.com>,
 Ramesh Babu B <ramesh.babu.b@intel.com>, xiao jin <jin.xiao@intel.com>
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



On 9/26/22 18:35, Eugeniu Rosca wrote:
> From: xiao jin <jin.xiao@intel.com>
> 
> After start of fe and be, fe might go to close without triggering
> STOP, and substream->runtime is freed. However, be is still at
> START state and its substream->runtime still points to the
> freed runtime.
> 
> Later on, FE is opened/started again, and triggers STOP.
> snd_pcm_do_stop => dpcm_fe_dai_trigger
>                 => dpcm_fe_dai_do_trigger
>                 => dpcm_be_dai_trigger
>                 => dpcm_do_trigger
>                 => soc_pcm_trigger
>                 => skl_platform_pcm_trigger
> skl_platform_pcm_trigger accesses the freed old runtime data and
> kernel panic.
> 
> The patch fixes it by assigning be_substream->runtime in
> dpcm_be_dai_startup when be's state is START.

Can I ask on which kernel this patch was validated and on what platform?

We've done a lot of work since last year on DPCM states, and I wonder
the problem mentioned above actually exists on recent kernels.

Specifically, if the FE is closed, I don't get how the BE is not closed
as well. And if this problem is found on a recent kernel, then it should
be seen in the AVS driver as well, no?


> Signed-off-by: xiao jin <jin.xiao@intel.com>
> Signed-off-by: Zhang Yanmin <yanmin.zhang@intel.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  sound/soc/soc-pcm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 4f60c0a83311..6ca1d02065ce 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1608,6 +1608,8 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
>  		if (be->dpcm[stream].users++ != 0)
>  			continue;
>  
> +		be_substream->runtime = be->dpcm[stream].runtime;
> +
>  		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
>  		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
>  			continue;
> @@ -1615,7 +1617,6 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
>  		dev_dbg(be->dev, "ASoC: open %s BE %s\n",
>  			stream ? "capture" : "playback", be->dai_link->name);
>  
> -		be_substream->runtime = be->dpcm[stream].runtime;
>  		err = __soc_pcm_open(be, be_substream);
>  		if (err < 0) {
>  			be->dpcm[stream].users--;
