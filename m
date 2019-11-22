Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DAA10769A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B39182F;
	Fri, 22 Nov 2019 18:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B39182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574444507;
	bh=1ZBHbZy4YhRzMTcgyPpiyMgDiuxOh+l8FGrmHDa7p2A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmvqfe9VzuL1R+/UheWsA7YMzfhEu8fgQ+hmj3bqM+BiorvZibjvz1CtRQZQDbiXz
	 JAaHpvarZl+Tshbh5LNGAVqw6fskV5Y78TArAJHyGJNEyQXyGU3fDJvk1AVqQv6aFf
	 osWPkOcN8uFK5GqeoWfxz9++Ig2KtuDF4S1lfynU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91931F801ED;
	Fri, 22 Nov 2019 18:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0AC4F8019B; Fri, 22 Nov 2019 18:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ABCCF80161
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABCCF80161
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="238683032"
Received: from sygreen1-mobl4.amr.corp.intel.com (HELO [10.252.195.68])
 ([10.252.195.68])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2019 09:38:47 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87r2208o9g.wl-kuninori.morimoto.gx@renesas.com>
 <87a78o8o2m.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <463fb1e1-74ed-995a-ff08-1aec4388c93a@linux.intel.com>
Date: Fri, 22 Nov 2019 10:41:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87a78o8o2m.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 12/14] ASoC: soc-core: rename
 soc_link_init() to soc_init_pcm_runtime()
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


> +static int soc_init_pcm_runtime(struct snd_soc_card *card,
> +				struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>   	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> @@ -1998,8 +1998,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   		goto probe_end;
>   	}
>   
> -	for_each_card_rtds(card, rtd)
> -		soc_link_init(card, rtd);
> +	for_each_card_rtds(card, rtd) {
> +		ret = soc_init_pcm_runtime(card, rtd);
> +		if (ret < 0)
> +			goto probe_end;
> +	}

might be better to first introduce the error check (functional change), 
then rename?

>   
>   	snd_soc_dapm_link_dai_widgets(card);
>   	snd_soc_dapm_connect_dai_link_widgets(card);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
