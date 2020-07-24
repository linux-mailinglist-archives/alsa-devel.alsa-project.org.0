Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865122C0B1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 10:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11A6C168B;
	Fri, 24 Jul 2020 10:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11A6C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595579621;
	bh=FzFdMx256j8gIkvc/vasmW5sucGF3CMHBR3czxRFry0=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pi/rmKgrFopxAEDy4oJK16MhtUGjkdkbDbQZqLttpSwL7tPR6hVxa22QxmIPTx3jf
	 kg8dGwQWlICJj/0FTnvAF5bRtBPRyK6dMyXGWCp+Nv7YHssz13rk6nT2RATqnO0z/W
	 lioMFtxNGkuLYkJFIh5RbNeNMMchEjgMEA/BFNhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18CBFF8011F;
	Fri, 24 Jul 2020 10:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB70EF8014C; Fri, 24 Jul 2020 10:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19959F8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 10:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19959F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="UGGWx3pH"
Received: by mail-wr1-x441.google.com with SMTP id a15so7504469wrh.10
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 01:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=t8iw4vG22j4Hao1CpzPmsHZ84TvzdNOkMSscONpNECU=;
 b=UGGWx3pHKB8YyPxib62i/AKRxYgRLj1xiO/3B0yq/irmtrvdipTPKgscVL/Y0FrfHe
 HAIRVto00WXG6v5iVU7Xl9MpIxDW12tviCgZBABZu+btVXXTXZBo0bsce0Oj3UUfBH3I
 KuJFRfbE2VJ0cJlsYS04OmCUH+9TF/H/ehFYhP1XXm+W4au424DneoF1DvOxnZ1V2MnA
 2DQ+qsB3xWO5zFn+2gTndiiby1eydxZKWIwF7UrJkD7mfeiowT4cNO84+lR7/yXMxRks
 ZJIHc2on9cRZK2hz9A++Kc53bgAjBzZX9W8Nu5Kv+DVRIzm3nAVpdMvIQSTgBmPNmr9Z
 FAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=t8iw4vG22j4Hao1CpzPmsHZ84TvzdNOkMSscONpNECU=;
 b=FkrGlE4CfopWn5PXkiGJrhACCZYit1dTJ1D2sa4asU9L26/Suilfq4KZ1xtqwOijwc
 IVp87bk7lcrrrPMnfWIM5t5seBF4R5zq0Y48WCCvCHejie9ZCBoaboXj2KAFivBc21hn
 YHI7S9r1aJmWa3hrekyyYj6dDfWjc1DUOzG+7PE+Y+y6HcsDoMiGc9+sIPmtl+OCEI9u
 NfH+4aY51g+F0yDpkVp1C+/WgYJYEJtubrxCSv62Jc0ltQVZAVMi7+EvLYho4PhqlyZC
 vYOPNPx7ayv8V19T4DNOtdn4N6/TwSlB5S+aY/Tj1fq3NYCviQPNOdpUv6jzh4HHuEs1
 rquQ==
X-Gm-Message-State: AOAM5300OJDnaTQGT/48TAJaOOmRxf0pOGHnsgdJ3wSSopDocd6z6K/W
 nFgHgXTr14QScdc6O4MOJ7qnyQ==
X-Google-Smtp-Source: ABdhPJwo92Ml987SOXqo3Hg5X5dvXjOOHBvreb7VKrOSdO29x2/W88mUB+4bii6cT9rc7frNzGNAEQ==
X-Received: by 2002:adf:e647:: with SMTP id b7mr1040040wrn.220.1595579505157; 
 Fri, 24 Jul 2020 01:31:45 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v1sm429378wro.83.2020.07.24.01.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 01:31:44 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: core: use less strict tests for dailink capabilities
In-reply-to: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
Date: Fri, 24 Jul 2020 10:31:43 +0200
Message-ID: <1jlfj98gb4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tiwai@suse.de, broonie@kernel.org
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


On Thu 23 Jul 2020 at 20:05, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> Previous updates to set dailink capabilities and check dailink
> capabilities were based on a flawed assumption that all dais support
> the same capabilities as the dailink. This is true for TDM
> configurations

Actually it is not true for TDM either, having codecs with different
playback/capture caps is valid with TDM as well

