Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF8231D4D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 13:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3787A16F1;
	Wed, 29 Jul 2020 13:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3787A16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596021689;
	bh=q8jp0GI8I8KQ/xygyfNoU/lut00aVnzmbtr9R40DPx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhbNp8l7dnHtyXFLdJscB/V9fBzB/CAdgdPOXaCsSclZgWGHV8oacqDNsPnBCVmAN
	 nu5uviZYhDgzPs52lRGhDFAlE4zxolYq2qvTPc7iLMonhxCHuZW3jJEykznJofUaAi
	 IKJSb0WRX5kgYHfBQKJPF88JplNZsp3xncadVe8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8B8F800DE;
	Wed, 29 Jul 2020 13:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9802AF801A3; Wed, 29 Jul 2020 13:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DEDBF800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 13:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DEDBF800DE
IronPort-SDR: LXkQUF4CMd99AXyvZFT0vj9DfFoB38E5W1m3Vs/TCMIgFgy0KqtR5jl1qtOdPZCjTuGTkc4r8y
 Md19HODD4yjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="131463273"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="131463273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 04:19:32 -0700
IronPort-SDR: p88OI+P5yPX3nTPCMXDzuzWyzJRVyFyhyuhhTQHhfAbFp3LGMMp4OpFuHF7QZg/wDP0y0d3Fyp
 gu/tKhW/ZNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="312991400"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2020 04:19:28 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0k7L-004gAn-KP; Wed, 29 Jul 2020 14:19:27 +0300
Date: Wed, 29 Jul 2020 14:19:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH 1/2] ASoC: intel: atom: Add period size constraint
Message-ID: <20200729111927.GV3703480@smile.fi.intel.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-2-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596020585-11517-2-git-send-email-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

On Wed, Jul 29, 2020 at 07:03:04PM +0800, Brent Lu wrote:
> Use constraint to enforce the period sizes which are validated in
> Android BSP.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 49b9f18..f614651 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -300,6 +300,16 @@ static void power_down_sst(struct sst_runtime_stream *stream)
>  	stream->ops->power(sst->dev, false);
>  }
>  
> +static const unsigned int media_period_size[] = {
> +	/* sizes validated on Android platform */

> +	240, 320, 960, 3072

Leave comma at the end.

> +};
> +
> +static const struct snd_pcm_hw_constraint_list constraints_media_period_size = {
> +	.count = ARRAY_SIZE(media_period_size),
> +	.list  = media_period_size,
> +};
> +
>  static int sst_media_open(struct snd_pcm_substream *substream,
>  		struct snd_soc_dai *dai)
>  {
> @@ -333,6 +343,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
>  	if (ret_val < 0)
>  		return ret_val;
>  
> +	/* Avoid using period size which is not validated */
> +	snd_pcm_hw_constraint_list(substream->runtime, 0,
> +			SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +			&constraints_media_period_size);
> +
>  	/* Make sure, that the period size is always even */
>  	snd_pcm_hw_constraint_step(substream->runtime, 0,
>  			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


