Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53423220B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7756B1717;
	Wed, 29 Jul 2020 17:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7756B1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596038286;
	bh=ypKljuw+rWHc8pjVYuOK8ExU6hHd7bIlhR7AstImwLo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAEdC4xw6j3xoSMwjf6F8AhEodPLU96SLMQ24PM/1PYh2ZXg5ruXOxVjnFe4tVIRy
	 tyCLp2pSGCCG30cL0u0xWjJRNLUbpcF54QsK7xZhXaXESsC7Cv4LkAf3hIR1WHVYfc
	 Nc/CTWRZ87c4v6iT1XSl7HJZuvuhxy/ZXnn40BTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8816CF80125;
	Wed, 29 Jul 2020 17:56:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60997F801A3; Wed, 29 Jul 2020 17:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B91F5F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B91F5F800DE
IronPort-SDR: 5U7TwJ+j97pL2sCVQ+fG+tkchLf5M7bWAKvDT9C+FzbxoUNY+SgBl4rAexxCz0PMuMgMeVibCp
 HtTMvvYCNhXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="215936396"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="215936396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 08:56:10 -0700
IronPort-SDR: IDiwGItDXIzja3qJHXtAQwZsgkfdvjN51ZFJYyn4gETjqIXmWP3NNyN85itVh4GNZZCNBIn5O4
 HqvTijKzaFgQ==
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="322594221"
Received: from vmlivin-mobl1.amr.corp.intel.com (HELO [10.209.108.29])
 ([10.209.108.29])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 08:56:08 -0700
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
Date: Wed, 29 Jul 2020 10:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729154639.1983854-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
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



On 7/29/20 10:46 AM, Jerome Brunet wrote:
> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
> changed dpcm_playback and dpcm_capture semantic by throwing an error if
> these flags are not aligned with DAIs capabilities on the link.
> 
> The former semantic did not force the flags and DAI caps to be aligned.
> The flag previously allowed card drivers to disable a stream direction on
> a link (whether or not such feature is deemed useful).
> 
> With change ('ASoC: core: use less strict tests for dailink capabilities')
> an error is thrown if the flags and and the DAI caps are not aligned. Those
> parameters were not meant to aligned initially. No technical reason was
> given about why cards should now be considered "broken" in such condition
> is not met, or why it should be considered to be an improvement to enforce
> that.
> 
> Forcing the flags to be aligned with DAI caps just make the information
> the flag carry redundant with DAI caps, breaking a few cards along the way.
> 
> This change drops the added error conditions and restore the initial flag
> semantics.

or rather lack thereof.

I am ok to move dev_err to dev_warn and remove the return -EINVAL, but I 
maintain that we have to reach a point where configurations make sense 
before we can clean them up. If we implicitly push issues under the rug 
by not even being aware of them we'll never make progress.

> 
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
>   Hi Mark,
> 
>   Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>   introduced more than one problem, the change
>   "ASoC: core: use less strict tests for dailink capabilities" [0] is still
>   necessary but the change of semantic remains a problem with it.
> 
>   This patch applies on top of it.
> 
>   sound/soc/soc-pcm.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 00ac1cbf6f88..2e205b738eae 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   					break;
>   				}
>   			}
> -
> -			if (!playback) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support playback for stream %s\n",
> -					rtd->dai_link->stream_name);
> -				return -EINVAL;
> -			}
>   		}
>   		if (rtd->dai_link->dpcm_capture) {
>   			stream = SNDRV_PCM_STREAM_CAPTURE;
> @@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   					break;
>   				}
>   			}
> -
> -			if (!capture) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support capture for stream %s\n",
> -					rtd->dai_link->stream_name);
> -				return -EINVAL;
> -			}
>   		}
>   	} else {
>   		/* Adapt stream for codec2codec links */
> 
