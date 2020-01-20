Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330581428BB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 12:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A94591673;
	Mon, 20 Jan 2020 12:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A94591673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579518235;
	bh=Mq8GGuuF8ruWCLggPEFCfgdL3S4b4JG0o6XVD7sVQ4M=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGth+Ra+tPYHije5lVUr+5aQEvtekl3kD//4JXf6VIT0aBNitqVXevG2Td+kZOGfg
	 8rV3xDfS0OufN72nXE2L7QOWq6CwcPDLnb5yVeuMe/faC+3vD4qBt72IkgfkWko2Kl
	 mdc/PuXYQHXTOI3bUyaWj/8ra2X2ZlO++k1gr5R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D12F8022D;
	Mon, 20 Jan 2020 12:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8688FF8020C; Mon, 20 Jan 2020 12:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 925DDF8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 12:02:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 925DDF8012F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 03:02:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; d="scan'208";a="249918057"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2020 03:02:01 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 03:02:01 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jan 2020 19:01:59 +0800
Received: from shsmsx606.ccr.corp.intel.com ([10.109.6.216]) by
 SHSMSX606.ccr.corp.intel.com ([10.109.6.216]) with mapi id 15.01.1713.004;
 Mon, 20 Jan 2020 19:01:59 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bard liao
 <yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "tiwai@suse.de" <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH RFC v3 2/4] ASoC: Add multiple CPU DAI
 support for PCM ops
Thread-Index: AQHVzQ9LbNhG6NK9OUylVH85HlTtm6fuLViAgAURwGA=
Date: Mon, 20 Jan 2020 11:01:59 +0000
Message-ID: <666fa7259fac4da88704dc5266d484e3@intel.com>
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
 <20200116202620.7401-3-yung-chuan.liao@linux.intel.com>
 <609dd6ae-fa05-50c8-bd3a-acd5bad2618a@linux.intel.com>
In-Reply-To: <609dd6ae-fa05-50c8-bd3a-acd5bad2618a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH RFC v3 2/4] ASoC: Add multiple CPU DAI
 support for PCM ops
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



> -----Original Message-----
> From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
> Sent: Friday, January 17, 2020 7:11 PM
> To: Bard liao <yung-chuan.liao@linux.intel.com>; broonie@kernel.org;
> tiwai@suse.de
> Cc: alsa-devel@alsa-project.org; liam.r.girdwood@linux.intel.com;
> kuninori.morimoto.gx@renesas.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [alsa-devel] [PATCH RFC v3 2/4] ASoC: Add multiple CPU DAI
> support for PCM ops
> 
> I noticed a couple of code changes, we should probably do a code refactor first
> and add those changes, then add the multi-cpu support.
> 
> > @@ -892,10 +979,17 @@ static int soc_pcm_hw_params(struct
> snd_pcm_substream *substream,
> >   component_err:
> >   	soc_pcm_components_hw_free(substream, component);
> >
> > -	snd_soc_dai_hw_free(cpu_dai, substream);
> > -	cpu_dai->rate = 0;
> > +	i = rtd->num_cpus;
> >
> >   interface_err:
> > +	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
> > +		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> > +			continue;
> 
> maybe this check should be added to the existing code before adding multi-cpu
> support? it looks copy/pasted from the codec case, but is it a miss in the existing
> code?

Thanks Pierre for the review. My point is that we don't test
snd_soc_dai_stream_valid in the existing code since we assume the cpu dai
will support the set of all codec dais. For example, the cpu dai will
support both playback and capture  if a dai link with one cpu and two codecs
dai which support playback and capture separated. However, we may have
two cpus dai which support different directions in multi cpu dai link case.

I do see I miss a snd_soc_dai_stream_valid() test above.

> 
> > +
> > +		snd_soc_dai_hw_free(cpu_dai, substream);
> > +		cpu_dai->rate = 0;
> > +	}
> > +
> 
> [...]
> 
> > @@ -965,7 +1062,12 @@ static int soc_pcm_hw_free(struct
> snd_pcm_substream *substream)
> >   		snd_soc_dai_hw_free(codec_dai, substream);
> >   	}
> >
> > -	snd_soc_dai_hw_free(cpu_dai, substream);
> > +	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
> > +		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> > +			continue;
> > +
> > +		snd_soc_dai_hw_free(cpu_dai, substream);
> > +	}
> 
> same here, the hw_free should be first made conditional on the stream being
> valid, before introducing multi-cpu-dai support?

