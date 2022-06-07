Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5453F771
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 09:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6868E1917;
	Tue,  7 Jun 2022 09:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6868E1917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654587691;
	bh=W8olvD6jsW8G7sUBGciwGYzzYT1FeeRZhqthVitPYz4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Odd5Wjd+jj3EX/OykmvCcjj7gw3oIyf16HO3+GWibTl+CvoG205vcUj2cNlZ1mY8t
	 CM90QMSAqgslRFnll2q647HiIyxAkFl38J/13Xd8dc+IQONo93n9H0hYAHfmMBq31J
	 kviYVpCqBaKCjxPaQGpC3NLvZ9Uk0RiTXsVkJvbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA15F80109;
	Tue,  7 Jun 2022 09:40:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5EEF80159; Tue,  7 Jun 2022 09:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0990F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 09:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0990F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ngf303N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654587627; x=1686123627;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W8olvD6jsW8G7sUBGciwGYzzYT1FeeRZhqthVitPYz4=;
 b=ngf303N4N8o7iclFBxPgZQyc1e9T7VDeeb8UBygNCRVb0yBHtUYPoYrx
 /frSG44PDWXvfBn1edrFmMvbM5UPOKVOECvOlx3ngGEtsfaASBK3mZ7Dp
 h2/L2zyDxmfevoVbLG689ZLinwq40jLsN0cHkMuJuPSkivsap9yo6SrRA
 VtbQvmOUCdg7EWzM8QWhbmwoFqyVx/tUmZI9hin0BY+5gJprZrmAfZpfL
 FaPemAUrEt8lWP99sUQESyv4xY3pd6ySTk/+k1FvxJMYwasjF9guAac2E
 Ij/Y1adDcTsmGzQxsyDNdmlyR6CDYYJiiSBgZys0c2M6/0QAj+IyOBZd6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276752666"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="276752666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 00:40:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="906930360"
Received: from mrasiewx-mobl.ger.corp.intel.com (HELO [10.99.241.39])
 ([10.99.241.39])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 00:40:17 -0700
Message-ID: <238510b7-fc5f-4f1b-9e25-6e38b49c2535@linux.intel.com>
Date: Tue, 7 Jun 2022 09:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: topology: Avoid card NULL deref in
 snd_soc_tplg_component_remove()
Content-Language: en-US
To: Dean Gehnert <deang@tpi.com>, linux-kernel@vger.kernel.org
References: <20220603201425.2590-1-deang@tpi.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220603201425.2590-1-deang@tpi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 6/3/2022 10:14 PM, Dean Gehnert wrote:
> Don't deference card in comp->card->snd_card before checking for NULL card.
> 
> During the unloading of ASoC kernel modules, there is a kernel oops in
> snd_soc_tplg_component_remove() that happens because comp->card is set to
> NULL in soc_cleanup_component().
> 
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> Fixes: 7e567b5ae063 ("ASoC: topology: Add missing rwsem around snd_ctl_remove() calls")
> Signed-off-by: Dean Gehnert <deang@tpi.com>
> ---
>   sound/soc/soc-topology.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 3f9d314fba16..cf0efe1147c2 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -2613,15 +2613,18 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
>   /* remove dynamic controls from the component driver */
>   int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
>   {
> -	struct snd_card *card = comp->card->snd_card;
> +	struct snd_card *card;
>   	struct snd_soc_dobj *dobj, *next_dobj;
>   	int pass;
>   
>   	/* process the header types from end to start */
>   	for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
>   
> +		card = (comp->card) ? comp->card->snd_card : NULL;
> +
>   		/* remove mixer controls */
> -		down_write(&card->controls_rwsem);
> +		if (card)
> +			down_write(&card->controls_rwsem);
>   		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
>   			list) {

I'm pretty sure that quite a lot of operations in this 
list_for_each_entry_safe() loop require existing card...

And trying to investigate more closely, there is no 
soc_cleanup_component() mentioned in commit message, for quite a few 
kernel versions - seems to have been removed during v5.5-rc1.

I would say to not merge this, unless problem can be reproduced with 
latest kernel and even then would consider if it is a correct fix.

>   
> @@ -2660,7 +2663,8 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
>   				break;
>   			}
>   		}
> -		up_write(&card->controls_rwsem);
> +		if (card)
> +			up_write(&card->controls_rwsem);
>   	}
>   
>   	/* let caller know if FW can be freed when no objects are left */

