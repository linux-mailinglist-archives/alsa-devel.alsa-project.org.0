Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770E5533D6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 15:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB79D20BC;
	Tue, 21 Jun 2022 15:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB79D20BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655818819;
	bh=fwax/Pkwxrv9EAcaY10xAsTelNY3ww0mq1gyEfcM/5E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XJEaTH4P+EYE7ySRZKyiKMeXHUBGMN2bOJ2r1KfIkcCr8n/jeb7AQNqGPvEhkhmgo
	 G5QQ0AxRg8tbRqRRXaap8iRHrw97lmvoD81SklM7gudJAQxD1QarQVQerkDiS+mAyX
	 +YnzY2hqCNb3CueR0Dov+Qse05RrXo+TPWoncIbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9739EF80535;
	Tue, 21 Jun 2022 15:38:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36E48F80155; Tue, 21 Jun 2022 15:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D93A6F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 15:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D93A6F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ep58IG5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655818722; x=1687354722;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fwax/Pkwxrv9EAcaY10xAsTelNY3ww0mq1gyEfcM/5E=;
 b=Ep58IG5Y6Y88E+og3CxC9iqs5V9HaH2c34ZtpG9ZTshwnyGySFTtABtY
 RS48lQwRc3NXvq+/6t2CsbgnogKjZnBmfiXQWQaJ8C+Kp/aYCp48sZwNn
 6IzsfFgS7XPZvYQAmRSOo3b0yWI9uYida9ITO2x6uHqhMHfJbjw+ic9z6
 COUYYYAlnVoRX+mLFAA+7wWmhnYiiiCK0Rx37wzrVaFn2MO2m0rsihnVd
 wG3dizW0F+dmc7hqIw0Ze0j/G3PkPh7v/qWoumP7a1d5DVFxOzFyY2Uxu
 n3FSntI4m3WsOj/CA6S/iNC2IcHf/VQ0F717VYIjsEy44+4l8eeIENnFt w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280167019"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="280167019"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 06:38:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591653661"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO [10.209.178.35])
 ([10.209.178.35])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 06:38:31 -0700
Message-ID: <24925485-9d0b-74c3-1e7f-b4906a3314ac@linux.intel.com>
Date: Tue, 21 Jun 2022 08:31:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: core: Exit all links before removing their
 components
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220621115758.3154933-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220621115758.3154933-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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



On 6/21/22 06:57, Cezary Rojewski wrote:
> Flows leading to link->init() and link->exit() are not symmetric.
> Currently the relevant part of card probe sequence goes as:
> 
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->probe()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->probe()
> 	for_each_card_rtds(card, rtd)
> 		rtd->init()
> 
> On the other side, equivalent remove sequence goes as:
> 
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->remove()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->remove()
> 	for_each_card_rtds(card, rtd)
> 		rtd->exit()
> 
> what can lead to errors as link->exit() may still operate on resources
> owned by its components despite the probability of them being freed
> during the component->remove().
> 
> This change modifies the remove sequence to:
> 
> 	for_each_card_rtds(card, rtd)
> 		rtd->exit()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->remove()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->remove()
> 
> so code found in link->exit() is safe to touch any component stuff as
> component->remove() has not been called yet.


This looks harmless as described, but...

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 4a3fca50a536..638e781df3b0 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -935,9 +935,6 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
>  {
>  	lockdep_assert_held(&client_mutex);
>  
> -	/* release machine specific resources */
> -	snd_soc_link_exit(rtd);
> -
>  	/*
>  	 * Notify the machine driver for extra destruction
>  	 */

.... what is not shown here is the 	

	soc_free_pcm_runtime(rtd);

which will call device_unregister(rtd->dev);

....

> @@ -1888,6 +1885,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>  
>  	snd_soc_dapm_shutdown(card);
>  
> +	/* release machine specific resources */
> +	for_each_card_rtds(card, rtd)
> +		snd_soc_link_exit(rtd);

... so there's still a risk that the link exit refers to memory that's
been released already.

We would need to make sure rtd->dev is not used in any of the existing
callbacks - or other functions such as e.g. snd_soc_close_delayed_work()
which makes use of rtd->dev

>  	/* remove and free each DAI */
>  	soc_remove_link_dais(card);
>  	soc_remove_link_components(card);
