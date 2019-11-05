Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B05EF3B4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 03:49:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411E61716;
	Tue,  5 Nov 2019 03:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411E61716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572922179;
	bh=VjCM98FxntMSDwmC0dxRQuLUfqM9YEososZYYmH1apU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PkiRpJBsv4dQyMhzxVxFj2fuwLm5eqXA6q/Sgiqz9qRANILvCbPdeDLdcLrRzMCXn
	 KgVlUTHcku0HJYnfjnZmGLoTVdMACscAdP6Ba4iPCCYnCU2vkM0+fU95L2ZCvA0c5Y
	 77538aBTpI10uoanrAYALZW7ZF+WHFDt1fw+NqnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52851F80610;
	Tue,  5 Nov 2019 03:47:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50AB2F8049B; Tue,  5 Nov 2019 03:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615B9F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 03:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615B9F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 18:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; d="scan'208";a="226952321"
Received: from demiho-mobl.amr.corp.intel.com (HELO [10.255.94.53])
 ([10.255.94.53])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2019 18:46:53 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
 <87tv7rc9be.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <16781745-5310-424a-3ad1-fae4a566bc1d@linux.intel.com>
Date: Mon, 4 Nov 2019 20:22:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87tv7rc9be.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 resend 07/18] ASoC: soc-core: move
 snd_soc_lookup_component()
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


> +struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
> +						   const char *driver_name)
> +{
> +	struct snd_soc_component *component;
> +	struct snd_soc_component *ret;
> +
> +	ret = NULL;
> +	mutex_lock(&client_mutex);
> +	for_each_component(component) {
> +		if (dev != component->dev)
> +			continue;
> +
> +		if (driver_name &&
> +		    (driver_name != component->driver->name) &&
> +		    (strcmp(component->driver->name, driver_name) != 0))
> +			continue;
> +
> +		ret = component;
> +		break;

The mix of continue and break in the same loop is odd.

can this be done with break only, e.g. (check the logic)

for_each_component(component) {
	if (dev == component->dev &&
	   (!driver_name ||
	    (driver_name == component->driver->name) ||
	    (strcmp(component->driver->name, driver_name) == 0))
		ret = component;
		break;
}

> +	mutex_unlock(&client_mutex);
> +
> +	return ret;

usually 'return ret' is for an error code. It's odd to use it for a pointer.

> +}
> +EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
> +
>   struct snd_pcm_substream *snd_soc_get_dai_substream(struct snd_soc_card *card,
>   		const char *dai_link, int stream)
>   {
> @@ -2889,32 +2915,6 @@ void snd_soc_unregister_component(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
>   
> -struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
> -						   const char *driver_name)
> -{
> -	struct snd_soc_component *component;
> -	struct snd_soc_component *ret;
> -
> -	ret = NULL;
> -	mutex_lock(&client_mutex);
> -	for_each_component(component) {
> -		if (dev != component->dev)
> -			continue;
> -
> -		if (driver_name &&
> -		    (driver_name != component->driver->name) &&
> -		    (strcmp(component->driver->name, driver_name) != 0))
> -			continue;
> -
> -		ret = component;
> -		break;
> -	}
> -	mutex_unlock(&client_mutex);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
> -
>   /* Retrieve a card's name from device tree */
>   int snd_soc_of_parse_card_name(struct snd_soc_card *card,
>   			       const char *propname)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
