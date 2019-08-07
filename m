Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8678533E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 20:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455F1851;
	Wed,  7 Aug 2019 20:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455F1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565203868;
	bh=Q78gncVLM1u5dZ46XKTJf+Xg480O3ci5ysJ/K8aNlHA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCrnw8KFnb/bk+Zzy6GtdNFSfMeTc4Eg8jH4FcCo/m76LtMiSUtoa1/2rYq3JTh4b
	 2XyrbRVxG8W97KuhFbqbgnpR1hM6Pu78XiKZCBOQbhfMiZLelJ9C+hpFsq40Gl1kZ+
	 28tGxJLUPWxlP0c81iwOmRLGM/tQmfDPjuasPkXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 709ECF800E4;
	Wed,  7 Aug 2019 20:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4F2BF80290; Wed,  7 Aug 2019 20:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1671F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 20:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1671F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 11:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="176278595"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.6.17])
 ([10.252.6.17])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 11:49:10 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87y305932s.wl-kuninori.morimoto.gx@renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f3ead090-8c2c-6be5-70b8-c6530239302a@intel.com>
Date: Wed, 7 Aug 2019 20:49:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y305932s.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 19/25] ASoC: soc-core: don't call
 snd_soc_component_set_jack()
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

On 2019-08-07 03:31, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_component_set_jack() is used for both setting/clearing.
> Setting purpose is used under each driver.
> Hence, clearing purpose should be used under each driver, not soc-core.
> 
> soc-core shouldn't touch it even though its purpose was for clearing,
> otherwise, code becomes very confusable.
> This patch removes snd_soc_component_set_jack() from soc-core.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
> 	- no change
> 
>   sound/soc/soc-core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 80703618..e708095 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -938,7 +938,6 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
>   
>   static void soc_cleanup_component(struct snd_soc_component *component)
>   {
> -	snd_soc_component_set_jack(component, NULL, NULL);
>   	list_del(&component->card_list);
>   	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
>   	soc_cleanup_component_debugfs(component);
> 

This has been added lately for a reason - reload/ unload series.
Amadeusz, could you comment on this change?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
