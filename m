Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61A6CD1D9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 07:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF961F3;
	Wed, 29 Mar 2023 07:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF961F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680069272;
	bh=bZGOXSB1uSyAgGLryYZ3B77Qy7A2kvzZgaWeKPYzXzE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=umM1kpezhVmZ8iyQx8cfsA6Pr9q4oNpHEM0AOq25T/7xkAYkLA5FAsjaxu63gipfH
	 XP5G26xVj9sO/XUzRyYxBcbjBHtvwvxm9CpVQJ4576aTCF8+xXVnWgyUqVwbDw2lMO
	 WerE92VdJgVCTARoP++SjMatabayituVhQ6c8QUs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD8C4F8024E;
	Wed, 29 Mar 2023 07:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25176F80272; Wed, 29 Mar 2023 07:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CA26F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 07:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA26F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U6FN3Tb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680069207; x=1711605207;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bZGOXSB1uSyAgGLryYZ3B77Qy7A2kvzZgaWeKPYzXzE=;
  b=U6FN3Tb5sPI1vnWK4yMrxZ+5c4ltAkhOR8G2sSHKKHqbcNto+Lco5vrP
   OiR1nijG4ZMYFnsqCa8yz488029Zw4fUZrpL2oYuFrWq4KbmOL1NPcgPk
   aGOQnIQqDV+5cZSEtsOaQnB/EXqLkfvCKGAQXza/wjw0fWpuLBcdKj//a
   WH0bg6xTwCcyffz8uhufSK1brbJcdQ8K77EGyS9GVvB7V2yj/nwoZank6
   t3D6AIFEknMsdxz7noWyALbU2E/Aw+IcRdprzuYAFfWUusCXdr9MQADjw
   5ObueLptPtzWaLplp891MSN+CdenVRlMikHIGmt2S6PZiG7s9okXBoeYN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="427061731"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400";
   d="scan'208";a="427061731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 22:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661469032"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400";
   d="scan'208";a="661469032"
Received: from dfchaves-mobl.amr.corp.intel.com (HELO [10.252.41.108])
 ([10.252.41.108])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 22:53:20 -0700
Message-ID: <ee60952b-95ed-cb91-2eb5-838d23389070@linux.intel.com>
Date: Wed, 29 Mar 2023 08:53:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: soc-topology.c: dai_link->platform again
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87v8ikcsr5.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87v8ikcsr5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HQPFTAG734IXAXU6N2NOUOABHINQ5OZH
X-Message-ID-Hash: HQPFTAG734IXAXU6N2NOUOABHINQ5OZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQPFTAG734IXAXU6N2NOUOABHINQ5OZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On 29/03/2023 03:21, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> On SOF, many topology is assuming dai_link->platform exists, and is
> allowed to be overwritten on each link_load().
> This patch restore the removed dai_link->platform for SOF, and add
> the comment.

Thank you, it works now.

Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: e7098ba9b378 ("ASoC: soc-topology.c: remove unnecessary dai_link->platform")
> Reported-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Link: https://lore.kernel.org/r/87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-topology.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index be9849749713..d0aca6b9058b 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1685,8 +1685,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>  	struct snd_soc_dai_link_component *dlc;
>  	int ret;
>  
> -	/* link + cpu + codec */
> -	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
> +	/* link + cpu + codec + platform */
> +	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
>  	if (link == NULL)
>  		return -ENOMEM;
>  
> @@ -1724,6 +1724,14 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>  	link->codecs->name = "snd-soc-dummy";
>  	link->codecs->dai_name = "snd-soc-dummy-dai";
>  
> +	/*
> +	 * Many topology is assuming link has Platform.
> +	 * This might be overwritten at soc_tplg_dai_link_load().
> +	 */
> +	link->platforms	= &dlc[2];
> +	link->platforms->name = "snd-soc-dummy";
> +	link->num_platforms = 1;
> +
>  	/* enable DPCM */
>  	link->dynamic = 1;
>  	link->ignore_pmdown_time = 1;

-- 
Péter
