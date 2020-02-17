Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD016189D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 18:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66502166F;
	Mon, 17 Feb 2020 18:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66502166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581959685;
	bh=3WENVCV9f9hXwcHYPytKYFF+SrOyLwxEwfUkTgO9tuM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LiHUy7xJYqCE44tB/BPjPW0jT1UiZ0rr45PswOS0QnSYneSuJ0F73fGQMF7yCEyGU
	 wGYsM6QlmdywCtCMSRJTnhoRPES4RCti/v6jCaJVRuuBoG89Uv7E1f9jlW681AOrEa
	 xHWznndRRBS03IurTKbla1la3HvWC7gqaNVPejJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA27F800C4;
	Mon, 17 Feb 2020 18:13:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C2E0F80172; Mon, 17 Feb 2020 18:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF68CF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 18:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF68CF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="R958SmJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581959576;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Ss3ccvJK1W2R8MPluJRGBjaq4okSpK5gZTbpzzImiiA=;
 b=R958SmJNU3A5LnipAZZZCFGn5/vRIaGQoDn553H76oH9IWXiZo06H5o3faw8wCiOaf
 7jmnHytNpk0dDpc0XmdKHn+BfwnX5jBUG53t08qAs5rMTDBWG+1ezeGskHCkpfbCg94X
 Gq2zBLgOUvGT+V2IFBK3QkCmzt5XL6JaukYaaOMEBCH0tjs2IrowGCSmXKdq/aeC5Cv1
 2cjDrGtL0qRS/WmW+cOwG61iFpuHc2JIHcrfbNsFAzc9S7K4TSvYDa+AaRKnQACZ76JG
 nRBQimOp4tDPGGqjlhsMg0ygaMu10fqgk4X9UDwpCWf8GSo2FXAxo143AG+9sAfiJabw
 RoGQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJKBk/pyQ=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id a01fe9w1HHCqeWy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 17 Feb 2020 18:12:52 +0100 (CET)
Date: Mon, 17 Feb 2020 18:12:45 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200217171245.GA881@gerhold.net>
References: <1579443563-12287-1-git-send-email-spujar@nvidia.com>
 <20200217144120.GA243254@gerhold.net>
 <20200217154301.GN9304@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217154301.GN9304@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: crash in snd_soc_dapm_new_dai
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

On Mon, Feb 17, 2020 at 03:43:01PM +0000, Mark Brown wrote:
> On Mon, Feb 17, 2020 at 03:41:20PM +0100, Stephan Gerhold wrote:
> 
> > I'm a bit confused about this patch, isn't SNDRV_PCM_STREAM_PLAYBACK
> > used for both cpu_dai and codec_dai in the playback case?
> 
> It is in the normal case, but with a CODEC<->CODEC link (which was what
> this was targeting) we need to bodge things by swapping playback and
> capture on one end of the link.

I see. Looking at the code again I'm guessing the cause of the crash
"fixed" by this patch is commit a342031cdd08 ("ASoC: create pcm for
codec2codec links as well") where the codec2codec case was sort of
patched in. This is what we had before this patch:

		/* Adapt stream for codec2codec links */
		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
			&cpu_dai->driver->capture : &cpu_dai->driver->playback;

This does the swapping you mentioned, so I guess rtd->dai_link->params
is only set for the codec2codec case?

		for_each_rtd_codec_dai(rtd, i, codec_dai) {
			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
				playback = 1;
			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
				capture = 1;
		}

		capture = capture && cpu_capture->channels_min;
		playback = playback && cpu_playback->channels_min;

And this does a part of the check in snd_soc_dai_stream_valid(),
but without the NULL check of cpu_capture/cpu_playback.
(Maybe that is the cause of the crash.)

From my limited understanding, I would say that a much simpler way to
implement this would be:

	/* Adapt stream for codec2codec links */
	int cpu_capture = rtd->dai_link->params ?
		SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
	int cpu_playback = rtd->dai_link->params ?
		SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;

	for_each_rtd_codec_dai(rtd, i, codec_dai) {
		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
			playback = 1;
		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
			capture = 1;
	}

since snd_soc_dai_stream_valid() does both the NULL-check and the 
"channels_min" check.

But I'm really not familar with the codec2codec case and am unable to
test it :) What do you think?

Thanks,
Stephan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
