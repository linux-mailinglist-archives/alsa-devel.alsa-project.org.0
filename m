Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B711DEBF6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 17:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D61A1865;
	Fri, 22 May 2020 17:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D61A1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590161714;
	bh=KGO6qH30UKyRPIxAT2XxQoa119qalE875QRBh7LHYCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R8EKOlJiyjUFycp7zfM8PsQ1J2of05Sl6109sv1M0hcUgjXsot2agGK9hhKQp2Sgz
	 RSgMrF+QOeCPjvgPvz7u6I2xhDEcUqmSifBkWj+IXQLHsgxsbuMduTbpraPpvuPOT+
	 xfcRnrJeO0hM43bogCWt3N9mG1IuCUMsQr2dBi9E=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E81BF8025E;
	Fri, 22 May 2020 17:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93363F80216; Fri, 22 May 2020 17:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06D35F80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 17:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D35F80111
IronPort-SDR: xcp999XkQvyUKd0HKlZZEhS3v5fubznrhd8mvYziZbwAMvENMYxqvs5cl6w3G2kDixlWoq8aSA
 P+N9UcB0XL1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 08:33:53 -0700
IronPort-SDR: EsgQ/86ZrGYCLQ0ivYKO1LN5ulBRXkUGm+lOETxWDQMWvNUm6dclvajrE9geKfHg0ULa6XCaVJ
 pdyZZWAJ1p+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="255621362"
Received: from kaparr-mobl1.amr.corp.intel.com (HELO [10.252.133.17])
 ([10.252.133.17])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2020 08:33:53 -0700
Subject: Re: [PATCH v3 0/7] ASoC: add soc-link
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87lflk4yk3.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75365f38-708d-32f1-a5e2-a3d1352687bd@linux.intel.com>
Date: Fri, 22 May 2020 09:36:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87lflk4yk3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 5/21/20 7:13 PM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> Current ALSA SoC is handling dai_link related operation,
> but it is implmemented directly without using function/macro,
> and at random place.
> 
> This v3 patch-set creates new snd_soc_link_xxx() functions
> which handles dai_link related operation,
> and implmement these at new soc-link.c.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> v2 -> v3
> 
> 	- add missing #include <sound/soc-link.h> in soc-link.c
> 
> v1 -> v2
> 	- #include <sound/soc-link.h> is added on each c source file
> 	  instead of soc.h
> 	- not have extra error message after snd_soc_link_xxx(),
> 	  because it already indicate it via snc_link_ret()
> 	- snd_soc_link_compr_xxx() doesn't have rtd parameter,
> 	  because it can be created from cstream
> 
> Link: https://lore.kernel.org/r/874ksa59wc.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/877dx868op.wl-kuninori.morimoto.gx@renesas.com
> 
> Kuninori Morimoto (7):
>    ASoC: add soc-link.c
>    ASoC: soc-link: move soc_rtd_xxx()
>    ASoC: soc-link: remove unneeded parameter from snd_soc_link_xxx()
>    ASoC: soc-link: add snd_soc_link_be_hw_params_fixup()
>    ASoC: soc-link: add snd_soc_link_compr_startup()
>    ASoC: soc-link: add snd_soc_link_compr_shutdown()
>    ASoC: soc-link: add snd_soc_link_compr_set_params()
> 
>   include/sound/soc-link.h |  27 +++++++
>   sound/soc/Makefile       |   2 +-
>   sound/soc/soc-compress.c |  46 ++++--------
>   sound/soc/soc-core.c     |  18 ++---
>   sound/soc/soc-dai.c      |   9 ++-
>   sound/soc/soc-link.c     | 150 +++++++++++++++++++++++++++++++++++++++
>   sound/soc/soc-pcm.c      |  86 ++++------------------
>   7 files changed, 219 insertions(+), 119 deletions(-)
>   create mode 100644 include/sound/soc-link.h
>   create mode 100644 sound/soc/soc-link.c
> 
