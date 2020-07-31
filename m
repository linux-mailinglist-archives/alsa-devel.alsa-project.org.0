Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CD234835
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 17:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D00F1665;
	Fri, 31 Jul 2020 17:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D00F1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596208164;
	bh=Z+i/wkSyRQ/kz/tLETIUiuDZqWoJIDr+cM7qjr7kYfw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGxwPO/zYJpMEq4Ioo5qqa0wA94uu3aDwS3GmkW6+u0T35sqI+9oaL4Y821O6V7HA
	 BdC7aVnaFCzJ2C8Z9VpoCjnoNCRY1SYNo4n0rP8KSIa12pcLXa4Y0IZtQ9GvClGtp5
	 9FkHcjFF7V5Z6I4lEnlpY++iRPGbJwC26Tcmaqcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F47EF8011C;
	Fri, 31 Jul 2020 17:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB201F8011C; Fri, 31 Jul 2020 17:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 736C1F8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 17:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 736C1F8011C
IronPort-SDR: dGJD7s0MFmx2wbNn9yxagHmer+lz9J4RqmckT69Oa5O+pun9hrp4NSDN7+L05/7jPB4r/IXVVg
 u/s2Gq75a8Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151762081"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="151762081"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 08:07:25 -0700
IronPort-SDR: kQjfLGrbDL3tO9Cl6DgN+IkPWBuEPdLIcMLkd+zQEOnTUcEMvzdflgoOGQwbkPRDySWGBOOjsq
 Uc9v/SrUlWRg==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="435417978"
Received: from yashroff-mobl.amr.corp.intel.com (HELO [10.251.25.37])
 ([10.251.25.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 08:07:24 -0700
Subject: Re: [PATCH 0/3] ASoC: core: Two step component registration
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
Date: Fri, 31 Jul 2020 10:07:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731144146.6678-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lars@metafoo.de, olivier.moysan@st.com, alexandre.torgue@st.com,
 lgirdwood@gmail.com, arnaud.pouliquen@st.com, tiwai@suse.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com
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



On 7/31/20 9:41 AM, Cezary Rojewski wrote:
> Provide a mechanism for true two-step component registration. This
> mimics device registration flow where initialization is the first step
> while addition goes as second in line. Drivers may choose to modify
> component's fields before registering component to ASoC subsystem via
> snd_soc_add_component.

I must admit I don't see where this might be used for Intel platforms, 
we've been happily using snd_soc_register_component() without hitting 
limitations.

Also the only two uses of snd_soc_add_component() seem mainly driven by 
memory allocation - and avoiding a devm_kzalloc in 
snd_soc_register_component().

Out of curiosity, can you provide an example where this two-step would 
be required or beneficial? Thanks!

> Patchset achieves status quo - behavior of snd_soc_register_component
> remains unchanged.
> 
> Cezary Rojewski (3):
>    ASoC: core: Relocate and expose snd_soc_component_initialize
>    ASoC: core: Simplify snd_soc_component_initialize declaration
>    ASoC: core: Two step component registration
> 
>   include/sound/soc-component.h         |  3 --
>   include/sound/soc.h                   | 11 +++---
>   sound/soc/soc-component.c             | 16 ---------
>   sound/soc/soc-core.c                  | 52 +++++++++++++++++----------
>   sound/soc/soc-generic-dmaengine-pcm.c | 14 +++++---
>   sound/soc/stm/stm32_adfsdm.c          |  9 +++--
>   6 files changed, 55 insertions(+), 50 deletions(-)
> 
