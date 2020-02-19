Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D41651F1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64DF316A9;
	Wed, 19 Feb 2020 22:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64DF316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582149334;
	bh=ACPiDPU/AwaDIXQvmX6YsRnNtMapN2Dp2lVgMLGlhhQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCmXB53IaGL4Xxo/Q8x03i3N+P8h9RNreqUxoBa+57aCjOaVa1sdNoE/OQYZRO49p
	 wyPH6s18yyI/YNhy+SGBdG9X02gMziYvTAZ0ikCMLc+ziPpW+lDY/oYGA1A7yZsFkX
	 TfWSLnTYOl0FQd8/UoQJ3tOj9HO19a2jIVQyC4Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C3DF80276;
	Wed, 19 Feb 2020 22:53:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F58F80273; Wed, 19 Feb 2020 22:53:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7F27F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 22:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7F27F80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 13:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="228724420"
Received: from ssavage-mobl.amr.corp.intel.com (HELO [10.254.46.100])
 ([10.254.46.100])
 by fmsmga007.fm.intel.com with ESMTP; 19 Feb 2020 13:53:43 -0800
Subject: Re: [PATCH] ASoC: dpcm: remove confusing trace in dpcm_get_be()
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200219115048.934678-1-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <88391284-8125-1be6-f7c9-4509b1d89367@linux.intel.com>
Date: Wed, 19 Feb 2020 15:53:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219115048.934678-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 2/19/20 5:50 AM, Jerome Brunet wrote:
> Now that dpcm_get_be() is used in dpcm_end_walk_at_be(), it is not a error
> if this function does not find a BE for the provided widget. Remove the
> related dev_err() trace which is confusing since things might be working
> as expected.
> 
> When called from dpcm_add_paths(), it is an error if dpcm_get_be() fails to
> find a BE for the provided widget. The necessary error trace is already
> done in this case.
> 
> Fixes: 027a48387183 ("ASoC: soc-pcm: use dpcm_get_be() at dpcm_end_walk_at_be()")
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Good catch, this error log is indeed unnecessary, I see more than 30 
lines of 'can't get capture/playback BE' for all the non-BE widgets in 
our topologies (PCM, buffers, PGA, EQ, etc).

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/soc-pcm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 63f67eb7c077..aff27c8599ef 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1270,9 +1270,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
>   		}
>   	}
>   
> -	/* dai link name and stream name set correctly ? */
> -	dev_err(card->dev, "ASoC: can't get %s BE for %s\n",
> -		stream ? "capture" : "playback", widget->name);
> +	/* Widget provided is not a BE */
>   	return NULL;
>   }
>   
> 
