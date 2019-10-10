Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB9D2DF9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 17:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788C01684;
	Thu, 10 Oct 2019 17:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788C01684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570722218;
	bh=qwnPkLvUSwFpe2nAJRO0oVquSp3dqrdhF49zX14YZdA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FO5/WCwUy8iWrHgjAxitz6p+aQYv51dHt3V0fPgqzkj9QBqrAVHmVJfYnB2+NptNu
	 lxYuNnCdJDOr1tzfHoACK7RnkGcblu3pyhNvBzrESDNygXzc8Wcua1Fwyw3HVTn7Ci
	 cw+5OxlXoVLxPI8FcFrnUrhb67hrM+NJ6ruo/fg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E29EF80447;
	Thu, 10 Oct 2019 17:41:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE88EF805FB; Thu, 10 Oct 2019 17:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346E8F8045E
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 17:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346E8F8045E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 08:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="369125051"
Received: from aandraox-mobl1.amr.corp.intel.com (HELO [10.254.98.68])
 ([10.254.98.68])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2019 08:40:58 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <87d0f6ilqq.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b6b3dc35-e596-7005-3cad-516c65fe7784@linux.intel.com>
Date: Thu, 10 Oct 2019 10:16:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87d0f6ilqq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 11/21] ASoC: soc-core: add
	snd_soc_del_component()
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



On 10/8/19 11:30 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> It is easy to read code if it is cleanly using paired function/naming,
> like start <-> stop, register <-> unregister, etc, etc.
> But, current ALSA SoC code is very random, unbalance, not paired, etc.
> It is easy to create bug at the such code, and is difficult to debug.
> 
> Now ALSA SoC has snd_soc_add_component(), but there is no paired
> snd_soc_del_component(). Thus, snd_soc_unregister_component() is
> calling cleanup function randomly. it is difficult to read.
> This patch adds missing snd_soc_del_component() and balance up code.


the problem now is that the naming is confusing

we have snd_soc_component_del and snd_soc_del_component.
we already had snd_soc_component_add and snd_soc_add_component.

Also I find it useful to keep the _unlocked suffix when relevant, it 
adds value that is lost otherwise.

Can we avoid this pretty please?

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 72eb59c..7c0bb32 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2767,12 +2767,7 @@ static void snd_soc_component_add(struct snd_soc_component *component)
>   	mutex_unlock(&client_mutex);
>   }
>   
> -static void snd_soc_component_cleanup(struct snd_soc_component *component)
> -{
> -	snd_soc_unregister_dais(component);
> -}
> -
> -static void snd_soc_component_del_unlocked(struct snd_soc_component *component)
> +static void snd_soc_component_del(struct snd_soc_component *component)
>   {
>   	struct snd_soc_card *card = component->card;
>   
> @@ -2826,6 +2821,12 @@ static void snd_soc_try_rebind_card(void)
>   			list_del(&card->list);
>   }
>   
> +static void snd_soc_del_component(struct snd_soc_component *component)
> +{
> +	snd_soc_unregister_dais(component);
> +	snd_soc_component_del(component);
> +}
> +
>   int snd_soc_add_component(struct device *dev,
>   			struct snd_soc_component *component,
>   			const struct snd_soc_component_driver *component_driver,
> @@ -2858,7 +2859,7 @@ int snd_soc_add_component(struct device *dev,
>   	return 0;
>   
>   err_cleanup:
> -	snd_soc_component_cleanup(component);
> +	snd_soc_del_component(component);
>   err_free:
>   	return ret;
>   }
> @@ -2896,15 +2897,12 @@ static int __snd_soc_unregister_component(struct device *dev)
>   		if (dev != component->dev)
>   			continue;
>   
> -		snd_soc_component_del_unlocked(component);
> +		snd_soc_del_component(component);
>   		found = 1;
>   		break;
>   	}
>   	mutex_unlock(&client_mutex);
>   
> -	if (found)
> -		snd_soc_component_cleanup(component);
> -
>   	return found;
>   }
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
