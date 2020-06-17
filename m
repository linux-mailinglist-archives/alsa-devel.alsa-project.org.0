Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1351FC969
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 11:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF161679;
	Wed, 17 Jun 2020 11:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF161679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592384592;
	bh=0jDji5SZn28vDd0rdQeRwaabmP0X66+GQfYylQjEtiQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LSU4PISczBJkG4mc4wCdm8/83ARZcxbsXa1R0vglWnRYAr4W140HQteATX+JSJ4bG
	 a2RAVUlvCtnWIUF4XSxI4mdmh0owIMEbUCdcD8jLgZ32mvo/bQFVuBKqZ1U/Ut4frM
	 /syAAvUNRJyy24eOCWtxtHEjY4zlS6zVd652yc2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D81F80116;
	Wed, 17 Jun 2020 11:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6505F80171; Wed, 17 Jun 2020 11:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27EF1F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 11:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27EF1F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="LXN4ik3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592384483;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TAfJKolAMlNmyikqXFuPrBkydNLh3uGnkmLvaeDAvrY=;
 b=LXN4ik3CE6VhjhPre0GEG6OdOV1J+Ze2Gau1UMEwTKc8Xq0JJUnwromqpN01PVBzr1
 WeRyaCa+/JZ7hCUd02XDK0a2ngP+KsxpRLRPWsUuCWUrwUCNXCSveTyq2NZUKrbD7l97
 M3G713cH1GCkQp0CsTzxbk6NX6yvVhTQ4Jw8O/tqHpHjd5cZaU8LjoTZkpxgb8MsuvLn
 0mWeTFPRYOptrdT5oH+LTyVNDszLrovLQbm8Y61n4dq2up+zCfmXSvQf5jKPZlbXY4Xb
 1V7a6h7KQxlNsI7rcl3JO+8blh1Y9puw/xCc9Xu3GP4UBHbmlYqSiia+FsVyyRNuyJmE
 +fhQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 6005e9w5H91HYtZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Jun 2020 11:01:17 +0200 (CEST)
Date: Wed, 17 Jun 2020 11:01:12 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200617090112.GA38317@gerhold.net>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net>
 <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616155544.GA8891@gerhold.net>
 <7cbc9233-e5f2-03e0-5659-cf22dea75e53@linux.intel.com>
 <45d43cc9-be22-a7d2-1628-3fb30232bd7c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45d43cc9-be22-a7d2-1628-3fb30232bd7c@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Tue, Jun 16, 2020 at 12:05:49PM -0500, Pierre-Louis Bossart wrote:
> 
> 
> 
> > > > simple-card.c and audio-graph-card do hard-code but that's done
> > > > with C in
> > > > the driver:
> > > > 
> > > >     ret = asoc_simple_parse_daifmt(dev, cpu_ep, codec_ep,
> > > >                        NULL, &dai_link->dai_fmt);
> > > >     if (ret < 0)
> > > >         goto out_put_node;
> > > > 
> > > >     dai_link->dpcm_playback        = 1;
> > > >     dai_link->dpcm_capture        = 1;
> > > > 
> > > > 
> > > > that that should be fixed based on the DAI format used in that
> > > > dai_link - in
> > > > other words we can make sure the capabilities of the dailink are aligned
> > > > with the dais while parsing the DT blobs.
> > > 
> > > But how do you know which capabilities to set? The device tree doesn't
> > > tells us that. We could add some code to look up the snd_soc_dai_driver
> > > early, based on the references in the device tree (basically something
> > > like snd_soc_of_get_dai_name(), see
> > >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/soc-core.c#n2988)
> > > 
> > > 
> > > At least to me that function doesn't exactly look trivial though,
> > > and that's just to properly fill in the dpcm_playback/capture
> > > parameters. Essentially those parameters only complicate the current
> > > device tree use case,  where you want the DAI link to be for both
> > > playback/capture, but restricted to the capabilities of the DAI.
> > > 
> > > Just wondering if setting up dpcm_playback/capture properly is worth it
> > > at all in this case. This isn't necessary for the non-DPCM case either,
> > > there we automatically set it based on the DAI capabilities.
> > 
> > We can add a simple loop for each direction that relies on
> > snd_soc_dai_stream_valid() to identify if each DAI is capable of doing
> > playback/capture.
> 
> see below completely untested diff to show what I had in mind: we already
> make use of snd_soc_dai_stream_valid() in other parts of the core so we
> should be able to determine dpcm_playback/capture based on the same
> information already used.
> 
> diff --git a/sound/soc/generic/audio-graph-card.c
> b/sound/soc/generic/audio-graph-card.c
> index 9ad35d9940fe..4c67f1f65eb4 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -215,7 +215,9 @@ static int graph_dai_link_of_dpcm(struct
> asoc_simple_priv *priv,
>         struct asoc_simple_dai *dai;
>         struct snd_soc_dai_link_component *cpus = dai_link->cpus;
>         struct snd_soc_dai_link_component *codecs = dai_link->codecs;
> +       int stream;
>         int ret;
> +       int i;
> 
>         /* Do it all CPU endpoint, and 1st Codec endpoint */
>         if (!li->cpu && dup_codec)
> @@ -317,8 +319,34 @@ static int graph_dai_link_of_dpcm(struct
> asoc_simple_priv *priv,
>         if (ret < 0)
>                 goto out_put_node;
> 
> -       dai_link->dpcm_playback         = 1;
> -       dai_link->dpcm_capture          = 1;
> +       for_each_pcm_streams(stream) {
> +               struct snd_soc_dai_link_component *cpu;
> +               struct snd_soc_dai_link_component *codec;
> +               struct snd_soc_dai *d;
> +               bool dpcm_direction = true;
> +
> +               for_each_link_cpus(dai_link, i, cpu) {
> +                       d = snd_soc_find_dai(cpu);
> +                       if (!d || !snd_soc_dai_stream_valid(d, stream)) {
> +                               dpcm_direction = false;
> +                               break;
> +                       }
> +               }
> +               for_each_link_codecs(dai_link, i, codec) {
> +                       d = snd_soc_find_dai(codec);
> +                       if (!d || !snd_soc_dai_stream_valid(d, stream)) {
> +                               dpcm_direction = false;
> +                               break;
> +                       }
> +               }
> +               if (dpcm_direction) {
> +                       if (stream == SNDRV_PCM_STREAM_PLAYBACK)
> +                               dai_link->dpcm_playback = 1;
> +                       if (stream == SNDRV_PCM_STREAM_CAPTURE)
> +                               dai_link->dpcm_capture = 1;
> +               }
> +       }
> +
>         dai_link->ops                   = &graph_ops;
>         dai_link->init                  = asoc_simple_dai_init;
> 

Thanks for the diff! I tested it for my case and it seems to work fine
so far. I'm fine with this solution given that it fixes the problem
I mentioned. We would need to patch it into at least
simple-audio-card.c, audio-graph-card.c and soc/qcom/common.c
(probably best to create a shared function in soc-core.c then).

However, personally I still think that dpcm_playback/capture essentially
just duplicate the capabilities that are already exposed as part of the
DAI drivers. We don't need that duplication in the non-DPCM case,
so I wonder if we really need it for DPCM.

With your diff we go over all the DAIs to set dpcm_playback/capture
correctly so that soc_new_pcm() can then verify that they were set
correctly. IMO it would be much simpler to restore the previous behavior
and just make soc_new_pcm() rely on the DAI capabilities to decide
if playback/capture is supported, without producing the error.

Thanks,
Stephan
