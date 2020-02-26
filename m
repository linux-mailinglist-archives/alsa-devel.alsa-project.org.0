Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318D170494
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:40:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50696169E;
	Wed, 26 Feb 2020 17:39:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50696169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582735236;
	bh=noH/qZLvTaR1XnENrUQb557QW6QLkN9dSgVsgco9kh4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWfmOccQ79mYmQgQbbi+v352gIU7YrFEjguc/RzTujkeNMYAPJjObHZjKJ/3AroGh
	 Q7opbUQpAwyQ4xBe9Mz/leffEES2vLkWMJMJisBS//0PUF13+22w9c2IZuI6yKevgl
	 dNZdB7LnMY6qyZEyBh7TdvUGheUFTZyOJc2L0ntM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF88F80171;
	Wed, 26 Feb 2020 17:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04BA0F80171; Wed, 26 Feb 2020 17:38:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 598B5F8014D
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 598B5F8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 08:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="410671946"
Received: from nkaburla-mobl.amr.corp.intel.com (HELO [10.252.133.245])
 ([10.252.133.245])
 by orsmga005.jf.intel.com with ESMTP; 26 Feb 2020 08:38:03 -0800
Subject: Re: [PATCH 8/8] ASoC: soc-pcm: tidyup dulicate handing at
 dpcm_fe_dai_startup()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
 <8736ax97hm.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1e91e2da-2e86-abfb-19fe-7924c92350a8@linux.intel.com>
Date: Wed, 26 Feb 2020 09:22:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8736ax97hm.wl-kuninori.morimoto.gx@renesas.com>
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



On 2/26/20 12:41 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> error handling at dpcm_fe_dai_startup() has duplicate code.
> This patch tidyup it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 1f7a86c4bc02..2fdd90437a6f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2165,11 +2165,9 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
>   		goto unwind;
>   	}

nit-pick: since the two lines below are removed, the 'goto unwind' above 
becomes unnecessary. I don't mind if you leave it for symmetry with the 
rest of the error handling flow.

> -	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
> -	return 0;
> -
>   unwind:
> -	dpcm_be_dai_startup_unwind(fe, stream);
> +	if (ret < 0)
> +		dpcm_be_dai_startup_unwind(fe, stream);
>   be_err:
>   	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
>   	return ret;
> 
