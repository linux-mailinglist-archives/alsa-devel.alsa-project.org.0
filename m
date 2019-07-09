Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF363523
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 13:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4CC166C;
	Tue,  9 Jul 2019 13:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4CC166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562672838;
	bh=kbtvKhUhOjC3GZVkKGb6hijh94hgEvqeyYh03/jSz4c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMgAQYQca310ZGxC/wzJrNTtaCl4hIWFZWhYlnY+AvFtZp+gI1cRy/1Ex0sgowgvy
	 m7jKw7kdadGE6ehgo0cYkc0GS24ge7W4Jpssz7k3GEKJaQSp80guemVNWeQREjq5/j
	 qtl/QZIyxS83SGAwfbtQXRzyvxRBpXhIEufHuEQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1B2F800E0;
	Tue,  9 Jul 2019 13:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D76F80274; Tue,  9 Jul 2019 13:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A34CBF800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 13:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34CBF800E2
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 04:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="340730852"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga005.jf.intel.com with ESMTP; 09 Jul 2019 04:45:20 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hkoYh-0002Yq-Et; Tue, 09 Jul 2019 14:45:19 +0300
Date: Tue, 9 Jul 2019 14:45:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Levin <levinale@chromium.org>
Message-ID: <20190709114519.GW9224@smile.fi.intel.com>
References: <20190709040147.111927-1-levinale@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709040147.111927-1-levinale@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, benzh@chromium.org,
 Mark Brown <broonie@kernel.org>, cujomalainey@chromium.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Atom: read timestamp moved to
	period_elapsed
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

On Mon, Jul 08, 2019 at 09:01:47PM -0700, Alex Levin wrote:
> sst_platform_pcm_pointer is called from both snd_pcm_period_elapsed and
> from snd_pcm_ioctl. Calling read timestamp results in recalculating
> pcm_delay and buffer_ptr (sst_calc_tstamp) which consumes buffers in a
> faster rate than intended.
> In a tested BSW system with chtrt5650, for a rate of 48000, the
> measured rate was sometimes 10 times more than that.
> After moving the timestamp read to period elapsed, buffer consumption is
> as expected.

From code prospective it looks good. You may take mine
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Though I'm not an expert in the area, Pierre and / or Liam should give
their blessing.

> 
> Signed-off-by: Alex Levin <levinale@chromium.org>
> ---
>  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 23 +++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 0e8b1c5eec88..196af0b30b41 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -265,16 +265,28 @@ static void sst_period_elapsed(void *arg)
>  {
>  	struct snd_pcm_substream *substream = arg;
>  	struct sst_runtime_stream *stream;
> -	int status;
> +	struct snd_soc_pcm_runtime *rtd;
> +	int status, ret_val;
>  
>  	if (!substream || !substream->runtime)
>  		return;
>  	stream = substream->runtime->private_data;
>  	if (!stream)
>  		return;
> +
> +	rtd = substream->private_data;
> +	if (!rtd)
> +		return;
> +
>  	status = sst_get_stream_status(stream);
>  	if (status != SST_PLATFORM_RUNNING)
>  		return;
> +
> +	ret_val = stream->ops->stream_read_tstamp(sst->dev, &stream->stream_info);
> +	if (ret_val) {
> +		dev_err(rtd->dev, "stream_read_tstamp err code = %d\n", ret_val);
> +		return;
> +	}
>  	snd_pcm_period_elapsed(substream);
>  }
>  
> @@ -658,20 +670,15 @@ static snd_pcm_uframes_t sst_platform_pcm_pointer
>  			(struct snd_pcm_substream *substream)
>  {
>  	struct sst_runtime_stream *stream;
> -	int ret_val, status;
> +	int status;
>  	struct pcm_stream_info *str_info;
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  
>  	stream = substream->runtime->private_data;
>  	status = sst_get_stream_status(stream);
>  	if (status == SST_PLATFORM_INIT)
>  		return 0;
> +
>  	str_info = &stream->stream_info;
> -	ret_val = stream->ops->stream_read_tstamp(sst->dev, str_info);
> -	if (ret_val) {
> -		dev_err(rtd->dev, "sst: error code = %d\n", ret_val);
> -		return ret_val;
> -	}
>  	substream->runtime->delay = str_info->pcm_delay;
>  	return str_info->buffer_ptr;
>  }
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
