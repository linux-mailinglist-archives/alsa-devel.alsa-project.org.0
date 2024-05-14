Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2168C4D00
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 09:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF787E76;
	Tue, 14 May 2024 09:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF787E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715671763;
	bh=Tm+W/k1wIKzjaUhZ1Z193EZWFqmYNWQo8g+1U/Y/oZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=suWh0N5QFb6RtEjQO90hcl7E6GnnhZoCOU/qvwmyXanfwR1joo/iGzXP4c5cCzZRF
	 aIjbX14Jl0wiijqT1dGs/4zIhI7I84seE1g2Uha83uR14DEUCSCXEjadFfrsElvcaY
	 dEhlqha/gpJIR62oHVTmnSr0rnKtMWdGB6/9KvSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83862F805C7; Tue, 14 May 2024 09:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4658F805E0;
	Tue, 14 May 2024 09:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26A0CF80224; Tue, 14 May 2024 09:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5994F8003A;
	Tue, 14 May 2024 09:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5994F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X80uP0cE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715671505; x=1747207505;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Tm+W/k1wIKzjaUhZ1Z193EZWFqmYNWQo8g+1U/Y/oZY=;
  b=X80uP0cEy9KLegZQzPmuZRsvrRqiC8Nh0JUoxeSvTJTdQNictIw/B8JQ
   84gD8NLoU6ayNDkYoVdnsd+83Bywonhs6tp1n3spQelvLJXNm2tEIIxZM
   wCeo/wslKkA63Vjkb+sBxX1nQLoq9tK7HN/qA6wOONKPH80MtrXqhEMH/
   WOFMihPVKk2wAuokbj6f5rSdbZS+Cbje4YDiCrurPQkHNhhHiQAVBA1rX
   Lgpk5c6hSVaD5XSeZ8KEISL+rqAYjIw3FlqaU5eWxJ4V01vjyo3qeXIWO
   P8AUvj+yc8pBtHKvWwZTns/ZKDZlbF6PmbEQs54K8vJEmp/Ua73p62U/f
   A==;
X-CSE-ConnectionGUID: rghU+2dZTZWa9/a60gOa5g==
X-CSE-MsgGUID: gkc+2Ul9TOC7OQeZv0UkUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11489026"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="11489026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:25:00 -0700
X-CSE-ConnectionGUID: R83TVYkLRTu0dk/2BjcVCg==
X-CSE-MsgGUID: PVXjhZT7RvCGKCbnvxgn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="30638161"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.32.104])
 ([10.94.32.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:24:50 -0700
Message-ID: <db981d27-7e70-4514-b82b-fc452b658019@linux.intel.com>
Date: Tue, 14 May 2024 09:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: Intel: Skylake: Constify struct
 snd_soc_tplg_ops
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
 <48f096b6dc617ecf3ca53211c2a696a4df33b21a.1715526069.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <48f096b6dc617ecf3ca53211c2a696a4df33b21a.1715526069.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QACWOYFZDUSDVRKWWHNTCRK4R23JU2NS
X-Message-ID-Hash: QACWOYFZDUSDVRKWWHNTCRK4R23JU2NS
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QACWOYFZDUSDVRKWWHNTCRK4R23JU2NS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/13/2024 7:37 PM, Christophe JAILLET wrote:
> Constifying "struct snd_soc_tplg_ops" moves some data to a read-only
> section, so increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    58844	   5282	     56	  64182	   fab6	sound/soc/intel/skylake/skl-topology.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    59004	   5122	     56	  64182	   fab6	sound/soc/intel/skylake/skl-topology.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

