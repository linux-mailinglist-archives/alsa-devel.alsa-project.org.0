Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE97834FD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E83810E;
	Tue,  6 Aug 2019 17:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E83810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104757;
	bh=LTheBSFnwuiW0kYq18gNY3FrfeWeaOl2770Ft1LC1q0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYs2VG0dh5lq/wDZNjVRvAoawYisxjv9dS3+JwTzzd4O6yPvYcPhpYk1c4Mo4Wyqd
	 STps6LIkEg+wDUr+Oz7O6eKmBXQ7iAeczErE0Z5i22GMv+jD+sAa/mkNXIyBEObsa+
	 jO1wPT+nVaqCl9Ojpyv+8tY3c6SfnLsk29bswktE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38383F8059F;
	Tue,  6 Aug 2019 17:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E4AF80535; Tue,  6 Aug 2019 17:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FA03F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FA03F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165012372"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:15:52 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87imrb2ify.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ba8876cf-97cb-3ca4-b957-c7f4bd1636ef@linux.intel.com>
Date: Tue, 6 Aug 2019 09:54:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87imrb2ify.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 13/28] ASoC: soc-core: remove verbose debug
 message from soc_bind_dai_link()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/5/19 8:29 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_bind_dai_link() will print debug message if dai_link was
> already binded. But it is very verbose. Print dai_link name when
> first binding is very enough.
> This patch removes verbose debug message
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index df0c22e..838a843 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -864,13 +864,10 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
>   	if (dai_link->ignore)
>   		return 0;
>   
> -	dev_dbg(card->dev, "ASoC: binding %s\n", dai_link->name);
> -
> -	if (soc_is_dai_link_bound(card, dai_link)) {
> -		dev_dbg(card->dev, "ASoC: dai link %s already bound\n",
> -			dai_link->name);
> +	if (soc_is_dai_link_bound(card, dai_link))
>   		return 0;
> -	}
> +
> +	dev_dbg(card->dev, "ASoC: binding %s\n", dai_link->name);

If you want to reduce verbosity, I would have kept the other message 
which tells you about a configuration error. Here you are reducing the 
ability to debug really.

>   
>   	rtd = soc_new_pcm_runtime(card, dai_link);
>   	if (!rtd)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
