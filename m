Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6E1910F9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 14:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0B01663;
	Tue, 24 Mar 2020 14:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0B01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585056996;
	bh=bsQyfYLawVtMOA5vA++O3dvtusmgNjuefx6xO7Lj1Tg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBjZgaYa0zF/MNIrhTyOjSK4GxYmyykNjhEw1C9tZIblDhYC1R+JtpAm2PHwt9J5/
	 +XgAvRd3x1+b4hIv9P3DovuPNJtcEJtpUyl5wfh5DKjvvJ+z4PbHqu/O6xy//afkBh
	 LhMzMhVUC+LSyCNCefK6NtH3q8GE3zgxbr9RlKwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 255DFF80249;
	Tue, 24 Mar 2020 14:34:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC92F80258; Tue, 24 Mar 2020 14:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36F69F801F8;
 Tue, 24 Mar 2020 14:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F69F801F8
IronPort-SDR: eaEc0j7Mo7ibsGF1nWoeR6m1eJkTNC2+K39h5AM643P2jKCih7Hy6GvOHGbR6ysnHRMRFjLzqr
 DXtwejvUB8Yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 06:34:04 -0700
IronPort-SDR: ZA2QTQaAVCTK2ztHNZRdgnJJEjoDWsHj9i0eza2PDp/j1LaZV8T9+/ckhmTtySyyxPlbcFmMWQ
 W6KSvzzFDiJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="325910645"
Received: from jgcortes-mobl1.amr.corp.intel.com (HELO [10.251.225.70])
 ([10.251.225.70])
 by orsmga001.jf.intel.com with ESMTP; 24 Mar 2020 06:34:03 -0700
Subject: Re: [PATCH 1/2] ASoC: SOF: (cosmetic) use for_each_pcm_streams() in
 sof_dai_load()
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324122921.29582-2-guennadi.liakhovetski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <451eb340-adf9-bb86-e4ef-4dee6763966b@linux.intel.com>
Date: Tue, 24 Mar 2020 08:29:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324122921.29582-2-guennadi.liakhovetski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sound-open-firmware@alsa-project.org
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

Guennadi, who are the intended reviewers/maintainers here and which tree 
is this supposed to be merged on?

Patch0 has everyone copied, patch 1/2 only target mailing lists, and I 
haven't seen any PR/CI for this?

I am flexible with processes, I am just lost here on what you had in mind.

Thanks
-Pierre

On 3/24/20 7:29 AM, Guennadi Liakhovetski wrote:
> Use for_each_pcm_streams() to enumerate streams in sof_dai_load()
> instead of doing that manually.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>   sound/soc/sof/topology.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 058de94..54437ca 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2448,7 +2448,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>   	struct snd_soc_tplg_stream_caps *caps;
>   	struct snd_soc_tplg_private *private = &pcm->priv;
>   	struct snd_sof_pcm *spcm;
> -	int stream = SNDRV_PCM_STREAM_PLAYBACK;
> +	int stream;
>   	int ret = 0;
>   
>   	/* nothing to do for BEs atm */
> @@ -2460,8 +2460,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>   		return -ENOMEM;
>   
>   	spcm->scomp = scomp;
> -	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
> -	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
> +
> +	for_each_pcm_streams(stream)
> +		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
>   
>   	spcm->pcm = *pcm;
>   	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
> @@ -2482,8 +2483,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>   	if (!spcm->pcm.playback)
>   		goto capture;
>   
> +	stream = SNDRV_PCM_STREAM_PLAYBACK;
> +
>   	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
> -		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
> +		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
>   
>   	caps = &spcm->pcm.caps[stream];
>   
> @@ -2513,7 +2516,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>   		return ret;
>   
>   	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
> -		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
> +		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
>   
>   	caps = &spcm->pcm.caps[stream];
>   
> 
