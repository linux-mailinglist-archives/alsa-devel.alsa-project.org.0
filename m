Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FF6C9BC4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 09:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF20829;
	Mon, 27 Mar 2023 09:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF20829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679901319;
	bh=jFl1Iud+xPnxYC5vx+gGSiZX4H//tCd3v7cAVs94k8c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MTY2riwynVcTo5P9gIYgnFnfVi9Td6rNjhNkNA3/FLKc5hvhQyB7v1coxIEnn3Uet
	 QqE9gNs/1fybe+v9k6LgZ1PkgRnhbG071ONOVLTWe1Q56zBme+oRfX0NlZ8ZH/xaYU
	 HMrrELtPJRkZUOblwvtBymxi040AmEenNFnk31hU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A08CDF8024E;
	Mon, 27 Mar 2023 09:14:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA5EF80290; Mon, 27 Mar 2023 09:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA207F80272
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 09:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA207F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fdTjNqGT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679901147; x=1711437147;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jFl1Iud+xPnxYC5vx+gGSiZX4H//tCd3v7cAVs94k8c=;
  b=fdTjNqGTausVXFzRSj4EuP32cbFMWcM/tBAOFJ5WaZ/HIGXsIMjDb8/2
   dslBVSaY8z/kODFASR5wDGETj9YiHeF9iqESOgv11MeYBCyhch7mz/wCs
   ITLv2cXjRT3FeoYavDY9wQIBNul5Uf9ESTp16V9mjQxbX7fOFIf/ySChN
   LHG00lJAJldS1D/VYr6w8eVDmAlks0u9V2JiPLCRlATA/qU8lIlPp65Cd
   oslOrHKmxi8L02gbEy1O8zXKSApBq22LfFD6bLIXTMZGTTLlJ9zy+VPHW
   HMeSRwMA5Fveq4E2YCYPYfkkRRntByN5LJiVNMo3NiUXV/CS354V5frVz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="337699753"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="337699753"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 00:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="715972994"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="715972994"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO [10.251.223.110])
 ([10.251.223.110])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 00:12:22 -0700
Message-ID: <5eb5c8e5-a6ad-2522-1b53-5f927a3a7d8c@linux.intel.com>
Date: Mon, 27 Mar 2023 10:12:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
 <87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NM4PX55HA7WRK7ETGQPQICKEFNDQPRVO
X-Message-ID-Hash: NM4PX55HA7WRK7ETGQPQICKEFNDQPRVO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NM4PX55HA7WRK7ETGQPQICKEFNDQPRVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Morimoto-san,

On 24/03/2023 00:53, Kuninori Morimoto wrote:
> dai_link->platform is no longer needed if CPU and Platform are
> same Component. This patch removes unnecessary dai_link->platform.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-topology.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 07421f5d4ebd..7f6424fa59ab 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1685,8 +1685,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>  	struct snd_soc_dai_link_component *dlc;
>  	int ret;
>  
> -	/* link + cpu + codec + platform */
> -	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
> +	/* link + cpu + codec */
> +	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
>  	if (link == NULL)
>  		return -ENOMEM;
>  
> @@ -1694,11 +1694,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>  
>  	link->cpus	= &dlc[0];
>  	link->codecs	= &dlc[1];
> -	link->platforms	= &dlc[2];
>  
>  	link->num_cpus	 = 1;
>  	link->num_codecs = 1;
> -	link->num_platforms = 1;
>  
>  	link->dobj.index = tplg->index;
>  	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
> @@ -1726,8 +1724,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>  	link->codecs->name = "snd-soc-dummy";
>  	link->codecs->dai_name = "snd-soc-dummy-dai";
>  
> -	link->platforms->name = "snd-soc-dummy";
> -

I think this patch is incorrect and should be reverted (I have received
a note from a SOF developer).
The link->cpus->dai_name is not necessarily "snd-soc-dummy", it is set
earlier:
if (strlen(pcm->dai_name)) {
	link->cpus->dai_name = devm_kstrdup(tplg->dev, pcm->dai_name,
					    GFP_KERNEL);
	if (!link->cpus->dai_name) {
		ret = -ENOMEM;
		goto err;
	}
}

We cannot be sure that it is the same component, in fact it is most like
not.

>  	/* enable DPCM */
>  	link->dynamic = 1;
>  	link->ignore_pmdown_time = 1;

-- 
Péter
