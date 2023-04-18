Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91086E5AA1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 09:42:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B4DDF8;
	Tue, 18 Apr 2023 09:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B4DDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681803774;
	bh=HJW4utlkntetkSrMSCvfkm5HJFUQ8RsvwFLL2l1AEU8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZD8oigsLnCpMbH4xWFeezRCPLcuhCrLJCQPPBaK+ygh0I7uGB6kWNYQQGVsBHNvr
	 r37+D5preI0HUGxnQpBLQxxnDkKsJ3gHctxIikBVu8/otYpD9v3o4kzGLrvyHz7wtf
	 ac3ZryC20K8CvUOSDt8cwVz8kf5KcUeV9N+LBtVw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 123FBF80149;
	Tue, 18 Apr 2023 09:42:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DB02F80155; Tue, 18 Apr 2023 09:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C70BF800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 09:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C70BF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J/t9N6PQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681803712; x=1713339712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HJW4utlkntetkSrMSCvfkm5HJFUQ8RsvwFLL2l1AEU8=;
  b=J/t9N6PQikGaZOa72JcOLPbPx2EqlVWm/XbanlGqkwIzRcmo5w4UW7wY
   1NwTLWjmQ4cpfybN6QMECLnJbeE88aIxzNmzg2I0ZcNbyoZQfquAnsqhC
   xq4i4NGHODhP6/51+7B56VAuSBKq7bJpk+G1JzTJYG2+3UFrx6tH/Vgww
   mFuzF+8lJ+n3VdoS7IAmcghhwET8oe/jlFrNnJeMsga25lSCY1tioUZcu
   mp8p10VAZyz5O3LwLbvbplClnxHbNTAhEJfR9yFgOh6x29kYDeE413IHc
   VuGfcXexnk6jAv0F5anh+v+Dj/nagyHe172qPP3HT9uHLhAmKHHfyo2ek
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407999412"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200";
   d="scan'208";a="407999412"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="780412002"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200";
   d="scan'208";a="780412002"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:41:44 -0700
Message-ID: <76fb9246-db98-35e1-7ded-40340b2a39bb@linux.intel.com>
Date: Tue, 18 Apr 2023 09:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/11] ASoC: soc-topology.c: use asoc_dummy_dlc
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
 <87o7nm2fvf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87o7nm2fvf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5IIV4AQRH2Q55KGIYVML26KR3XI4X5AT
X-Message-ID-Hash: 5IIV4AQRH2Q55KGIYVML26KR3XI4X5AT
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IIV4AQRH2Q55KGIYVML26KR3XI4X5AT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/18/2023 2:28 AM, Kuninori Morimoto wrote:
> Now we can share asoc_dummy_dlc. This patch use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-topology.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index d0aca6b9058b..873448c4a895 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1685,15 +1685,15 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>   	struct snd_soc_dai_link_component *dlc;
>   	int ret;
>   
> -	/* link + cpu + codec + platform */
> -	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
> +	/* link + cpu + platform */
> +	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
>   	if (link == NULL)
>   		return -ENOMEM;
>   
>   	dlc = (struct snd_soc_dai_link_component *)(link + 1);
>   
>   	link->cpus	= &dlc[0];
> -	link->codecs	= &dlc[1];
> +	link->codecs	= &asoc_dummy_dlc;
>   
>   	link->num_cpus	 = 1;
>   	link->num_codecs = 1;
> @@ -1721,14 +1721,12 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>   		}
>   	}
>   
> -	link->codecs->name = "snd-soc-dummy";
> -	link->codecs->dai_name = "snd-soc-dummy-dai";
> -
>   	/*
>   	 * Many topology is assuming link has Platform.
>   	 * This might be overwritten at soc_tplg_dai_link_load().
> +	 * Don't use &asoc_dummy_dlc here.
>   	 */
> -	link->platforms	= &dlc[2];
> +	link->platforms	= &dlc[1];
>   	link->platforms->name = "snd-soc-dummy";
>   	link->num_platforms = 1;
>   

In case of topology I'm not convinced that it is a good idea. You set 
link->codecs to point at global object, but if any of link modifies its 
link->codecs, which for example can happen in soc_tplg_dai_link_load() 
then all other link objects will point at modified value.

