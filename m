Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D82FF250
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFC01909;
	Thu, 21 Jan 2021 18:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFC01909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611251231;
	bh=4lCWEkGrINb3YCl76Nij164aEB09syV+LC9mRBMHwtc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3z+0WLlLRZNJIdsSTNEpUaf2bHBFSxfKfHMY/1slNWQNZD+0FDxyk8eQpQOC/r/D
	 g+Mc6JUXFIu+4k11Q88+DyuDDAjuf5F5ruKyN1KdIwyFVZ3H9P14kfMJ9TDr/OpqY1
	 AYJ0XU4y8p7Uob+gFwaIg2IR2SyVSW03mqtScdMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E19F80162;
	Thu, 21 Jan 2021 18:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0856F80257; Thu, 21 Jan 2021 18:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27887F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:45:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27887F80162
IronPort-SDR: Jj5CAH74OXIPjTLnB+cehUbkqRsTNu43y1TDFzB8aRVBtB7mCJTwK70oZ4+M7E0sAUMS9bNwLm
 6/4tZ5mgdkiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="240849670"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="240849670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:45:24 -0800
IronPort-SDR: FGDfNZ5uVSfF+AG8jkgOhNj4k+ISYc+3flz+AUhyvW2Xz7k42lbQWl8DPt88RyTfFGD7vJvvL8
 eSjdS52jpIiQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="351532590"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:45:21 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l2e2J-007oKb-28; Thu, 21 Jan 2021 19:46:23 +0200
Date: Thu, 21 Jan 2021 19:46:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Message-ID: <YAm977TOZBgaQChA@smile.fi.intel.com>
References: <20210121171644.131059-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171644.131059-1-ribalda@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Lukasz Majczak <lma@semihalf.com>
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

On Thu, Jan 21, 2021 at 06:16:43PM +0100, Ricardo Ribalda wrote:
> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:
> 
> [   26.553358] BUG: kernel NULL pointer dereference, address:
> 0000000000000078
> [   26.561151] #PF: supervisor read access in kernel mode
> [   26.566897] #PF: error_code(0x0000) - not-present page
> [   26.572642] PGD 0 P4D 0
> [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> 5.4.81 #4
> [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.106.0 12/03/2019
> [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  sound/soc/intel/skylake/skl-topology.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index ae466cd59292..1ef30ca45410 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3619,15 +3619,16 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>  
>  	list_for_each_entry(dobj, &component->dobj_list, list) {
>  		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> -		struct soc_enum *se =
> -			(struct soc_enum *)kcontrol->private_value;
> -		char **texts = dobj->control.dtexts;
> +		struct soc_enum *se;

> +		char **texts;

A nit-pick: Can we place this after below line?

>  		char chan_text[4];
>  
> -		if (dobj->type != SND_SOC_DOBJ_ENUM ||
> -		    dobj->control.kcontrol->put !=
> -		    skl_tplg_multi_config_set_dmic)
> +		if (dobj->type != SND_SOC_DOBJ_ENUM || !kcontrol ||
> +		    kcontrol->put != skl_tplg_multi_config_set_dmic)
>  			continue;
> +
> +		se = (struct soc_enum *)kcontrol->private_value;
> +		texts = dobj->control.dtexts;
>  		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
>  
>  		for (i = 0; i < se->items; i++) {
> -- 
> 2.30.0.296.g2bfb1c46d8-goog
> 

-- 
With Best Regards,
Andy Shevchenko