> but existing configurations use an amplifier and a
> capture device on the same dailink, and the tests would prevent the
> card from probing.
>
> This patch modifies the snd_soc_dai_link_set_capabilities()
> helper so that the dpcm_playback (resp. dpcm_capture) dailink
> capabilities are set if at least one dai supports playback (resp. capture).
>
> Likewise the checks are modified so that an error is reported only
> when dpcm_playback (resp. dpcm_capture) is set but none of the CPU
> DAIs support playback (resp. capture).

This was not is the original proposal you sent ...

>
> Fixes: 25612477d20b5 ('ASoC: soc-dai: set dai_link dpcm_ flags with a helper')
> Fixes: b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/soc-dai.c | 16 +++++++++-------
>  sound/soc/soc-pcm.c | 42 ++++++++++++++++++++++++------------------
>  2 files changed, 33 insertions(+), 25 deletions(-)
>
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 98f0c98b06bb..ef1700e5e1bf 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -402,28 +402,30 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
>  	struct snd_soc_dai_link_component *codec;
>  	struct snd_soc_dai *dai;
>  	bool supported[SNDRV_PCM_STREAM_LAST + 1];
> +	bool supported_cpu;
> +	bool supported_codec;
>  	int direction;
>  	int i;
>  
>  	for_each_pcm_streams(direction) {
> -		supported[direction] = true;
> +		supported_cpu = false;
> +		supported_codec = false;
>  
>  		for_each_link_cpus(dai_link, i, cpu) {
>  			dai = snd_soc_find_dai(cpu);
> -			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
> -				supported[direction] = false;
> +			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
> +				supported_cpu = true;
>  				break;
>  			}
>  		}
> -		if (!supported[direction])
> -			continue;
>  		for_each_link_codecs(dai_link, i, codec) {
>  			dai = snd_soc_find_dai(codec);
> -			if (!dai || !snd_soc_dai_stream_valid(dai, direction)) {
> -				supported[direction] = false;
> +			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
> +				supported_codec = true;
>  				break;
>  			}
>  		}
> +		supported[direction] = supported_cpu && supported_codec;
>  	}
>  
>  	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index f2c7c85ad40c..aac61df0c50e 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2743,30 +2743,36 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>  		if (rtd->dai_link->dpcm_playback) {
>  			stream = SNDRV_PCM_STREAM_PLAYBACK;
>  
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -				if (!snd_soc_dai_stream_valid(cpu_dai,
> -							      stream)) {
> -					dev_err(rtd->card->dev,
> -						"CPU DAI %s for rtd %s does not support playback\n",
> -						cpu_dai->name,
> -						rtd->dai_link->stream_name);
> -					return -EINVAL;
> +			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> +				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> +					playback = 1;
> +					break;
>  				}
> -			playback = 1;
> +			}
> +
> +			if (!playback) {
> +				dev_err(rtd->card->dev,
> +					"No CPU DAIs support playback for stream %s\n",
> +					rtd->dai_link->stream_name);
> +				return -EINVAL;
> +			}

Again, this is changing the original meaning of the flag from "playback
allowed" to "playback required".

This patch (or the orignal) does not explain why this change of meaning
is necessary ? The point I was making here [0] still stands.

If your evil plan is to get rid of 2 of the 4 flags, why go through the
trouble of the changing the meaning and effect of one them ?

[0]: https://lore.kernel.org/r/1j1rla9s22.fsf@starbuckisacylon.baylibre.com

>  		}
>  		if (rtd->dai_link->dpcm_capture) {
>  			stream = SNDRV_PCM_STREAM_CAPTURE;
>  
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -				if (!snd_soc_dai_stream_valid(cpu_dai,
> -							      stream)) {
> -					dev_err(rtd->card->dev,
> -						"CPU DAI %s for rtd %s does not support capture\n",
> -						cpu_dai->name,
> -						rtd->dai_link->stream_name);
> -					return -EINVAL;
> +			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> +				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> +					capture = 1;
> +					break;
>  				}
> -			capture = 1;
> +			}
> +
> +			if (!capture) {
> +				dev_err(rtd->card->dev,
> +					"No CPU DAIs support capture for stream %s\n",
> +					rtd->dai_link->stream_name);
> +				return -EINVAL;
> +			}
>  		}
>  	} else {
>  		/* Adapt stream for codec2codec links */

