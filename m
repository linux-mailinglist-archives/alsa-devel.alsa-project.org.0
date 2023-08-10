Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D520777C10
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 17:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838C4826;
	Thu, 10 Aug 2023 17:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838C4826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691681049;
	bh=XAFRjI39t8Q8MiQyxRvHys4lXjxeKC98m9Ty/dzfFx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZImpVZtzTMp/Fk+krv+/EPElrRuXAX119iffCI5hz5wMNF5iiGOMKfoNqHMNfxN6
	 vP0g0BtP/ow+dvckOLuDZk5SSlrW2uPFhN2dO3Yq5nXmPPxuHfd+ILs6li+HixkjsH
	 0wwXa45GewkKlEQvvbjgaZz/ecNdbRcWjqISLEd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67FBEF800F4; Thu, 10 Aug 2023 17:22:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2F7F80166;
	Thu, 10 Aug 2023 17:22:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F2BF8016E; Thu, 10 Aug 2023 17:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25E9FF800EE;
	Thu, 10 Aug 2023 17:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E9FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bFa0qslh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691680961; x=1723216961;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XAFRjI39t8Q8MiQyxRvHys4lXjxeKC98m9Ty/dzfFx4=;
  b=bFa0qslhRCknpvC3OmugK08tCEJ+ZhUm/7C3QoNrTqIC7Q6JDgVbcbL3
   JngxjnDS1YeXWfDUpmGwp3hMFx4ZljdIYZhXBWO07QRx4jlAWhOguwF+B
   KutigdttIeQZM9SeaOjcujZs9Z6OX+Jr4AqWJuO1Zsop0hHyXEDFxlAhd
   pGb5BgYIdFj4y2+8pCkMjy97xy2RoZtmDfLcNLFHHwJVhxDJ2+v1TndN3
   IYeGlmKNRGYL6y3hSFhbeKZcC67xDAlgRzJqkAv/1NCFg1u7QjHaf0+gF
   z7f1LAPkJLgeBdGDDJAek92Tm578n898uLL1S679zzS+W02JJYG6598lh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356356048"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200";
   d="scan'208";a="356356048"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709137872"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200";
   d="scan'208";a="709137872"
Received: from dhoeflin-mobl.amr.corp.intel.com (HELO [10.212.101.20])
 ([10.212.101.20])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:00:00 -0700
Message-ID: <3cbac915-8177-e30d-8e31-2aa27feebac9@linux.intel.com>
Date: Thu, 10 Aug 2023 07:32:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH -next] ASoC: SOF: Intel: Remove duplicated include in
 lnl.c
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com
Cc: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230810005555.4610-1-yang.lee@linux.alibaba.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230810005555.4610-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6VS6PSSHFCGV3PT47KJ6C4SEZP2JRWZ3
X-Message-ID-Hash: 6VS6PSSHFCGV3PT47KJ6C4SEZP2JRWZ3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VS6PSSHFCGV3PT47KJ6C4SEZP2JRWZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/9/23 19:55, Yang Li wrote:
> ./sound/soc/sof/intel/lnl.c: hda.h is included more than once.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

yes, thanks for the patch

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/intel/lnl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
> index 3d919b0b6891..db94b45e53af 100644
> --- a/sound/soc/sof/intel/lnl.c
> +++ b/sound/soc/sof/intel/lnl.c
> @@ -16,7 +16,6 @@
>  #include "hda-ipc.h"
>  #include "../sof-audio.h"
>  #include "mtl.h"
> -#include "hda.h"
>  #include <sound/hda-mlink.h>
>  
>  /* LunarLake ops */
