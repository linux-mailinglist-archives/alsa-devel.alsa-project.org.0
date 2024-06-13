Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3579063A8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 07:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B86BC0;
	Thu, 13 Jun 2024 07:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B86BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718258353;
	bh=jA+p+c2oxMuJwrkeiL5Elamxl7w5DxZPj3FunEj/30I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1FWOXlPy8L/B7tsiRvmUkEEMdOagQUAClGZdUpT5GEJ5y2iMpJEgfMMdH3vqwORv
	 gPdj7EUPmuDblYhyEJSRk6HxEsX4tPAbIGo9Cpdy4Yn+N5GhjBmFOXDpyJgq2/bln6
	 dYJO46x51PTAz+Z92Tk1+R16mej8m7BXemqrKFiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99505F805BD; Thu, 13 Jun 2024 07:58:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E72DF805B3;
	Thu, 13 Jun 2024 07:58:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ADD1F8057A; Thu, 13 Jun 2024 07:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5959EF800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 07:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5959EF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IBMLLDbH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718258306; x=1749794306;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jA+p+c2oxMuJwrkeiL5Elamxl7w5DxZPj3FunEj/30I=;
  b=IBMLLDbHA+WQrozPgW7XxIka5nDUibwfBd3tJAAmFCRgy31TIa3l5aVt
   Omjnmw1WEDoH7Ktdn1YHRcuWU5WE78GBqBCpyFx7M/n6FcG3ddXUHkKau
   M55+bKcv8U34QnYc8shyZVZgoJzqp9e5wmG/R0bQnFmif+J0N1fvlOLH3
   H47ML71XB8uLLX39EsRkDWcMnikdDVvNHdRhLuPMGNKHauQ54Beext0wg
   7qYWLOcksQFgaYivyMGvIYCrQ7IK7O1mPMivTOVQFTqaba+NXBehnyQ4I
   zRuXvmO7pIwLoE65R8YirqYnDxhWlGXoNQEAb5VaZAxU63RWoRKaGklXw
   w==;
X-CSE-ConnectionGUID: btdO/zDdQWa6XzEL8CpNow==
X-CSE-MsgGUID: H98tWkTaTYW0ZnK1uABYHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15209748"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="15209748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 22:58:21 -0700
X-CSE-ConnectionGUID: Zcd9rqi0SdK20b0RSg7x4w==
X-CSE-MsgGUID: nYuz97NVQGavObsJQDCE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="77480061"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 22:58:18 -0700
Message-ID: <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
Date: Thu, 13 Jun 2024 07:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RRF5LK7UKOLA7XTPQJWEW74ERAO2MPU5
X-Message-ID-Hash: RRF5LK7UKOLA7XTPQJWEW74ERAO2MPU5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRF5LK7UKOLA7XTPQJWEW74ERAO2MPU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/3/24 12:28, Amadeusz Sławiński wrote:
> Most users after parsing a topology file, release memory used by it, so
> having pointer references directly into topology file contents is wrong.
> Use devm_kmemdup(), to allocate memory as needed.
> 
> Reported-by: Jason Montleon <jmontleo@redhat.com>
> Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---

This patch breaks the Intel SOF CI in spectacular ways, with the widgets
names completely garbled with noise such as

host-copier.5.playbackpid.socket
host-copier.5.playbackrt@linux.intel.com>
dai-copier.HDA.iDisp3.playbackrun_t:s0
host-copier.31.playback\xff`\x86\xba\x034\x89\xff\xff@N\x83\xb83\x89\xff\xff\x10\x84\xe9\x8b\xff\xff\xff\xffS\x81ی\xff\xff\xff\xff\x0f

https://github.com/thesofproject/linux/pull/5057#issuecomment-2164470192

I am going to revert this patchset in the SOF tree.

>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 90ca37e008b32..75d9395a18ed4 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1060,15 +1060,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>  			break;
>  		}
>  
> -		route->source = elem->source;
> -		route->sink = elem->sink;
> +		route->source = devm_kmemdup(tplg->dev, elem->source,
> +					     min(strlen(elem->source),
> +						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +					     GFP_KERNEL);
> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +					   GFP_KERNEL);
> +		if (!route->source || !route->sink) {
> +			ret = -ENOMEM;
> +			break;
> +		}
>  
>  		/* set to NULL atm for tplg users */
>  		route->connected = NULL;
> -		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
> +		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
>  			route->control = NULL;
> -		else
> -			route->control = elem->control;
> +		} else {
> +			route->control = devm_kmemdup(tplg->dev, elem->control,
> +						      min(strlen(elem->control),
> +							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +						      GFP_KERNEL);
> +			if (!route->control) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +		}
>  
>  		/* add route dobj to dobj_list */
>  		route->dobj.type = SND_SOC_DOBJ_GRAPH;

97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1 is the first bad commit
commit 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Date:   Mon Jun 3 12:28:15 2024 +0200

    ASoC: topology: Fix references to freed memory

    Most users after parsing a topology file, release memory used by it, so
    having pointer references directly into topology file contents is wrong.
    Use devm_kmemdup(), to allocate memory as needed.

    Reported-by: Jason Montleon <jmontleo@redhat.com>
    Link:
https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
    Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
    Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
    Link:
https://lore.kernel.org/r/20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

 sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

