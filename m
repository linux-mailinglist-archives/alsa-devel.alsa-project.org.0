Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4BD8C4CFD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 09:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C24E72;
	Tue, 14 May 2024 09:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C24E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715671741;
	bh=h+u2Wm6oUPSgHkFoJjK1aRuxkFR0VPr3ulemXFqbNqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N7uLdND1qfQH3f/+ABiW4PRsn59O41WR/KSrvHFOA/2TbWMB/f54S2MUT/ph7U9rL
	 1547eADwKRFLJYwyMAfNZrqChn5qrepGCyQvITXTsa9VnV3NYw5kxZpXDid0ZeBrrs
	 ZtikSHTvd5Vc5H/BK1r3nyZjUuIjALd99FB4HTsM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F13ACF805B4; Tue, 14 May 2024 09:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 101EDF8057F;
	Tue, 14 May 2024 09:28:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0868F80224; Tue, 14 May 2024 09:24:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E571BF8003A;
	Tue, 14 May 2024 09:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E571BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WP8n5bsS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715671480; x=1747207480;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h+u2Wm6oUPSgHkFoJjK1aRuxkFR0VPr3ulemXFqbNqM=;
  b=WP8n5bsSIl6dWq+LDRFi4q17y6J0MMad5NBZCd/k4/JYEPR7m9GwNk+m
   JSirF10qoRtyfcWLQ8HQZl17ceOkZ1B0BiEmPCsaKIXCizt28P9AgHOya
   ayb9AfNmgmeu49Gq1p6YXVLfr3sWvwwplECFG91LTFU6ioIK4ov/hQV3Y
   BoRXYBVrcDqM6Pw36vSY76WM+Sc8u0UEDHgnMgM7cmj+/MWJUwFW5MxFS
   VYgQvySkCieUV9av0YnFGa8kPo5MDUd1swx+spWgKti1vybJl4p7j8+Or
   NF0BvUWcYt2hj6wVnyV1ytTfAr172QCdC+nzT32YEBzcRxtIoxSv8wx/1
   w==;
X-CSE-ConnectionGUID: InX0kaR9QWi4gbgzlo8NcQ==
X-CSE-MsgGUID: hKF/sQ8NQAGJtD086XXOBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11488979"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="11488979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:24:29 -0700
X-CSE-ConnectionGUID: 4hN61N4NRaStSxwDU6v6Tg==
X-CSE-MsgGUID: Bl6Ybfb1SUioI5nPBUkcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000";
   d="scan'208";a="30638113"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.32.104])
 ([10.94.32.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:24:20 -0700
Message-ID: <e1110221-8b84-4364-bea9-e166ce859444@linux.intel.com>
Date: Tue, 14 May 2024 09:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: Intel: avs: Constify struct snd_soc_tplg_ops
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
 <01de0157088de0475970c79738284d6c86d702fe.1715526069.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <01de0157088de0475970c79738284d6c86d702fe.1715526069.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BQJUIOF3EDB45GUERDWWMXFZYQOCNYGL
X-Message-ID-Hash: BQJUIOF3EDB45GUERDWWMXFZYQOCNYGL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQJUIOF3EDB45GUERDWWMXFZYQOCNYGL/>
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
>    28046	    794	      0	  28840	   70a8	sound/soc/intel/avs/topology.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    28206	    614	      0	  28820	   7094	sound/soc/intel/avs/topology.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

