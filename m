Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A42FF252
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:47:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2E7190D;
	Thu, 21 Jan 2021 18:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2E7190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611251241;
	bh=b0ETUYxtiexC5GYllI5JDaiSED1uDbcy75YVuN1efro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbdg8sdGiwqXv7QON0jwdS+LiEuD01XDSyE2GfIYwzZatV753eB3zYphpJECYTN71
	 h37J5M699KqtZFM8L2hPCrzTvljaNKF/ELC+Y0Hx6KoxwJ8ULsGOwnkT23P1+8wmki
	 LRiXB247uxgFGdxSQYkse/43Vk5oMvbLWCn502zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E14DF80272;
	Thu, 21 Jan 2021 18:46:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C568BF80273; Thu, 21 Jan 2021 18:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E75F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E75F80125
IronPort-SDR: W99yMDq9oQBl3dmmmcbF8oBeVBTUZ92SCaZUnNl2wT0DysCVVGnuVnpiQaJT3Mti49wcMPpaBx
 88+99QuIkOzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198049986"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="198049986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:46:20 -0800
IronPort-SDR: S8I3SKCOdNxCtAanMLbnazamcZPP2+1r1NdLYAt0c3poCPSyo2ymCYY6ZXQ5dnZBE7VOZBNO5f
 5juMlkBFMyFg==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="427447489"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:46:16 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l2e3D-007oOc-4n; Thu, 21 Jan 2021 19:47:19 +0200
Date: Thu, 21 Jan 2021 19:47:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
Message-ID: <YAm+JxMdvhmKBWQt@smile.fi.intel.com>
References: <20210121171644.131059-1-ribalda@chromium.org>
 <20210121171644.131059-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171644.131059-2-ribalda@chromium.org>
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

On Thu, Jan 21, 2021 at 06:16:44PM +0100, Ricardo Ribalda wrote:
> Clear struct snd_ctl_elem_value before calling ->put() to avoid any data
> leak.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  sound/soc/intel/skylake/skl-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index 1ef30ca45410..b824086203b9 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3632,7 +3632,7 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>  		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
>  
>  		for (i = 0; i < se->items; i++) {
> -			struct snd_ctl_elem_value val;
> +			struct snd_ctl_elem_value val = {};
>  
>  			if (strstr(texts[i], chan_text)) {
>  				val.value.enumerated.item[0] = i;
> -- 
> 2.30.0.296.g2bfb1c46d8-goog
> 

-- 
With Best Regards,
Andy Shevchenko


