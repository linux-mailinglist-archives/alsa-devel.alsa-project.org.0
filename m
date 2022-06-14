Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0F54AA24
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC7516FB;
	Tue, 14 Jun 2022 09:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC7516FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655190822;
	bh=bTzyUDG/xn3eoLovQdEvpgAJqPPl044VpECLbq6qQGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k/ENS5rskANvOmn0aNwyyi6v9q5f0+jwyK69w9YsR/cTS3yI6FGuAdIOEB+KUyOjC
	 QA5KdqzxMgTy4DbaAKZghv8Ix7qjCnaQU9BwR4wmSN1IZr781wbPPGNV197SnGt4yn
	 Okl+ASOtWNw5iQMSWzG6JFYtSK6znNf0syhcznhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E128AF800E1;
	Tue, 14 Jun 2022 09:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3951FF80139; Tue, 14 Jun 2022 09:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34D80F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D80F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Xxx6ZhvM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16212611D1;
 Tue, 14 Jun 2022 07:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9637C3411B;
 Tue, 14 Jun 2022 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655190749;
 bh=bTzyUDG/xn3eoLovQdEvpgAJqPPl044VpECLbq6qQGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xxx6ZhvMaC6FlWB038KmujLKhzXwKGKHraIaNbOkIvInGjh9Ae8qjPomYrw7wmXD2
 ywL5ALOR1jRvr+PFes7ixbz22d9zfUatGQ/lqOwqZg3Cum0SgM0SCyDnD5ks0+hrkt
 vKF3L07TmL8RhM6FOuNjjHAUIvPoS6G0dt9AFEw0=
Date: Tue, 14 Jun 2022 09:12:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Message-ID: <Yqg01aSixhBq9d4+@kroah.com>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
 <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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

On Tue, Jun 14, 2022 at 03:08:17PM +0800, Bard Liao wrote:
> For IPC4, we need to set pipeline state in BE DAI trigger.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  sound/soc/sof/intel/hda-dai.c | 15 ++++++++++++---
>  sound/soc/sof/intel/hda.c     |  2 +-
>  sound/soc/sof/intel/hda.h     |  1 +
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
> index 228079a52c3d..6ed99fdc5793 100644
> --- a/sound/soc/sof/intel/hda-dai.c
> +++ b/sound/soc/sof/intel/hda-dai.c
> @@ -713,8 +713,7 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
>  	.shutdown = ssp_dai_shutdown,
>  };
>  
> -static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
> -			       int cmd, struct snd_soc_dai *dai)
> +static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stream)
>  {
>  	struct snd_sof_widget *pipe_widget;
>  	struct sof_ipc4_pipeline *pipeline;
> @@ -723,7 +722,7 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
>  	struct snd_sof_dev *sdev;
>  	int ret;
>  
> -	w = snd_soc_dai_get_widget(dai, substream->stream);
> +	w = snd_soc_dai_get_widget(dai, stream);
>  	swidget = w->dobj.private;
>  	pipe_widget = swidget->pipe_widget;
>  	pipeline = pipe_widget->private;
> @@ -758,6 +757,12 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
> +			       int cmd, struct snd_soc_dai *dai)
> +{
> +	return ipc4_be_dai_common_trigger(dai, cmd, substream->stream);
> +}
> +
>  static const struct snd_soc_dai_ops ipc4_dmic_dai_ops = {
>  	.trigger = ipc4_be_dai_trigger,
>  };
> @@ -809,6 +814,10 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
>  		if (!hda_use_tplg_nhlt)
>  			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
>  
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
> +		sdw_callback.trigger = ipc4_be_dai_common_trigger;
> +#endif

#if should not be in .c files if at all possible.  Surely there's a
better way here...

thanks,

greg k-h
