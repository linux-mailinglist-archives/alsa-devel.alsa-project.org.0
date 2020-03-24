Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C3191278
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 15:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4730D1664;
	Tue, 24 Mar 2020 15:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4730D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585058896;
	bh=eplP30okL247j5OUMlIOFTomVkhDEK4NfVOXRmyHiic=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dUCCPKSw+rKz4x0QpYuPEhPpWlwIoivtm4MBNWydLOHvkhhxELWzvev4xuduhmNB/
	 A0qvXVicQDpgeAx0RX0J41tMcVtLLd5fbDpkNFgS7fLMlHRmM7NTNll/OVcVs17SIn
	 UsVVNq1cSG7uLlYGIz5NLfJek7Wj3Ry2aplV3C3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52BEBF800FE;
	Tue, 24 Mar 2020 15:06:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75FF7F801F9; Tue, 24 Mar 2020 15:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BAEEF80095;
 Tue, 24 Mar 2020 15:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAEEF80095
IronPort-SDR: Al2VW4TII2YfbzLSkCwQK3TMFQWtFI5qpz8BmEDNliz3LjVGVL7/dGJ44WNhY2tkuadZw6NkdY
 YYuaEfGtFLRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 07:06:25 -0700
IronPort-SDR: 0xQ55GZwzrC9evaEGcOCxp8oB+gTHfsvZ48GCF/lc6r9ceNfoYhc2s2aZJ12bpAiybOhVNmlgM
 UB8N+xy8yHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="240067405"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.33.88])
 by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2020 07:06:24 -0700
Date: Tue, 24 Mar 2020 15:06:22 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: (cosmetic) use for_each_pcm_streams() in
 sof_dai_load()
Message-ID: <20200324140622.GB29623@ubuntu>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324122921.29582-2-guennadi.liakhovetski@linux.intel.com>
 <451eb340-adf9-bb86-e4ef-4dee6763966b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451eb340-adf9-bb86-e4ef-4dee6763966b@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
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

Hi Pierre,

On Tue, Mar 24, 2020 at 08:29:43AM -0500, Pierre-Louis Bossart wrote:
> Guennadi, who are the intended reviewers/maintainers here and which tree is
> this supposed to be merged on?
> 
> Patch0 has everyone copied, patch 1/2 only target mailing lists, and I
> haven't seen any PR/CI for this?

Yes, as explained in my reply to Mark, I didn't want to spam everybody's mail 
boxes with all the patches, so I only copied the "patch 0" to maintainers 
and sent the patches themselves to lists only.

> I am flexible with processes, I am just lost here on what you had in mind.

I was advised to make this a separate patch from my VirtIO patch series, so 
I did that and sent it again directly to the mailing lists. But we can take 
it back to the local review process, if you prefer.

Thanks
Guennadi

> Thanks
> -Pierre
> 
> On 3/24/20 7:29 AM, Guennadi Liakhovetski wrote:
> > Use for_each_pcm_streams() to enumerate streams in sof_dai_load()
> > instead of doing that manually.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> >   sound/soc/sof/topology.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> > index 058de94..54437ca 100644
> > --- a/sound/soc/sof/topology.c
> > +++ b/sound/soc/sof/topology.c
> > @@ -2448,7 +2448,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
> >   	struct snd_soc_tplg_stream_caps *caps;
> >   	struct snd_soc_tplg_private *private = &pcm->priv;
> >   	struct snd_sof_pcm *spcm;
> > -	int stream = SNDRV_PCM_STREAM_PLAYBACK;
> > +	int stream;
> >   	int ret = 0;
> >   	/* nothing to do for BEs atm */
> > @@ -2460,8 +2460,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
> >   		return -ENOMEM;
> >   	spcm->scomp = scomp;
> > -	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
> > -	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
> > +
> > +	for_each_pcm_streams(stream)
> > +		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
> >   	spcm->pcm = *pcm;
> >   	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
> > @@ -2482,8 +2483,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
> >   	if (!spcm->pcm.playback)
> >   		goto capture;
> > +	stream = SNDRV_PCM_STREAM_PLAYBACK;
> > +
> >   	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
> > -		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
> > +		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
> >   	caps = &spcm->pcm.caps[stream];
> > @@ -2513,7 +2516,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
> >   		return ret;
> >   	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
> > -		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
> > +		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
> >   	caps = &spcm->pcm.caps[stream];
> > 
