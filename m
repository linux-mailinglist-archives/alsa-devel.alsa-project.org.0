Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A56438A7DB6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 10:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C036D9F6;
	Wed, 17 Apr 2024 10:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C036D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713341159;
	bh=+AHxkBxgK0JVVQSGYJS1zewwUaQq0VBfzWVYWCsdqJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XxV4GxvnpGhA8HigJX66HgUYEIyC9972uqxJuMXnbPKhwVb5uXuhJLEAgVvMIcsFh
	 uC9grOXfAXP7zYIbFChlwlbMQN+2NDPGhG35rqA8+tWJJAY+4EskVyZB78ezMgzq4d
	 ElH4npXO9ADDJJXOcSzd1igzdLiVFV1LoyF8aFaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA7EF805AA; Wed, 17 Apr 2024 10:05:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADB06F8059F;
	Wed, 17 Apr 2024 10:05:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7912F8025A; Wed, 17 Apr 2024 10:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88366F801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 10:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88366F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Obr4bESM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713340895; x=1744876895;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+AHxkBxgK0JVVQSGYJS1zewwUaQq0VBfzWVYWCsdqJ0=;
  b=Obr4bESMB6FBc9Gqzpczj2xj1Wc8cM38NsEjnvxpzlW8k4EGpsYiiu0x
   cho/VgJ+oAO0pkY2wrQed75O199owqtP83dlkduXuu/7W+Nz2GnfsXBdh
   CbchUBO8Z3sE+yABDvNyUC+j8TEcWppsFa7qG9sEyIHIhhUCV9oPNLrUU
   WIC+rR+iT09Kmyb2dEHX3iy5oVGCoSf0u0Tz4byfekKcO47/51ysuax1r
   PpBWF+Sdmxn/GMV+naNiTfxbHqEVqAGfrsUcuJwCayleedwlR1L4uEEGK
   Ba/L123CV5etX8MO0ja69064CZeHB7CUH3QTsqOjFUg44LogZ2lsVxh7X
   g==;
X-CSE-ConnectionGUID: x0+3LKJMQYe3qR4PBG2+Ng==
X-CSE-MsgGUID: 44it4abmSRCHW3hLWr1HgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8645471"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000";
   d="scan'208";a="8645471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:01:29 -0700
X-CSE-ConnectionGUID: B+QfucwGScGx7lVtv3A5OA==
X-CSE-MsgGUID: Fe65QYkKT6Cu91ekTALwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000";
   d="scan'208";a="22619310"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:01:23 -0700
Message-ID: <f75809bb-1594-4bcd-9362-5aee8df04375@linux.intel.com>
Date: Wed, 17 Apr 2024 10:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 71/74] x86/cpu/vfm: Update
 sound/soc/intel/avs/boards/es8336.c
Content-Language: en-US
To: Tony Luck <tony.luck@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20240416211941.9369-1-tony.luck@intel.com>
 <20240416212257.10009-1-tony.luck@intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240416212257.10009-1-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HYUABE7SXU4W2EC72N7R2273B2PTJUXR
X-Message-ID-Hash: HYUABE7SXU4W2EC72N7R2273B2PTJUXR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYUABE7SXU4W2EC72N7R2273B2PTJUXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/16/2024 11:22 PM, Tony Luck wrote:
> New CPU #defines encode vendor and family as well as model.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>   sound/soc/intel/avs/boards/es8336.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
> index 5c90a6007577..6c86c581877e 100644
> --- a/sound/soc/intel/avs/boards/es8336.c
> +++ b/sound/soc/intel/avs/boards/es8336.c
> @@ -18,6 +18,7 @@
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include <sound/soc-acpi.h>
> +#include <asm/cpu_device_id.h>
>   #include <asm/intel-family.h>
>   #include "../utils.h"
>   
> @@ -153,9 +154,9 @@ static int avs_es8336_hw_params(struct snd_pcm_substream *substream,
>   	int clk_freq;
>   	int ret;
>   
> -	switch (boot_cpu_data.x86_model) {
> -	case INTEL_FAM6_KABYLAKE_L:
> -	case INTEL_FAM6_KABYLAKE:
> +	switch (boot_cpu_data.x86_vfm) {
> +	case INTEL_KABYLAKE_L:
> +	case INTEL_KABYLAKE:
>   		clk_freq = 24000000;
>   		break;
>   	default:

Any chance we could adjust topic to follow subsystem rules?
Something like:
ASoC: Intel: avs: boards: Update defines used in es8336
or something like that?
