Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEB433EC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 09:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D181417E0;
	Thu, 13 Jun 2019 09:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D181417E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560412735;
	bh=w68Jv4Ln3f4in8alAz8ZPx8jqKaC8KXLAPvNgWiDM3g=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKmDZvMY174MAH5ft7s4KtALiVc1HKvp4gEoGlT4DrSJuumSKHaIc3tufKfd4DqfY
	 nxRifvBzr1JdQV+857OLKrxIUkUoNv2h1x7DyQ1/ORY6F3VMFcxrlWgui48MK3x6M7
	 x1P/z21fqKwYClwj0lH/0WIPk7GsZk0zSZK55Yz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3767FF89703;
	Thu, 13 Jun 2019 09:57:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31CD6F89703; Thu, 13 Jun 2019 09:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7C5F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 09:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7C5F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 00:57:01 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 13 Jun 2019 00:56:59 -0700
Date: Thu, 13 Jun 2019 10:00:50 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190613092001.2027f42a@xxx>
In-Reply-To: <20190612172347.22338-2-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
 <20190612172347.22338-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/15] ASoC: SOF: Intel: hda: save handle
 to sdev in sof_intel_hda_stream
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

On Wed, 12 Jun 2019 12:23:33 -0500
Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Add a snd_sof_dev member to sof_intel_hda_stream. This will be
> used to access the snd_sof_dev during link hw_params callback.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> ---
>  sound/soc/sof/intel/hda-stream.c | 4 ++++
>  sound/soc/sof/intel/hda.h        | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda-stream.c
> b/sound/soc/sof/intel/hda-stream.c index c92006f89499..1cd94e7631a8
> 100644 --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -564,6 +564,8 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
>  		if (!hda_stream)
>  			return -ENOMEM;
>  
> +		hda_stream->sdev = sdev;
> +
>  		stream = &hda_stream->hda_stream;
>  
>  		stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
> @@ -617,6 +619,8 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
>  		if (!hda_stream)
>  			return -ENOMEM;
>  
> +		hda_stream->sdev = sdev;
> +
>  		stream = &hda_stream->hda_stream;
>  

Just one thing, you have two rather big for loops here, one for capture
and other for playback, they are almost identical apart for ~2 lines.
Maybe share this code and only put the differences into ifs?

>  		/* we always have DSP support */
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 6c7dee2627d0..502b0a3c2e3c 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -409,6 +409,7 @@ static inline struct hda_bus *sof_to_hbus(struct
> snd_sof_dev *s) }
>  
>  struct sof_intel_hda_stream {
> +	struct snd_sof_dev *sdev;
>  	struct hdac_ext_stream hda_stream;
>  	struct sof_intel_stream stream;
>  	int hw_params_upon_resume; /* set up hw_params upon resume */

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
