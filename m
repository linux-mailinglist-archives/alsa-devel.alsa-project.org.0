Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DF762EB2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 09:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DED6C1;
	Wed, 26 Jul 2023 09:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DED6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690357826;
	bh=/R38XYog4+QpG82OrQJ3Z95EuFCn1/IVFT2UrPu1ZJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qWj+8E79hh83ffzatDvDoIgVanoOJn5b4OmFCHqxUmmIu+1QqLhJ3knle0qXNWr4z
	 Zpug4gPWaJPxPcVsp54ecpSmxWsCEFgwVypZKbhF6C2DQDJavIUPUrGq3etfC05y9Z
	 4ncJi5iXGnP02F9AyvIvmJb7dXmnr3+xTb5A3gdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C70F800C7; Wed, 26 Jul 2023 09:49:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2A9F80149;
	Wed, 26 Jul 2023 09:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A285EF8019B; Wed, 26 Jul 2023 09:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FE75F80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 09:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE75F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P9QzPXJk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690357761; x=1721893761;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/R38XYog4+QpG82OrQJ3Z95EuFCn1/IVFT2UrPu1ZJ4=;
  b=P9QzPXJkutPsQmziTVbSLHXvAnLrvHvmLe7VxS+tKwqCxV4MNb31tAiS
   YmYk3xmTYZzyKSPYHooXffwSBkvsKjMzJTZV5aKyw0e+i4IIvDwBtXhYe
   QnRrwhB9MSr4NpVM1dnrEcgzF9QNHF3OMEko6PbfXaZz1NzRHicqqz/5s
   m4Oime5RxA0RcawW+dbC/9wNBBwCkEGNbHcaJhsUrKSnmLjdckrPmBsSM
   S2jI5SHYGi6+9Pbzxxw7Djq3XYcHKE78vRW8eopOx3dXx2ziEfZbLyWKD
   PRYqCBqgv5m/tH2/UWOggbmaVmNcyGbNwBW4V4Dzh2IlIIxFJVCWyrhed
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="434205666"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="434205666"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850366942"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="850366942"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:49:10 -0700
Message-ID: <cce17be6-acdf-9737-f2cb-3559712e4c56@linux.intel.com>
Date: Wed, 26 Jul 2023 09:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: intel: avs: refactor strncpy usage in topology
Content-Language: en-US
To: justinstitt@google.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>
References: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VKF7KOH54N7KGJI5O3MHKAAHVFW6R2CC
X-Message-ID-Hash: VKF7KOH54N7KGJI5O3MHKAAHVFW6R2CC
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKF7KOH54N7KGJI5O3MHKAAHVFW6R2CC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/26/2023 12:08 AM, justinstitt@google.com wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1].
> 
> A suitable replacement is `strscpy` [2].
> 
> There are some hopes that someday the `strncpy` api could be ripped out
> due to the vast number of suitable replacements (strscpy, strscpy_pad,
> strtomem, strtomem_pad, strlcpy) [1].
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> 
> ---
> 
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>   sound/soc/intel/avs/topology.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
> index cdb4ec500261..45d0eb2a8e71 100644
> --- a/sound/soc/intel/avs/topology.c
> +++ b/sound/soc/intel/avs/topology.c
> @@ -1388,12 +1388,12 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
>   		port = __ffs(mach->mach_params.i2s_link_mask);
>   
>   		snprintf(buf, len, route->source, port);
> -		strncpy((char *)route->source, buf, len);
> +		strscpy((char *)route->source, buf, len);
>   		snprintf(buf, len, route->sink, port);
> -		strncpy((char *)route->sink, buf, len);
> +		strscpy((char *)route->sink, buf, len);
>   		if (route->control) {
>   			snprintf(buf, len, route->control, port);
> -			strncpy((char *)route->control, buf, len);
> +			strscpy((char *)route->control, buf, len);
>   		}
>   	}
>   
> 

In this case snprintf adds NUL at the end and we strncpy using same 
size, so there should always be NUL at the end, so replacing it with 
strscpy shouldn't really change anything, so

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
