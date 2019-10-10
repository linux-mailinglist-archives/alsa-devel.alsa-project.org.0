Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27329D2DF8
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 17:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960E71687;
	Thu, 10 Oct 2019 17:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960E71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570722171;
	bh=Br/ln855n06mLDbCiCbQMGaHTG+SamLEgHi5K2ykUIc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjxZN5f/Rv8QhJ9HMUk4NMX+kfFk/Orva2VLNTAMwWQ7IQYW4hMjkTfO7Pg2YBAm4
	 /f+5z6BzR68P1k7t/lZ1LFCDmW7akuaER9B1WEDgUPVq7x5q4nSGnE1Bl6wQpriWnv
	 3IHIkB7dIG2bVXbYGm284bAF+obvLWVmy55IhO/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC59CF8060D;
	Thu, 10 Oct 2019 17:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EF0F805FD; Thu, 10 Oct 2019 17:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E9EF80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 17:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E9EF80113
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 08:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="369125055"
Received: from aandraox-mobl1.amr.corp.intel.com (HELO [10.254.98.68])
 ([10.254.98.68])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2019 08:40:59 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <87bluqilqm.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <562d76de-c724-e98b-ce7d-105a88bf17ce@linux.intel.com>
Date: Thu, 10 Oct 2019 10:19:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87bluqilqm.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 12/21] ASoC: soc-core: use
 snd_soc_lookup_component() at snd_soc_unregister_component()
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
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_unregister_component() is now finding component manually,
> but we already have snd_soc_lookup_component() to find component;
> Let's use existing function.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 7c0bb32..3e8ed4f 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2823,8 +2823,10 @@ static void snd_soc_try_rebind_card(void)
>   
>   static void snd_soc_del_component(struct snd_soc_component *component)
>   {
> +	mutex_lock(&client_mutex);
>   	snd_soc_unregister_dais(component);
>   	snd_soc_component_del(component);
> +	mutex_unlock(&client_mutex);
>   }
>   
>   int snd_soc_add_component(struct device *dev,
> @@ -2887,29 +2889,16 @@ EXPORT_SYMBOL_GPL(snd_soc_register_component);
>    *
>    * @dev: The device to unregister
>    */
> -static int __snd_soc_unregister_component(struct device *dev)
> +void snd_soc_unregister_component(struct device *dev)
>   {
>   	struct snd_soc_component *component;
> -	int found = 0;
> -
> -	mutex_lock(&client_mutex);
> -	for_each_component(component) {
> -		if (dev != component->dev)
> -			continue;
>   
> +	while (1) {
> +		component = snd_soc_lookup_component(dev, NULL);
> +		if (!component)
> +			break;
>   		snd_soc_del_component(component);

is it ok/intended that the mutex lock is now taken *after* looking up 
the component and after each iteration ?

> -		found = 1;
> -		break;
>   	}
> -	mutex_unlock(&client_mutex);
> -
> -	return found;
> -}
> -
> -void snd_soc_unregister_component(struct device *dev)
> -{
> -	while (__snd_soc_unregister_component(dev))
> -		;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