Or adding multi-cpu-dai support first then checking stream?
The reason is we don't need to test snd_soc_dai_stream_valid if we don't
support multi-cpu-dai

> 
> 
> > @@ -1672,18 +1804,32 @@ static void dpcm_runtime_merge_chan(struct
> snd_pcm_substream *substream,
> >
> >   	for_each_dpcm_be(fe, stream, dpcm) {
> >   		struct snd_soc_pcm_runtime *be = dpcm->be;
> > -		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
> > +		struct snd_soc_dai_driver *cpu_dai_drv;
> >   		struct snd_soc_dai_driver *codec_dai_drv;
> >   		struct snd_soc_pcm_stream *codec_stream;
> >   		struct snd_soc_pcm_stream *cpu_stream;
> > +		struct snd_soc_dai *dai;
> > +		int i;
> >
> > -		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
> > -			cpu_stream = &cpu_dai_drv->playback;
> > -		else
> > -			cpu_stream = &cpu_dai_drv->capture;
> > +		for_each_rtd_cpu_dai(be, i, dai) {
> > +			/*
> > +			 * Skip CPUs which don't support the current stream
> > +			 * type. See soc_pcm_init_runtime_hw() for more
> details
> > +			 */
> > +			if (!snd_soc_dai_stream_valid(dai, stream))
> > +				continue;
> 
> and here as well, this is a new test that didn't exist before?
> 
> 
> > @@ -2847,23 +3012,33 @@ int soc_new_pcm(struct snd_soc_pcm_runtime
> *rtd, int num)
> >   		playback = rtd->dai_link->dpcm_playback;
> >   		capture = rtd->dai_link->dpcm_capture;
> >   	} else {
> > +		int stream_playback;
> > +		int stream_capture;
> >   		/* Adapt stream for codec2codec links */
> > -		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link-
> >params ?
> > -			&cpu_dai->driver->playback : &cpu_dai->driver-
> >capture;
> > -		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link-
> >params ?
> > -			&cpu_dai->driver->capture : &cpu_dai->driver-
> >playback;
> > +		if (rtd->dai_link->params) {
> > +			stream_playback = SNDRV_PCM_STREAM_CAPTURE;
> > +			stream_capture  = SNDRV_PCM_STREAM_PLAYBACK;
> > +		} else {
> > +			stream_playback = SNDRV_PCM_STREAM_PLAYBACK;
> > +			stream_capture  = SNDRV_PCM_STREAM_CAPTURE;
> > +		}
> >
> > -		for_each_rtd_codec_dai(rtd, i, codec_dai) {
> > -			if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_PLAYBACK) &&
> > -			    snd_soc_dai_stream_valid(cpu_dai,
> SNDRV_PCM_STREAM_PLAYBACK))
> 
> the logic for this entire block isn't easy to follow, maybe we should
> first move the cpu case out of the codec_dai loop and refactor the code
> before adding the multi-cpu case.

I will try to split the patch.

> 
> > -				playback = 1;
> > -			if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_CAPTURE) &&
> > -			    snd_soc_dai_stream_valid(cpu_dai,
> SNDRV_PCM_STREAM_CAPTURE))
> > -				capture = 1;
> > +		playback = 1;
> > +		capture = 1;
> > +
> > +		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
> > +			if (!snd_soc_dai_stream_valid(cpu_dai,
> stream_playback))
> > +				playback = 0;
> > +			if (!snd_soc_dai_stream_valid(cpu_dai,
> stream_capture))
> > +				capture = 0;
> >   		}
> >
> > -		capture = capture && cpu_capture->channels_min;
> > -		playback = playback && cpu_playback->channels_min;
> 
> channels_min is no longer used so it's somewhat confusing if the new
> code is iso-functionality?

channels_min is to check if the stream is valid. It is  replaced by
snd_soc_dai_stream_valid().

> I'd prefer a code refactor that we can double check, then add the
> cpu_dai loop.
> 
> > +		for_each_rtd_codec_dai(rtd, i, codec_dai) {
> > +			if (!snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_PLAYBACK))
> > +				playback = 0;
> > +			if (!snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_CAPTURE))
> > +				capture = 0;
> > +		}
> >   	}
> >
> >   	if (rtd->dai_link->playback_only) {
> > @@ -2977,7 +3152,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd,
> int num)
> >   out:
> >   	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
> >   		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
> > -		 cpu_dai->name);
> > +		 (rtd->num_cpus > 1) ? "multicpu" : rtd->cpu_dai->name);
> >   	return ret;
> >   }
> >
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
