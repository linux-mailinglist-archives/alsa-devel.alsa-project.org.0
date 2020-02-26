Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CA917086B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 20:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 527281693;
	Wed, 26 Feb 2020 20:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 527281693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582743968;
	bh=JMkMnM5TNpPd1h+fFlxD1Cnd3lPomMzPYEioV22q3/U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4MEXTc4EBGjPAg7IzG0/ljNC8qa4E9c1nRUEJreNN6gcayfNpSGITw7H9FobAnHb
	 fo6zyQzOAN0CLH898JVSQoe9TWuSQI03nUKOPvDuEbW/NeCSdCmoryQGxzgAHSrkUw
	 3gq4BpAEW5/QrcZjaq0c02xJCLTfDDn/+fcOi3Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE6AF800AD;
	Wed, 26 Feb 2020 20:04:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3741F8014E; Wed, 26 Feb 2020 20:04:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6398CF800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 20:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6398CF800AD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 11:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,489,1574150400"; d="scan'208";a="271853059"
Received: from terrellb-mobl1.amr.corp.intel.com (HELO [10.254.114.82])
 ([10.254.114.82])
 by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2020 11:04:18 -0800
Subject: Re: [PATCH 6/8] ASoC: soc-pcm: check DAI's activity more simply
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
 <875zft97i4.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <704a2cb1-ebcd-d433-0b8a-0f8d97d72fa5@linux.intel.com>
Date: Wed, 26 Feb 2020 13:04:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <875zft97i4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 2/26/20 12:40 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> DAI is counting its activity, and both playback/capture directional
> activity. When considering mute, DAI's activity is enough instead of
> caring both playback/capture.
> This patch makes mute check simply.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 4a14f10b8c90..7e0464ec802e 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1202,7 +1202,6 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_dai *cpu_dai;
>   	struct snd_soc_dai *codec_dai;
> -	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>   	int i;
>   
>   	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
> @@ -1226,11 +1225,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
>   
>   	/* apply codec digital mute */
>   	for_each_rtd_codec_dai(rtd, i, codec_dai) {
> -		int playback_active = codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK];
> -		int capture_active  = codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE];
> -
> -		if ((playback && playback_active == 1) ||
> -		    (!playback && capture_active == 1))
> +		if (codec_dai->active == 1)

nit-pick: we have two tests in soc-pcm.c

if (codec_dai->active)
if (codec_dai->active == 1)

The two are functionality equivalent but it'd be good to choose one 
version - or possibly use 'active' as a boolean.

>   			snd_soc_dai_digital_mute(codec_dai, 1,
>   						 substream->stream);
>   	}
> 
